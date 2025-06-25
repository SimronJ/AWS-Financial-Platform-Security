output "vpc_id" {
  value = module.vpc.vpc_id
}

output "s3_bucket_name" {
  value = module.s3_static_site.bucket_name
}

# Add more outputs as needed for each module 