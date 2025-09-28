terraform {
  required_providers {
    proxmox = {
      source  = "bpg/proxmox"
      version = "~> 0.70"
    }
  }
}

provider "proxmox" {
  endpoint  = "https://192.168.1.240:8006/api2/json"
  api_token = var.proxmox_api_token
  insecure  = true
}

resource "proxmox_virtual_environment_container" "test_lxc" {
  node_name     = "node2"
  description   = "Managed by Terraform"
  unprivileged  = false           # Use privileged to avoid NFS permission issues
  start_on_boot = true
  started       = true

  cpu {
    cores = 1
  }

  memory {
    dedicated = 1024              # Increased from 512MB for better performance
    swap      = 0
  }

  # Root disk on truenas-nfs (shared NFS storage)
  disk {
    datastore_id = "truenas-nfs"
    size         = 8
  }

  # Optional: Add additional disk on NFS if needed
  # disk {
  #   datastore_id = "truenas-nfs"
  #   size         = 10
  #   mount_point  = "/mnt/shared"
  # }

  network_interface {
    name   = "eth0"
    bridge = "vmbr0"
  }

  initialization {
    hostname = "test-lxc"

    dns {
      servers = ["192.168.1.198"]
      domain  = "lan"
    }

    ip_config {
      ipv4 {
        address = "192.168.1.212/24"
        gateway = "192.168.1.1"
      }
    }
  }

  operating_system {
    template_file_id = "nvme-storage:vztmpl/debian-12-standard_12.12-1_amd64.tar.zst"
    type             = "debian"
  }
}