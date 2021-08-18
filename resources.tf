/*
resource "netapp-cloudmanager_cvo_aws" "cvo-aws" {
  #provider = netapp-cloudmanager
  name   = var.name_of_cvo_working_environment
  region = var.region
  subnet_id = var.subnet
  svm_password = var.cvo_admin_password
  client_id           = var.connector_id
  writing_speed_state = "NORMAL"
}
*/



resource "netapp-cloudmanager_volume" "cvo-volume-nfs" {
  provider = netapp-cloudmanager
  volume_protocol = "nfs"
  name = "volume_1"
  size = 1
  unit = "GB"
  provider_volume_type = "gp2"
  export_policy_type = "custom"
  export_policy_ip = ["0.0.0.0/0"]
  export_policy_nfs_version = ["nfs4"]
  working_environment_id = var.working_environment_id
  client_id = var.connector_id
}
