"" For vim-terraform-completion
set nocompatible

" Syntax higlighting "
syntax on

" Line nubmers "
set number

" Mouse "
set mouse=a

" Change folder to match current file "
set autochdir

" Show the command being typed in "
set showcmd

" Highlight the matching bracket "
set showmatch

" Don't consider numbers starting with 0 as octal numbers with Ctrl+A Ctrl+X "
set nrformats-=octal

" Round indent to multiple of shiftwidth "
set shiftround

" Jump to the next matching element when typing in a search "
set incsearch

" Show line and column numbers "
set ruler

" Always show the status line "
set laststatus=2

" Show completion options for commands in statusline "
set wildmenu

" Always use utf-8
set encoding=utf-8

" Disable the error bell
set noeb vb t_vb=

" Always keep a line between cursor and status line while scrolling down "
if !&scrolloff
  set scrolloff=1
endif
if !&sidescrolloff
  set sidescrolloff=5
endif

" Reloads the current file if it has changed "
set autoread

" Keep 1000 commands in history "
set history=1000

" Set the max number of tabs at 50 instead of 10 "
set tabpagemax=50

" Show as much text as possible, even if the line doesn't fit in the screen"
set display+=lastline

" Set the default method of indenting "
set autoindent
set shiftwidth=4 " Use tabs of width equals to four spaces"
set tabstop=4    "                                        "
set backspace=indent,eol,start " Use backspace to remove indent "
" Set the indenting method depending on filetype "
filetype indent plugin on

" Show tabs using the defined listchars character "
set list
set listchars=tab:\|\ ,eol:↩

" Set the leader key to , "
let mapleader = ","

" Auto-complete menu
set completeopt=longest,menuone

" Force 256 colors display "
set t_Co=256

" Use the hybrid dark colorscheme "
colorscheme hybrid

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
Plug 'ctrlpvim/ctrlp.vim'
"Plug 'scrooloose/nerdcommenter', { 'tag': '2.5.1' }
"Plug 'vim-scripts/netrw.vim'
"Plug 'tpope/vim-vinegar'
Plug 'ervandew/supertab'
Plug 'vim-syntastic/syntastic'
"Plug 'SirVer/ultisnips'
Plug 'tpope/vim-fugitive'
Plug 'tfnico/vim-gradle'
Plug 'derekwyatt/vim-scala'
"Plug 'jpalardy/vim-slime'
"Plug 'honza/vim-snippets'
"Plug 'tpope/vim-surround'
Plug 'hashivim/vim-terraform'
Plug 'juliosueiras/vim-terraform-completion'
Plug 'christoomey/vim-tmux-navigator'
Plug 'benmills/vimux'
call plug#end()

"""""""""""""
" Syntastic Config
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
" (Optional)Remove Info(Preview) window
set completeopt-=preview
" (Optional)Hide Info(Preview) window after completions
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

"""""""""""""
" vim-terraform-completion config

" (Optional) Enable terraform plan to be include in filter
let g:syntastic_terraform_tffilter_plan = 1
" (Optional) Default: 0, enable(1)/disable(0) plugin's keymapping
let g:terraform_completion_keys = 1
" (Optional) Default: 1, enable(1)/disable(0) terraform module registry completion
let g:terraform_registry_module_completion = 0

"""""""""""""
" vim-terraform config
let g:terraform_align=1
let g:terraform_fold_sections=1
let g:terraform_remap_spacebar=1

" Use the latex filetype for every kind of tex file "
let g:tex_flavor = "latex"

" Give ultisnips extra-snipper folder "
"let g:UltiSnipsSnippetDirectories=["mySnippets", "plugged/vim-snippets/UltiSnips"]

" Set slime to use tmux "
"let g:slime_target = "tmux"
"let g:slime_paste_file = tempname()

" Function to detect a template file inside a Django project
function! DjangoDetect()
  let b:file = findfile("manage.py", ".;")
  if !empty(b:file)
    set filetype=htmldjango
  else
    set filetype=html
  endif
endfunction

autocmd BufNewFile,BufRead *.html call DjangoDetect()
