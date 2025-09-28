# Terraform Proxmox Infrastructure

This repository contains Terraform configuration and state files for managing infrastructure on [Proxmox Virtual Environment](https://www.proxmox.com/en/proxmox-virtual-environment/) using the [bpg/terraform-provider-proxmox](https://github.com/bpg/terraform-provider-proxmox).

## Structure

- `proxmox/`  
  Contains all Terraform configuration files and state for Proxmox resources.
  - `main.tf` - Main Terraform configuration.
  - `variables.tf` - Input variables for the configuration.
  - `terraform.tfvars` - Values for the input variables.
  - `.terraform.lock.hcl` - Provider dependency lock file.
  - `terraform.tfstate` / `terraform.tfstate.backup` - Terraform state files.
  - `.terraform/` - Terraform provider binaries and plugins.

## Usage

1. **Install Terraform**  
   Download and install [Terraform](https://www.terraform.io/downloads.html).

2. **Initialize the Project**
   ```sh
   cd proxmox
   terraform init
   ```

3. **Plan and Apply Changes**
   ```sh
   terraform plan
   terraform apply
   ```

## Provider

This repo uses the [bpg/proxmox](https://registry.terraform.io/providers/bpg/proxmox/latest) provider.  
See the [provider documentation](https://registry.terraform.io/providers/bpg/proxmox/latest/docs) for details on configuration and supported resources.

## State & Security

- State files (`terraform.tfstate`) may contain sensitive information.  
  Do not commit them to public repositories.
- Lock files and provider binaries are managed automatically by Terraform.

## License

See [`proxmox/.terraform/providers/registry.terraform.io/bpg/proxmox/0.83.0/linux_amd64/LICENSE`](proxmox/.terraform/providers/registry.terraform.io/bpg/proxmox/0.83.0/linux_amd64/LICENSE) for license details of the provider.

## Contributing

Feel free to open issues or pull requests for improvements.

## Acknowledgements

Provider developed by [bpg](https://github.com/bpg/terraform-provider-proxmox).  
This repo is not affiliated with Proxmox Server Solutions GmbH.
