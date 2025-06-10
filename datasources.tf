## Copyright (c) 2021, Oracle and/or its affiliates.
## All rights reserved. The Universal Permissive License (UPL), Version 1.0 as shown at http://oss.oracle.com/licenses/upl
# 

# Availability Domains
data "oci_identity_availability_domains" "ADs" {
  compartment_id = var.tenancy_ocid
}

# Tenancy details
data "oci_identity_tenancy" "oci_tenancy" {
  tenancy_id = var.tenancy_ocid
}

# Regions (filtered for current region)
data "oci_identity_regions" "oci_regions" {
  filter {
    name   = "name"
    values = [var.region]
  }
}

# OCI Services
data "oci_core_services" "all_services" {
  filter {
    name   = "name"
    values = ["All .* Services In Oracle Services Network"]
    regex  = true
  }
}

# Object Storage Namespace — uses tenancy OCID, not compartment
data "oci_objectstorage_namespace" "os_namespace" {
  compartment_id = var.tenancy_ocid
}

# Random value generator
resource "random_string" "deploy_id" {
  length  = 4
  special = false
}

# Use static locals instead of broken dynamic region lookup
locals {
  ocir_docker_repository = "${lower(var.region)}.ocir.io"
  ocir_namespace         = data.oci_objectstorage_namespace.os_namespace.namespace
}
