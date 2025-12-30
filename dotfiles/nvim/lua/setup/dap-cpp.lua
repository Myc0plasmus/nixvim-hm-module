-- user_path = vim.api.nvim_command_output(":echo $HOME")
--
-- local dap = require('dap')
-- dap.adapters.cppdbg = {
--   id = 'cppdbg',
--   type = 'executable',
--   command = string.format('%s/.vscode/extensions/ms-vscode.cpptools-1.14.5-linux-x64/debugAdapters/bin/OpenDebugAD7',user_path),
-- }
--

-- local dap = require('dap')
-- dap.adapters.lldb = {
--   type = 'executable',
--   command = '/usr/bin/lldb-vscode',
--   name = 'lldb'
-- }

local dap = require('dap')
dap.adapters.codelldb = {
  type = 'server',
  port = "13000",
  executable = {
    -- CHANGE THIS to your path!
    command = '/usr/bin/codelldb',
    args = {"--port", "13000"},

    -- On windows you may have to uncomment this:
    -- detached = false,
  }
}

