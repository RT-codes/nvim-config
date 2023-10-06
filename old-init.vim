
" -----------------------------------------------------------------
"     _   __      __           
"    / | / /_  __/ /__________ 
"   /  |/ / / / / __/ ___/ __ \
"  / /|  / /_/ / /_/ /  / /_/ /
" /_/ |_/\__, /\__/_/   \____/ 
"       /____/                 
"
" -----------------------------------------------------------------


" ------------------ Plugin Manager ------------------
call plug#begin()

" Plugin Section
" Plug 'dracula/vim'
Plug 'flazz/vim-colorschemes'                                "for colorschemes
Plug 'github/copilot.vim'                                    "for copilot
Plug 'ryanoasis/vim-devicons'                              "for icons
Plug 'SirVer/ultisnips'                                     "for snippets
Plug 'honza/vim-snippets'                                   "for snippets
Plug 'scrooloose/nerdtree'                                  "for file tree
Plug 'preservim/nerdcommenter'                               "for commenting
Plug 'mhinz/vim-startify'                                     "for start screen
Plug 'dense-analysis/ale'                                     "for linting
Plug 'sbdchd/neoformat'                                       "to use :Neoformat
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' } "for autocompletion
Plug 'fedepujol/move.nvim'                                    "for moving lines
Plug 'lukas-reineke/indent-blankline.nvim'                     "for indent lines
Plug 'nvim-lua/plenary.nvim'
Plug 'ThePrimeagen/harpoon'
call plug#end()


" ------------------- General Settings ------------------

colorscheme gruvbox
"colorscheme birds-of-paradise
"colorscheme monokai-chris

let g:confirmKey = "\<Meta>"
let mapleader = "\<Space>"   " set leader key to space
set nocompatible            " disable compatibility to old-time vi
set textwidth=800           " set width of text to 100 characters
set showmatch               " show matching 
set ignorecase              " case insensitive 
set mouse=v                 " middle-click paste with 
set hlsearch                " highlight search 
set incsearch               " incremental search
set tabstop=4               " number of columns occupied by a tab 
set softtabstop=4           " see multiple spaces as tabstops so <BS> does the right thing
set expandtab               " converts tabs to white space
set shiftwidth=4            " width for autoindents
set autoindent              " indent a new line the same amount as the line just typed
set number                  " add line numbers 
set number relativenumber   " sets relative numbers
set wildmode=longest,list   " get bash-like tab completions
filetype plugin indent on   "allow auto-indenting depending on file type
syntax on                   " syntax highlighting
set mouse=a                 " enable mouse click
set clipboard=unnamedplus   " using system clipboard
filetype plugin on
set cursorline              " highlight current cursorline
set ttyfast                 " Speed up scrolling in Vim
" set noswapfile            " disable creating swap file
"set backupdir=~/.cache/vim " Directory to store backup files.


" ------------------- Plugin Settings -------------------


" ------------------- indent-blankline ------------------
let g:indent_blankline_enabled = 1

" ------------------- Copilot ---------------------------
nnoremap <leader>cc :Copilot complete<CR>

" ------------------- NerdTree --------------------------
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

" ------------------- Neoformat -------------------------

nnoremap <leader>f :Neoformat<CR>

" ------------------- Move ------------------------------

nnoremap <silent> <C-j> :MoveLine(1)<CR>
nnoremap <silent> <C-k> :MoveLine(-1)<CR>
vnoremap <silent> <C-j> :MoveBlock(1)<CR>
vnoremap <silent> <C-k> :MoveBlock(-1)<CR>

" ------------------- linting options -------------------

let g:ale_python_flake8_options = '--max-line-length=800'

" -------------------- Deoplete -------------------------

let g:deoplete#enable_at_startup = 1
highlight Pmenu ctermbg=8 guibg=#3b3a3b
highlight PmenuSel ctermbg=1 guifg=#d7d787 guibg=#1f82cd
highlight PmenuSbar ctermbg=0 guibg=#fd2b56





" -------------------- Scripts/logic ---------------------
set nocompatible
if exists("$VIRTUAL_ENV")
    let g:python3_host_prog=substitute(system("which -a python3 | head -n2 | tail -n1"), "\n", '', 'g')
else
    let g:python3_host_prog=substitute(system("which python3"), "\n", '', 'g')
endif

let g:ale_completion_enabled = 1

let g:ale_enabled = 0 " disable linter by default

function! ToggleALELinter()
  if g:ale_enabled == 1
    let g:ale_enabled = 0
    echo "ALE linter disabled."
  else
    let g:ale_enabled = 1
    echo "ALE linter enabled."
  endif
endfunction

command! ALEToggle call ToggleALELinter()



