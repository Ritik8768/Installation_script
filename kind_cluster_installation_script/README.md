# Kubernetes in Docker (KinD) Setup Script

This script automates the installation of Docker, `kubectl`, KinD (Kubernetes in Docker), and creates a local KinD cluster. Follow the steps below to use it.

---

## Step-by-Step Installation Guide

### Step 1: Clone the Repository
```bash
git clone https://github.com/Ritik8768/Installation_script.git

cd Installation_script.git
```

### Step 2: Make the Script Executable
```bash
chmod +x install_kind_K8s.sh
```

### Step 3: Run the Installation Script
```bash
./install_kind_K8s.sh
```

The script will:
1. Install Docker and start the Docker service.
2. Install `kubectl` (Kubernetes CLI).
3. Install KinD based on your system architecture (`x86_64` or `aarch64`).
4. Create a KinD cluster.

---

## Verify the Installation

After the script completes, run these commands to confirm everything works:

1. **Check Docker**:
   ```bash
   docker --version
   ```
   Example output: `Docker version 24.0.7, build afdd53b`

2. **Check `kubectl`**:
   ```bash
   kubectl version --client
   ```
   Example output: `Client Version: v1.28.2`

3. **Check KinD**:
   ```bash
   kind version
   ```
   Example output: `kind v0.20.0 go1.20.4 linux/amd64`

4. **Check KinD Cluster**:
   ```bash
   kubectl cluster-info
   ```
   Example output:  
   ```
   Kubernetes control plane is running at https://127.0.0.1:6443
   CoreDNS is running at https://127.0.0.1:6443/api/v1/namespaces/kube-system/services/kube-dns:dns/proxy
   ```

---

## Example Script Output

Successful execution will show:
```bash
Installing Docker...
Docker installed successfully.
Installing kubectl...
kubectl installed successfully.
Installing KinD...
KinD installed successfully.
Creating KinD cluster...
KinD cluster created successfully.
```

---

## Notes
- **Supported Systems**: CentOS/RHEL-based Linux distributions (e.g., CentOS 7/8, Fedora).
- **Internet Connection Required**: The script downloads packages from the internet.
