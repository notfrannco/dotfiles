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

"binding de powerline, checkear disponibilidad para py3"
"set  rtp+=/usr/lib/python3.6/site-packages/powerline/bindings/vim"
"set laststatus=2"
"set t_Co=256"

"split windows navegacion en lugar de C-w j solo C-j"
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

"desabilita el backup, backup es para pussys" 
set nobackup

"Especifico para ansible"
autocmd FileType yaml setlocal ai ts=2 sw=2 et
autocmd FileType yml setlocal ai ts=2 sw=2 et
