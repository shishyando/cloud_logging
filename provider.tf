variable "zone" {
  type    = string
  default = "ru-central1-a"
}


terraform {
  required_providers {
    yandex = {
      source  = "yandex-cloud/yandex"
      version = "0.84.0"
    }
  }
  required_version = ">= 0.13"
}

provider "yandex" {
  zone = var.zone
}
