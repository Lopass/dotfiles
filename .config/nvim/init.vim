filetype on          " Detection du type de fichie
syntax on            " Coloration syntaxique
set linebreak        " Coupe les lignes au dernier mot et pas au caractère (requier Wrap lines, actif par défaut)
set visualbell       " Utilisation du clignotement � la place du "beep"
set showmatch        " Surligne le mots recherchés dans le texte
set hlsearch         " Surligne tous les résultats de la recherche
set smartindent      " Active "smart-indent" (améliore l'auto-indentation, notamment en collant du texte �a� inden�)
set smarttab         " Active "smart-tabs" (améliore l'auto-indentation, Gestion des espaces en début de ligne pour l'auto-indentation)
set nowrap                      " Wrap long lines
set noexpandtab                 " Do not expand tabs into spaces
set autoindent                  " Indent at the same level of the previous line
set copyindent
set softtabstop=0               " Let backspace delete indent
set shiftwidth=4                " Use indents of 4 spaces
set tabstop=4                   " An indentation every four columns
"set mouse=a          " Active la souris, dans tous les modes (note il faudra alors d'appuyer sur "shift" pour faire les sélections de copier-coller dans l'éditeur)
let g:netrw_winsize = 20 " Change the window size for netrw 
"Print line numbre
set number
" Recherche ?
set smartcase
" Pas de swapfile 
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile

if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif


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
Plug 'flazz/vim-colorschemes'
Plug 'morhetz/gruvbox'
Plug 'altercation/vim-colors-solarized'
Plug 'drewtempelmeyer/palenight.vim'
Plug 'tomasiser/vim-code-dark'
" Icon
Plug 'ryanoasis/vim-devicons'
" Git usage in vim
Plug 'tpope/vim-fugitive'
" Conquer of Completion
"Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}

" File-line
Plug 'bogado/file-line'
" Doxygen
Plug 'vim-scripts/DoxygenToolkit.vim'
call plug#end()

" Change the color of the indentLine
let g:indentLine_color_gui = '#A6A6A6'
" Change the character of the indentLine
let g:indentLine_char = '▏'

"Show hidden files in NerdTree by default
let NERDTreeShowHidden=1

" Colorscheme
set background=dark
colorscheme codedark 
"colorscheme gruvbox 
"

" Change the color of the line
highlight LineNr term=bold cterm=NONE ctermfg=DarkCyan ctermbg=NONE gui=NONE guifg=DarkCyan guibg=NONE

"Map Plugin key
map <F2> :NERDTreeToggle<CR>
nmap <F8> :TagbarToggle<CR>

 
" Doxygen
let g:DoxygenToolkit_startCommentTag = "/*!"
let g:DoxygenToolkit_startCommentBlock = "/* "
let g:DoxygenToolkit_briefTag_pre = "\\brief "
let g:DoxygenToolkit_paramTag_pre = "\\param[in, out] "
let g:DoxygenToolkit_returnTag = "\\return "

"COC plugin settings options
" if hidden is not set, TextEdit might fail.
"set hidden
"
"" Some servers have issues with backup files, see #649
"set nobackup
"set nowritebackup
"
"" Better display for messages
"set cmdheight=2
"
"" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=100
"
"" don't give |ins-completion-menu| messages.
"set shortmess+=c
"
"" always show signcolumns
"set signcolumn=yes
"
"" Use tab for trigger completion with characters ahead and navigate.
"" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
"inoremap <silent><expr> <TAB>
"      \ pumvisible() ? "\<C-n>" :
"      \ <SID>check_back_space() ? "\<TAB>" :
"      \ coc#refresh()
"inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
"
"function! s:check_back_space() abort
"  let col = col('.') - 1
"  return !col || getline('.')[col - 1]  =~# '\s'
"endfunction
"
"" Use <c-space> to trigger completion.
"inoremap <silent><expr> <c-space> coc#refresh()
"
"" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
"" Coc only does snippet and additional edit on confirm.
"inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
"
"" Use `[c` and `]c` to navigate diagnostics
"nmap <silent> [c <Plug>(coc-diagnostic-prev)
"nmap <silent> ]c <Plug>(coc-diagnostic-next)
"
"" Remap keys for gotos
"nmap <silent> gd <Plug>(coc-definition)
"nmap <silent> gy <Plug>(coc-type-definition)
"nmap <silent> gi <Plug>(coc-implementation)
"nmap <silent> gr <Plug>(coc-references)
"
"" Use K to show documentation in preview window
"nnoremap <silent> K :call <SID>show_documentation()<CR>
"
"function! s:show_documentation()
"  if (index(['vim','help'], &filetype) >= 0)
"    execute 'h '.expand('<cword>')
"  else
"    call CocAction('doHover')
"  endif
"endfunction
"
"" Highlight symbol under cursor on CursorHold
"autocmd CursorHold * silent call CocActionAsync('highlight')
"
"" Remap for rename current word
"nmap <leader>rn <Plug>(coc-rename)
"
"" Remap for format selected region
"xmap <leader>f  <Plug>(coc-format-selected)
"nmap <leader>f  <Plug>(coc-format-selected)
"
"augroup mygroup
"  autocmd!
"  " Setup formatexpr specified filetype(s).
"  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
"  " Update signature help on jump placeholder
"  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
"augroup end
"
"" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
"xmap <leader>a  <Plug>(coc-codeaction-selected)
"nmap <leader>a  <Plug>(coc-codeaction-selected)
"
"" Remap for do codeAction of current line
"nmap <leader>ac  <Plug>(coc-codeaction)
"" Fix autofix problem of current line
"nmap <leader>qf  <Plug>(coc-fix-current)
"
"" Use <tab> for select selections ranges, needs server support, like: coc-tsserver, coc-python
"nmap <silent> <TAB> <Plug>(coc-range-select)
"xmap <silent> <TAB> <Plug>(coc-range-select)
"xmap <silent> <S-TAB> <Plug>(coc-range-select-backword)
"
"" Use `:Format` to format current buffer
"command! -nargs=0 Format :call CocAction('format')
"
"" Use `:Fold` to fold current buffer
"command! -nargs=? Fold :call     CocAction('fold', <f-args>)
"
"" use `:OR` for organize import of current buffer
"command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')
"
"" Add status line support, for integration with other plugin, checkout `:h coc-status`
"set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}
"
"" Using CocList
"" Show all diagnostics
"nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
"" Manage extensions
"nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
"" Show commands
"nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
"" Find symbol of current document
"nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
"" Search workspace symbols
"nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
"" Do default action for next item.
"nnoremap <silent> <space>j  :<C-u>CocNext<CR>
"" Do default action for previous item.
"nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
"" Resume latest coc list
"nnoremap <silent> <space>p  :<C-u>CocListResume<CR>
"
