#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

# Function to install Docker
install_docker() {
    echo "Installing Docker..."
    sudo dnf install -y yum-utils
    sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
    sudo dnf install -y docker-ce docker-ce-cli containerd.io
    sudo systemctl start docker
    sudo systemctl enable docker
    echo "Docker installed successfully."
}

# Function to install kubectl
install_kubectl() {
    echo "Installing kubectl..."
    curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
    sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
    rm -f kubectl
    echo "kubectl installed successfully."
}

# Function to install KinD
install_kind() {
    echo "Installing KinD..."
    ARCH=$(uname -m)
    if [ "$ARCH" = "x86_64" ]; then
        curl -Lo ./kind https://kind.sigs.k8s.io/dl/v0.27.0/kind-linux-amd64
    elif [ "$ARCH" = "aarch64" ]; then
        curl -Lo ./kind https://kind.sigs.k8s.io/dl/v0.27.0/kind-linux-arm64
    else
        echo "Unsupported architecture: $ARCH"
        exit 1
    fi
    chmod +x ./kind
    sudo mv ./kind /usr/local/bin/kind
    echo "KinD installed successfully."
}

# Function to create a KinD cluster
create_kind_cluster() {
    echo "Creating KinD cluster..."
    kind create cluster
    echo "KinD cluster created successfully."
}

# Main script execution
main() {
    install_docker
    install_kubectl
    install_kind
    create_kind_cluster
}

main
