require("mason").setup()
require("mason-lspconfig").setup{
	ensure_installed = {"clangd","dockerls","eslint","pyright","jsonls","html","quick_lint_js","lua_ls","kotlin_language_server","rnix","tsserver"}	
}
require("mason-lspconfig").setup_handlers {
        -- The first entry (without a key) will be the default handler
        -- and will be called for each installed server that doesn't have
        -- a dedicated handler.
        function (server_name) -- default handler (optional)
			local capabilities = require('cmp_nvim_lsp').default_capabilities()  
            require("lspconfig")[server_name].setup {capabilities = capabilities,cmd = {'steam-run',string.format('require("./%s")', server_name)}}
        end,

		-- ["clangd"] = function()
		-- 	local lspconfig = require("lspconfig")
		-- 	lspconfig.clangd.setup {
		-- 		cmd = {'steam-run','./clangd'},
		-- 	}
		-- end
        -- Next, you can provide a dedicated handler for specific servers.
        -- For example, a handler override for the `rust_analyzer`:
    }
