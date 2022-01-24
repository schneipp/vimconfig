call plug#begin()
Plug 'preservim/nerdtree'
Plug 'neoclide/coc.nvim', { 'branch': 'master', 'do': 'yarn install --frozen-lockfile' }
Plug 'tpope/vim-surround'
" Plug 'bling/vim-airline'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
" Plug 'vim-airline/vim-airline-themes'
Plug 'vim-vdebug/vdebug'
" Plug 'puremourning/vimspector'

Plug 'terryma/vim-expand-region'
" Plug 'junegunn/fzf'
" Plug 'junegunn/fzf.vim'
" Plug 'neovim/nvim-lspconfig'
" Initialize plugin system
Plug 'dracula/vim', { 'as': 'dracula' }
" Status Line
Plug 'hoob3rt/lualine.nvim'
Plug 'kyazdani42/nvim-web-devicons'

" File Management
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
Plug 'nvim-telescope/telescope-file-browser.nvim'
Plug 'sudormrfbin/cheatsheet.nvim'
Plug 'kyazdani42/nvim-tree.lua'

Plug 'norcalli/nvim-colorizer.lua', { 'branch': 'color-editor' }
Plug 'machakann/vim-highlightedyank'
Plug 'github/copilot.vim'

Plug 'nvim-lua/plenary.nvim' " don't forget to add this one if you don't have it yet!
Plug 'ThePrimeagen/harpoon'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }

Plug 'kyazdani42/nvim-web-devicons'
Plug 'romgrk/barbar.nvim'

Plug 'mattn/webapi-vim'
Plug 'cirla/vim-giphy'
call plug#end()


set shell=/bin/bash

" Remap CAPSLOCK to escape
au VimEnter * silent! !xmodmap -e 'clear Lock' -e 'keycode 0x42 = Escape'
au VimLeave * silent! !xmodmap -e 'clear Lock' -e 'keycode 0x42 = Caps_Lock'



nnoremap <F3> :NERDTreeToggle<CR>
nnoremap <F11> :bn<CR>
nnoremap <F2> :FzfBuffers<CR>
" nnoremap <F4> :FzfFiles<CR>
nnoremap <leader><F4> :lua require'telescope.builtin'.find_files{ hidden = true }<cr>
vnoremap <leader>J :m '>+1<CR>gv=gv
vnoremap <leader>K :m '<-2<CR>gv=gv

nnoremap Y yg$
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap J mzJ`z
nnoremap <space> :w<CR>

" greatest remap ever
xnoremap <leader>p "_dP

" next greatest remap ever : asbjornHaland
nnoremap <leader>y "+y
vnoremap <leader>y "+y
nnoremap <leader>Y gg"+yG

nnoremap <leader>d "_d



" If another buffer tries to replace NERDTree, put it in the other window, and bring back NERDTree.
autocmd BufEnter * if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
    \ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif


" Ignore files
set wildignore+=*.pyc
set wildignore+=*_build/*
set wildignore+=**/coverage/*
set wildignore+=**/node_modules/*
set wildignore+=**/android/*
set wildignore+=**/ios/*
set wildignore+=**/.git/*
set wildignore+=**/ressources/*
set wildignore+=**/node_modules/*
set wildignore+=**/vendor/*



" Tabline for airline
let g:airline#extensions#tabline#enabled = 1
let g:vdebug_options = {}
let g:vdebug_options["port"] = 9100
let g:vdebug_options.path_maps = { "/var/www/data" : "/home/rams/work/scmiddleware/src/data" }
" Enable Mouse!
set mouse+=a

set hidden
set nobackup
set nowritebackup
set noswapfile
set cmdheight=2

set updatetime=300
set shortmess+=c
" Show Tabs
set list
set listchars=tab:>·

set tabstop     =3
set softtabstop =4
set shiftwidth  =4
" set expandtab

" ctrl+space for completion
inoremap <silent><expr> <c-space> coc#refresh()

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> H :call <SID>show_documentation()<CR>


function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Expand or Shrink selection :)
map <leader>K <Plug>(expand_region_expand)
map <leader>J <Plug>(expand_region_shrink)


set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}
command! -nargs=0 Format :call CocActionAsync('format')

" Same Clipboard for all vim instances :)
"vmap <leader>y !xsel -i -b && xsel -b <CR>
"nmap <leader>p :r !xsel -b <CR>

"Set no wordwrap
set nowrap

"color scheme
colorscheme gruvbox

"fzf
let g:fzf_command_prefix = 'Fzfs'

" Colors {{{
if (has("termguicolors"))
  set termguicolors " enable true colors support
endif
let g:dracula_colorterm = 0
let g:dracula_italic = 1
" colorscheme dracula
let mapleader = " "
let g:sneak#label = 1
lua require'colorizer'.setup()

set number relativenumber
set nu rnu

" nvim-telescope/telescope.nvim {{{
lua << EOF
require('telescope').setup {
  defaults = {
		file_ignore_patterns = { "yarn.lock","node_modules","vendor","coverage","build","dist","*.log","*.tgz","*.zip","*.tar.gz","%.git","storage" }
  },
  extensions = {
    fzf = {
      fuzzy = true,
      override_generic_sorter = true,
      override_file_sorter = true,
      case_mode = "smart_case"
    },
  },
  pickers = {
    buffers = {
      show_all_buffers = true,
      sort_lastused = true,
      -- theme = "dropdown",
      -- previewer = false,
      mappings = {
        i = {
          ["<M-d>"] = "delete_buffer",
        }
      }
    }
  }
}
require('telescope').load_extension('fzf')
require("telescope").load_extension "file_browser"
EOF
nnoremap <leader>ps :lua require('telescope.builtin').grep_string( { search = vim.fn.input("Grep for > ") } )<cr>
nnoremap <leader>ff :lua require'telescope.builtin'.find_files{ hidden = true }<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
" nnoremap <Leader>fs :lua require'telescope.builtin'.file_browser{ cwd = vim.fn.expand('%:p:h') }<cr>
nnoremap <leader>fs <cmd>lua require 'telescope'.extensions.file_browser.file_browser( { path = vim.fn.expand('%:p:h') } )<CR>
nnoremap <Leader>fc :lua require'telescope.builtin'.git_status{}<cr>
nnoremap <Leader>cb :lua require'telescope.builtin'.git_branches{}<cr>
nnoremap <leader>fr :lua require'telescope.builtin'.resume{}<CR>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep( { file_ignore_patterns = { '**/*.spec.js' } } )<cr>
" nnoremap <leader>fgi <cmd>lua require('telescope.builtin').live_grep( { file_ignore_patterns = { vim.fn.input("Ignore pattern > ") } } )<cr>
nnoremap <leader>fgd :lua require'telescope.builtin'.live_grep{ search_dirs = { 'slices/admin' } }


" HARPOOOOOON because I'm lazy
nnoremap <leader>a :lua require'harpoon.mark'.add_file()<CR>
nnoremap <leader><TAB> :lua require'harpoon.ui'.toggle_quick_menu()<CR>
nnoremap <leader>1 :lua require("harpoon.ui").nav_file(1)<CR>   
nnoremap <leader>2 :lua require("harpoon.ui").nav_file(2)<CR>
nnoremap <leader>3 :lua require("harpoon.ui").nav_file(3)<CR>
nnoremap <leader>4 :lua require("harpoon.ui").nav_file(4)<CR>
nnoremap <leader>5 :lua require("harpoon.ui").nav_file(5)<CR>
nnoremap <leader>6 :lua require("harpoon.ui").nav_file(6)<CR>
nnoremap <leader>7 :lua require("harpoon.ui").nav_file(7)<CR>
nnoremap <leader>8 :lua require("harpoon.ui").nav_file(8)<CR>
nnoremap <leader>9 :lua require("harpoon.ui").nav_file(9)<CR>
nnoremap § :lua require("harpoon.ui").nav_next()<CR>
nnoremap <leader>k :lua require("harpoon.ui").nav_next()<CR>
nnoremap <leader>j :lua require("harpoon.ui").nav_prev()<CR>
" nnoremap <leader>w :mksession!<CR>
nnoremap <leader>l :BufferPrevious<CR>
nnoremap <leader>ö :BufferNext<CR>
nnoremap <leader>w :BufferClose<CR>

nnoremap <leader>cheat :Cheatsheet<cr>


" nnoremap <leader>fh <cmd>Telescope help_tags<cr>
"}}}
" let g:vimspector_enable_mappings = 'HUMAN'
