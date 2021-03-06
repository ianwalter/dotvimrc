" Turn syntax highlighting on.
syntax enable

" Enable 24-bit true color.
set termguicolors
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

" Use the arrow keys for HJKL navigation.
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

" Turn on spell checking.
set spell

" Turn on word completion in insert mode.
set complete+=kspell

" Disable spell check for string in JavaScript.
" From: https://github.com/pangloss/vim-javascript/issues/1149
" Strings, Templates, Numbers
syntax region  jsString           start=+\z(["']\)+  skip=+\\\%(\z1\|$\)+  end=+\z1+ end=+$+  contains=jsSpecial,@NoSpell extend
syntax region  jsTemplateString   start=+`+  skip=+\\`+  end=+`+     contains=jsTemplateExpression,jsSpecial,@NoSpell extend
"
" Objects
syntax region  jsObjectKeyString   contained start=+\z(["']\)+  skip=+\\\%(\z1\|$\)+  end=+\z1\|$+  contains=jsSpecial,@NoSpell skipwhite skipempty nextgroup=jsObjectValue
syntax region  jsObjectStringKey   contained start=+\z(["']\)+  skip=+\\\%(\z1\|$\)+  end=+\z1\|$+  contains=jsSpecial,@NoSpell extend skipwhite skipempty

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

" Enable code folding. Not using 'syntax' because it is too slow.
set foldmethod=indent
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

" Show hidden files in NERDTree.
let NERDTreeShowHidden=1

" Open NERDTree with <Ctrl+n>.
map <C-n> :NERDTreeToggle<CR>

" Show hidden files in ctrlp.
let g:ctrlp_show_hidden = 1

" Integrate ALE with vim-airline.
let g:airline#extensions#ale#enabled = 1

" Keep the ALE gutter always open.
let g:ale_sign_column_always = 1

" Tell ALE to fix lint issues on save.
let g:ale_fix_on_save = 1

"
let g:ale_sign_error = '•'
let g:ale_sign_warning = '◦'
" Disable folding by vim-markdown.
let g:vim_markdown_folding_disabled=1

" Disabling preprocessor checking.
let g:vue_disable_pre_processors=1

" Save workspace sessions in a global directory instead of CWD.
let g:workspace_session_directory = $HOME . '/.vim/sessions/'

" Tell workspace to always autosave changes.
let g:workspace_autosave_always = 1

" Set UltiSnips snippets directory.
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
let g:ctrlp_user_command = 'rg %s --files --hidden --no-ignore --color=never --glob "!.git" --glob "!.cache" --glob "!node_modules"'

" Tell ctrlp to stop clearing its cache all the time.
" let g:ctrlp_clear_cache_on_exit = 0
"
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

" Don't copy when pasting.
xnoremap p "_dP
