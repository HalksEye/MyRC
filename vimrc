" 
"���������������[  �����[   �����[�����[�������[   �������[
"�^�T�T�������X�a  �����U   �����U�����U���������[ ���������U
"  �������X�a   �����U   �����U�����U�����X���������X�����U
" �������X�a    �^�����[ �����X�a�����U�����U�^�����X�a�����U
"���������������[�����[�^���������X�a �����U�����U �^�T�a �����U
"�^�T�T�T�T�T�T�a�^�T�a �^�T�T�T�a  �^�T�a�^�T�a     �^�T�a
"
" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
    finish
endif
set nocompatible

filetype off

" =========Bundle Managed By Vundle
set rtp+=~/.vim/bundle/vundle/
call vundle#begin()

Plugin 'altercation/vim-colors-solarized'
Plugin 'clvv/a.vim'
Plugin 'digitaltoad/vim-jade'
Plugin 'duganchen/vim-soy'
Plugin 'fatih/vim-go'
Plugin 'gmarik/Vundle.vim'
Plugin 'guns/vim-clojure-static'
Plugin 'honza/vim-snippets'
Plugin 'ironcamel/vimchat'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'kchmck/vim-coffee-script'
Plugin 'kien/ctrlp.vim'
Plugin 'kovisoft/slimv'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'mbbill/undotree'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'rking/ag.vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'shougo/neocomplcache.vim'
Plugin 'shougo/vimproc.vim'
Plugin 'shougo/vimshell.vim'
Plugin 'sirver/ultisnips'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'tomasr/molokai'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-fireplace'
Plugin 'tpope/vim-classpath'
Plugin 'tpope/vim-rails'
Plugin 'Valloric/YouCompleteMe'
Plugin 'vim-scripts/tagbar'
Plugin 'w0ng/vim-hybrid'

call vundle#end()

" =========For Japanese Support
set fileencodings=gbk,iso-2022-jp,euc-jp,cp932,utf8,default,latin1

syntax on
" size of a hard tabstop
set tabstop=4
" size of an "indent"
set shiftwidth=4
" a combination of spaces and tabs are used to simulate tab stops at a width
" other than the (hard)tabstop
set softtabstop=4

filetype plugin indent on

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

set number

"if has("vms")
set nobackup		" do not keep a backup file, use versions instead
"else
"  set backup		" keep a backup file
"endif
set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching

set background=dark
let g:hybrid_use_Xresources = 1
colorscheme molokai

map Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
    set mouse=a
endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
    syntax on
    set hlsearch
endif

" Enable file type detection.
" Use the default filetype settings, so that mail gets 'tw' set to 72,
" 'cindent' is on in C files, etc.
" Also load indent files, to automatically do language-dependent indenting.
filetype plugin indent on

" Put these in an autocmd group, so that we can delete them easily.
augroup vimrcEx
    au!

    " For all text files set 'textwidth' to 78 characters.
    autocmd FileType text setlocal textwidth=78

    " When editing a file, always jump to the last known cursor position.
    " Don't do it when the position is invalid or when inside an event handler
    " (happens when dropping a file on gvim).
    " Also don't do it when the mark is in the first line, that is the default
    " position when opening a file.
    autocmd BufReadPost *
                \ if line("'\"") > 1 && line("'\"") <= line("$") |
                \   exe "normal! g`\"" |
                \ endif

augroup END

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
    command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
                \ | wincmd p | diffthis
endif

set t_Co=256

" =========Slimv
let g:slimv_python = 'python2'
let g:slimv_impl = 'sbcl'
"let g:slimv_swank_cmd = '! tmux new-window "sbcl --load /home/zshang/.vim/start-swank.lisp &"'
let g:lisp_rainbow = 1
let g:slimv_repl_syntax = 1

" =========Syntastic
let g:syntastic_check_on_open = 1
let g:syntastic_cpp_include_dirs = ['/usr/include/']
let g:syntastic_cpp_remove_include_errors = 1
let g:syntastic_cpp_check_header = 1
let g:syntastic_cpp_compiler = 'clang++'
let g:syntastic_cpp_auto_refresh_includes = 1
let g:syntastic_cpp_compiler_options = '-std=c++11 -stdlib=libstdc++'
let g:Syntastic_cpp_checkers = ['gcc']
"set error or warning signs
let g:syntastic_error_symbol = 'X'
let g:syntastic_warning_symbol = '!'
"whether to show balloons
let g:syntastic_enable_balloons = 1

" =========YCM
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/cpp/ycm/.ycm_extra_conf.py'
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_seed_identifiers_with_syntax = 1
let g:ycm_confirm_extra_conf = 0
"Make Syntastic works together with YCM
let g:ycm_show_diagnostics_ui = 0

" =========Misc Key Mappings
imap <C-k> <Esc>k
imap <C-l> <Esc>l
imap <C-h> <Esc>h
imap <C-j> <Esc>j
imap <C-\> lambda

nmap <C-t> :TagbarToggle<CR>
nmap <C-l> :NERDTreeToggle<CR>
nmap <C-i> :IndentGuidesToggle<CR>

"imap <C-f> function

" =========Airline
set laststatus=2
let g:Powerline_symbols = 'fancy'
let g:airline_powerline_fonts = 1

" =========Indent Guides
set ts=4 sw=4 et
hi IndentGuidesEven ctermbg=1
hi IndentGuidesOdd  ctermbg=2
let g:indent_guides_start_level=2
let g:indent_guides_guide_size=1

"gVIM
set guifont=SourceCodeProforPowerline\ 12
set guioptions-=m
set guioptions-=T
set guioptions-=r
set guioptions-=L
