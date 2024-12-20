# name: Terraform Plan and Apply Pipeline

# on:
#   push:
#     branches:
#       - main
#   workflow_dispatch:

# permissions:
#   id-token: write
#   contents: read

# jobs:
#   build-plan-and-apply:
#     runs-on: ubuntu-latest
#     steps:
#       - name: Azure login
#         uses: azure/login@v2
#         with:
#           client-id: "06db7845-49d9-4a99-b5c3-ed940162972d"
#           tenant-id: "6b99c178-e515-4bb7-bda4-073a8601a463"
#           subscription-id: "ed650814-527f-4ad3-98f7-9af062cc8adf"

#       - name: Checkout repository
#         uses: actions/checkout@v3

#       - name: Setup Terraform
#         uses: hashicorp/setup-terraform@v2
#         with:
#           terraform_wrapper: false

#       - name: Terraform Init
#         run: terraform init

#       - name: Terraform Plan
#         run: terraform plan -out=tfplan

#       - name: Save Terraform Plan
#         run: |
#           git config user.name "JuanF88"
#           git config user.email "juanfhurtado@unicauca.edu.co"
#           git add tfplan
#           git commit -m "Save Terraform plan output"
#           git push

#       - name: Apply Terraform Plan
#         if: github.event_name == 'workflow_dispatch'
#         run: terraform apply tfplan
