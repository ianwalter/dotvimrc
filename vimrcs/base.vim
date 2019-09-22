" Turn syntax highlighting on.
syntax on

" Display line numbers on the left.
set number

" Use spaces for tabs.
set expandtab

" Set tab width to 2 spaces.
set tabstop=2 shiftwidth=2

" Use continuous indenting.
set cindent

" Add blank line above and below cursor shortcut.
map <Enter> o<ESC>
map <S-Enter> O<ESC>

" Enable 256 colors.
if !has('gui_running')
  set t_Co=256
endif

" Add git status to statusline.
set laststatus=2

" Make backspace work again.
set backspace=indent,eol,start

" Open NERDTree when starting vim if no file was specified.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Open NERDTree with <Ctrl+n>.
map <C-n> :NERDTreeToggle<CR>

" Close vim if NERDTree is the only thing left open.
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Integrate ALE with vim-airline.
let g:airline#extensions#ale#enabled = 1

" Disable the ALE gutter.
let g:ale_set_signs = 0

" Disable folding by vim-markdown.
let g:vim_markdown_folding_disabled=1

" Disabling preprocessor checking.
let g:vue_disable_pre_processors=1


