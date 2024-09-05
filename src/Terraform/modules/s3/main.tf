// S3 버킷 생성
resource "aws_s3_bucket" "deploy" {
    bucket = var.deployment_bucket_name

    tags = {
        Name = "Project Heart Harmony Deployment"
    }
}


// S3 버킷 웹사이트 정적 웹사이트 호스팅 설정
resource "aws_s3_bucket_website_configuration" "deploy" {
    bucket = aws_s3_bucket.deploy.id

    index_document {
        suffix = "index.html"
    }

    error_document {
        key = "error.html"
    }
}

// S3 버킷 퍼블릭 액세스 차단 설정
resource "aws_s3_bucket_public_access_block" "deploy" {
    bucket = aws_s3_bucket.deploy.id

    block_public_acls       = false
    block_public_policy     = false
    ignore_public_acls      = false
    restrict_public_buckets = false
}

// S3 버킷 정책 설정
resource "aws_s3_bucket_policy" "deploy" {
    bucket = aws_s3_bucket.deploy.id

    policy = jsonencode({
      Version = "2012-10-17"
      Statement = [
        {
          Sid       = "PublicReadGetObject"
          Effect    = "Allow"
          Principal = "*"
          Action    = "s3:GetObject"
          Resource  = "${aws_s3_bucket.deploy.arn}/*"
        },
      ]
    })

    depends_on = [ aws_s3_bucket_public_access_block.deploy ]
}