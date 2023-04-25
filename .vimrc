" Main local Vim configuration file.

" Set shift width to 4 spaces.
  set shiftwidth=4

" Set tab width to 4 columns.
  set tabstop=4

" Use space characters instead of tabs.
  set expandtab

" Set Vim encoding.
  set encoding=UTF-8 

" Enable line numbering.
  set number

" Enable relative line numbering.
  set relativenumber 

" Disable compatibility with Vi.
  set nocompatible

" Enable syntax highlighting.
  syntax on

" Enable type file detection.
  filetype on

" Enable filetype plugins.
  filetype plugin on

" Load indent file for detected file type.
  filetype indent on

" Disable mode display.
  set noshowmode 

" Highlight results during searches.
  set hlsearch

" Wildmenu configuration. {{{
  " Enable auto completion menu after pressing TAB.
  set wildmenu

  " Make wildmenu behave like similar to Bash completion.
  set wildmode=list:longest

  " Wildmenu will ignore files with these extensions.
  set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx
" }}}

" Set Vim folding method
  set foldmethod=marker

" Load plugins. {{{
  call plug#begin('~/.vim/plugged')

    Plug 'https://github.com/preservim/nerdtree'
    Plug 'https://github.com/tiagofumo/vim-nerdtree-syntax-highlight'
    Plug 'https://github.com/Xuyuanp/nerdtree-git-plugin'
    Plug 'https://github.com/ryanoasis/vim-devicons'
    Plug 'https://github.com/vim-airline/vim-airline'
    Plug 'https://github.com/vim-airline/vim-airline-themes'
    Plug 'https://github.com/bling/vim-bufferline'
    Plug 'https://github.com/sainnhe/sonokai'
    Plug 'https://github.com/neoclide/coc.nvim', {'branch': 'release'}
    Plug 'https://github.com/dense-analysis/ale'

  call plug#end()
" }}}

" NERDTree configuration. {{{
  " Always show hidden files
    let NERDTreeShowHidden=1

  " Ignore certain filetypes in NerdTree.   
    let NERDTreeIgnore=['\.git$', '\.jpg$', '\.mp4$', '\.ogg$', '\.iso$', '\.pdf$', '\.pyc$', '\.odt$', '\.png$', '\.gif$', '\.db$']

  " Autostart NerdTree and leave cursor in it.
  " autocmd VimEnter * NERDTree
" }}} 

" Vim colorscheme configuration. {{{
    " Sonokai configuration. {{{
      if has('termguicolors')
        set termguicolors
      endif
    
    " Set Sonokai colorscheme.
      let g:sonokai_style = 'andromeda' 
      let g:sonokai_better_performance = 1
      let g:sonokai_transparent_background = 0
    " }}}
    
  " Set colorscheme.
    colorscheme sonokai

  " Set Vim Airline theme.
    let g:airline_theme='sonokai'
" }}}

" Vim shortcut mappings. {{{
  " Set leader key.
    let mapleader = "CTRL"

  " Press space in normal mode to enter command mode.
  " nnoremap <space> : 

  " Use CTRL + hjkl to switch windows. 
    nnoremap <c-j> <c-w>j
    nnoremap <c-k> <c-w>k
    nnoremap <c-h> <c-w>h
    nnoremap <c-l> <c-w>l
  
  " Toggle NerdTree
    nnoremap <c-f> :NERDTreeToggle<enter>

  " Complete suggestions.
    inoremap <expr> <Tab> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"
  " Use TAB and S-TAB to navigate completion list. 
    inoremap <expr> <S-Tab> coc#pum#visible() ? coc#pum#next(1) : "\<Tab>" 
    inoremap <expr> <c-Tab> coc#pum#visible() ? coc#pum#prev(1) : "\<S-Tab>"

" }}} 













