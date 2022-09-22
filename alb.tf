# Creating External LoadBalancer 
resource "aws_lb" "tf-external-alb" {
  name               = "External-LB"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.tf-sg.id]
  subnets            = [aws_subnet.tf-sn-1.id, aws_subnet.tf-sn-2.id]
}
resource "aws_lb_target_group" "tf-target-elb" {
  name     = "ALB-TG"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.tf-vpc.id
}
resource "aws_lb_target_group_attachment" "tf-attachment-1" {
  target_group_arn = aws_lb_target_group.tf-target-elb.arn
  target_id        = aws_instance.tf-ec2-1.id
  port             = 80
  depends_on = [
    aws_instance.tf-ec2-1
  ]
}
resource "aws_lb_target_group_attachment" "tf-attachment-2" {
  target_group_arn = aws_lb_target_group.tf-target-elb.arn
  target_id        = aws_instance.tf-ec2-2.id
  port             = 80
  depends_on = [
    aws_instance.tf-ec2-2
  ]
}
resource "aws_lb_listener" "tf-external-elb" {
  load_balancer_arn = aws_lb.tf-external-alb.arn
  port              = "80"
  protocol          = "HTTP"
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.tf-target-elb.arn
  }
}