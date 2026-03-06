# Stage 1: Downloader
FROM debian:bookworm-slim AS builder

ARG COPILOT_CLI_VERSION="latest"

# Install curl and tar to download and extract the CLI binary
RUN apt-get update && apt-get install -y ca-certificates curl tar

WORKDIR /tmp
RUN set -ex; \
    ARCH=$(dpkg --print-architecture); \
    if [ "$ARCH" = "amd64" ]; then \
      COPI_ARCH="x64"; \
    elif [ "$ARCH" = "arm64" ]; then \
      COPI_ARCH="arm64"; \
    else \
      echo "Unsupported architecture: $ARCH"; exit 1; \
    fi; \
    if [ "${COPILOT_CLI_VERSION}" = "latest" ]; then \
      curl -fsSL https://github.com/github/copilot-cli/releases/latest/download/copilot-linux-${COPI_ARCH}.tar.gz -o copilot.tar.gz; \
    else \
      curl -fsSL https://github.com/github/copilot-cli/releases/download/${COPILOT_CLI_VERSION}/copilot-linux-${COPI_ARCH}.tar.gz -o copilot.tar.gz; \
    fi && \
    tar -xzf copilot.tar.gz && \
    chmod +x copilot

# Stage 2: Final Image
FROM debian:bookworm-slim

# Install runtime dependencies: gosu (for user mapping), git (for repos)
RUN apt-get update && apt-get install -y \
    gosu \
    git \
    ca-certificates \
    && rm -rf /var/lib/apt/lists/*

# Setup unprivileged user defaults
COPY usr/ /usr/
COPY .copilot/ /etc/copilot/
RUN chmod +x /usr/local/sbin/docker-entrypoint.sh

# Copy the pre-compiled binary from the builder stage
COPY --from=builder /tmp/copilot /usr/local/bin/copilot

# Verify binary works
RUN copilot --version

WORKDIR /workspace
ENTRYPOINT ["/usr/local/sbin/docker-entrypoint.sh", "copilot"]
