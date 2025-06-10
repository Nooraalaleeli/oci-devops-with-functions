resource "oci_devops_deploy_artifact" "test_deploy_artifact_default" {
  argument_substitution_mode = var.deploy_artifact_argument_substitution_mode
  deploy_artifact_source {
    deploy_artifact_source_type = var.deploy_artifact_deploy_artifact_source_deploy_artifact_source_type
    image_uri     = "${local.ocir_docker_repository}/${local.ocir_namespace}/${oci_artifacts_container_repository.test_container_repository.display_name}:$${BUILDRUN_HASH}"
    image_digest  = " "
    repository_id = oci_devops_repository.test_repository.id
  }
  deploy_artifact_type = var.deploy_artifact_deploy_artifact_type
  project_id           = oci_devops_project.test_project.id
  display_name         = "artifact-default"
}

resource "oci_devops_deploy_artifact" "test_deploy_artifact_custom" {
  argument_substitution_mode = var.deploy_artifact_argument_substitution_mode
  deploy_artifact_source {
    deploy_artifact_source_type = var.deploy_artifact_deploy_artifact_source_deploy_artifact_source_type
    image_uri     = "${local.ocir_docker_repository}/${local.ocir_namespace}/${oci_artifacts_container_repository.test_container_repository2.display_name}:$${BUILDRUN_HASH}"
    image_digest  = " "
    repository_id = oci_devops_repository.test_repository.id
  }
  deploy_artifact_type = var.deploy_artifact_deploy_artifact_type
  project_id           = oci_devops_project.test_project.id
  display_name         = "artifact-custom"
}

resource "oci_artifacts_container_repository" "test_container_repository" {
  compartment_id = var.compartment_ocid
  display_name   = "test-container-repo"
  is_public      = false
}

resource "oci_artifacts_container_repository" "test_container_repository2" {
  compartment_id = var.compartment_ocid
  display_name   = "test-container-repo-2"
  is_public      = false
}

