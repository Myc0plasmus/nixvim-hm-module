local Terminal = require('toggleterm.terminal').Terminal

vim.keymap.set("n","<leader>rr","<cmd>AsyncTaskLast<CR>")
vim.keymap.set("n","<leader>te","<cmd>AsyncTaskEdit<CR>")

local function my_toggleterm(opts)
    require'toggleterm'.exec(string.format("cd %s && %s ", opts.cwd, opts.cmd))
end

local satelite = nil
local sateliteMappingSet = false

local function reset_satelite()
	if satelite ~= nil then
		satelite:shutdown()
	end
	if sateliteMappingSet then
		vim.keymap.del("n", '<space>t')
		sateliteMappingSet = false
	end
end

local function toggleterm_satelite(opts)
	reset_satelite()
	satelite = Terminal:new({
		cmd = "zsh",
		dir = opts.cwd,
		close_on_exit = false,
		hidden = true,
		count = 9
	})
	
	function toggle_satelite()
		satelite:toggle()
	end


	toggle_satelite()
	satelite:send(opts.cmd)

	if not sateliteMappingSet then
		vim.keymap.set("n", "<space>t","<cmd>lua toggle_satelite()<CR>")
		sateliteMappingSet = true
	end
end

_G.my_toggleterm = my_toggleterm
_G.toggleterm_satelite = toggleterm_satelite

vim.api.nvim_exec([[
	function! s:my_toggleterm(opts)
		call luaeval('my_toggleterm(_A)', a:opts)
	endfunction
	
	let g:asyncrun_runner = get(g:, 'asyncrun_runner', {})
	let g:asyncrun_runner.my_toggleterm = function('s:my_toggleterm')
	
	function! s:toggleterm_satelite(opts)
		call luaeval('toggleterm_satelite(_A)', a:opts)
	endfunction
	
	let g:asyncrun_runner = get(g:, 'asyncrun_runner', {})
	let g:asyncrun_runner.toggleterm_satelite = function('s:toggleterm_satelite')
]], false)
