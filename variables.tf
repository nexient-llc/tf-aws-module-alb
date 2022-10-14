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

variable "name" {
  description = "Name of the application."
  type        = string
}

variable "naming_prefix" {
  description = "Prefix to other resources."
}

variable "vpc_id" {
  description = "Application Name running in ECS Task."
  type        = string
}

variable "subnets" {
  description = "Subnet ID's for the Load Balancer to use."
  type        = list(string)
}

variable "health_check_interval" {
  description = "The approximate amount of time, in seconds, during which no response from a target means a failed health check."
  type        = number
  default     = 30

  validation {
    condition     = var.health_check_interval >= 2 && var.health_check_interval <= 120
    error_message = "The value must be between 2 and 120 seconds."
  }
}

variable "health_check_path" {
  description = "Path to check App Health (e.g.; /, /health)"
  type        = string
  default     = "/"
}

variable "application_port" {
  description = "Port of Application"
  type        = string
  default     = 80
}

variable "healthy_threshold" {
  description = "Consecutive health checks needed to declare healthy."
  type        = number
  default     = 3
}

variable "unhealthy_threshold" {
  description = "Consecutive failed health checks needed to declare unhealthy."
  type        = number
  default     = 3
}

variable "timeout" {
  description = "Wait time for response (seconds)"
  type        = number
  default     = 5
}

variable "certificate_arn" {
  description = "ARN of the ACM cert"
  type        = string
  default     = ""
}

variable "tags" {
  description = "Tags to be applied to all resources created"
  type        = map(string)
  default     = {}
}
