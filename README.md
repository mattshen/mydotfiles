# mydotfiles

## Download latest neovim
neovim releases: https://github.com/neovim/neovim/releases

```shell
curl -LO https://github.com/neovim/neovim/releases/download/nightly/nvim.appimage
chmod u+x nvim.appimage
sudo mv nvim.appimage /usr/local/bin/nvim
```

## Install VIM package manager for neovim
URL: https://github.com/junegunn/vim-plug

```shell
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

## Use init.vim from this repo

```
mkdir ~/.config/nvim
cd ~/.config/nvim
ln -s ~/Developer/mydotfiles/init.vim
```

## Launch nvim and install plugins
