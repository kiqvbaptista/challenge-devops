data "aws_ecs_cluster" "this" {
  cluster_name = var.ecs_cluster_name
}


resource "aws_ecs_task_definition" "this" {
  family                   = var.task_name
  execution_role_arn       = aws_iam_role.this.arn
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  cpu                      = var.fargate_cpu
  memory                   = var.fargate_memory
  container_definitions = jsonencode([
    {
      name      = "certisign"
      image     = "service-click"
      cpu       = 10
      memory    = 512
      essential = true
      portMappings = [
        {
          containerPort = 80
          hostPort      = 80
        }
      ]
    }
  ])

}

resource "aws_ecs_service" "this" {
  name            = var.service_name
  cluster         = data.aws_ecs_cluster.this.cluster_name
  task_definition = aws_ecs_task_definition.this.arn
  desired_count   = var.app_count
  launch_type     = "FARGATE"

  network_configuration {
    security_groups  = [aws_security_group.ecs_sg.id]
    subnets          = var.subnet_ids_pvt
    assign_public_ip = false
  }

  load_balancer {
    target_group_arn = aws_alb_target_group.this.arn
    container_name   = var.container_name
    container_port   = var.app_port
  }

  depends_on = [aws_alb_listener.this, aws_iam_role_policy_attachment.this]
}