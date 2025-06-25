# IAM module stub 

resource "aws_iam_role" "ec2" {
  name = "ec2-backend-role"
  assume_role_policy = data.aws_iam_policy_document.ec2_assume.json
}

data "aws_iam_policy_document" "ec2_assume" {
  statement {
    actions = ["sts:AssumeRole"]
    principals {
      type        = "Service"
      identifiers = ["ec2.amazonaws.com"]
    }
  }
}

resource "aws_iam_policy" "backend_access" {
  name        = "backend-access-policy"
  description = "Allow EC2 to access S3, Secrets Manager, and KMS"
  policy      = data.aws_iam_policy_document.backend_access.json
}

data "aws_iam_policy_document" "backend_access" {
  statement {
    actions = [
      "s3:*",
      "secretsmanager:GetSecretValue",
      "kms:Decrypt"
    ]
    resources = ["*"]
  }
}

resource "aws_iam_role_policy_attachment" "attach" {
  role       = aws_iam_role.ec2.name
  policy_arn = aws_iam_policy.backend_access.arn
}

output "iam_instance_profile" {
  value = aws_iam_role.ec2.name
} 