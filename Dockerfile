FROM python:3.13-slim AS builder

WORKDIR /app

# Install UV for fast dependency installation
RUN pip install --no-cache-dir uv

# Build argument for version (passed from GitHub Actions)
ARG CZ_VERSION
RUN test -n "$CZ_VERSION" || (echo "CZ_VERSION not set" && false)

# Install commitizen with UV
RUN uv pip install --system --no-cache commitizen==${CZ_VERSION}

# Runtime stage
FROM python:3.13-slim

LABEL org.opencontainers.image.source="https://github.com/commitizen-tools/commitizen"
LABEL org.opencontainers.image.description="Commitizen is a release management tool designed for teams"
LABEL org.opencontainers.image.licenses="MIT"

# Install git (required for commitizen operations)
RUN apt-get update && \
    apt-get install -y --no-install-recommends git && \
    rm -rf /var/lib/apt/lists/*

# Copy Python packages and binaries from builder
COPY --from=builder /usr/local/lib/python3.13/site-packages /usr/local/lib/python3.13/site-packages
COPY --from=builder /usr/local/bin/cz /usr/local/bin/cz
COPY --from=builder /usr/local/bin/git-cz /usr/local/bin/git-cz

# Working directory
WORKDIR /app

# Entry point on cz command
ENTRYPOINT ["cz"]

# Default command: show version
CMD ["version"]
