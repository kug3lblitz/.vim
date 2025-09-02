# Setting up Vim/Nvim

### 1. Install Vim/Nvim from origin of choice, configure git
* `git config --global user.name "user name"`
* `git config --global user.email "user@email.com"`
* `git config --global core.editor /usr/bin/nvim`

### 2. Link .vim/ and .vimrc to Nvim config 

* `ln -s ~/.vim ~/.config/nvim`
* `ln -s ~/.vimrc ~/.config/nvim/init.vim` (linux only)
#### if you're on a mac, do not link init.vim. Instead, init.vim should contain
* ` set runtimepath^=~/.vim runtimepath+=~/.vim/after`
* ` let &packpath = &runtimepath`
* ` source ~/.vimrc`

### 3. Run Installer.sh to install dein

* `rm -r dein/ && mkdir dein`
* `sh installer.sh dein/` to install dein package manager

### 4. Install pynvim
* `pacman -S python-pynvim`
or
* `xbps-install -S python3-neovim`

### 5. Install Vim/Nvim plugins with dein

* Open vim/nvim, enter `call dein#install()` from command mode

### 6. Periodically update plugins

* enter `call dein#update()` from command mode to periodically update plugins

### 7. Add in desired airline color files


Also - nice little one liner for finding recent files globally (any pngs, in this example):
```

find / -type f -name "*.png" -printf "%T@ %p\n" 2>/dev/null | sort -n | tail -n 5

```
