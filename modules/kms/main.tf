# KMS module stub 

resource "aws_kms_key" "main" {
  description = "KMS key for backend to S3 encryption"
  enable_key_rotation = true
}

output "kms_key_arn" {
  value = aws_kms_key.main.arn
} 