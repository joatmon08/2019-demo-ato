provider "docker" {
  version = "~> 2.4"
}

locals {
  container_name = "2019-ato"
}

resource "docker_container" "ato" {
  image = "nginx:latest"
  name  = local.container_name
}

// resource "docker_network" "ato" {
//   name = "ato"
// }