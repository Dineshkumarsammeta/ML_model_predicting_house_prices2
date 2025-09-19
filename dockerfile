# Dockerfile
# Multi-stage build: install deps in a builder stage then copy to slimmer runtime image

# ---- Builder: install dependencies ----
FROM python:3.11-slim AS builder

# Install system deps needed for common ML packages (adjust if you need more e.g., build-essential)
RUN apt-get update && apt-get install -y --no-install-recommends \
    gcc \
    libpq-dev \
    git \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

# Copy dependency manifests early for caching
COPY requirements.txt ./
# If you use pyproject.toml / poetry, add it here instead
RUN python -m pip install --upgrade pip setuptools wheel
RUN pip wheel --no-cache-dir --wheel-dir /wheels -r requirements.txt

# ---- Runtime image ----
FROM python:3.11-slim

# Create a non-root user
ARG USER=appuser
RUN adduser --disabled-password --gecos "" ${USER}
WORKDIR /app

# Install minimal runtime deps and copy wheels
COPY --from=builder /wheels /wheels
RUN python -m pip install --upgrade pip && \
    pip install --no-cache /wheels/*

# Copy project files
COPY . /app

# Ensure scripts are executable (if any)
RUN chmod +x /app/*.sh || true

# Use non-root user (security best practice)
USER ${USER}

# Expose commonly used ports (API / dashboard)
EXPOSE 8000 8501

# Default command: open a shell. Override with `docker run <image> <command>`
CMD ["bash"]
