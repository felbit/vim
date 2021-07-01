""" The Eternal Rewrite
""" a.k.a. [neo]vim config
"""
""" Epoch 1625117235
""" Repo github.com/felbit/vim
"""

" Env {{
    " Identify platform {
    silent function! OSX()
        return has('macunix')
    endfunction
    silent function! LINUX()
        return has('unix') && !has('macunix') && !has('win32unix')
    endfunction
" }}


" General {{
    set nocompatible                   " vincompatible
    set hidden                         " switch between unsafed buffers

    filetype plugin indent on          " auto-detect file type
    syntax on                          " basic syntax highighting

    set background=dark                " what else?
    set backspace=indent,eol,start     " Backspace for dummies
    set relativenumber                 " current line is 0
    set showmatch                      " highlight matching brackets/quotes
    set incsearch                      " find while typing
    set wildmenu                       " list instead just completing
    set wildmode=list:longest,full     " Cmd <Tab> completion, list matches, 
                                       " then longest common part, then all.
    set whichwrap=b,s,h,l,<,>,[,]      " backspace and cursor keys wrap too
    set scrolloff=3                    " minimum lines above and below cursor

    set spell                          " spell checking
    set nowrap                         " no wrap
    set autoindent                     " indent at the same level
    set splitright                     " Puts new vsplit windows to the right
    set splitbelow                     " Puts new split windows to the bottom

    set shiftwidth=4                   " Use indents of 4 spaces
    set expandtab                      " Tabs are spaces, not tabs
    set tabstop=4                      " An indentation every four columns
    set softtabstop=4                  " Let backspace delete indent
    set nojoinspaces                   " Prevents inserting two spaces
" }}


" Key Bindings {{
    " Move between splits with CTRL+[hjkl]
    nnoremap <C-h> <C-w>h
    nnoremap <C-j> <C-w>j
    nnoremap <C-k> <C-w>k
    nnoremap <C-l> <C-w>l

    " be consistent!
    nnoremap Y y$

    " For when you forget to sudo.. Really Write the file.
    cmap w!! w !sudo tee % >/dev/null

    " Map leader
    let mapleader = ","
    let maplocalleader = ","

    " Easier formatting
    nnoremap <silent> <leader>q gwip
" }}


" PlugIns {{
    call plug#begin('~/.config/nvim/plugged')
    
    " fuzzy file finder
    Plug 'junegunn/fzf'
    Plug 'junegunn/fzf.vim'

    " file system explorer
    Plug 'preservim/nerdtree' |
        \ Plug 'Xuyuanp/nerdtree-git-plugin'

    " Git
    Plug 'tpope/vim-fugitive'
    Plug 'tpope/vim-rhubarb'
    
    call plug#end()
" }}

" FZF Config {{
    if isdirectory(expand('~/.config/nvim/plugged/fzf.vim'))
        " [Buffers] Jump to the existing window if possible
        let g:fzf_buffers_jump = 1
    endif
" }}

" NERDTree Config {{
    if isdirectory(expand("~/.config/nvim/plugged/nerdtree"))
        let NERDTreeShowBookmarks=1
        let NERDTreeIgnore=['\.py[cd]$', '\~$', '\.swo$', '\.swp$', '^\.git$', '^\.hg$', '^\.svn$', '\.bzr$']
        let NERDTreeChDirMode=0
        let NERDTreeQuitOnOpen=1
        let NERDTreeMouseMode=2
        let NERDTreeShowHidden=1
        let NERDTreeKeepTreeInNewTab=1
        let g:nerdtree_tabs_open_on_gui_startup=0
    endif
" }}

" Misc {{
    " Instead of reverting the cursor to the last position in the buffer, we
    " set it to the first line when editing a git commit message
    au FileType gitcommit au! BufEnter COMMIT_EDITMSG call setpos('.', [0, 1, 1, 0])
" }}
