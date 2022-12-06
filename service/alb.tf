#in this template we are creating aws application laadbalancer and target group and alb http listener

resource "aws_alb" "this" {
  name            = "${var.container_name}-alb"
  subnets         = var.subnet_ids_pub
  security_groups = [aws_security_group.alb-sg.id]
}

resource "aws_alb_target_group" "this" {
  name        = "${var.container_name}-tg"
  port        = 80
  protocol    = "HTTP"
  target_type = "ip"
  vpc_id      = var.vpc_id

  health_check {
    healthy_threshold   = 3
    unhealthy_threshold = 3
    timeout             = 30
    protocol            = "HTTP"
    matcher             = "200-499"
    path                = var.health_check_path
    interval            = 60
  }
}

#redirecting all incomming traffic from ALB to the target group
resource "aws_alb_listener" "this" {
  load_balancer_arn = aws_alb.this.id
  port              = var.app_port
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_alb_target_group.this.arn
  }
}
