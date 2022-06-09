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
