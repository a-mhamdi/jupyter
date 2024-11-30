# Jupyter Docker Image

To run a Jupyter notebook or lab, follow these steps:
```zsh
export JUPYTER_CONFIG_DIR=.jupyter
uv pip venv .venv
uv pip install -r requirements.txt
jupyter notebook # lab
```
In order to retrieve the Docker image, type:
```zsh
docker pull abmhamdi/jupyter
```
The steps below can be used to rebuild the Docker image:
```zsh
docker build -t jupyter:local .
docker run --rm -p 2468:2468 jupyter:local
```
+ The server is accessible via port 2468;
+ No password is required.
