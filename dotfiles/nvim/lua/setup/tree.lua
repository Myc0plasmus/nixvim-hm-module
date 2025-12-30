require('nvim-tree').setup()

vim.keymap.set('n', '<leader>no', '<cmd>NvimTreeOpen<cr>')
vim.keymap.set('n', '<leader>nc', '<cmd>NvimTreeClose<cr>')
vim.keymap.set('n', '<leader>nn', '<cmd>NvimTreeFocus<cr>')
