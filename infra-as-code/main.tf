provider "docker" {
  version = "~> 2.4"
}

resource "docker_image" "ato" {
  name = "nginx:latest"
  //name = "joatmon08/hello"
}

resource "docker_container" "ato" {
  image = "${docker_image.ato.latest}"
  name  = "2019-ato-demo"
}

// resource "docker_network" "ato" {
//   name = "ato"
// }