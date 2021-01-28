if g:dein#_cache_version !=# 150 || g:dein#_init_runtimepath !=# '/home/patrick/.config/nvim,/usr/etc/xdg/nvim,/etc/xdg/nvim,/home/patrick/.local/share/nvim/site,/usr/local/share/nvim/site,/usr/share/nvim/site,/usr/share/nvim/runtime,/usr/share/nvim/site/after,/usr/local/share/nvim/site/after,/home/patrick/.local/share/nvim/site/after,/etc/xdg/nvim/after,/usr/etc/xdg/nvim/after,/home/patrick/.config/nvim/after,/usr/share/vim/vimfiles,/home/patrick/.vim/dein/repos/github.com/Shougo/dein.vim' | throw 'Cache loading error' | endif
let [plugins, ftplugin] = dein#load_cache_raw(['/home/patrick/.vim/init.vim'])
if empty(plugins) | throw 'Cache loading error' | endif
let g:dein#_plugins = plugins
let g:dein#_ftplugin = ftplugin
let g:dein#_base_path = '/home/patrick/.vim/dein'
let g:dein#_runtime_path = '/home/patrick/.vim/dein/.cache/init.vim/.dein'
let g:dein#_cache_path = '/home/patrick/.vim/dein/.cache/init.vim'
let &runtimepath = '/home/patrick/.config/nvim,/usr/etc/xdg/nvim,/etc/xdg/nvim,/home/patrick/.local/share/nvim/site,/usr/local/share/nvim/site,/usr/share/nvim/site,/home/patrick/.vim/dein/repos/github.com/Shougo/dein.vim,/home/patrick/.vim/dein/.cache/init.vim/.dein,/usr/share/nvim/runtime,/home/patrick/.vim/dein/.cache/init.vim/.dein/after,/usr/share/nvim/site/after,/usr/local/share/nvim/site/after,/home/patrick/.local/share/nvim/site/after,/etc/xdg/nvim/after,/usr/etc/xdg/nvim/after,/home/patrick/.config/nvim/after,/usr/share/vim/vimfiles'
filetype off
