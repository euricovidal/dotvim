" .vimrc
" Author: Eurico Vidal <euricovidal@gmail.com>
" Source: https://github.com/euricovidal/dotvim.git
"
" This file has changes a lot, I will try to document it
"
" Vim-PLug core {{{
if has('vim_starting')
  set nocompatible " Be iMproved
endif

let vimplug_exists=expand('~/.vim/autoload/plug.vim')

if !filereadable(vimplug_exists)
  echo "Installing Vim-Plug..."
  echo ""
  silent !\curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  let g:not_finish_vimplug = "yes"

  " Run shell script if exist on custom select language
  autocmd VimEnter * PlugInstall
endif

" Required:
call plug#begin(expand('~/.vim/plugged'))
" }}}
" Plug packages {{{
Plug 'scrooloose/nerdtree'            " files explorer
Plug 'tiagofumo/vim-nerdtree-syntax-highlight' " color of files  on nerdtree
Plug 'Xuyuanp/nerdtree-git-plugin'    " git status on nerdtree
Plug 'ryanoasis/vim-devicons'
Plug 'scrooloose/nerdcommenter'       " to comment line/block
Plug 'tpope/vim-fugitive'             " git status, gblame, gdiff, gbrowse
Plug 'ctrlpvim/ctrlp.vim'
Plug 'jlanzarotta/bufexplorer'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'airblade/vim-gitgutter'         " modified lines by git
Plug 'Raimondi/delimitMate'           " auto open ([\" '
Plug 'majutsushi/tagbar'              " list of classes/methods/vars on right sidebar
Plug 'scrooloose/syntastic'           " syntax check
"Plug 'Yggdroot/indentLine'            " display indent lines by |
" up, esta zoando o estilo do .slim
Plug 'tomasr/molokai'                 " theme/color
Plug 'mileszs/ack.vim'                " to find word with Ag
Plug 'YankRing.vim'                   " history of copy
Plug 'konfekt/fastfold'               " auto folds
Plug 'shougo/neocomplete.vim'         " add auto complete
Plug 'shougo/neosnippet.vim'          " add snippets
Plug 'shougo/neosnippet-snippets'     " the snippets
Plug 'sirver/ultisnips'               " complete snippets <TAB>
Plug 'honza/vim-snippets'
Plug 'godlygeek/tabular'              " to tabularize
Plug 'gagoar/stripwhitespaces'        " remove useless spaces
Plug 'tmhedberg/matchit'              " allow % to ruby methods
" Plug 'gregsexton/gitv'
" Plug 'cohama/agit.vim'
" Plug 'chrisbra/csv.vim'
" }}}
" Ruby {{{
Plug 'vim-ruby/vim-ruby'
" Plug 'tpope/vim-rails'             " improve to works with rails
Plug 'ecomba/vim-ruby-refactoring' " fast improve ruby commands
" }}}
" HTML Bundle {{{
"Plug 'amirh/HTML-AutoCloseTag'
"Plug 'hail2u/vim-css3-syntax'
"Plug 'gorodinskiy/vim-coloresque' " add colors on #000 red
"Plug 'mattn/emmet-vim'            " expanding abbreviations htmls tags, ex: html:5
Plug 'slim-template/vim-slim'  			" syntax highlight to slim template
"Plug 'cakebaker/scss-syntax.vim'
"Plug 'hail2u/vim-css3-syntax'
" }}}
" JS {{{
"Plug 'mxw/vim-jsx'
"Plug 'isruslan/vim-es6'
"Plug 'jaxbot/syntastic-react'
" }}}
" Basic Setup {{{
call plug#end()

" Required:
filetype plugin indent on

set mouse=a
set cursorcolumn
set cursorline

"" Encoding
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8
"" Fix backspace indent
set backspace=indent,eol,start
"" Tabs. May be overriten by autocmd rules
set expandtab
" set tabstop=2 " dont use this, breaks the space indent
set softtabstop=0
set shiftwidth=2
set smartindent
set autoindent
"" Map leader to ,
let mapleader=','
" don't need to press the shift key :
nnoremap ; :
"" Enable hidden buffers
set hidden
"" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase
"" Encoding
set bomb
" set binary " this break the tabs
set ttyfast
"" Directories for swp files
set nobackup
set noswapfile

set fileformats=unix,dos,mac
set showcmd
set shell=/bin/sh
" }}}
" Visual Settings {{{
syntax on
set ruler
set number
set nowrap

colorscheme molokai

set mousemodel=popup
set t_Co=256
set guioptions=egmrti
set gfn=Monospace\ 10

if has("gui_running")
  if has("gui_mac") || has("gui_macvim")
    set guifont=Knack\ Nerd\ Font:h15
    "set guifont=Menlo:h16
    "set guifont=Menlo\ for\ Powerline:h16
    " set guifont=PowerlineSymbols:h16
    set transparency=7
  endif
else
  if $COLORTERM == 'gnome-terminal'
    set term=gnome-256color
  else
    if $TERM == 'xterm'
      set term=xterm-256color
    endif
  endif
endif

if &term =~ '256color'
  set t_ut=
endif

" Disable the blinking cursor.
set gcr=a:blinkon0
set scrolloff=3

" Status bar
set laststatus=2

" Use modeline overrides
set modeline
set modelines=10

set title
set titleold="Terminal"
set titlestring=%F

set statusline=%F%m%r%h%w%=(%{&ff}/%Y)\ (line\ %l\/%L,\ col\ %c)\

if exists("*fugitive#statusline")
  set statusline+=%{fugitive#statusline()}
endif
" }}}
" Configuration {{{
" IndentLine
let g:indentLine_enabled = 1
let g:indentLine_concealcursor = 0
let g:indentLine_char = '┆'
let g:indentLine_faster = 1

" vim-airline
let g:airline_theme = 'powerlineish'
let g:airline#extensions#syntastic#enabled = 1
let g:airline#extensions#branch#enabled = 0
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tagbar#enabled = 1

" NERDTree configuration
" let g:NERDTreeChDirMode=2
let g:NERDTreeIgnore=['\.rbc$', '\~$', '\.pyc$', '\.db$', '\.sqlite$', '__pycache__']
let g:NERDTreeSortOrder=['^__\.py$', '\/$', '*', '\.swp$', '\.bak$', '\~$']
let g:NERDTreeShowBookmarks=0
" let g:nerdtree_tabs_focus_on_files=1
let g:NERDTreeMapOpenInTabSilent = '<RightMouse>'
let g:NERDTreeWinSize = 50
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc,*.db,*.sqlite
" nnoremap <silent> <F2> :NERDTreeFind<CR>
noremap <leader>nt :NERDTreeToggle<CR>

" NERDCommenter
let g:NERDSpaceDelims = 1
let g:NERDDefaultAlign = 'left'

" NerdFonts / DevIcons
let g:NERDTreeFileExtensionHighlightFullName = 1
let g:NERDTreeExactMatchHighlightFullName = 1
let g:NERDTreePatternMatchHighlightFullName = 1
let g:NERDTreeHighlightFolders = 1         " enables folder icon highlighting using exact match
let g:NERDTreeHighlightFoldersFullName = 1 " highlights the folder name

" NerdtreeGitPlugin
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ 'Ignored'   : '☒',
    \ "Unknown"   : "?"
    \ }

" Ack
if executable('ag')
  let g:ackprg = 'ag --vimgrep --smart-case'
  cnoreabbrev Ag Ack
endif
" }}}
" Backups {{{
" Directories for swp files
set undofile
" set backupdir=~/.vim/tmp/backup//
set undodir=~/.vim/tmp/undo//
" set directory=~/.vim/tmp/swap//

" if !isdirectory(expand(&backupdir))
" 	call mkdir(expand(&backupdir), 'p')
" endif
if !isdirectory(expand(&undodir))
  call mkdir(expand(&undodir), 'p')
endif
" if !isdirectory(expand(&directory))
" 	call mkdir(expand(&directory), 'p')
" endif
" }}}
" Folding {{{
set foldlevelstart=3
nnoremap <Space> za
function! MyFoldText() " {{{
  let line = getline(v:foldstart)

  let nucolwidth = &fdc + &number * &numberwidth
  let windowwidth = winwidth(0) - nucolwidth - 3
  let foldedlinecount = v:foldend - v:foldstart

  " expand tabs into spaces
  let onetab = strpart('          ', 0, &tabstop)
  let line = substitute(line, '\t', onetab, 'g')

  let line = strpart(line, 0, windowwidth - 2 -len(foldedlinecount))
  let fillcharcount = windowwidth - len(line) - len(foldedlinecount)
  return line . '…' . repeat(" ",fillcharcount) . foldedlinecount . '…' . ' '
endfunction " }}}
set foldtext=MyFoldText()
" }}}
" Functions {{{
if !exists('*s:setupWrapping')
  function s:setupWrapping()
    set wrap
    set wm=2
    set textwidth=79
  endfunction
endif
" }}}
" Highlight word {{{
highlight InterestingWord  ctermbg=yellow guibg=yellow ctermfg=black guifg=#000000
highlight InterestingWord1 ctermbg=green  guibg=green  ctermfg=black guifg=#000000
highlight InterestingWord2 ctermbg=blue   guibg=blue   ctermfg=black guifg=#000000
highlight InterestingWord3 ctermbg=red    guibg=red    ctermfg=white guifg=#FFFFFF

"autocmd BufEnter * highlight OverLength ctermbg=black guibg=#003542 guibg=#592929
"autocmd BufEnter * highlight OverLength ctermbg=red guibg=#FF0000
autocmd BufEnter * highlight OverLength ctermbg=red guibg=#AA3333
autocmd BufEnter * match OverLength /\%121v.*/

nnoremap <leader>hh :execute 'match InterestingWord /\<<c-r><c-w>\>/'<cr>
nnoremap <leader>h1 :execute '1match InterestingWord1 /\<<c-r><c-w>\>/'<cr>
nnoremap <leader>h2 :execute '2match InterestingWord2 /\<<c-r><c-w>\>/'<cr>
nnoremap <leader>h3 :execute '3match InterestingWord3 /\<<c-r><c-w>\>/'<cr>
" }}}
" Autocmd Rules {{{
" The PC is fast enough, do syntax highlight syncing from start
augroup vimrc-sync-fromstart
  autocmd!
  autocmd BufEnter * :syntax sync fromstart
augroup END

" Remember cursor position
augroup vimrc-remember-cursor-position
  autocmd!
  autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
augroup END

" vim-javascript
augroup vimrc-javascript
  autocmd!
  autocmd FileType javascript set foldmethod=syntax
augroup END

augroup vimrc-ruby
  autocmd!
  autocmd BufNewFile,BufRead *.rb,*.rbw,*.gemspec setlocal filetype=ruby
  autocmd FileType ruby set foldmethod=syntax
augroup END

" Resize splits when the window is resized
" au VimResized * :wincmd =
augroup ft_vim
  au!
  au FileType vim setlocal foldmethod=marker
  au BufWinEnter *.txt if &ft == 'help' | wincmd L | endif
augroup END

set autoread
" }}}
" cTags {{{
" autocomplete for all methods (by ctags)
" inoremap <leader><TAB> <C-X><C-]>

" re-ctags all methods and gems
map <leader>rt :!ctags --extra=+f --exclude=.git --exclude=log --exclude=node_modules --exclude=db --exclude=tmp -R *<CR>
"`rvm gemdir`/gems/*<CR><CR>
" }}}
" Mappings {{{
" YankRing
map <leader>y :YRShow<CR>

" Find merge conflict markers
map <leader>cf <ESC>/\v^[<=>]{7}( .*\|$)<CR>

" Highlight VCS conflict markers
match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'

" JSON Format
map <leader>jt <Esc>:%!json_xs -f json -t json-pretty<CR>

" XML Format
map <leader>xt <Esc>:1,$!xmllint --format -<CR>

" CSV Format
map <leader>vt <Esc>:Tabularize /;<CR>

" Clean search (highlight)
nnoremap <silent> <leader>/ :noh<cr>

" Buffer nav
noremap <C-Left> :bprevious<CR>
noremap <C-Right> :bnext<CR>

"" Move visual block
vnoremap <C-Down> :m '>+1<CR>gv=gv
vnoremap <C-Up> :m '<-2<CR>gv=gv

" switch to last used buffer
noremap <leader>l :e#<CR>

" Split
" noremap <Leader>h :<C-u>split<CR>
" noremap <Leader>v :<C-u>vsplit<CR>

" Git
" noremap <Leader>ga :Gwrite<CR>
" noremap <Leader>gc :Gcommit<CR>
" noremap <Leader>gsh :Gpush<CR>
" noremap <Leader>gll :Gpull<CR>
" noremap <Leader>gs :Gstatus<CR>
" noremap <Leader>gb :Gblame<CR>
" noremap <Leader>gd :Gvdiff<CR>
" noremap <Leader>gr :Gremove<CR>

" Tabs
" nnoremap <Tab> gt
" nnoremap <S-Tab> gT
" nnoremap <silent> <S-t> :tabnew<CR>

" Set working directory
" nnoremap <leader>. :lcd %:p:h<CR>

" Opens an edit command with the path of the currently edited file filled in
" noremap <Leader>e :e <C-R>=expand("%:p:h") . "/" <CR>

" Opens a tab edit command with the path of the currently edited file filled
" noremap <Leader>te :tabe <C-R>=expand("%:p:h") . "/" <CR>

"" ctrlp.vim
set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,.git,*.rbc,*.pyc,__pycache__
let g:ctrlp_custom_ignore = '\v[\/](node_modules|target|dist)|(\.(swp|tox|ico|git|hg|svn))$'
let g:ctrlp_user_command = "find %s -type f | grep -Ev '"+ g:ctrlp_custom_ignore +"'"
let g:ctrlp_use_caching = 1
let g:ctrlp_map = '<leader>p'

" The Silver Searcher
if executable('ag')
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
  let g:ctrlp_use_caching = 0
endif

cnoremap <C-P> <C-R>=expand("%:p:h") . "/" <CR>
noremap <leader>b :CtrlPBuffer<CR>
let g:ctrlp_map = '<leader>e'
let g:ctrlp_open_new_file = 'r'
let g:ctrlp_cache_dir = $HOME . '/.cache/ctrlp'

" snippets
" let g:UltiSnipsExpandTrigger="<tab>"
" let g:UltiSnipsJumpForwardTrigger="<tab>"
" let g:UltiSnipsJumpBackwardTrigger="<c-b>"
let g:UltiSnipsEditSplit="vertical"

" syntastic
let g:syntastic_always_populate_loc_list=0
let g:syntastic_error_symbol='✗'
let g:syntastic_warning_symbol='⚠'
let g:syntastic_style_error_symbol = '✗'
let g:syntastic_style_warning_symbol = '⚠'
let g:syntastic_auto_loc_list=0
let g:syntastic_check_on_wq = 0
let g:syntastic_auto_jump = 0
let g:syntastic_aggregate_errors = 1

let g:syntastic_ruby_checkers = ['mri', 'rubocop']
let g:syntastic_ruby_rubocop_args = '--display-cop-names' " --display-style-guide --extra-details
let g:syntastic_php_checkers = ['php', 'phpcs', 'phpmd']
let g:syntastic_javascript_checkers = ['eslint', 'jsxhint']
let g:syntastic_javascript_eslint_exec = 'eslint_d'
let g:jsx_ext_required = 0 " Allow JSX in normal JS files
let g:airline_powerline_fonts = 1

" Tagbar
nmap <leader>tb :TagbarToggle<CR>
let g:tagbar_autofocus = 1

" Tabs
noremap <C>h gt
noremap <C>l gT

" Disable visualbell
set novisualbell t_vb=

"" Copy/Paste/Cut
if has('unnamedplus')
  set clipboard=unnamed,unnamedplus
endif

noremap YY "+y<CR>
"noremap <leader>p "+gP<CR>
noremap XX "+x<CR>

if has('macunix')
  " pbcopy for OSX copy/paste
  vmap <C-x> :!pbcopy<CR>
  vmap <C-c> :w !pbcopy<CR><CR>
endif

"" Buffer nav
" noremap <leader>z :bp<CR>
" noremap <leader>q :bp<CR>
" noremap <leader>x :bn<CR>
" noremap <leader>w :bn<CR>

"" Close buffer
" noremap <leader>c :bd<CR>

"" Clean search (highlight)
" nnoremap <silent> <leader><space> :noh<cr>

"" Switching windows
" noremap <C-j> <C-w>j
" noremap <C-k> <C-w>k
" noremap <C-l> <C-w>l
" noremap <C-h> <C-w>h

"" Vmap for maintain Visual Mode after shifting > and <
" vmap < <gv
" vmap > >gv

"" Move visual block
" vnoremap J :m '>+1<CR>gv=gv
" vnoremap K :m '<-2<CR>gv=gv

"" Open current line on GitHub
nnoremap <Leader>o :.Gbrowse<CR>

let g:rubycomplete_buffer_loading = 1
let g:rubycomplete_classes_in_global = 1
let g:rubycomplete_rails = 1

let g:tagbar_type_ruby = {
    \ 'kinds' : [
        \ 'm:modules',
        \ 'c:classes',
        \ 'd:describes',
        \ 'C:contexts',
        \ 'f:methods',
        \ 'F:singleton methods'
    \ ]
\ }

" RSpec.vim mappings
" map <Leader>t :call RunCurrentSpecFile()<CR>
" map <Leader>s :call RunNearestSpec()<CR>
" map <Leader>l :call RunLastSpec()<CR>
" map <Leader>a :call RunAllSpecs()<CR>

" Ruby refactory
" nnoremap <leader>rap  :RAddParameter<cr>
" nnoremap <leader>rcpc :RConvertPostConditional<cr>
" nnoremap <leader>rel  :RExtractLet<cr>
" vnoremap <leader>rec  :RExtractConstant<cr>
" vnoremap <leader>relv :RExtractLocalVariable<cr>
" nnoremap <leader>rit  :RInlineTemp<cr>
" vnoremap <leader>rrlv :RRenameLocalVariable<cr>
" vnoremap <leader>rriv :RRenameInstanceVariable<cr>
" vnoremap <leader>rem  :RExtractMethod<cr>
" }}}
" NEOComplete {{{
" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif
let g:neocomplete#enable_at_startup = 1 " Use neocomplete
let g:neocomplete#enable_smart_case = 1 " Use smartcase
let g:neosnippet#enable_snipmate_compatibility = 1 " Enable snipMate compatibility feature.
" Tell Neosnippet about the other snippets
let g:neosnippet#snippets_directory='~/.vim/plugged/vim-snippets/snippets'
smap <expr><TAB> neosnippet#expandable_or_jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" Enable omni completion.
au BufRead,BufNewFile *.scss set filetype=scss.css
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType ruby setlocal omnifunc=rubycomplete#CompleteRuby
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" }}}
" Convenience variables {{{

" vim-airline
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

if exists('g:airline_powerline_fonts')
  let g:airline#extensions#tabline#left_sep = ' '
  let g:airline#extensions#tabline#left_alt_sep = '|'
  let g:airline_left_sep          = '▶'
  let g:airline_left_alt_sep      = '»'
  let g:airline_right_sep         = '◀'
  let g:airline_right_alt_sep     = '«'
  let g:airline#extensions#branch#prefix     = '⤴' "➔, ➥, ⎇
  let g:airline#extensions#readonly#symbol   = '⊘'
  let g:airline#extensions#linecolumn#prefix = '¶'
  let g:airline#extensions#paste#symbol      = 'ρ'
  let g:airline_symbols.linenr    = '␊'
  let g:airline_symbols.branch    = '⎇'
  let g:airline_symbols.paste     = 'ρ'
  let g:airline_symbols.paste     = 'Þ'
  let g:airline_symbols.paste     = '∥'
  let g:airline_symbols.whitespace = 'Ξ'
  let g:airline_left_sep  = ''
  let g:airline_right_sep = ''
endif
