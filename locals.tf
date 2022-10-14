locals {
  # This name must be unique within your set of load balancers for the region,
  # must have a maximum of 32 characters, must contain only alphanumeric
  # characters or hyphens, and cannot begin or end with a hyphen.
  alb_name = replace(replace("${var.name}-alb-000", "/(.{0,32})(.*)/", "$1"), "_", "-")
  # For Target group name, type a name for the target group. This name must be
  # unique per region per account, can have a maximum of 32 characters, must
  # contain only alphanumeric characters or hyphens, and must not begin or end with a hyphen.
  alb_target_name = replace(replace("${var.name}-target-group-000", "/(.{0,32})(.*)/", "$1"), "_", "-")
}
