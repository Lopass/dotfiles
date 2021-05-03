filetype on          " Detection du type de fichie
syntax on            " Coloration syntaxique
set linebreak        " Coupe les lignes au dernier mot et pas au caractère (requier Wrap lines, actif par défaut)
set visualbell       " Utilisation du clignotement � la place du "beep"
set showmatch        " Surligne le mots recherchés dans le texte
set hlsearch         " Surligne tous les résultats de la recherche
set smartindent      " Active "smart-indent" (améliore l'auto-indentation, notamment en collant du texte �a� inden�)
set smarttab         " Active "smart-tabs" (améliore l'auto-indentation, Gestion des espaces en début de ligne pour l'auto-indentation)
set nowrap           " Wrap long lines
set noexpandtab      " Do not expand tabs into spaces
set autoindent       " Indent at the same level of the previous line
set copyindent
set softtabstop=0    " Let backspace delete indent
set shiftwidth=4     " Use indents of 4 spaces
set tabstop=4        " An indentation every four columns
let g:netrw_winsize = 20 " Change the window size for netrw 

"Print line number
set number

" Recherche ?
set smartcase

" Pas de swapfile 
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile

" Open at the last cursor location 
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" share data between nvim instances (registers etc)
augroup SHADA
    autocmd!
    autocmd CursorHold,TextYankPost,FocusGained,FocusLost *
                \ if exists(':rshada') | rshada | wshada | endif
augroup END

" Show physical tabulations define by tabstop
set list lcs=tab:\|\ 

"Add ruler to 120 characters
set colorcolumn=120
highlight ColorColumn ctermbg=235 guibg=#262626

if !has('gui_running')
  set t_Co=256
endif

" Encoding
set encoding=UTF-8

" Specify a directory for plugins
" - Avoid using standard Vim directory names like 'plugin'
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
" A vim plugin to display the indention levels with thin vertical lines
Plug 'yggdroot/indentline'
Plug 'scrooloose/nerdtree' 
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'vim-airline/vim-airline' "status bar
Plug 'majutsushi/tagbar' "displays tags

" Colorschemes
Plug 'arcticicestudio/nord-vim'

" Icon
Plug 'ryanoasis/vim-devicons'

" Git usage in vim
Plug 'tpope/vim-fugitive'

" File-line
Plug 'bogado/file-line'

" Doxygen
Plug 'vim-scripts/DoxygenToolkit.vim'

call plug#end()

" Snippets (test):w
"Plug 'garbas/vim-snipmate'

" Change the color of the indentLine
let g:indentLine_color_gui = '#A6A6A6'

" Change the character of the indentLine
let g:indentLine_char = '▏'

"Show hidden files in NerdTree by default
let NERDTreeShowHidden=1

" Colorscheme
syntax enable
colorscheme nord

" Change the color of the line
highlight LineNr term=bold cterm=NONE ctermfg=DarkCyan ctermbg=NONE gui=NONE guifg=DarkCyan guibg=NONE
augroup nord-overrides
  autocmd!
  autocmd ColorScheme nord highlight Comment ctermfg=6
augroup END

"Map Plugin key
map <F2> :NERDTreeToggle<CR>
"nmap <F8> :TagbarToggle<CR>
 
" Doxygen
let g:DoxygenToolkit_startCommentTag = "/*!"
let g:DoxygenToolkit_startCommentBlock = "/* "
let g:DoxygenToolkit_briefTag_pre = "\\brief "
let g:DoxygenToolkit_paramTag_pre = "\\param[in, out] "
let g:DoxygenToolkit_returnTag = "\\return "

