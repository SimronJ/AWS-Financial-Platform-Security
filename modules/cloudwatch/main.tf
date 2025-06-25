# CloudWatch module stub 

resource "aws_cloudwatch_log_group" "web" {
  name = "/aws/webapp"
  retention_in_days = 30
}

resource "aws_cloudwatch_metric_alarm" "4xx" {
  alarm_name          = "4xx-spike"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = 1
  metric_name         = "4xxErrorRate"
  namespace           = "AWS/CloudFront"
  period              = 300
  statistic           = "Sum"
  threshold           = 10
  alarm_description   = "Spike in 4xx errors"
  alarm_actions       = [var.sns_topic_arn]
}

resource "aws_cloudwatch_metric_alarm" "5xx" {
  alarm_name          = "5xx-threshold"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = 1
  metric_name         = "5xxErrorRate"
  namespace           = "AWS/CloudFront"
  period              = 900
  statistic           = "Sum"
  threshold           = 25
  alarm_description   = "5xx errors exceed threshold"
  alarm_actions       = [var.sns_topic_arn]
}

resource "aws_cloudwatch_metric_alarm" "ddos" {
  alarm_name          = "ddos-alert"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = 3
  metric_name         = "Requests"
  namespace           = "AWS/CloudFront"
  period              = 60
  statistic           = "Sum"
  threshold           = 300
  alarm_description   = "Potential DDoS detected"
  alarm_actions       = [var.sns_topic_arn]
} 