# TEE Demonstrator Infrastructure

Minimal Terraform repository configured with GitHub Actions workflows for deploying and destroying Azure resources.

## Repository Structure

```
.
├── .github/
│   └── workflows/
│       ├── tee-deploy.yml     # GitHub Action to deploy Terraform infrastructure
│       └── tee-destroy.yml    # GitHub Action to destroy Terraform infrastructure
└── terraform/
    ├── main.tf                # Provider & Storage Account definitions
    ├── variables.tf           # Input parameters
    ├── outputs.tf             # Outputs (storage account ID, endpoints)
    └── terraform.tfvars.example
```

## GitHub Environment Setup

To enable deployment from GitHub Actions:

1. Create target environments in GitHub (**Settings > Environments**), e.g., `dev`, `staging`, `prod`.
2. Configure environment **Secrets** (or **Variables**) for Azure OIDC authentication (using Managed Identity):
   - `ARM_CLIENT_ID`: Azure Managed Identity Client ID
   - `ARM_SUBSCRIPTION_ID`: Azure Subscription ID
   - `ARM_TENANT_ID`: Azure Directory (tenant) ID

## Workflow Usage

### `tee-deploy`
- Go to **Actions > TEE Deploy > Run workflow**.
- Select target environment (`dev`, `staging`, `prod`).
- Select action (`apply` or `plan`).
- Optionally override `resource_group_name` or `location`.

### `tee-destroy`
- Go to **Actions > TEE Destroy > Run workflow**.
- Select target environment.
- Type `DESTROY` into the confirmation field to authorize destruction.
