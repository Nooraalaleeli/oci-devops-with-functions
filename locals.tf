## Copyright (c) 2021, Oracle and/or its affiliates.
## All rights reserved. The Universal Permissive License (UPL), Version 1.0 as shown at http://oss.oracle.com/licenses/upl

locals {
  devops_compartment_statements = concat(
    local.allow_devops_manage_compartment_statements,
  )
}

locals {
  app_name_lower = lower(var.app_name)
}

locals {
  allow_devops_manage_compartment_statements = [
    "Allow dynamic-group your-dg-name-here to manage all-resources in tenancy"
  ]
}
