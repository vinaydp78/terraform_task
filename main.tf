provider "helm" {}

resource "helm_release" "example"{
  name       = "example"
  repository = "https://charts.bitnami.com/bitnami"
  chart      = "node"
}

resource "null_resource" "top_command" {
  provisioner "local-exec" {
    command = "top -b -n 1 > top-$(date +%s).txt"
  }
}

