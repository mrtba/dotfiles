"" .vimrc
""
"" Tobias Anderberg, 2013

" This isn't strictly neccessary as it's on by default when using
" a custom .vimrc. Keep it here, and first, for legacy reasons.
set nocompatible
filetype off

" ================================================================================
" General
" ================================================================================
set showmatch                   " Show matching brackets.
set incsearch                   " Incremental search.
set hlsearch                    " Highlight search results.
set textwidth=80                " Wrap at 80 columns, override per filetype.
set nobackup                    " Don't keep backups around.
set nowritebackup               " Don't write backups while editing
set noswapfile                  " No swapfile.
set backspace=2                 " Backspace behave like in other programs.
set vb                          " Visual bell, no beeping please.
set laststatus=2                " Always show status line.
set showmode                    " Show current mode.
set hidden                      " Buffers to background without save first.
set wildmenu                    " Nicer completion in command buffer.
set wildmode=list:longest
set scrolloff=8                 " Cursor pos always offset 8 from top/bottom.
set autoread                    " Auto read a file that's changed on disk.

" Configure status line.
set stl=%f\ %m\ %r\ L:%l/%L[%p%%]\ C:%v\ Buf:#%n

" Set format options (don't auto-insert comments).
set fo-=r
set fo-=o

" ================================================================================
" Coding
" ================================================================================
set expandtab                   " Insert spaces instead of tabs.
set tabstop=4                   " Indentation is 4 spaces.
set shiftwidth=4                " 
set smartindent                 " Automatically indent after opening bracket.

set cino=N-s                    " Ahh - don't indent in C++ namespaces!
set cino+=L0                    " Don't de-indent labels
set cino+=g0                    " Don't indent access specifiers (public, private)

" ================================================================================
" GUI
" ================================================================================
if has("gui_running")

    colorscheme mrtba             " Use my custom color scheme, it's dark!

    set go-=T                   " Hide toolbar.
    set go-=r                   " Hide right scrollbar.
    set go-=l                   " Hide left scrollbar.
    set go-=L
    set guicursor=a:blinkon0    " Don't blink cursor.

    set columns=95              " Set window to 95x55.
    set lines=55                " 

    set mouse=a                 " Place cursor with mouse click.
    set mousehide               " Hide mouse pointer while typing.

endif

" ================================================================================
" Filetype overrides
" ================================================================================

" Allow 110 columns for C++; partial blasphemy!
autocmd FileType cpp setlocal tw=110

" ================================================================================
" Custom keybindings
" ================================================================================

" Configure mapleader to ,
let mapleader=","

" ,/ turns of search highlight.
nmap <silent> <leader>/ :nohls<CR>

" ,cd set pwd to directory of current file.
nmap <silent> <leader>cd :lcd %:h<CR>

" Easier window navigation using CTRL-<navigation keys> instead of <C-w>.
nnoremap <silent> <C-k> :wincmd k<CR>
nnoremap <silent> <C-j> :wincmd j<CR>
nnoremap <silent> <C-l> :wincmd l<CR>
nnoremap <silent> <C-h> :wincmd h<CR>

" Switch between previous and current buffer
nnoremap <silent> <leader>b :b#<CR>

" Close current window.
nnoremap <silent> <leader>cc :close<CR>

" Resize windows.
nnoremap <silent> <leader>wr :res +10<CR>
nnoremap <silent> <leader>we :res -10<CR>
nnoremap <silent> <leader>wf :vertical resize +10<CR>
nnoremap <silent> <leader>wd :vertical resize -10<CR>

" I quite like Emacs 'C-x o' and 'C-x p' for going to next and previous window.
" So Set that up here.
nnoremap <silent> <C-x>o <C-w>w
nnoremap <silent> <C-x>p <C-w>W

" OK - disable naviation keys in all modes.
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

" ================================================================================
" Plugins, handled by vundle.
" ================================================================================
set runtimepath+=~/.vim/bundle/vundle
call vundle#rc()

Bundle 'gmarik/vundle'

" Fugitive
Bundle 'tpope/vim-fugitive'

" ================================================================================
" Enable syntax highlighting.
" ================================================================================
syntax on
filetype plugin indent on
