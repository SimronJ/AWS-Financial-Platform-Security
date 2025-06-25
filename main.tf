module "vpc" {
  source = "./modules/vpc"
  # ... variables ...
}

module "s3_static_site" {
  source = "./modules/s3-static-site"
  # ... variables ...
}

module "cloudfront" {
  source = "./modules/cloudfront"
  # ... variables ...
}

module "waf" {
  source = "./modules/waf"
  # ... variables ...
}

module "ec2" {
  source = "./modules/ec2"
  # ... variables ...
}

module "iam" {
  source = "./modules/iam"
  # ... variables ...
}

module "guardduty" {
  source = "./modules/guardduty"
  # ... variables ...
}

module "secrets_manager" {
  source = "./modules/secrets-manager"
  # ... variables ...
}

module "kms" {
  source = "./modules/kms"
  # ... variables ...
}

module "cloudwatch" {
  source = "./modules/cloudwatch"
  # ... variables ...
}

module "sns" {
  source = "./modules/sns"
  # ... variables ...
}

module "macie" {
  source = "./modules/macie"
  # ... variables ...
}

module "dr_replication" {
  source = "./modules/dr-replication"
  # ... variables ...
}

module "route53" {
  source = "./modules/route53"
  # ... variables ...
} 