" < Dev Specific >
filetype on          " Detect the type of file
syntax on            " Syntaxic coloration

" < Encoding >
set encoding=UTF-8

" < Vim errors mgt >
set visualbell       " Sound off, flash instead

" < Clipboard >
set clipboard+=unnamedplus " use to enable clipboard for all yanking

" < Search >
set showmatch        " Highlight search words
set hlsearch         " Highlight all match in a search

" < Formating tools >
" << Lines >>
set linebreak        " Cut to the last word and not the last char in a line
set nowrap           " Wrap long lines
set number           " Print line number

" << Indentation >>
set smartindent      " Smart indentation on !
set autoindent       " Indent at the same level of the previous line
set smarttab         " Smart tab char on !
set noexpandtab      " Do not expand tabs into spaces
set softtabstop=0    " Let backspace delete indent
set shiftwidth=4     " Use indents of 4 spaces
set tabstop=4        " An indentation every four columns
set copyindent       " ???

" < Visual helper >
set list lcs=tab:\|\ " Show physical tabulations define by tabstop
set colorcolumn=120  " Add ruler to 120 characters
" Set ruler color
highlight ColorColumn ctermbg=235 guibg=#262626

" < BACKUP >
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile

" < AUTOCMD >
" Open at the last cursor location
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif
" Share data between nvim instances (registers etc)
augroup SHADA
    autocmd!
    autocmd CursorHold,TextYankPost,FocusGained,FocusLost *
                \ if exists(':rshada') | rshada | wshada | endif
augroup END

" If gui is running ser the color to 256 bits
if !has('gui_running')
  set t_Co=256
endif


" < Plugins of VIM plug >
" Specify a directory for plugins
" - Avoid using standard Vim directory names like 'plugin'
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
" << Dev >>
Plug 'vim-scripts/DoxygenToolkit.vim'

" << Formating >>
Plug 'yggdroot/indentline'         " A vim plugin to display the indention levels with thin vertical lines

" << Files explorer >>
Plug 'scrooloose/nerdtree'         " Open a toolbar with folder and files architecture
Plug 'Xuyuanp/nerdtree-git-plugin' " Show git information in Nerdtree

" << Bars >>
Plug 'vim-airline/vim-airline'     " Add a status bar
" Plug 'majutsushi/tagbar'           " Displays tags

" << Colorschemes >>
Plug 'arcticicestudio/nord-vim'    " Nord theme for vim

" << Icons >>
Plug 'ryanoasis/vim-devicons'      " Add icons for pluggins and more

" << Git usage in vim >>
Plug 'tpope/vim-fugitive'          " Add Git commands directly inside vim
Plug 'vim-scripts/vim-gitgutter'

" << Misc >>
Plug 'bogado/file-line'            " Little plugin that allow this : vim file:linenumber

call plug#end()

" Snippets (test)
"Plug 'garbas/vim-snipmate'

" < NERDTree >
let g:netrw_winsize = 20 " Change the window size for netrw
let NERDTreeShowHidden=1 " Show hidden files in NerdTree by default
" << Maps >>
map <F2> :NERDTreeToggle<CR>

" < COLORS >
let g:indentLine_color_gui = '#A6A6A6' " Change the color of the indentLine
let g:indentLine_char = '▏'    " Change the character of the indentLine
syntax enable
colorscheme nord

" Change the color of the line
highlight LineNr term=bold cterm=NONE ctermfg=DarkCyan ctermbg=NONE gui=NONE guifg=DarkCyan guibg=NONE
" Change the color of comments 
augroup nord-overrides
  autocmd!
  autocmd ColorScheme nord highlight Comment ctermfg=6
augroup END

" < Tagbar >
"nmap <F8> :TagbarToggle<CR>

" < Doxygen >
let g:DoxygenToolkit_startCommentTag = "/*!"
let g:DoxygenToolkit_startCommentBlock = "/* "
let g:DoxygenToolkit_briefTag_pre = "\\brief "
let g:DoxygenToolkit_paramTag_pre = "\\param[in, out] "
let g:DoxygenToolkit_returnTag = "\\return "

