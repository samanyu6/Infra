terraform {
  required_providers {
    docker = {
      source = "kreuzwerker/docker"
    }
  }
}

provider "docker" {
  host = "npipe:////.//pipe//docker_engine"   #windows specific, this is different for POSIX systems
}

resource "docker_image" "nginx" {  
  name         = "nginx:latest"
  keep_locally = false
}

resource "docker-container" "nginx" {
  image = docker_image.nginx.latest
  name  = "tutorial"
  ports {
    internal = 80
    external = 8000
  }
}
