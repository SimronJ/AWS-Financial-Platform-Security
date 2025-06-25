# Macie module stub 

resource "aws_macie2_account" "main" {
  finding_publishing_frequency = "FIFTEEN_MINUTES"
  status = "ENABLED"
}

resource "aws_macie2_classification_job" "s3_scan" {
  name = "s3-bucket-scan"
  job_type = "ONE_TIME"
  s3_job_definition {
    bucket_definitions {
      account_id = var.account_id
      buckets    = var.s3_buckets
    }
  }
  schedule_frequency {
    daily_schedule {} # For continuous monitoring, change to scheduled
  }
  custom_data_identifier_ids = []
  initial_run = true
} 