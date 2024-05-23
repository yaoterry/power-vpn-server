variable "name" {
  type        = string
  description = "Name of the PowerVS Workspace"
}

variable "ssh_public_key" {
  type        = string
  description = "SSH public key to login Power virtual server"
}

variable "power_workspace_id" {
  type        = string
  description = "GUID of the Power Workspace to create the connection for"
}