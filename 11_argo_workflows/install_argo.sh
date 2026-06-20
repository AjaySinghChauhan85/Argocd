# Detect OS
ARGO_OS="darwin"
if [[ "$(uname -s)" != "Darwin" ]]; then
  ARGO_OS="linux"
fi

# Detect architecture
ARGO_ARCH="amd64"
if [[ "$(uname -m)" == "arm64" || "$(uname -m)" == "aarch64" ]]; then
  ARGO_ARCH="arm64"
fi

# Download the binary
curl -sLO "https://github.com/argoproj/argo-workflows/releases/download/v4.0.6/argo-$ARGO_OS-$ARGO_ARCH.gz"

# Unzip
gunzip "argo-$ARGO_OS-$ARGO_ARCH.gz"

# Make binary executable
chmod +x "argo-$ARGO_OS-$ARGO_ARCH"

# Move binary to path
sudo mv "./argo-$ARGO_OS-$ARGO_ARCH" /usr/local/bin/argo

# Test installation
argo version
