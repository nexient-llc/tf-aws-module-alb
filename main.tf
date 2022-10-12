// Copyright 2022 Nexient LLC
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

resource "aws_security_group" "load_balancer_redirect" {
  name        = "${var.naming_prefix}-sg-load-balancer-redirect-000"
  description = "allow port 80 so it can be redirected"
  vpc_id      = var.vpc_id

  tags = merge(
    var.tags,
    {
      "Name" = "${var.naming_prefix}-sg-load-balancer-redirect-000"
    },
  )

  ingress {
    protocol    = "tcp"
    from_port   = 80
    to_port     = 80
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    protocol    = "-1"
    from_port   = 0
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "load_balancer" {
  name        = "${var.naming_prefix}-sg-load-balancer-000"
  description = "Port 443 Access to Load Balancer"
  vpc_id      = var.vpc_id

  tags = merge(
    var.tags,
    {
      "Name" = "${var.naming_prefix}-sg-load-balancer-000"
    },
  )

  ingress {
    protocol    = "tcp"
    from_port   = 80
    to_port     = 80
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    protocol    = "-1"
    from_port   = 0
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "application" {
  name        = "${var.naming_prefix}-sg-application-000"
  description = "allow inbound access from the ALB only"
  vpc_id      = var.vpc_id

  tags = merge(
    var.tags,
    {
      "Name" = "${var.naming_prefix}-sg-application-000"
    },
  )

  ingress {
    protocol        = "tcp"
    from_port       = var.application_port
    to_port         = var.application_port
    security_groups = [aws_security_group.load_balancer.id]
  }

  egress {
    protocol    = "-1"
    from_port   = 0
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_lb" "application" {
  name            = local.alb_name
  subnets         = var.subnets
  security_groups = [aws_security_group.load_balancer.id, aws_security_group.load_balancer_redirect.id]

  tags = merge(
    var.tags,
    {
      "Name" = local.alb_name
    },
  )
}

resource "aws_lb_target_group" "application" {
  name        = local.alb_target_name
  port        = var.application_port
  protocol    = "HTTP"
  vpc_id      = var.vpc_id
  target_type = "ip"

  tags = merge(
    var.tags,
    {
      "Name" = local.alb_target_name
    }
  )

  health_check {
    interval            = 30
    path                = var.health_check_path
    port                = var.application_port
    healthy_threshold   = 3
    unhealthy_threshold = 3
    timeout             = 5
    protocol            = "HTTP"
    matcher             = "200-299"
  }
}

resource "aws_lb_listener" "application" {
  load_balancer_arn = aws_lb.application.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    target_group_arn = aws_lb_target_group.application.id
    type             = "forward"
  }
}
