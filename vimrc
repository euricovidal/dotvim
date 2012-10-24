" call the init pathogen
call pathogen#infect()

" do not use vi compatibility mode. must come first because it changes other options
set nocompatible

" show status line, to Powerline Style
set laststatus=2

" intuitive backspacing
set backspace=indent,eol,start

" use the same symbols as TextMate for tabstops and EOLs
set listchars=tab:▸\ ,eol:¬

" show numbers of line
set number

" don't break wrapped lines on words
set linebreak

" set no word rap line
set nowrap

" highlight N columns
set cc=120

" show highlight columns on cursor
set cursorcolumn

" show highlight line on cursor
set cursorline

" EOL format
set fileformats=unix,mac,dos

" highlight matches as you type
set incsearch

" highlight matches
set hlsearch

" show 3 lines of context around the cursor
set scrolloff=1

" ignore case while searching except if there's an uppercase letter
set ignorecase smartcase

" an autoindent (with <<) is two spaces
set shiftwidth=2
" use spaces, not tabs
set expandtab
" a tab is two spaces
set softtabstop=2
" automatic alignment during insertions
set autoindent
" should be the same value of shiftwidth
set smartindent

" keep 100 cmdline history
set history=10

" persistent undo
set undofile
set undodir=~/.vim/tmp

" set title window (file name and path)
set title

" display incomplete commands below statusline
set showcmd

" enable 256 colors in terminal
set t_Co=256

" show matching bracket when text indicator is over them
set showmatch

" disable swap of file
set noswapfile

" change leader key
let mapleader=","

" don't need to press the shift key :
nnoremap ; :

" Useful status information at bottom of screen
" "set statusline=[%n]\ %<%.99f\ %h%w%m%r%y\ %{fugitive#statusline()}\
" %{exists('g:loaded_rvm')?rvm#statusline():''}\ %=%-16(\ %l,%c-%v\ %)%P
" "statusline setup
" set statusline=%f                                               " tail of the filename
" set statusline+=\ [%{strlen(&fenc)?&fenc:'none'},               " file encoding
" set statusline+=\ %{&ff}]                                       " file format
" set statusline+=\ %r                                            " Opened type (read-only)
" set statusline+=\ %m                                            " Modify?
" set statusline+=\ %y                                            " File type (vim, php, ruby)
" set statusline+=\ %{fugitive#statusline()}                      " Git
" set statusline+=\ %{exists('g:loaded_rvm')?rvm#statusline():''} " RVM
" set statusline+=%=                                              " left/right separator
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*
" set statusline+=%c,                                             " cursor column
" set statusline+=%l/%L                                           " cursor line/total lines
" set statusline+=\ %P                                            " percent through file

" set colorscheme
color molokai

" auto detect type of file
filetype on
" auto detect type of plugin
filetype plugin on
" enable filetype-based indentation
filetype indent on

" enable syntax highlighting
syntax on

" set Powerline mode
let g:Powerline_symbols = 'fancy'

" auto focus on errors/warnings
let g:syntastic_auto_jump=0
" symbol when have errors
let g:syntastic_error_symbol='✗'
" symbol when have warnings
let g:syntastic_warning_symbol='⚠'
" check syntax when its open
let g:syntastic_check_on_open=1

" set show relative path on bufexplorer
let g:bufExplorerShowRelativePath=1

" yankring path to history
let g:yankring_history_dir="~/.vim/tmp"

" call CtrlP list of all files
nnoremap <leader>p :CtrlP<CR>
" call CtrlP list of buffer files
nnoremap <leader>P :CtrlPBuffer<CR>

" switch to last used buffer
nnoremap <leader>l :e#<CR>

" YankRing mapping
nnoremap <leader>y :YRShow<CR>

" clears the search register
nmap <silent> <leader>/ :nohlsearch<CR>

" keep window on buffer delete
nmap <silent> <leader>bd <Plug>Kwbd
"
" " use tagbar
" nmap <silent> <leader>b :TagbarToggle<CR>
"
" " to use CtrlP
" nnoremap <leader>p :CtrlP<CR>
"
" " use Ctrl-P to buffers
" nnoremap <leader>P :CtrlPBuffer<CR>
