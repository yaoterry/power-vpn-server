resource "ibm_pi_network" "power_network" {
  pi_network_name      = var.name
  pi_cloud_instance_id = var.power_workspace_id
  pi_network_type      = "vlan"
  pi_cidr              = "10.100.0.0/24"
  pi_gateway           = "10.100.0.1"
}

resource "ibm_pi_image" "demo_image" {
  pi_image_name        = "RHEL9-SP2"
  pi_image_id          = "9461ad89-514c-4d2f-bc5b-d16cc12b979e"
  pi_cloud_instance_id = var.power_workspace_id
}

resource "ibm_pi_key" "key" {
  pi_key_name          = var.name
  pi_ssh_key           = var.ssh_public_key
  pi_cloud_instance_id = var.power_workspace_id
}

resource "ibm_pi_instance" "test-instance" {
  pi_memory            = "4"
  pi_processors        = "2"
  pi_instance_name     = var.name
  pi_proc_type         = "shared"
  pi_image_id          = ibm_pi_image.demo_image.image_id
  pi_key_pair_name     = ibm_pi_key.key.key_id
  pi_sys_type          = "s922"
  pi_cloud_instance_id = var.power_workspace_id
  pi_pin_policy        = "none"
  pi_health_status     = "WARNING"
  pi_network {
    network_id = ibm_pi_network.power_network.network_id
    ip_address = "10.100.0.100"
  }
}
