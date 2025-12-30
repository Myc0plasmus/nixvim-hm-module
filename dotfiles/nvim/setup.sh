# lsp
sudo pacman -S pyright
sudo pacman -S lua-language-server
sudo pacman -S clangd
sudo pacman -S lldb
sudo pacman -S xclip
paru quick-lint-js
sudo pacman -S vscode-html-languageserver
sudo pacman -S vscode-json-languageserver
sudo apcamn -S eslint-language-server
paru kotlin-language-server

#python debug 
cd ~
mkdir .virtualenvs
cd .virtualenvs
python -m venv debugpy
debugpy/bin/python -m pip install debugpy

#cpp debug
#/usr/bin/lldb-vscode

#jupyter plugin
pip install pynvim
pip install jupyter_client
pip install ueberzug
pip install Pillow
pip install cairosvg
pip install pnglatex
pip install plotly
pip install jupytext
