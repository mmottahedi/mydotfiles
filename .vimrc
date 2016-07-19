set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
Plugin 'L9'
" Git plugin not hosted on GitHub
Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
"Plugin 'ascenator/L9', {'name': 'newL9'}
Plugin 'scrooloose/syntastic'
Plugin 'scrooloose/nerdtree'
"Plugin 'Valloric/YouCompleteMe'
Plugin 'klen/python-mode'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'ryanoasis/vim-devicons'
Plugin 'davidhalter/jedi-vim'
Bundle 'edkolev/tmuxline.vim'
Bundle 'edkolev/promptline.vim'
Plugin 'vim-ctrlspace/vim-ctrlspace'



" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

"------------------------------------------------------------------------------
autocmd! bufwritepost .vimrc source %
let g:ctrlp_map = '<c-p>'
set noswapfile
set backup
set backupdir=~/.vim/backup/
set directory=~/.vim/swap/
set undodir=~/.vim/undo/

" better copy & pastve
set pastetoggle=<F2>
set clipboard=unnamed

"Mouse and backspace
set mouse=a
set bs=2

" rebind <leader> key
let mapleader= ","
"better command-completion
set wildmenu

"show partial commands in last line of screen
set showcmd
"highlight searches
set hlsearch

"always show status line
set laststatus=2

" Instead of failing a command because of unsaved changes, instead raise a
" " dialogue asking if you wish to save changed files.
set confirm
"visual bell
set visualbell

set hidden
"Quick quit command
map <F4> :nohl<CR>
noremap <leader>e :quit<CR> " Quit current window:
noremap <Leader>E :qa!<CR>   "Quit all window:s

"bind nohl
" removes highlight of your last search
noremap <C-n> :nohl<CR>
vnoremap <C-n> :nohl<CR>


"quick save command
noremap <C-Z> :update<CR>
vnoremap <C-Z> <C-C>:update<CR>
inoremap <C-Z> <C-O>:update<CR>
"inoremap <C-z>:update<CR>
noremap <Leader>s :update<CR>
noremap <C-s> :update<CR>
noremap <C-x> :hide<CR>
inoremap <C-x> :hide<CR>
"bind ctrl+<movement> keys to move around the windows, instead of usning ctrl+w+<movement>
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h


"easier movement between tabs
map <Leader>n <esc>:tabprevious<CR>
map <Leader>m <esc>:tabnext<CR>

"map sort fucntion to a key
vnoremap <Leader>s :sort<CR>


"easier moving of code blocks
vnoremap < <gv " better indentation
vnoremap > >gv " better indentation


"show whitespace
"must be inserted before colorscheme command
"autocmd ColorScheme *  ExtraWhitespace ctermbg=red guibg=red
"match ExtraWhitespace /\s\+\%#\@<!$/
"au InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
"au InsertLeave * imatch ExtraWhitespace /\s\+$/



" ----------visual----------------
set number
set tw=79 "width of document
set nowrap " don't automatically weap on load
set fo-=t " don't automatically wrap text when typing
set colorcolumn=80
highlight ColorColumn ctermbg=233

if has('gui_running')
    set background=dark
    colorscheme solarized
else
    "colorscheme zenburn
    "colorscheme textmate16
    "color monokai
    "color codeschool
endif

"call togglebg#map("<F8>")



"enable syntax highlighting
filetype on
filetype plugin indent on
syntax on
set nocompatible
syntax enable
filetype plugin on
filetype indent on

"easier formating of parameters
vmap Q gq
nmap Q gqap


"Real programmers don't use tabs but spaces
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround
set expandtab
set autoindent
set cursorline
set showmatch
set ruler

"make search case insensative
set hlsearch
set incsearch
set ignorecase
set smartcase

set guifont=Monaco:h12
"let g:NERDTreeWinPos = "right"
set guioptions-=T " Removes top toolbar
set guioptions-=r " Removes right hand scroll bar
set go-=L " Removes left hand scroll bar
autocmd User Rails let b:surround_{char2nr('-')} = "<% \r %>" " displays <% %> correctly
:set cpoptions+=$ " puts a $ marker for the end of words/lines in cw/c$ commands

"python specific
set list listchars=tab:▷⋅,trail:⋅,nbsp:⋅
set statusline=%H%m%r%h%w\ [TYPE=%Y\ %{&ff}]\
\ [%l/%L\ (%p%%)
filetype plugin indent on
au FileType py set autoindent
au FileType py set smartindent
au FileType py set textwidth=79 " PEP-8 Friendly
let python_highlight_all=1
syntax on
"python with virtualenv support
python3 << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
  project_base_dir = os.environ['VIRTUAL_ENV']
  activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
  # execfile(activate_this, dict(__file__=activate_this))
  with open(activate_this) as f:
    code = compile(f.read(), activate_this, 'exec')
    exec(code, dict(__file__=activate_this))
EOF

" NERD_tree config
let NERDTreeChDirMode=2
let NERDTreeIgnore=['\.vim$', '\~$', '\.pyc$', '\.swp$']
let NERDTreeSortOrder=['^__\.py$', '\/$', '*', '\.swp$',  '\~$']
let NERDTreeShowBookmarks=1
map <F3> :NERDTreeToggle<CR>

" Syntax for multiple tag files are
" set tags=/my/dir1/tags, /my/dir2/tags
set tags=tags;$HOME/.vim/tags/

" TagList Plugin Configuration
"let Tlist_Ctags_Cmd='/usr/local/bin/ctags'
"let Tlist_GainFocus_On_ToggleOpen = 1
"let Tlist_Close_On_Select = 1
"let Tlist_Use_Right_Window = 1
"let Tlist_File_Fold_Auto_Close = 1
"map <F7> :TlistToggle<CR>

" PEP8
au FileType *.py
    \ set tabstop=4
    \ set softtabstop=4
    \ set shiftwidth=4
    \ set textwidth=79
    \ set expandtab
    \ set autoindent
    \ set fileformat=unix

" full stack development
au BufNewFile,BufRead *.js, *.html, *.css
    \ set tabstop=2
    \ set softtabstop=2
    \ set shiftwidth=2

" syntastic options
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" You Complete Me
"let g:ycm_autoclose_preview_window_after_completion=1
"map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>


"python-rope
"let ropevim_vim_completetion=1
"let ropevim_extended_complete=1

" PyMode setup
let g:pymode = 1
"let g:pymode_rope_autoimport=1
let g:pymode_virtualenv=1
let g:pymode_run=1
let g:pymode_syntax=1
let g:pymode_doc=1
let g:pymode_rope= 1
let g:pymode_rope_lookup_project = 0
let g:pymode_rope_project_root = ""
let g:pymode_rope_ropefolder='.ropeproject'
let g:pymode_rope_completion = 1
let g:pymode_rope_complete_on_dot = 1
let g:pymode_rope_autoimport = 0
let g:pymode_rope_autoimport_import_after_complete = 0
let g:pymode_rope_rename_bind = '<C-c>rr'
let g:pymode_rope_organize_imports_bind = '<C-c>ro'
let g:pymode_rope_autoimport_bind = '<C-c>ra'
let g:pymode_folding =1 
let g:pymode_trim_whitespaces = 1
let g:pymode_lint = 0
let g:pymode_lint_signs =1
let g:pymode_lint_on_write = 1
let g:pymode_lint_unmodified = 0
let g:pymode_lint_on_fly = 0
let g:pymode_lint_message = 1
let g:pymode_lint_checkers = ['pyflakes', 'pep8', 'mccabe']
"let g:pymode_lint_ignore = "E501,W"
"let g:pymode_lint_select = "E501,W0011,W430"
let g:pymode_lint_sort = ['E', 'C', 'I']
let g:pymode_lint_cwindow = 1
let g:pymode_lint_signs = 1
let g:pymode_lint_todo_symbol = 'WW'
let g:pymode_lint_comment_symbol = 'CC'
let g:pymode_lint_visual_symbol = 'RR'
let g:pymode_lint_error_symbol = 'EE'
let g:pymode_lint_info_symbol = 'II'
let g:pymode_lint_pyflakes_symbol = 'FF'
let g:pymode_option = 0
let g:pymode_syntax_all = 1
let g:pymode_syntax_slow_sync = 1
let g:pymode_syntax_string_formatting = g:pymode_syntax_all
let g:pymode_syntax_string_format = g:pymode_syntax_all
let g:pymode_syntax_string_templates = g:pymode_syntax_all
let g:pymode_syntax_doctests = g:pymode_syntax_all
let g:pymode_options_colorcolumn = 1
let g:pymode_options_max_line_length = 79
let g:pymode_quickfix_minheight = 3
let g:pymode_quickfix_maxheight = 4
let g:pymode_indent = 1
let g:pymode_breakpoint = 1
let g:pymode_breakpoint_cmd = ''
let g:pymode_virtualenv_path = $VIRTUAL_ENV
let g:pymode_syntax_indent_errors = g:pymode_syntax_all
let g:pymode_syntax_space_errors = g:pymode_syntax_all
"overide go-to definition key shortcut to ctrl-]
let g:pymode_rope_goto_definition_bind = "<C-]>"
"override run current python file key shortcut to Crtl-Shift-e
let g:pymode_run_bind = "<C-S-e>"
"Override view python doc key shortcut to crlt-shift-d
let g:pymode_doc_bind = "<C-S-d>"
let g:pymode_rope_show_doc_bind = '<C-c>d'
"insert break point
let g:pymode_breakpoint_bind = '<C-S-b>'
"Keymap for autocomplete
let g:pymode_rope_completion_bind = '<C-Space>'
let g:pymode_rope_goto_definition_bind = '<C-c>g'

"powerline
set rtp+=$HOME/.virtualenvs/py3/lib/python3.5/site-packages/powerline/bindings/vim/
"always show status line
set laststatus=2
"use 256 colors
set t_Co=256
set encoding=utf-8
set nocompatible
set guifont=Incosolata\ for\ Powerline:h14
set noshowmode

" testing extra-powerline-symbols

" set font:
" for now must grab this specific one:
" https://github.com/ryanoasis/powerline-extra-symbols/blob/master/patched-fonts/DroidSansMonoForPowerlinePlusNerdFileTypesMono.otf
set guifont=Droid\ Sans\ Mono\ for\ Powerline\ Plus\ Nerd\ File\ Types\ Mono\ 12


filetype plugin on
filetype indent on
"airline
" testing rounded separators (extra-powerline-symbols):

"airlinei
let g:airline_theme='ravenpower'
let g:airline_powerline_fonts=1
let g:Powerline_symbols='patched'
let  g:airline_left_sep = "\uE0B0"
let g:airline_right_sep = "\uE0B2"
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = '|'
let g:airline#extensions#tabline#left_alt_sep = '|'
" set the CN (column number) symbol:
let g:airline_section_z = airline#section#create(["\uE0A1".' '.'%{line(".")}'.' ',"\uE0A3" . ' '. '%{col(".")}'])
