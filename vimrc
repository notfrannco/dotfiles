set nocompatible

"pone bold y mejora los colores"
set background=dark

"pone numeros a las lineas"
set number

"pone space cada que das tab"
set expandtab

"tab a 4 espacio"
set tabstop=4

set softtabstop=4
set shiftwidth=4

"para establecer otro comando de esc"
:inoremap jk <esc>

"elimina el beep"
set noeb vb t_vb=

"elimina la verga flash en gvim"
"set t_vb="

"binding de powerline si se instalo con pip, checkear disponibilidad para py3"
"set  rtp+=/usr/lib/python3.6/site-packages/powerline/bindings/vim"
"set rtp+=/usr/lib/python2.7/site-packages/powerline/bindings/vim"
"set laststatus=2"
"set t_Co=256"


"Binding de powerline si se instalo el package vim-powerline"
python3 from powerline.vim import setup as powerline_setup
python3 powerline_setup()
python3 del powerline_setup
set laststatus=2 " Always display the statusline in all windows
set showtabline=2 " Always display the tabline, even if there is only one tab
set noshowmode " Hide the default mode text (e.g. -- INSERT -- below the statusline)
set t_Co=256


"split windows navegacion en lugar de C-w j solo C-j"
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>


"desabilita el backup, cuidado con este"
set nobackup

"Especifico para ansible"
autocmd FileType yaml setlocal ai ts=2 sw=2 et sts=2 cuc
autocmd FileType yml setlocal ai ts=2 sw=2 et sts=2 cuc

"Auto closing"
"inoremap " ""<left>"
"inoremap ' ''<left>"
"inoremap ( ()<left>"
"inoremap [ []<left>"
"inoremap { {}<left>"
"inoremap < <><left>"

"search highlight"
set hlsearch

"search highlight when still typing"
set incsearch
