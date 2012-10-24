" do not use vi compatibility mode. must come first because it changes other options
set nocompatible

" call the init pathogen
call pathogen#infect()

" show status line, to Powerline Style
set laststatus=2

" set Powerline mode
let g:Powerline_symbols = 'fancy'

" auto detect type of file
filetype on

" enable syntax highlighting
syntax on

" auto focus on errors/warnings
let g:syntastic_auto_jump=0
" symbol when have errors
let g:syntastic_error_symbol='✗'
" symbol when have warnings
let g:syntastic_warning_symbol='⚠'
" check syntax when its open
let g:syntastic_check_on_open=1

" call CtrlP list of all files
nnoremap <leader>p :CtrlP<CR>

" call CtrlP list of buffer files
nnoremap <leader>P :CtrlPBuffer<CR>
