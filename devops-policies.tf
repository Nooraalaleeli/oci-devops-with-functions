## Copyright (c) 2021, Oracle and/or its affiliates.
## All rights reserved. The Universal Permissive License (UPL), Version 1.0 as shown at http://oss.oracle.com/licenses/upl
# 

# === DevOps Policies and Dynamic Groups (Commented out – requires tenancy-level access) ===

# resource "oci_identity_dynamic_group" "devops_coderepo_dg" {
#   provider       = oci.home_region
#   name           = "CodeReposDynamicGroup-${random_id.tag.hex}"
#   description    = "DevOps code repository dynamic group"
#   compartment_id = var.tenancy_ocid
#   matching_rule  = "ALL {resource.type = 'devopsrepository'}"
# }

# resource "oci_identity_dynamic_group" "devops_build_dg" {
#   provider       = oci.home_region
#   name           = "MyDynamicGroup-${random_id.tag.hex}"
#   description    = "DevOps repository build pipeline dynamic group"
#   compartment_id = var.tenancy_ocid
#   matching_rule  = "ALL {resource.type = 'devopsbuildpipeline'}"
# }

# resource "oci_identity_policy" "devopsrootpolicy" {
#   provider       = oci.home_region
#   name           = "devops-root-policies-${random_id.tag.hex}"
#   description    = "policy created for root compartment"
#   compartment_id = var.tenancy_ocid
#   statements = [
#     "Allow dynamic-group ${oci_identity_dynamic_group.devops_coderepo_dg.name} to manage all-resources in tenancy",
#     "Allow dynamic-group ${oci_identity_dynamic_group.devops_build_dg.name} to manage all-resources in tenancy",
#   ]
# }
