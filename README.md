
# Ethereum Deployment on GKE using Helm

## Prerequisites

- [Google Cloud SDK](https://cloud.google.com/sdk/docs/install)
- [Terraform](https://learn.hashicorp.com/tutorials/terraform/install-cli)
- [Helm](https://helm.sh/docs/intro/install/)
- [Docker](https://docs.docker.com/get-docker/)
- A GCP account with billing enabled

## Setup Instructions

### 1. Configure GCP Project

1. Create a new GCP project.
2. Enable the Kubernetes Engine API and Compute Engine API.
3. Authenticate using the Google Cloud SDK:
    ```sh
    gcloud auth login
    gcloud config set project aleveri-assessment
    gcloud auth application-default login
    ```

### 2. Deploy GKE Cluster using Terraform

1. Clone the repository:
    ```sh
    git clone <repository-url>
    cd <repository-directory>
    ```

2. Initialize Terraform:
    ```sh
    terraform init
    ```

3. Apply the Terraform configuration:
    ```sh
    terraform apply -var 'project_id=aleveri-assessment' -var 'region=us-east1'
    ```

### 3. Set Up Helm

1. Install Helm if not already installed:
    ```sh
    curl https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3 | bash
    ```

2. Initialize Helm and add any necessary repositories:
    ```sh
    helm repo add stable https://charts.helm.sh/stable
    helm repo update
    ```

### 4. Build Docker Images for Ethereum Nodes

1. Build the Docker images:
    ```sh
    docker build -t bootnode:latest ./bootnode
    docker build -t jsonrpc:latest ./jsonrpc
    docker build -t miner:latest ./miner
    ```

### 5. Verify Deployment

1. Get the external IP of the JSON-RPC service:
    ```sh
    kubectl get services
    ```

2. Interact with the JSON-RPC endpoint to ensure it's functioning correctly:
    ```sh
    curl http://<json-rpc-external-ip>:8545
    ```

### Cleanup

To destroy the resources created by Terraform:
```sh
terraform destroy
```

To uninstall the Helm charts:
```sh
helm uninstall bootnode
helm uninstall jsonrpc
helm uninstall miner
```
