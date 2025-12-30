require('telescope').setup()

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>t', '<cmd>Telescope<cr>')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})

-- has extensive config, look at it at: https://github.com/nvim-telescope/telescope.nvim
