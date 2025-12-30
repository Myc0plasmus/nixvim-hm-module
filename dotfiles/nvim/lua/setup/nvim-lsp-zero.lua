require('lsp-zero').setup({})
local lsp_zero = require('lsp-zero')


lsp_zero.on_attach(function(client, bufnr)
  -- see :help lsp-zero-keybindings
  -- to learn the available actions
  lsp_zero.default_keymaps({buffer = bufnr, exclude = {'gl','gi','gd','gD','gs'}})
  
  vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
  vim.keymap.set('n', '<space>e', '<cmd>lua vim.diagnostic.open_float()<cr>')
  vim.keymap.set('n', '<space>q', '<cmd>lua vim.diagnostic.setloclist()<cr>')
  vim.keymap.set('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<cr>')
  vim.keymap.set('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<cr>')
  vim.keymap.set('n', '<leader>gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
  vim.keymap.set('n', '<leader>gd', '<cmd>Telescope lsp_definitions<cr>', {buffer = bufnr})
  vim.keymap.set('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename<cr>', {buffer = bufnr})
  vim.keymap.set('n', '<leader>gi', '<cmd>Telescope lsp_implementations<cr>', {buffer = bufnr})
  vim.keymap.set('n', '<leader>gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
  vim.keymap.set('n', '<leader>go', '<cmd>Telescope lsp_type_definitions<cr>', {buffer = bufnr})
  
  vim.keymap.set('n', 'gr', '<cmd>Telescope lsp_references<cr>', {buffer = bufnr})
end)



require("mason").setup()
require("mason-lspconfig").setup{
	ensure_installed = {"dockerls","eslint","pyright","jsonls","html","quick_lint_js","lua_ls","kotlin_language_server","rnix","tsserver"},	
	handlers = {
		lsp_zero.default_setup,
		-- clangd = function()
		-- 		require("lspconfig").clangd.setup({
		-- 			cmd = {"clangd"}
		-- 	    })
		-- end
	},
}
require('lspconfig').clangd.setup({})

-- require("mason-lspconfig").setup_handlers {
--             function (server_name) -- default handler (optional)
-- 			local capabilities = require('cmp_nvim_lsp').default_capabilities()  
--             -- require("lspconfig")[server_name].setup {capabilities = capabilities,cmd = {'nix-alien',string.format('~/.local/share/nvim/mason/bin/%s', require('mason-lspconfig').get_mappings().lspconfig_to_mason[server_name])}}
--             require("lspconfig")[server_name].setup {capabilities = capabilities,cmd = {"clangd"}}
--         end,
-- }


