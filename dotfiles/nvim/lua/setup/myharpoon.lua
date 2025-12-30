require("harpoon").setup({  })


vim.keymap.set('n', '<leader>ha', '<cmd>lua require("harpoon.mark").add_file()<cr>')
vim.keymap.set('n', '<leader>hh', '<cmd>lua require("harpoon.ui").toggle_quick_menu()<cr>')
vim.keymap.set('n', '<leader>hn', '<cmd>lua require("harpoon.ui").nav_next()<cr>')
vim.keymap.set('n', '<leader>hN', '<cmd>lua require("harpoon.ui").nav_previous()<cr>')

require("telescope").load_extension('harpoon')
vim.keymap.set('n', '<leader>fh', '<cmd>Telescope harpoon marks<cr>', {})
