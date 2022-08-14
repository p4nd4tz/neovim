# My Neovim Config

## Try out this config
Make sure to remove or move your current `` nvim `` directory 
```
git clone git@github.com:p4nd4tz/neovim.git ~/.config/nvim
```

Run `` nvim `` and wait for plugins to be installed

**NOTE:** ( You will notice treesitter pulling in a bunch of parsers the next you open neovim )

## Get healthy
Open nvim and enter the following:
```
:checkhealth
```
You'll probably notice you don't have support for copy/paste also that python and node haven't been setup

So let's fix that

First we'll fix copy/paste
* For Arch Linux  
```
sudo pacman -S xsel
```

Nex we need to install python support ( node is optional )
* Neovim python support  
```
pip install pynvim
```
* Neovim node support  
```
> npm i -g neovim
```
