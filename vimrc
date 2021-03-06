set nocompatible
filetype off

" Load plugins
source ~/.vim/vimrc.plugins

" Disable beeps
set belloff=all

" Maximum history
set history=1000 

" Scrolling
set scrolloff=8
set sidescrolloff=15
set sidescroll=1

" Mouse support
set mouse=a

" No swap files
set noswapfile
set nobackup
set nowb

" Persistent undo
if has('persistent_undo') && !isdirectory(expand('~').'/.vim/backups')
  silent !mkdir ~/.vim/backups > /dev/null 2>&1
  set undodir=~/.vim/backups
  set undofile
endif

" Automatically re-source .vimrc when it's saved
augroup reload_vimrc " {
  autocmd!
  autocmd BufWritePost vimrc source $MYVIMRC
augroup END " }

" Tabs and indentation
filetype indent on
set wrap
set shiftwidth=2
set tabstop=2
set shiftwidth=2
set expandtab
set autoindent
set smartindent
set smarttab

" Auto indent pasted text
nnoremap p p=`]<C-o>
nnoremap P P=`]<C-o>

" Ignore case unless you uppercase
set ignorecase
set smartcase
" search characters as they're entered
set incsearch
" highlight search matches
set hlsearch

" Display relative line numbers
set relativenumber
" display the absolute line number at the line you're on
set number
" Keep the line number gutter narrow so three digits is cozy. 
set numberwidth=2

" keep cursor in the same column if possible
set nostartofline

" Makes regex work like Perl
nnoremap / /\v
vnoremap / /\v

" Search globally by default
set gdefault

" Autosave on Vim blur
au FocusLost * :wa

" Highlight current column
set cursorline cursorcolumn

" Prevents some security issues
set modelines=0

" Color Scheme
filetype on
syntax on
colorscheme base16-eighties

" Switch ; and :
noremap ; :
noremap : ;

" START Leader commands
" ----------------
" Change leader from \ to ,
let mapleader=","

" ,space clears the current search term highlighting
nnoremap <leader><space> :noh<cr>

" ,ev edits the .vimrc file
nnoremap <leader>ev <C-w><C-v><C-l>:e $MYVIMRC<cr>

" ,vs opens a new vertical split and switches to it
nnoremap <leader>vs <C-w>v<C-w>l

" ,nt opens NerdTree
map <leader>nt ;NERDTreeToggle<CR>
let NERDTreeShowLineNumbers=1

" ,gu opens Graphical Undo
nnoremap <leader>gu :GundoToggle<CR>

" ----------------
" END Leader commands
"
" open on the right so as not to compete with the nerdtree
let g:gundo_right = 1 

" a little wider for wider screens
let g:gundo_width = 60

" NerdTree settings
" ------------------
" Show hidden files
let NERDTreeShowHidden=1

" Launch NerdTree on vim load but don't focus it
autocmd VimEnter * NERDTree
autocmd VimEnter * wincmd p

" Close vim if only NerdTree is left open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Ignore system files
let NERDTreeIgnore=['\.DS_Store', '\~$', '\.swp']

let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let g:NERDTreeWinSize = 30


" CommandT Settings
" ------------------
" Ignore directories
" let g:CommandTWildIgnore=&wildignore . ",*/bower_components,*/node_modules,*/wp-includes,*/wp-content"
" let g:CommandTTraverseSCM='dir'

" Easymotion settings
" let g:EasyMotion_leader_key = '<Leader>'

" == junegunn/fzf ==
nnoremap <C-T> :FZF<CR>
inoremap <C-T> <ESC>:FZF<CR>i

" File types
" -----------
" SCSS
au BufNewFile,BufRead *.scss set filetype=css.sass

" Javascript
" Libraries for highlighting 
" let g:used_javascript_libs = 'jquery,underscore,backbone,angularjs,angularui,angularuirouter,react,flux,requirejs'

" JSX
let g:jsx_ext_required = 0

" Autocomplete
" -------------
if has('nvim')
  " == Shougo/deoplete.nvim ==
  " == carlitux/deoplete-ternjs ==
  let g:deoplete#enable_at_startup = 1
  let g:SuperTabDefaultCompletionType = "<c-n>"
  " let g:deoplete#sources#flow#flow_bin = g:flow_path
  let g:tern_request_timeout = 1
  let g:tern_show_signature_in_pum = 0
  set completeopt-=preview
endif

" Colemak keybindings
source ~/.vim/vimrc.colemak
