# Use a Python image with uv pre-installed
FROM ghcr.io/astral-sh/uv:debian

# Setup a non-root user
RUN groupadd --system --gid 999 nonroot \
    && useradd --system --gid 999 --uid 999 --create-home nonroot

# Install the project into `/app`
WORKDIR /app

# Keeps Python from buffering stdout and stderr to avoid situations where
# the application crashes without emitting any logs due to buffering.
ENV PYTHONUNBUFFERED=1

# Enable bytecode compilation
# ENV UV_COMPILE_BYTECODE=1

# Copy from the cache instead of linking since it's a mounted volume
ENV UV_LINK_MODE=copy

# Omit development dependencies
# ENV UV_NO_DEV=1

# Ensure installed tools can be executed out of the box
ENV UV_TOOL_BIN_DIR=/usr/local/bin

# Install the project's dependencies using the lockfile and settings
RUN --mount=type=cache,target=/root/.cache/uv \
    --mount=type=bind,source=uv.lock,target=uv.lock \
    --mount=type=bind,source=pyproject.toml,target=pyproject.toml \
    uv sync --locked --no-install-project
# RUN --mount=type=cache,target=/root/.cache/uv \
#     --mount=type=bind,source=uv.lock,target=uv.lock \
#     --mount=type=bind,source=pyproject.toml,target=pyproject.toml \
#     uv sync --frozen --no-install-workspace

# Then, add the rest of the project source code and install it
# Installing separately from its dependencies allows optimal layer caching
COPY . /app
RUN --mount=type=cache,target=/root/.cache/uv \
    uv sync --locked

# Place executables in the environment at the front of the path
ENV PATH="/app/.venv/bin:$PATH"

# Reset the entrypoint, don't invoke `uv`
ENTRYPOINT []

###
RUN chmod -R 777 /app/.venv/
ENV UV_NO_CACHE=1

ENV XDG_CONFIG_HOME=/tmp/.config
ENV XDG_CACHE_HOME=/tmp/.cache

# Use the non-root user to run our application
USER nonroot

###
CMD ["python"]


###


# # For more information, please refer to https://aka.ms/vscode-docker-python
# # FROM python:3.13
# FROM mcr.microsoft.com/devcontainers/python:3.13

# # Keeps Python from generating .pyc files in the container
# ENV PYTHONDONTWRITEBYTECODE=1

# # Turns off buffering for easier container logging
# ENV PYTHONUNBUFFERED=1

# # Ignore non-root pip usage
# ENV PIP_ROOT_USER_ACTION=ignore

# #
# RUN apt-get -y update && apt-get -y upgrade && apt-get install -y \
#     libgl1 \
#     libegl1 \
#     libxkbcommon-x11-0 \
#     libdbus-1-3 \
#     libxcb-cursor0 \
#     libwayland-cursor0 \
#     libwayland-egl1

# # Install pip requirements
# RUN python -m pip install --upgrade wheel setuptools pip
# COPY requirements.txt requirements-dev.txt /tmp/pip-tmp/
# RUN python -m pip --disable-pip-version-check --no-cache-dir install \
#     -r /tmp/pip-tmp/requirements.txt \
#     -r /tmp/pip-tmp/requirements-dev.txt \
#     && rm -rf /tmp/pip-tmp

# WORKDIR /app
# # COPY . .
# # RUN python -m pip install -e .[dev]

# # Creates a non-root user with an explicit UID and adds permission to access the /app folder
# # For more info, please refer to https://aka.ms/vscode-docker-python-configure-containers
# # RUN adduser -u 5678 --disabled-password --gecos "" appuser && \
# #     chown -R appuser /app
# # USER appuser

# # During debugging, this entry point will be overridden. For more information, please refer to https://aka.ms/vscode-docker-python-debug
# # ENTRYPOINT [ "/bin/sh", "-c" ]
# # CMD ["/bin/bash"]
# CMD ["/bin/zsh"]
