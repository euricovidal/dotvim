" call the init pathogen
call pathogen#infect()

" For ruby, autoindent with two spaces, always expand tabs
autocmd FileType ruby,haml,eruby,yaml,html,javascript,sass,cucumber set ai sw=2 sts=2 et

" For python autoindent with four spaces
autocmd FileType php,python set sw=4 sts=4 et

" Highlight characters longer than 80 characters
autocmd BufEnter * highlight OverLength ctermbg=black guibg=#003542 guibg=#592929
autocmd BufEnter * match OverLength /\%120v.*/

" set encoding with utf-8
set encoding=utf-8

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

" no blinking
set novisualbell

" no noise
set noerrorbells

" change leader key
let mapleader=","

" Aliasing the new leader ',' to the default one '\'
nmap \ ,

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

" set name of modes of show (Visual, Normal, Replace, Insert, Select)
let g:Powerline_mode_v  = 'V'
let g:Powerline_mode_V  = 'V⋅LINE'
let g:Powerline_mode_cv = 'V⋅BLOCK'
let g:Powerline_mode_s  = 'S'
let g:Powerline_mode_S  = 'S⋅LINE'
let g:Powerline_mode_cs = 'S⋅BLOCK'
let g:Powerline_mode_i  = 'I'
let g:Powerline_mode_R  = 'R'
let g:Powerline_mode_n  = 'N'

" Use sane regexes.
nnoremap / /\v
vnoremap / /\v

" autocomplete for all methods (by ctags)
inoremap <leader><TAB> <C-X><C-]>

" re-ctags all methods and gems
map <leader>rt :!ctags --extra=+f --exclude=.git --exclude=log -R * `rvm gemdir`/gems/*<CR><CR>

" call CtrlP list of all files
nnoremap <leader>p :CtrlP<CR>
inoremap <leader>p <ESC>:CtrlP<CR>
" call CtrlP list of buffer files
nnoremap <leader>P :CtrlPBuffer<CR>

" switch to last used buffer
nnoremap <leader>l :e#<CR>

" YankRing mapping
nnoremap <leader>y :YRShow<CR>

" System clipboard interaction
nnoremap <leader>Y :.!pbcopy<CR>uk<CR>
vnoremap <leader>Y :!pbcopy<CR>uk<CR>
"noremap <leader>P :set paste<CR>:r !pbpaste<CR>:set nopaste<CR>

" Find merge conflict markers
nmap <silent> <leader>cf <ESC>/\v^[<=>]{7}( .*\|$)<CR>

" clears the search register
nmap <silent> <leader>/ :nohlsearch<CR>

" keep window on buffer delete
nmap <silent> <leader>bd <Plug>Kwbd

" use tagbar
nmap <silent> <leader>b :TagbarToggle<CR>

" mapping for function above
map <leader>bw :call Wipeout()<CR>

" NerdTree
map <leader>nt :NERDTreeToggle<CR>

" JSON Format
map <leader>jt <Esc>:%!json_xs -f json -t json-pretty<CR>

" XML Format
map <leader>xt <Esc>:1,$!xmllint --format -<CR>

" Tab next
nnoremap <C-w>k :tabnew %<CR>
nnoremap <C-w>l :tabprevious<CR>
nnoremap <C-w>h :tabnext<CR>

" Remove file
"nnoremap <C-D> :!rm %<CR>

" switch to last used buffer
nnoremap <leader>l :e#<CR>

" TagList of functions
map <leader>t :TlistToggle<CR>

" tmux fixes
map <Esc>OH <Home>
map! <Esc>OH <Home>
map <Esc>OF <End>
map! <Esc>OF <End>

" use sudo to write the file
cmap w!! w !sudo tee % >/dev/null

" Clear the search buffer when hitting return
function! MapCR()
  nnoremap <cr> :nohlsearch<cr>
endfunction
call MapCR()

" SWITCH BETWEEN TEST AND PRODUCTION CODE
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! OpenTestAlternate()
  let new_file = AlternateForCurrentFile()
  exec ':e ' . new_file
endfunction
function! AlternateForCurrentFile()
  let current_file = expand("%")
  let new_file = current_file
  let in_spec = match(current_file, '^spec/') != -1
  let going_to_spec = !in_spec
  let in_app = match(current_file, '\<controllers\>') != -1 || match(current_file, '\<models\>') != -1 || match(current_file, '\<views\>') != -1
  if going_to_spec
    if in_app
      let new_file = substitute(new_file, '^app/', '', '')
    end
    let new_file = substitute(new_file, '\.rb$', '_spec.rb', '')
    let new_file = 'spec/' . new_file
  else
    let new_file = substitute(new_file, '_spec\.rb$', '.rb', '')
    let new_file = substitute(new_file, '^spec/', '', '')
    if in_app
      let new_file = 'app/' . new_file
    end
  endif
  return new_file
endfunction
nnoremap <leader>. :call OpenTestAlternate()<cr>

" rename file
function! RenameFile()
  let old_name = expand('%')
  let new_name = input('New file name: ', expand('%'), 'file')
  if new_name != '' && new_name != old_name
    exec ':saveas ' . new_name
    exec ':silent !rm ' . old_name
    redraw!
  endif
endfunction
map <leader>n :call RenameFile()<cr>

if has("autocmd")
  autocmd BufWritePost .vimrc source $MYVIMRC " apply .vimrc settings on save
  autocmd BufWritePre * :call <SID>StripTrailingWhitespaces() " remove trailing white spaces before saving (only in specified filetypes)
endif

" function to remove trailing white space (while saving cursor position)
" http://vimcasts.org/episodes/tidying-whitespace/
function! <SID>StripTrailingWhitespaces()
  " Preparation: save last search, and cursor position.
  let _s=@/
  let l = line(".")
  let c = col(".")
  " Do the business:
  %s/\s\+$//e
  " Clean up: restore previous search history, and cursor position
  let @/=_s
  call cursor(l, c)
endfunction

" function to delete all hidden buffers
function! Wipeout()
  " list of *all* buffer numbers
  let l:buffers = range(1, bufnr('$'))

  " what tab page are we in?
  let l:currentTab = tabpagenr()
  try
    " go through all tab pages
    let l:tab = 0
    while l:tab < tabpagenr('$')
      let l:tab += 1

      " go through all windows
      let l:win = 0
      while l:win < winnr('$')
        let l:win += 1
        " whatever buffer is in this window in this tab, remove it from
        " l:buffers list
        let l:thisbuf = winbufnr(l:win)
        call remove(l:buffers, index(l:buffers, l:thisbuf))
      endwhile
    endwhile

    " if there are any buffers left, delete them
    if len(l:buffers)
      execute 'bwipeout' join(l:buffers)
    endif
  finally
    " go back to our original tab page
    execute 'tabnext' l:currentTab
  endtry
endfunction
