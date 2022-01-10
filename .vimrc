call plug#begin()
Plug 'preservim/nerdtree'
Plug 'neoclide/coc.nvim', { 'branch': 'master', 'do': 'yarn install --frozen-lockfile' }
Plug 'tpope/vim-surround'
Plug 'bling/vim-airline'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-vdebug/vdebug'
Plug 'terryma/vim-expand-region'
Plug 'svermeulen/vim-easyclip'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
" Initialize plugin system
call plug#end()

nnoremap <F3> :NERDTreeToggle<CR>
nnoremap <F3> :NERDTreeToggle<CR>
nnoremap <F11> :bn<CR>
nnoremap <F2> :FzfBuffers<CR>
nnoremap <F4> :FzfFiles<CR>
" If another buffer tries to replace NERDTree, put it in the other window, and bring back NERDTree.
autocmd BufEnter * if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
    \ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif

" Tabline for airline
let g:airline#extensions#tabline#enabled = 1
let g:vdebug_options = {}
let g:vdebug_options["port"] = 9100
let g:vdebug_options.path_maps = { "/var/www/data" : "/home/rams/work/scmiddleware/src/data" }

" Enable Mouse!
" set mouse=n
set ttymouse=xterm2
set mouse=a

" Expand or Shrink selection :)
map K <Plug>(expand_region_expand)
map J <Plug>(expand_region_shrink)

" Same Clipboard for all vim instances :)
vmap <leader>y !xsel -i -b && xsel -b <CR>
nmap <leader>p :r !xsel -b <CR>

"Set no wordwrap
set nowrap

"monokai
colorscheme monokai

"fzf
let g:fzf_command_prefix = 'Fzf'

