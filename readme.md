# Installing python lsp stuff

```console
pyenv virtualenv 3.8.9 nvim_venv
pyenv activate nvim_venv
python -m pip install --upgrade pynvim basedpyright autopep8 isort
```

# Fixing versions

```console
cd ~/.local/share/nvim/mason/packages/basedpyright
source ./venv/bin/activate
cd ~/.local/share/nvim/mason/packages/basedpyright/venv/lib/python3.8/site-packages
nvim basedpyright-1.10.2.dist-info/METADATA
```

# Change to nodejs-bin>=18 ... to nodejs-bin==16.15.1a4

```console
pip install nodejs-bin==16.15.1a4
```
