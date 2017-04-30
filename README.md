# Setting up Vim/Nvim

### 1. Install Vim/Nvim from origin of choice

### 2. Link .vim/ and .vimrc to Nvim config

* `ln -s ~/.vim ~/.config/nvim`
* `ln -s ~/.vimrc ~/.config/nvim/init.vim`

### 3. Run Installer.sh to install dein

* `sh installer.sh dein` to install dein package manager

### 4. Install Vim/Nvim plugins with dein

* Open vim/nvim, enter `call dein#install()` from command mode

### 5. Periodically update plugins

* enter `call dein#update()` from command mode to periodically update plugins
