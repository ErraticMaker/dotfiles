let mapleader = ","     " Change Leader key to ,

syntax on               " enable syntax highlighting
set nocompatible        " be iMproved, required by vundle
set laststatus=2	    " allways show the statusbar
filetype off            " required by vundle

set t_Co=256            " Set vim 256 color support
set number
set colorcolumn=60,80
set expandtab
set tabstop=4
set shiftwidth=4
set hlsearch

autocmd FileType markdown setlocal tabstop=2 shiftwidth=2
autocmd Filetype makefile setlocal noexpandtab
autocmd FileType python setlocal colorcolumn=72,79

" set the runtime path to include Vundle and initialize
set rtp+=~/.homesick/repos/dotfiles/home/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
" Plugin 'tpope/vim-fugitive'
Plugin 'bling/vim-airline'
Plugin 'scrooloose/syntastic'
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
Plugin 'Valloric/YouCompleteMe'
Plugin 'edkolev/tmuxline.vim'
Plugin 'rhysd/vim-clang-format'
" Colorschemes from GitHub
Plugin 'sjl/badwolf'
Plugin 'w0ng/vim-hybrid'
Plugin 'vim-scripts/BusyBee'
Plugin 'chriskempson/vim-tomorrow-theme'
Plugin 'morhetz/gruvbox'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
" Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Avoid a name conflict with L9
" Plugin 'user/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update
"                     or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to
"                     auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" Plugins config
let g:airline_powerline_fonts = 1 " Load Powerline glyphs
let g:vim_markdown_folding_disabled = 1 " Disable folding for markdown

let g:airline#extensions#tmuxline#enabled = 0 " Disable Tmuxline so it doesn't
                                              " overwrite the current
                                              " configuration
let g:tmuxline_theme = 'vim_powerline'
let g:tmuxline_preset = 'full'

" Color schemes
if !has("gui_running")
	let g:gruvbox_italic=0
endif

let g:gruvbox_contrast_dark = 'hard'

set background=dark
colorscheme gruvbox

let g:ycm_global_ycm_extra_conf = "~/.vim/.ycm_extra_conf.py"

"autocmd FileType vim colorscheme Tomorrow-Night-Eighties
"autocmd FileType c,cpp colorscheme BusyBee
"autocmd FileType markdown colorscheme hybrid
"autocmd FileType python colorscheme badwolf

let g:clang_format#code_style = "mozilla"
let g:clang_format#style_options = {
    \ "AlwaysBreakTemplateDeclarations" : "true",
    \ "MaxEmptyLinesToKeep" : 2,
    \ "IndentWidth" : 4,
    \ "BreakBeforeBraces": "Stroustrup" }

" map <Leader>F in c/c++/obj-c code
autocmd FileType c,cpp,objc nnoremap <buffer><Leader>F :<C-u>ClangFormat<CR>
autocmd FileType c,cpp,objc vnoremap <buffer><Leader>F :ClangFormat<CR>
