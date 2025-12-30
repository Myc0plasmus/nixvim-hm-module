require("toggleterm").setup({
	open_mapping = [[<c-\>]],
	insert_mapping = true,
	direction = "float";
})

vim.keymap.set("n", '<leader>tf', '<Cmd>execute v:count . "ToggleTerm direction=\\\"float\\\""<CR>', {
      desc = "Toggle Terminal",
      silent = true,
    })
vim.keymap.set("n", '<leader>tt', '<Cmd>execute v:count . "ToggleTerm direction=\\\"tab\\\""<CR>', {
      desc = "Toggle Terminal",
      silent = true,
    })
vim.keymap.set("n", '<leader>th', '<Cmd>execute v:count . "ToggleTerm direction=\\\"horizontal\\\""<CR>', {
      desc = "Toggle Terminal",
      silent = true,
    })
vim.keymap.set("n", '<leader>tv', '<Cmd>execute v:count . "ToggleTerm direction=\\\"vertical\\\""<CR>', {
      desc = "Toggle Terminal",
      silent = true,
    })
vim.keymap.set("n", '<leader>ts', '<Cmd>TermSelect<CR>', {
      desc = "Toggle Terminal",
      silent = true,
    })
