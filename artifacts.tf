resource "oci_artifacts_container_repository" "test_container_repository" {
  compartment_id   = var.compartment_ocid
  display_name     = "oci-function-python-defaultimage-${random_id.tag.hex}"
  is_public        = var.container_repository_is_public
  repository_type  = "DOCKER"
}

resource "oci_artifacts_container_repository" "test_container_repository2" {
  compartment_id   = var.compartment_ocid
  display_name     = "oci-function-python-customimage-${random_id.tag.hex}"
  is_public        = var.container_repository_is_public
  repository_type  = "DOCKER"
}
