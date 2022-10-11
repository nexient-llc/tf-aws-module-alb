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

output "dns_name" {
  description = "ALB DNS Name"
  value       = aws_lb.application.dns_name
}

output "zone_id" {
  description = "ALB Zone ID"
  value       = aws_lb.application.zone_id
}

output "arn" {
  description = "ALB ARN"
  value       = aws_lb_listener.application.arn
}

output "target_group_arn" {
  description = "ALB Target Group ARN"
  value       = aws_lb_target_group.application.arn
}

output "sg_id" {
  description = "ALB Security Group, Allow 443"
  value       = aws_security_group.load_balancer.id
}

output "sg_redirect_id" {
  description = "ALB Allow port 80 redirect to 443"
  value       = aws_security_group.load_balancer_redirect.id
}

output "application_sg_id" {
  description = "Application Security Group"
  value       = aws_security_group.application.id
}
