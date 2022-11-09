resource "kubernetes_namespace" "aws-observability" {
  metadata {
    labels = {
      aws-observability = "enabled"
    }
    name = "aws-observability"
  }
}

resource "kubernetes_config_map" "fargate_log_config" {
  count = var.fargate_logging_enabled ? 1 : 0
  metadata {
    name      = "aws-logging"
    namespace = "aws-observability"
  }

  data = {
    "output.conf" = <<EOF
[OUTPUT]
    Name cloudwatch_logs
    Match   *
    region ${var.aws_region}
    log_group_name ${module.cluster_log_group.cloudwatch_log_group_name}
    log_stream_prefix fargate-
    auto_create_group false
    log_key log
EOF

    "parsers.conf" = <<EOF
[PARSER]
    Name crio
    Format Regex
    Regex ^(?<time>[^ ]+) (?<stream>stdout|stderr) (?<logtag>P|F) (?<log>.*)$
    Time_Key    time
    Time_Format %Y-%m-%dT%H:%M:%S.%L%z
EOF

    "filters.conf" = <<EOF
[FILTER]
    Name parser
    Match *
    Key_name log
    Parser crio
EOF
  }
}
