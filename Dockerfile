# Base image
FROM python:3.10.12

# Metadata
LABEL org.opencontainers.image.authors="A. Mhamdi"
LABEL version="latest"

# Install nvm (Node Version Manager)
RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.0/install.sh | bash

ENV PATH="/jl/.venv/bin":$PATH
ENV JUPYTER_CONFIG_DIR=/jl/.venv/.jupyter

COPY --from=ghcr.io/astral-sh/uv:latest /uv /uvx /bin

WORKDIR /jl
COPY requirements.txt requirements.txt
RUN uv venv .venv
RUN uv pip install pip --upgrade
RUN uv pip install -r requirements.txt --upgrade
COPY .jupyter .venv/.jupyter
RUN bash -c "source $HOME/.nvm/nvm.sh && nvm install 22 && jupyter lab build"
WORKDIR /jl/work
 
# Expose 2468
EXPOSE 2468

# Default command
CMD ["jupyter", "notebook"]
