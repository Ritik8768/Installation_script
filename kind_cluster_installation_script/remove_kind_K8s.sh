#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

# Function to delete all KinD clusters
delete_all_kind_clusters() {
    echo "Deleting all KinD clusters..."
    for cluster in $(kind get clusters); do
        kind delete cluster --name "$cluster"
        echo "Cluster '$cluster' deleted successfully."
    done
}

# Function to uninstall kubectl
uninstall_kubectl() {
    echo "Uninstalling kubectl..."
    sudo rm -f /usr/local/bin/kubectl
    echo "kubectl uninstalled successfully."
}

# Function to uninstall Docker
uninstall_docker() {
    echo "Uninstalling Docker..."
    sudo dnf remove -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
    sudo rm -rf /var/lib/docker
    sudo rm -rf /var/lib/containerd
    echo "Docker uninstalled successfully."
}

# Main script execution
main() {
    delete_all_kind_clusters
    uninstall_kubectl
    uninstall_docker
}

main
