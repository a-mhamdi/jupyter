# Jupyter Docker Image

To install and run Jupyter, follow these steps:
```zsh
export JUPYTER_CONFIG_DIR=.jupyter
uv pip venv .venv
source .venv/bin/activate
uv pip install -U pip
uv pip install -r requirements.txt --upgrade
jupyter notebook # lab
```
In order to retrieve the docker image, type:
```zsh
docker pull abmhamdi/jupyter
```
The steps below can be used to rebuild the docker image:
```zsh
docker build -t jupyter:local .
docker run --rm -p 2468:2468 jupyter:local
```
+ The server is accessible via port 2468;
+ No password is required.
