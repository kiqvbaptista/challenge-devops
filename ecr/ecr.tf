resource "aws_ecr_repository" "front" {
  name = "${var.image_ecr_front}-ecr"
}

