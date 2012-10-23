" do not use vi compatibility mode. must come first because it changes other options
set nocompatible

" call the init pathogen
call pathogen#infect()

" show status line, to Powerline Style
set laststatus=2

" set Powerline mode
let g:Powerline_symbols = 'fancy'
