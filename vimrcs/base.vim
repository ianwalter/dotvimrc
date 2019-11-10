" Turn syntax highlighting on.
syntax enable

" Enable 24-bit true color.
set termguicolors
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

nnoremap ^[[A <Up>
nnoremap ^[[B <Down>
nnoremap ^[[D <Left>
nnoremap ^[[C <Right>

" Display line numbers on the left.
set number

" Use spaces for tabs.
set expandtab

" Set tab width to 2 spaces.
set tabstop=2 shiftwidth=2

" Highlight trailing whitespace.
set list
set listchars=""
set listchars=tab:\ \
set listchars+=trail:.

" Create a vertical line at column 80 to help enforce line lengths.
set colorcolumn=80

" Configure search (borrowed from https://github.com/carlhuda/janus).
set hlsearch    " Highlight matches.
set incsearch   " Incremental searching.
set ignorecase  " Searches are case insensitive...
set smartcase   " ...unless they contain at least one capital letter.

" Use continuous indenting.
set cindent

" Enable code folding.
set foldmethod=syntax
set nofoldenable

" Configure commenting behavior.
let g:NERDSpaceDelims = 1
let g:NERDTrimTrailingWhitespace = 1
let g:NERDDefaultAlign = 'left'
let g:NERDCommentEmptyLines = 1

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

" Show hidden files in NERDTree.
let NERDTreeShowHidden=1

" Open NERDTree with <Ctrl+n>.
map <C-n> :NERDTreeToggle<CR>

" Close vim if NERDTree is the only thing left open.
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Keep NERDTree open when opening a new tab.
autocmd BufWinEnter * NERDTreeMirror

" Show hidden files in ctrlp.
let g:ctrlp_show_hidden = 1

" Integrate ALE with vim-airline.
let g:airline#extensions#ale#enabled = 1

" Disable the ALE gutter.
let g:ale_set_signs = 0

" Disable folding by vim-markdown.
let g:vim_markdown_folding_disabled=1

" Disabling preprocessor checking.
let g:vue_disable_pre_processors=1

" Save workspace sessions in a global directory instead of CWD.
let g:workspace_session_directory = $HOME . '/.vim/sessions/'

" Tell workspace to always autosave changes.
let g:workspace_autosave_always = 1

"
let g:UltiSnipsSnippetDirectories=[$HOME.'/.vim/UltiSnips']

" Stop YouCompleteMe from using tab completion and close the popup when a
" suggestion is selected using <enter>.
let g:ycm_key_list_select_completion=[]
let g:ycm_key_list_previous_completion=[]
let g:ycm_key_list_stop_completion = ['<C-y>', '<CR>']

" Allow UltiSnips to use tab completion.
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

"
let g:airline#extensions#tabline#enabled = 1

" Tell ctrlp to use ripgrep for searching files.
let g:ctrlp_user_command = 'rg %s --files --color=never --glob ""'

" Stop ctrlp to stop clearing its cache all the time.
let g:ctrlp_clear_cache_on_exit = 0

" Don't copy when pasting.
xnoremap p "_dP
