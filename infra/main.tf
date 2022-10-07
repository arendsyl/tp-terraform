terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "2.22.0"
    }
  }
}

provider "docker" {
  host = "unix:///var/run/docker.sock"
}


resource "docker_image" "build" {
  name = "build"
  build {
    path = ".."
  }
}

resource "docker_container" "api" {
  image = docker_image.build.image_id
  name  = "api"
  ports {
    internal = 80
    external = 8080
  }
}
