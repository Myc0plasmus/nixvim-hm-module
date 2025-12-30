local lspconf = require('lspconfig')
local servers = {'clangd', 'pyright', 'csharp_ls', 'lua_ls', 'quick_lint_js','eslint','tsserver','html','jsonls', 'kotlin_language_server'}

for _,lsp in ipairs(servers) do
    lspconf[lsp].setup{}
end
