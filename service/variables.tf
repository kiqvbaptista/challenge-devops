variable "aws_region" {
    default = ""
    type = string
  
}
variable "ecs_task_execution_role" {
    default = "myECcsTaskExecutionRole"
    type = string
  
}
variable "app_image" {
    type = string    
    description = "Image ECR"
  
}
variable "app_port" {
    default = "80"
    type = string  
  
}
variable "app_count" {
    default = "1"
    type = string 
  
}
variable "health_check_path" {
    default = "/"
  
}
variable "fargate_cpu" {
    default = "1024"
    type    = string
  
}
variable "fargate_memory" {
    default = "2048"
    type = string 
  
}
variable "ecs_cluster_name" {
    default = "Name Cluster"
    type = string 
  
}
variable "task_name" {
    description = "Name Task"
    type = string 
  
}
variable "service_name" {
    description = "Name Service"
    type = string 
  
}
variable "container_name" {
    description = "Name Container"
    type = string 
  
}
variable "subnet_ids_pvt" {
    type = list
  
}
variable "subnet_ids_pub" {
    type = list
  
}
variable "vpc_id" {
    type = string 
  
}
variable "tag_name" {
    type = string 
  
}
