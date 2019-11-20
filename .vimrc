" Note: Skip initialization for vim-tiny or vim-small.
 if 0 | endif

 if &compatible
   set nocompatible               " Be iMproved
 endif

" Required:
set runtimepath+=/home/patrick/.vim/dein/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('/home/patrick/.vim/dein')
  call dein#begin('/home/patrick/.vim/dein')

  " Let dein manage dein
  " Required:
  call dein#add('/home/patrick/.vim/dein/repos/github.com/Shougo/dein.vim')

  " Add or remove your plugins here:
  call dein#add('ctrlpvim/ctrlp.vim')
  call dein#add('mattn/emmet-vim')
  call dein#add('Yggdroot/indentLine')
  call dein#add('scrooloose/nerdcommenter')
  call dein#add('hdima/python-syntax')
  call dein#add('vim-syntastic/syntastic')
  call dein#add('edkolev/tmuxline.vim')
  call dein#add('leafgarland/typescript-vim')
  call dein#add('vim-airline/vim-airline')
  call dein#add('vim-airline/vim-airline-themes')
  call dein#add('gko/vim-coloresque')
  call dein#add('digitaltoad/vim-pug')
  call dein#add('Shougo/deoplete.nvim')
  call dein#add('easymotion/vim-easymotion')
  call dein#add('mxw/vim-jsx')
  " You can specify revision/branch/tag.
  "call dein#add('Shougo/vimshell', { 'rev': '3787e5' })

  " Required:
  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
"if dein#check_install()
"  call dein#install()
"endif
" Disable Vi compatibility mode
set nocompatible

" Enables syntax highlighting by filename
" Also enables filetype dependent indentation
filetype plugin indent on

" Enables syntax highlighting
syntax on

" Enables the mouse
"set this value to 'a' to enable mouse
set mouse=

" Enable the line and column numbers in the modeline
set ruler

" Enable line numbering
set nu

" Recommended Syntastic settings
"" Adds messages to the modeline
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

"" Populates the location list with messages from the checker
let g:syntastic_always_populate_loc_list = 0
let g:syntastic_auto_loc_list = 0

"" Syntastic checks files on open
let g:syntastic_check_on_open = 0

"" Syntastic doesn't check files on save+exit
let g:syntastic_check_on_wq = 0

let g:syntastic_check_on_w = 0

" Colorschemes
syntax enable
"solarized colorscheme
"let g:solarized_termcolors=256
"let g:solarized_contrast = "high"
"let g:solarized_termtrans = 1
set background=dark
colorscheme dracula
let g:gruvbox_termcolors=256
set noswapfile

"easymotion
let g:EasyMotion_leader_key = '<Leader>'

filetype plugin indent on
set tabstop=4
set shiftwidth=4
set expandtab

set listchars=tab:}.,trail:≠,nbsp:•,precedes:…,extends:↲

"the line below will toggle airline

set laststatus=2
let g:airline_theme='dracula'
set t_Co=256
"let g:airline_powerline_fonts = 1
"let g:Powerline_symbols = 'fancy'

"set underline (current line) on by default
:set cursorline

set runtimepath^=~/.vim/bundle/ctrlp.vim

" CtrlP
 if executable('ag')
 " Use ag in CtrlP for listing files. Lightning fast and respects
 let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

   "ag is fast enough that CtrlP doesn't need to cache
 let g:ctrlp_use_caching = 0
endif

"enable deoplete autocompletion
let g:deoplete#enable_at_startup = 1

" air-line
let g:airline_powerline_fonts = 0

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶ '
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'
let g:tmuxline_powerline_separators = 0


"if using neovim, link to .config, as below

"ln -s ~/.vim ~/.config/nvim
"ln -s ~/.vimrc ~/.config/nvim/init.vim
