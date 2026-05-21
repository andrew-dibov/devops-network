resource "yandex_lockbox_secret" "ls__bastion_ssh_key" {
  name = var.ls__bastion_ssh_key_name
}

resource "yandex_lockbox_secret_version" "ls__bastion_ssh_key_version" {
  secret_id = yandex_lockbox_secret.ls__bastion_ssh_key.id

  entries {
    key        = "private_key"
    text_value = tls_private_key.tls__bastion_ssh_key.private_key_openssh
  }

  entries {
    key        = "public_key"
    text_value = tls_private_key.tls__bastion_ssh_key.public_key_openssh
  }
}
