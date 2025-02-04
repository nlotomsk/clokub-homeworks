resource "yandex_compute_instance" "nat-instance" {
  name     = var.nat-instance-name
  hostname = "${var.nat-instance-name}.${var.domain}"

  resources {
    cores  = 2
    memory = 2
  }

  boot_disk {
    initialize_params {
      image_id    = var.nat-instance-image-id
      name        = "root-${var.nat-instance-name}"
      type        = "network-nvme"
      size        = "50"
    }
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.subnet-public.id
    ip_address = var.nat-instance-ip
    nat       = true
  }

  metadata = {
    ssh-keys = "ubuntu:${local.key_ssh}"
  }
}

resource "yandex_compute_instance" "public-vm" {
  name     = var.public-vm-name
  hostname = "${var.public-vm-name}.${var.domain}"

  resources {
    cores  = 2
    memory = 2
  }

  boot_disk {
    initialize_params {
      image_id    = var.ubuntu-2004-lts
      name        = "root-${var.public-vm-name}"
      type        = "network-nvme"
      size        = "50"
    }
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.subnet-public.id
    nat       = true
  }

  metadata = {
    ssh-keys = "ubuntu:${local.key_ssh}"
  }
}

resource "yandex_compute_instance" "private-vm" {
  name     = var.private-vm-name
  hostname = "${var.private-vm-name}.${var.domain}"

  resources {
    cores  = 2
    memory = 2
  }

  boot_disk {
    initialize_params {
      image_id    = var.ubuntu-2004-lts
      name        = "root-${var.private-vm-name}"
      type        = "network-nvme"
      size        = "50"
    }
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.subnet-private.id
    nat       = false
  }

  metadata = {
    ssh-keys = "ubuntu:${local.key_ssh}"
  }
}