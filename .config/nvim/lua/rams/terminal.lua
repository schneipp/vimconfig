local ui = require('vim.ui')

require('toggleterm').setup {
	 open_mapping = [[<C-t>]],
	 direction = 'float',
	 float_opts = {
		  border = 'curved',
        width = 150,
        height = 50,
		  highlights = {
				border = "#FF6600",
				background = "Normal"
			}
	  }
}

local Terminal  = require('toggleterm.terminal').Terminal
local lazygit = Terminal:new({ cmd = "/home/rams/go/bin/lazygit", hidden = true })

function LazygitToggle()
  lazygit:toggle()
end

vim.api.nvim_set_keymap("n", "<C-g>", "<cmd>lua LazygitToggle()<CR>", {noremap = true, silent = true})
-- vim.api.nvim_set_keymap("n", "<C-e>", "<cmd>lua _ranger_toggle()<CR>", {noremap = true, silent = true})

-- vim.wo.colorcolumn = '120'

print('hello terminal')
