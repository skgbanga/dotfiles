set nocompatible              " be iMproved, required
filetype off                  " required by Vundle, will be set later

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

Plugin 'altercation/vim-colors-solarized' " solarized color theme
Plugin 'rafi/awesome-vim-colorschemes'    " more vim color schemes
Plugin 'ctrlpvim/ctrlp.vim'               " trusted ctrlp
Plugin 'JazzCore/ctrlp-cmatcher'          " better/faster algorithm for ctrlp
Plugin 'haya14busa/incsearch.vim'         " better incsearch
Plugin 'Valloric/YouCompleteMe'           " c++ syntax/semantic checking
Plugin 'danro/rename.vim'                 " allow to rename within vim without issues
Plugin 'jiangmiao/auto-pairs'             " auto complete the pairs like parens, strings
Plugin 'wellle/targets.vim'               " more text objects
Plugin 'vim-scripts/a.vim'                " alternate file
Plugin 'rking/ag.vim'                     " ag from within vim
Plugin 'godlygeek/tabular'                " allow aligning with a character in column
Plugin 'skywind3000/asyncrun.vim'         " allows any command to run asynchronously
Plugin 'majutsushi/tagbar'                " show class structure at a glance
Plugin 'easymotion/vim-easymotion'        " easy motion anywhere in the file
Plugin 'w0rp/ale'                         " run linters
Plugin 'fisadev/vim-isort'                " isort
Plugin 'tell-k/vim-autopep8'              " auto pep8
Plugin 'junegunn/goyo.vim'
Plugin 'ambv/black'

Plugin 'tpope/vim-fugitive'   " do git within tower
Plugin 'tpope/vim-vinegar'    " navigate directory structure within vim
Plugin 'tpope/vim-surround'   " surround words with auto pairy things
Plugin 'tpope/vim-commentary' " comment easily

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " put filetype back on


" Figure out which git directory we are in
let git_path = system("git rev-parse --show-toplevel 2>/dev/null")
let git_path_formatted = substitute(git_path, '\n', '', '')


" vim set parameters - applicable to everyone
" set background=dark
" colorscheme solarized
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
syntax enable
set backspace=2 "indent, eol, start
set shell=/bin/bash

"set colorcolumn=80 " highlight a column 80 characters away
"highlight ColorColumn ctermbg=darkgray

set showcmd
set wildmenu
set wildmode=list:longest
set term=xterm

set autoread
set ignorecase
set smartcase
set shortmess=filnxToOc     " avoid hit enter prompts
set textwidth=80
set linebreak

" display tabs and trailing space
set list
set listchars=tab:>-,trail:-

set hidden
set t_Co=256
set autowrite
set mouse=a
set directory=~/tmp
set splitright

" All the leader mappings should go here
let mapleader = ","
nnoremap <Leader>c :AsyncRun CXX=/opt/vatic/bin/g++ cmake -DCMAKE_BUILD_TYPE=Debug -DCMAKE_INSTALL_PREFIX=~/.local/ -DCMAKE_POSITION_INDEPENDENT_CODE=ON -GNinja -B build<CR>
nnoremap <Leader>f :call FormatFile()<CR>
nnoremap <Leader>d "_dd

" All the non-leader mapping should go here
nnoremap Y y$
nnoremap <C-f> :CtrlPMRU<Enter>
nnoremap <C-p> :CtrlP git_path_formatted<Enter>
nnoremap <space> za
inoremap <C-U> <C-G>u<C-U> "?
nnoremap <C-h> :YcmCompleter GoToImprecise<CR>
nnoremap <C-j> :YcmCompleter GoToDefinitionElseDeclaration<CR>
nnoremap <C-k> <C-]>
nnoremap <f6> :!/usr/bin/ctags -R --exclude=.git --exclude=thirdparty --exclude=tools .<CR>
nnoremap <C-t> :TagbarToggle<CR>

" When editing a file, always jump to the last known cursor position.
" Don't do it when the position is invalid or when inside an event handler
" (happens when dropping a file on gvim).
autocmd BufReadPost *
 \ if line("'\"") >= 1 && line("'\"") <= line("$") |
 \   exe "normal! g`\"" |
 \ endif

" vim-colors-solarized configurations
let g:solarized_hitrail = 1
let g:cpp_class_scope_highlight = 1
let g:cpp_experimental_template_highlight = 1
call togglebg#map("<F5>")

" ctrlp mappings
" let g:ctrlp_match_func = {'match' : 'matcher#cmatch' }
let g:ctrlp_max_files = 0

" set the ignore patterns
set wildignore+=*.so,*.swp,*.zip,*.pyc,*.ninja,a.out
let g:ctrlp_custom_ignore = {
      \ 'dir': 'build',
      \ 'file': '\v\.(so|swp|zip|pyc|sv|v)$'
      \ }

" async run mappings
let g:asyncrun_bell = 1
let g:asyncrun_open = 10  "open the quickfix window automatically

" incsearch configurations
set hlsearch
let g:incsearch#auto_nohlsearch = 1
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)               "do not change the location of the cursor
map n  <Plug>(incsearch-nohl-n)
map N  <Plug>(incsearch-nohl-N)
map *  <Plug>(incsearch-nohl-*)

" YouCompleteMe configuration
let g:ycm_global_ycm_extra_conf = '/home/sandeep/dotfiles/ycmd_global_conf.py'
let g:ycm_always_populate_location_list = 1
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_confirm_extra_conf = 0
let g:ycm_filetype_blacklist = {
  \ 'ctrlp' : 1,
  \ 'netrw' : 1,
  \ 'cmake' : 1
  \ }

" Easy motion config
let g:EasyMotion_smartcase = 1
nmap <Leader> <Plug>(easymotion-prefix)
nmap s <Plug>(easymotion-s2)
nmap t <Plug>(easymotion-t2)

" vim ag
let g:ag_prg='ag --column --nogroup --noheading --path-to-ignore ~/.ignore --noaffinity'
" CtrlP
let g:ctrlp_map = 'C-0'

" vim.a
let g:alternateExtensions_h = "cpp"
let g:alternateExtensions_cpp = "h"

" fugitive
" autocmd BufReadPost fugitive://* set bufhidden=delete
" set diffopt+=vertical

" vim-cpp enhanced
let g:cpp_class_scope_highlight = 1
let g:cpp_experimental_template_highlight = 1
let c_no_curly_error=1

" Tagbar
let g:tagbar_width=60
let g:tagbar_show_linenumbers=-1
let g:tagbar_autoclose = 1

" My commands
command! Vrc vs ~/dotfiles/vimrc
command! Src so ~/dotfiles/vimrc
command! Ccd cd %:h
command! Pcd echo expand("%:p:h")

"My autocmds
autocmd FileType qf wincmd L
autocmd FileType qf nnoremap <buffer> q :q<CR>
autocmd FileType c,cpp setlocal commentstring=//\ %s
autocmd FileType cmake setlocal commentstring=#\ %s

" auto pep8 configuration
let g:autopep8_disable_show_diff=0
let g:autopep8_aggressive=2

" ale configuration
let g:ale_sign_warning = '>>'

let g:ale_cpp_cpplint_executable = 'python'
let g:ale_cpp_cpplint_options = git_path_formatted . '/buildlib/misc-scripts/cpplint.py'

let g:ale_linters = {
\   'cpp': [],
\   'python': ['pylint'],
\}

let g:ale_fixers = {
\   'python': ['black'],
\}

function! FormatFile()
  if (&filetype == 'cpp')
    let l:lines="all"
    py3file /home/sandeep/clang-format.py
  elseif (&filetype == 'python')
    execute "ALEFix"
  endif
endfunction

"moving between windows
let i = 1
while i <= 9
    execute 'nnoremap <Leader>' . i . ' :' . i . 'wincmd w<CR>'
    let i = i + 1
endwhile

function! WindowNumber()
    let str=winnr()
    return str
endfunction

set laststatus=2
set statusline=%<%f\ win:%{WindowNumber()}\ br:%{fugitive#statusline()}\ %h%m%r%=%-14.(%l,%c%V%)\ %P
