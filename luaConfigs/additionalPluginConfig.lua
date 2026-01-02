-- toggleterm

local Terminal  = require('toggleterm.terminal').Terminal
local lazygit = Terminal:new({
	cmd = "lazygit",
	hidden = true,
	on_open = function (term)
		vim.keymap.del('t','<ESC>')
	end,
	on_close = function (term)
		vim.keymap.set('t','<ESC>','<C-\\><C-N>')
	end,
	on_exit = function (term)
		vim.keymap.set('t','<ESC>','<C-\\><C-N>')
	end,
	count = 5
})

function project_cwd()
  local root, _ = require("project").get_project_root()
  return root or vim.loop.cwd()
end

function _lazygit_toggle()
  lazygit.dir = project_cwd()
  lazygit:toggle()
end





vim.api.nvim_set_keymap("n", "<leader>g", "<cmd>lua _lazygit_toggle()<CR>", {noremap = true, silent = true})
