call plug#begin()
Plug 'kyazdani42/nvim-tree.lua'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'puremourning/vimspector'
Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/nvim-lsp-installer'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'max397574/better-escape.nvim'
Plug 'glepnir/lspsaga.nvim'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
" For vsnip users.
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'
Plug 'L3MON4D3/LuaSnip'
Plug 'rafamadriz/friendly-snippets'
" Plug 'hoob3rt/lualine.nvim'
Plug 'nvim-lualine/lualine.nvim'
Plug 'nanotee/sqls.nvim'
Plug 'kyazdani42/nvim-web-devicons'
" File Management
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
Plug 'nvim-telescope/telescope-file-browser.nvim'
Plug 'nvim-telescope/telescope-github.nvim'

Plug 'sudormrfbin/cheatsheet.nvim'
Plug 'nvim-lua/plenary.nvim' " don't forget to add this one if you don't have it yet!
Plug 'tjdevries/complextras.nvim'
Plug 'ThePrimeagen/harpoon'
Plug 'norcalli/nvim-colorizer.lua', { 'branch': 'color-editor' }
Plug 'kyazdani42/nvim-web-devicons'

Plug 'akinsho/toggleterm.nvim'
Plug 'github/copilot.vim'
" Tabline Plugin
Plug 'romgrk/barbar.nvim'
Plug 'rbgrouleff/bclose.vim'
Plug 'ray-x/lsp_signature.nvim'
" Vim Session Management
" Plug 'tpope/vim-obsession'
Plug 'navarasu/onedark.nvim'
Plug 'onsails/lspkind-nvim'
Plug 'fcpg/vim-osc52'
Plug 'hesselbom/vim-hsftp'
Plug 'Rican7/php-doc-modded'
" ORG mode AWESOME EDITION
Plug 'nvim-neorg/neorg'
Plug 'easymotion/vim-easymotion'
Plug 'numToStr/Comment.nvim'

call plug#end()

colorscheme gruvbox
set shell=/bin/bash
" set clipboard^=unnamed,unnamedplus
set completeopt=menu,menuone,noselect
set autoindent
set nowrap
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
" Even more settings!
set mouse+=a
set hidden
set nobackup
set nowritebackup
set noswapfile
set cmdheight=2
set updatetime=300
set shortmess+=c
set list
set listchars=tab:>·
set tabstop     =3
set softtabstop =4
set shiftwidth  =4
set expandtab
" set background=dark

nnoremap y "*y
nnoremap p "*p
vnoremap y "*y
vnoremap p "*p
nnoremap <F3> :NvimTreeToggle<CR>
let g:vimspector_enable_mappings = 'VISUAL_STUDIO'
let g:vimspector_base_dir='/home/rams/.local/share/nvim/plugged/vimspector'
xmap <leader>di <Plug>VimspectorBalloonEval
nmap <leader>di <Plug>VimspectorBalloonEval
nmap <F8> :VimspectorReset<CR><CR>

" now for some customizations
vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv
" keep selection in visual mode when indenting
vnoremap < <gv
vnoremap > >gv

" Y yank the whole line, because wtf this isn't default?
nnoremap Y 0"*yg$
" n jump to next match, and center the screen
" forward and opposite dircection
nnoremap n nzzzv
nnoremap N Nzzzv
" J Join lines, but keep cursor on same line
nnoremap J mzJ`z
" Insane remapping of save to hammer
nnoremap <space> :w<CR>
" ctrl+space for completion
" Expand or Shrink selection :)
map <leader>K <Plug>(expand_region_expand)
map <leader>J <Plug>(expand_region_shrink)


" Same Clipboard for all vim instances :)
vmap <leader>y !xsel -i -b && xsel -b <CR>
nmap <leader>p :r !xsel -b <CR>

"Set no wordwrap

lua require('Comment').setup()

"fzf
let g:fzf_command_prefix = 'Fzfs'

" Colors {{{
if (has("termguicolors"))
  set termguicolors " enable true colors support
endif
"let g:dracula_colorterm = 0
"let g:dracula_italic = 1
" colorscheme dracula
let mapleader = " "
let g:sneak#label = 1
" Colorizer is a plugin that allows you to colorize hex colors
lua require'colorizer'.setup()

set number relativenumber
set nu rnu

set cursorline
"set color for line current line number
hi CursorLine ctermfg=white ctermbg=red
" set cursorcolumn " highlight the current column
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
require("telescope").load_extension('file_browser')
require("telescope").load_extension('gh')
require("rams/lsp")
require("rams/terminal")
require("rams/luasnip")
require("rams/norg")
EOF

lua <<EOF
require'nvim-tree'.setup {
	 disable_netrw = true,
	 open_on_setup = true,
	 open_on_tab = true,
	 diagnostics = {
		  enable = true
	 },
	 filters = {
		  dotfiles = false
	 },
	 git = { enable = true, ignore= true, timeout = 500 },
}
EOF

lua << EOF
require("better_escape").setup {
    mapping = {"jk", "jj"}, -- a table with mappings to use
    timeout = vim.o.timeoutlen, -- the time in which the keys must be hit in ms. Use option timeoutlen by default
    clear_empty_lines = false, -- clear line after escaping if there is only whitespace
    keys = "<Esc>", -- keys used for escaping, if it is a function will use the result everytime
    -- example
    -- keys = function()
    --   return vim.fn.col '.' - 2 >= 1 and '<esc>l' or '<esc>'
    -- end,
}
EOF

lua <<EOF
require('nvim-treesitter.configs').setup {
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
}

require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'auto',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {},
    always_divide_middle = true,
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
--    lualine_c = {'filename'},
    lualine_c = { 'filename', "os.date('%a')", 'data', "require'lsp-status'.status()" },
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  extensions = {}
}
EOF



function! Spawn_note_window() abort
  let path = "~/notes/"
  " let file_name = path.strftime("note-%d-%m-%y.wiki")
  let file_name = path.strftime("notes.txt")
  " Empty buffer
  let buf = nvim_create_buf(v:false, v:true)
  " Get current UI
  let ui = nvim_list_uis()[0]
  " Dimension
  let width = (ui.width/2)
  let height = (ui.height/2)
  " Options for new window
  let opts = {'relative': 'editor',
              \ 'width': width,
              \ 'height': height,
              \ 'col': (ui.width - width)/2,
              \ 'row': (ui.height - height)/2,
              \ 'anchor': 'NW',
              \ 'style': 'minimal',
              \ 'border': 'single',
              \ }
  " Spawn window
  let win = nvim_open_win(buf, 1, opts)
  " Now we can actually open or create the note for the day?
  if filereadable(expand(file_name))
    execute "e ".fnameescape(file_name)
    let column = 80
    execute "set textwidth=".column
    execute "set colorcolumn=".column
    execute "norm Go"
    execute "norm zz"
    execute "startinsert"
  else
    execute "e ".fnameescape(file_name)
    let column = 80
    execute "set textwidth=".column
    execute "set colorcolumn=".column
    execute "norm Gi= Notes for ".strftime("%d-%m-%y")." ="
    execute "norm G2o"
    execute "norm Gi- " 
    execute "norm zz"
    execute "startinsert"
  endif
"  let cmd = nvim_buf_set_keymap(buf, 't', '<C-l>', [[<C-\><C-n><C-W>l]], {})
endfunction

nmap <leader>N :call Spawn_note_window() <CR>
nmap <silent>nc <C-w>c<CR>

nnoremap <C-d> <C-d>zz

" nnoremap <silent> gh <cmd>lua require'lspsaga.provider'.lsp_finder()<CR>
nnoremap <silent> gh :Lspsaga lsp_finder<CR>


nnoremap <leader>ps :lua require('telescope.builtin').grep_string( { search = vim.fn.input("Grep for > ") } )<cr>
nnoremap <leader>ff :lua require'telescope.builtin'.find_files{ hidden = true }<cr>
nnoremap <leader>tb <cmd>Telescope builtin<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
" nnoremap <Leader>fs :lua require'telescope.builtin'.file_browser{ cwd = vim.fn.expand('%:p:h') }<cr>
nnoremap <leader>fs <cmd>lua require 'telescope'.extensions.file_browser.file_browser( { path = vim.fn.expand('%:p:h') } )<CR>
nnoremap <Leader>fc :lua require'telescope.builtin'.git_status{}<cr>
nnoremap <Leader>cb :lua require'telescope.builtin'.git_branches{}<cr>
nnoremap <leader>fr :lua require'telescope.builtin'.resume{}<CR>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep( { file_ignore_patterns = { '**/*.spec.js' } } )<cr>
" nnoremap <leader>fgi <cmd>lua require('telescope.builtin').live_grep( { file_ignore_patterns = { vim.fn.input("Ignore pattern > ") } } )<cr>
nnoremap <leader>fgd :lua require'telescope.builtin'.live_grep{ search_dirs = { 'slices/admin' } }


" HARPOON because I'm lazy
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
nnoremap <leader>c :BufferClose<CR>

nnoremap <leader>cheat :Cheatsheet<cr>

nnoremap <leader>y "*y<CR>
nmap <Leader>d :call PhpDocPasteComment()<CR>
" nnoremap <leader>fh <cmd>Telescope help_tags<cr>
"}}}
" let g:vimspector_enable_mappings = 'HUMAN'
sign define LspDiagnosticsSignError text=🔴
sign define LspDiagnosticsSignWarning text=🟠
sign define LspDiagnosticsSignInformation text=🔵
sign define LspDiagnosticsSignHint text=🟢

"nnoremap <silent> gd    <cmd>lua vim.lsp.buf.definition()<CR>
"nnoremap <silent> gi    <cmd>lua vim.lsp.buf.implementation()<CR>
"nnoremap <silent> gr    <cmd>lua vim.lsp.buf.references()<CR>
"nnoremap <silent> gD    <cmd>lua vim.lsp.buf.declaration()<CR>
"nnoremap <silent> ge    <cmd>lua vim.lsp.diagnostic.set_loclist()<CR>
"nnoremap <silent> K     <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> <leader>F    <cmd>lua vim.lsp.buf.formatting()<CR>
"nnoremap <silent> <leader>rn    <cmd>lua vim.lsp.buf.rename()<CR>

nnoremap <silent> <leader>a <cmd>lua vim.lsp.buf.code_action()<CR>
" xmap <silent> <leader>a <cmd>lua vim.lsp.buf.range_code_action()<CR>

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
" inoremap <C-P> <ESC>:call PhpDocSingle()<CR>i 
nnoremap <C-P> :call PhpDocSingle()<CR> 
vnoremap <C-P> :call PhpDocRange()<CR> 
