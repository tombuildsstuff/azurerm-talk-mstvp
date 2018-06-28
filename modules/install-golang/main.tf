resource "null_resource" "install-golang" {
  count = "${var.ip_address != "" ? 1 : 0}"

  provisioner "remote-exec" {
    inline = [
      "sudo apt-get update",
      "sudo apt-get install -y golang",
    ]
  }

  connection {
    type     = "ssh"
    host     = "${var.ip_address}"
    user     = "${var.username}"
    password = "${var.password}"
  }
}
