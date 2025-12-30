-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

_G._packer = _G._packer or {}
_G._packer.inside_compile = true

local time
local profile_info
local should_profile = false
if should_profile then
  local hrtime = vim.loop.hrtime
  profile_info = {}
  time = function(chunk, start)
    if start then
      profile_info[chunk] = hrtime()
    else
      profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
    end
  end
else
  time = function(chunk, start) end
end

local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end
  if threshold then
    table.insert(results, '(Only showing plugins that took longer than ' .. threshold .. ' ms ' .. 'to load)')
  end

  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/home/myc0plasmus/.cache/nvim/packer_hererocks/2.1.1693350652/share/lua/5.1/?.lua;/home/myc0plasmus/.cache/nvim/packer_hererocks/2.1.1693350652/share/lua/5.1/?/init.lua;/home/myc0plasmus/.cache/nvim/packer_hererocks/2.1.1693350652/lib/luarocks/rocks-5.1/?.lua;/home/myc0plasmus/.cache/nvim/packer_hererocks/2.1.1693350652/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/myc0plasmus/.cache/nvim/packer_hererocks/2.1.1693350652/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["Comment.nvim"] = {
    config = { 'require("setup/comment")' },
    loaded = true,
    path = "/home/myc0plasmus/.local/share/nvim/site/pack/packer/start/Comment.nvim",
    url = "https://github.com/numToStr/Comment.nvim"
  },
  LuaSnip = {
    loaded = true,
    path = "/home/myc0plasmus/.local/share/nvim/site/pack/packer/start/LuaSnip",
    url = "https://github.com/L3MON4D3/LuaSnip"
  },
  ["cmp-buffer"] = {
    loaded = true,
    path = "/home/myc0plasmus/.local/share/nvim/site/pack/packer/start/cmp-buffer",
    url = "https://github.com/hrsh7th/cmp-buffer"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/home/myc0plasmus/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp"
  },
  ["cmp-nvim-lua"] = {
    loaded = true,
    path = "/home/myc0plasmus/.local/share/nvim/site/pack/packer/start/cmp-nvim-lua",
    url = "https://github.com/hrsh7th/cmp-nvim-lua"
  },
  ["cmp-path"] = {
    loaded = true,
    path = "/home/myc0plasmus/.local/share/nvim/site/pack/packer/start/cmp-path",
    url = "https://github.com/hrsh7th/cmp-path"
  },
  ["cmp-tabnine"] = {
    loaded = true,
    path = "/home/myc0plasmus/.local/share/nvim/site/pack/packer/start/cmp-tabnine",
    url = "https://github.com/tzachar/cmp-tabnine"
  },
  ["dracula.nvim"] = {
    config = { 'require("setup/nvim-dracula")' },
    loaded = true,
    path = "/home/myc0plasmus/.local/share/nvim/site/pack/packer/start/dracula.nvim",
    url = "https://github.com/Mofiqul/dracula.nvim"
  },
  ["dressing.nvim"] = {
    loaded = true,
    path = "/home/myc0plasmus/.local/share/nvim/site/pack/packer/start/dressing.nvim",
    url = "https://github.com/stevearc/dressing.nvim"
  },
  ["github-nvim-theme"] = {
    loaded = true,
    path = "/home/myc0plasmus/.local/share/nvim/site/pack/packer/start/github-nvim-theme",
    url = "https://github.com/projekt0n/github-nvim-theme"
  },
  ["gitsigns.nvim"] = {
    config = { 'require("setup/gitsign")' },
    loaded = true,
    path = "/home/myc0plasmus/.local/share/nvim/site/pack/packer/start/gitsigns.nvim",
    url = "https://github.com/lewis6991/gitsigns.nvim"
  },
  harpoon = {
    config = { 'require("setup/myharpoon")' },
    loaded = true,
    path = "/home/myc0plasmus/.local/share/nvim/site/pack/packer/start/harpoon",
    url = "https://github.com/ThePrimeagen/harpoon"
  },
  ["jupyter_ascending.vim"] = {
    loaded = true,
    path = "/home/myc0plasmus/.local/share/nvim/site/pack/packer/start/jupyter_ascending.vim",
    url = "https://github.com/untitled-ai/jupyter_ascending.vim"
  },
  ["lsp-zero.nvim"] = {
    config = { 'require("setup/nvim-lsp-zero")' },
    loaded = true,
    path = "/home/myc0plasmus/.local/share/nvim/site/pack/packer/start/lsp-zero.nvim",
    url = "https://github.com/VonHeikemen/lsp-zero.nvim"
  },
  ["lspkind-nvim"] = {
    loaded = true,
    path = "/home/myc0plasmus/.local/share/nvim/site/pack/packer/start/lspkind-nvim",
    url = "https://github.com/onsails/lspkind-nvim"
  },
  ["lualine.nvim"] = {
    config = { 'require("setup/nvim-lualine")' },
    loaded = true,
    path = "/home/myc0plasmus/.local/share/nvim/site/pack/packer/start/lualine.nvim",
    url = "https://github.com/nvim-lualine/lualine.nvim"
  },
  ["marks.nvim"] = {
    config = { 'require("setup/my_mark")' },
    loaded = true,
    path = "/home/myc0plasmus/.local/share/nvim/site/pack/packer/start/marks.nvim",
    url = "https://github.com/chentoast/marks.nvim"
  },
  ["mason-lspconfig.nvim"] = {
    loaded = true,
    path = "/home/myc0plasmus/.local/share/nvim/site/pack/packer/start/mason-lspconfig.nvim",
    url = "https://github.com/williamboman/mason-lspconfig.nvim"
  },
  ["mason.nvim"] = {
    loaded = true,
    path = "/home/myc0plasmus/.local/share/nvim/site/pack/packer/start/mason.nvim",
    url = "https://github.com/williamboman/mason.nvim"
  },
  ["nvim-cmp"] = {
    config = { 'require("setup/nvim-cmp")' },
    loaded = true,
    path = "/home/myc0plasmus/.local/share/nvim/site/pack/packer/start/nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-dap"] = {
    config = { 'require("setup/dap-main")' },
    loaded = true,
    path = "/home/myc0plasmus/.local/share/nvim/site/pack/packer/start/nvim-dap",
    url = "https://github.com/mfussenegger/nvim-dap"
  },
  ["nvim-dap-python"] = {
    config = { 'require("setup/dap-python")' },
    loaded = true,
    path = "/home/myc0plasmus/.local/share/nvim/site/pack/packer/start/nvim-dap-python",
    url = "https://github.com/mfussenegger/nvim-dap-python"
  },
  ["nvim-dap-ui"] = {
    config = { 'require("setup/dap-ui")' },
    loaded = true,
    path = "/home/myc0plasmus/.local/share/nvim/site/pack/packer/start/nvim-dap-ui",
    url = "https://github.com/rcarriga/nvim-dap-ui"
  },
  ["nvim-dap-virtual-text"] = {
    config = { 'require("setup/dap-virtual-text")' },
    loaded = true,
    path = "/home/myc0plasmus/.local/share/nvim/site/pack/packer/start/nvim-dap-virtual-text",
    url = "https://github.com/theHamsta/nvim-dap-virtual-text"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/home/myc0plasmus/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-man"] = {
    loaded = true,
    path = "/home/myc0plasmus/.local/share/nvim/site/pack/packer/start/nvim-man",
    url = "https://github.com/paretje/nvim-man"
  },
  ["nvim-notify"] = {
    loaded = true,
    path = "/home/myc0plasmus/.local/share/nvim/site/pack/packer/start/nvim-notify",
    url = "https://github.com/rcarriga/nvim-notify"
  },
  ["nvim-remote-containers"] = {
    loaded = true,
    path = "/home/myc0plasmus/.local/share/nvim/site/pack/packer/start/nvim-remote-containers",
    url = "https://github.com/jamestthompson3/nvim-remote-containers"
  },
  ["nvim-sshfs"] = {
    config = { 'require("setup/sshfs-plug")' },
    loaded = true,
    path = "/home/myc0plasmus/.local/share/nvim/site/pack/packer/start/nvim-sshfs",
    url = "https://github.com/DanielWeidinger/nvim-sshfs"
  },
  ["nvim-tree.lua"] = {
    config = { 'require("setup/tree")' },
    loaded = true,
    path = "/home/myc0plasmus/.local/share/nvim/site/pack/packer/start/nvim-tree.lua",
    url = "https://github.com/kyazdani42/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    config = { 'require("setup/treesitter")' },
    loaded = true,
    path = "/home/myc0plasmus/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/home/myc0plasmus/.local/share/nvim/site/pack/packer/start/nvim-web-devicons",
    url = "https://github.com/kyazdani42/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/home/myc0plasmus/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/myc0plasmus/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["roshnivim-cs"] = {
    loaded = true,
    path = "/home/myc0plasmus/.local/share/nvim/site/pack/packer/start/roshnivim-cs",
    url = "https://github.com/shaeinst/roshnivim-cs"
  },
  ["suda.vim"] = {
    loaded = true,
    path = "/home/myc0plasmus/.local/share/nvim/site/pack/packer/start/suda.vim",
    url = "https://github.com/lambdalisue/suda.vim"
  },
  ["telescope.nvim"] = {
    config = { 'require("setup/t-scope")' },
    loaded = true,
    path = "/home/myc0plasmus/.local/share/nvim/site/pack/packer/start/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  ["toggleterm.nvim"] = {
    config = { 'require("setup/toggleTerm")' },
    loaded = true,
    path = "/home/myc0plasmus/.local/share/nvim/site/pack/packer/start/toggleterm.nvim",
    url = "https://github.com/akinsho/toggleterm.nvim"
  },
  ["vim-terminator"] = {
    loaded = true,
    path = "/home/myc0plasmus/.local/share/nvim/site/pack/packer/start/vim-terminator",
    url = "https://github.com/erietz/vim-terminator"
  },
  ["which-key.nvim"] = {
    config = { 'require("setup/whichKey")' },
    loaded = true,
    path = "/home/myc0plasmus/.local/share/nvim/site/pack/packer/start/which-key.nvim",
    url = "https://github.com/folke/which-key.nvim"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: Comment.nvim
time([[Config for Comment.nvim]], true)
require("setup/comment")
time([[Config for Comment.nvim]], false)
-- Config for: nvim-dap
time([[Config for nvim-dap]], true)
require("setup/dap-main")
time([[Config for nvim-dap]], false)
-- Config for: nvim-dap-python
time([[Config for nvim-dap-python]], true)
require("setup/dap-python")
time([[Config for nvim-dap-python]], false)
-- Config for: harpoon
time([[Config for harpoon]], true)
require("setup/myharpoon")
time([[Config for harpoon]], false)
-- Config for: nvim-dap-virtual-text
time([[Config for nvim-dap-virtual-text]], true)
require("setup/dap-virtual-text")
time([[Config for nvim-dap-virtual-text]], false)
-- Config for: lsp-zero.nvim
time([[Config for lsp-zero.nvim]], true)
require("setup/nvim-lsp-zero")
time([[Config for lsp-zero.nvim]], false)
-- Config for: telescope.nvim
time([[Config for telescope.nvim]], true)
require("setup/t-scope")
time([[Config for telescope.nvim]], false)
-- Config for: toggleterm.nvim
time([[Config for toggleterm.nvim]], true)
require("setup/toggleTerm")
time([[Config for toggleterm.nvim]], false)
-- Config for: lualine.nvim
time([[Config for lualine.nvim]], true)
require("setup/nvim-lualine")
time([[Config for lualine.nvim]], false)
-- Config for: nvim-cmp
time([[Config for nvim-cmp]], true)
require("setup/nvim-cmp")
time([[Config for nvim-cmp]], false)
-- Config for: which-key.nvim
time([[Config for which-key.nvim]], true)
require("setup/whichKey")
time([[Config for which-key.nvim]], false)
-- Config for: marks.nvim
time([[Config for marks.nvim]], true)
require("setup/my_mark")
time([[Config for marks.nvim]], false)
-- Config for: nvim-treesitter
time([[Config for nvim-treesitter]], true)
require("setup/treesitter")
time([[Config for nvim-treesitter]], false)
-- Config for: nvim-dap-ui
time([[Config for nvim-dap-ui]], true)
require("setup/dap-ui")
time([[Config for nvim-dap-ui]], false)
-- Config for: nvim-sshfs
time([[Config for nvim-sshfs]], true)
require("setup/sshfs-plug")
time([[Config for nvim-sshfs]], false)
-- Config for: gitsigns.nvim
time([[Config for gitsigns.nvim]], true)
require("setup/gitsign")
time([[Config for gitsigns.nvim]], false)
-- Config for: dracula.nvim
time([[Config for dracula.nvim]], true)
require("setup/nvim-dracula")
time([[Config for dracula.nvim]], false)
-- Config for: nvim-tree.lua
time([[Config for nvim-tree.lua]], true)
require("setup/tree")
time([[Config for nvim-tree.lua]], false)

_G._packer.inside_compile = false
if _G._packer.needs_bufread == true then
  vim.cmd("doautocmd BufRead")
end
_G._packer.needs_bufread = false

if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
