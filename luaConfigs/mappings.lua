function get_cursor_pos()
	return tonumber(vim.api.nvim_command_output("echo col(\'.\')"))
end

function get_line_lenght()
	return tonumber(vim.api.nvim_command_output("echo strlen(getline(\'.\'))"))
end

function insert_text(text)
  local pos = vim.api.nvim_win_get_cursor(0)[2]
  local line = vim.api.nvim_get_current_line()
  local nline = line:sub(0, pos) .. text .. line:sub(pos + 1)
  vim.api.nvim_set_current_line(nline)
end

function kex(mycommand)
	-- print(mycommand)
	vim.cmd(string.format("exe \":normal %s\"",mycommand))
end

function get_character_under_cursor()
	return vim.api.nvim_command_output("echo matchstr(getline(\'.\'), \'\\%\' . col(\'.\') . \'c.\')")
end

function escape_prison()
	local cursor_pos = get_cursor_pos()
	-- get the position of closest brackets
	kex("%%")
	local bracket_pos = get_cursor_pos()
	if cursor_pos ~= bracket_pos then
		kex(string.format("%dh", bracket_pos - cursor_pos))
	end

	-- get the position of closest double quotes
	kex("f\\\"")
	local dquote_pos = get_cursor_pos()
	if cursor_pos ~= dquote_pos then
		kex(string.format("%dh", dquote_pos - cursor_pos))
	end	-- kex("``")

	-- get the position of closest single quotes
	kex("f\\\'")
	local squote_pos = get_cursor_pos()
	if cursor_pos ~= squote_pos then
		kex(string.format("%dh", squote_pos - cursor_pos))
	end	-- kex("``")

	-- debug
	-- print(string.format("cursor: %d\nbrackets: %d\ndouble quotes: %d\nsingle quotes: %d\n",cursor_pos,bracket_pos,dquote_pos,squote_pos))

	if bracket_pos == cursor_pos then
		local sign = get_character_under_cursor()
		if sign == "}" or sign == "]" or sign == ")" then
			kex("l")
			local after_sign = get_character_under_cursor()
			if after_sign == "}" or after_sign == "]" or after_sign == ")" then
			   return
			else
				kex("h")
			end	

		end
	end
		-- checking which to which thing, the cursor should move
	if bracket_pos ~= cursor_pos and (
	(squote_pos == cursor_pos and dquote_pos == cursor_pos) or
	(bracket_pos < squote_pos and bracket_pos < dquote_pos) or
	(bracket_pos < squote_pos and dquote_pos == cursor_pos) or
	(bracket_pos < dquote_pos and squote_pos == cursor_pos) )  then
		kex("%%")
		-- print("brackets\n")
	elseif (squote_pos < dquote_pos and squote_pos ~= cursor_pos) or
	(dquote_pos == cursor_pos and squote_pos ~= cursor_pos) then
		kex("f\\\'")
		-- print("single quotes\n")
	-- {}} else
	elseif (dquote_pos < squote_pos and dquote_pos ~= cursor_pos) or
	(squote_pos == cursor_pos and dquote_pos ~= cursor_pos) then
		kex("f\\\"")
		-- print("double quotes\n")
	end
end

function check_brakchets(trigger, put_text)
	local pre_cursor_pos = get_cursor_pos()
	local line_lenght = get_cursor_pos()
	kex('l')
	sign = get_character_under_cursor()
	if sign == trigger and get_cursor_pos() ~= line_lenght or pre_cursor_pos == line_lenght - 1 then
		return
	else

		if get_cursor_pos() ~= line_lenght then
			kex('h')
		end

		kex(string.format("a\\\\%s",put_text))
	end
end

function check_quotes(quote_type)
	local pre_cursor_pos = get_cursor_pos()
	local line_lenght = get_cursor_pos()
	kex('l')
	sign = get_character_under_cursor()
	if sign == quote_type and get_cursor_pos() ~= line_lenght or pre_cursor_pos == line_lenght - 1 then
		return
	else
		if get_cursor_pos() ~= line_lenght then
			kex('h')
		end

		if quote_type == "\"" then
			kex(string.format("a\\%s\\%s",quote_type,quote_type))
			kex(string.format("a\\%s\\%s",quote_type,quote_type))
			kex('h')
		else
			kex(string.format("a%s%s",quote_type,quote_type))
			kex(string.format("a%s%s",quote_type,quote_type))
			kex('h')
		end
	end
end

function delete_brackets()
	first = get_character_under_cursor()
	first_pos = get_cursor_pos()
	line_length = vim.cmd("echo strwidth(getline(\'.\'))")
	kex('l')
	second = get_character_under_cursor()
	if first_pos ~= get_line_lenght() then
		-- print(string.format("did h\nline length: %d\n", get_line_lenght()))
		kex('h')
	end
	-- print(string.format("first: %s\nsecond: %s\n",first,second))
	if (first == second and get_cursor_pos() ~= get_line_lenght() and (first == "\"" or first == "\'")) or (first == "(" and second == ")") or (first == "[" and second == "]") or (first == "{" and second == "}")then
		kex('xx')
	else
		kex('x')
	end

	if get_cursor_pos() == get_line_lenght() then
		vim.cmd("call nvim_feedkeys(\"a\",\"n\",0)")
	else
		vim.cmd("call nvim_feedkeys(\"i\",\"n\",0)")
	end
end


-- function printsth()
-- 	print("aaaaa")
-- 	print("aaaaaa")
-- 	a = 10
-- 	if a == 10 then
-- 		print("bbbb")
-- 	else
-- 		print("aaaa")
-- 	end
-- end



--easy compilation
vim.cmd("command Compile :w <bar> :echo \"Compiled\" <bar> :make!")
vim.keymap.set('n','<F9>',"Compile" )

-- getting through brackets and placing semicolon at the end
-- vim.keymap.set('i','<C-l>','<Esc>l%%a')
vim.keymap.set('i','<C-l>','<Esc>:call v:lua.escape_prison()<Enter>a')
vim.keymap.set('i',';;','<C-o>$;')

-- Brakcet / quote closing/deleting
--
vim.keymap.set('i',"{","{}<left>")
vim.keymap.set('i',"}","<ESC>:call v:lua.check_brakchets(\"}\",\"}\")<ENTER>a")
vim.keymap.set('i',"{<CR>","{<CR>}<Esc>O")
vim.keymap.set('i',"{{","{")
-- vim.keymap.set('i',"{}","{}")
vim.keymap.set('i',"\\}","}")

vim.keymap.set('i',"(","()<left>")
vim.keymap.set('i',")","<ESC>:call v:lua.check_brakchets(\")\",\")\")<ENTER>a")
vim.keymap.set('i',"(<CR>","(<CR>)<Esc>O")
vim.keymap.set('i',"((","(")
-- vim.keymap.set('i',"()","()")
vim.keymap.set('i',"\\)",")")

vim.keymap.set('i',"[","[]<left>")
vim.keymap.set('i',"]","<ESC>:call v:lua.check_brakchets(\"]\",\"]\")<ENTER>a")
vim.keymap.set('i',"[<CR>","[<CR>]<Esc>O")
vim.keymap.set('i',"[[","[")
-- vim.keymap.set('i',"[]","[]")
vim.keymap.set('i',"\\]","]")

vim.keymap.set('i',"\'","<Esc>:call v:lua.check_quotes(\"\\\'\")<Enter>a")
vim.keymap.set('i',"\'<CR>","\'<CR>\'<Esc>O")
vim.keymap.set('i',"\'\'"," \'<ESC>hxa")

vim.keymap.set('i',"\"","<Esc>:call v:lua.check_quotes(\"\\\"\")<Enter>a")
vim.keymap.set('i',"\"<CR>","\"<CR>\"<Esc>O")
vim.keymap.set('i',"\"\""," \"<ESC>hxa")

vim.keymap.set('i', "<C-h>", "<Esc>:call v:lua.delete_brackets()<Enter>")
--
-- vim.keymap.set('i',"<F9>","<ESC>:call v:lua.printsth()<Enter>")

-- debug
vim.keymap.set('n', '<F5>', function() require('dap').continue() end)
vim.keymap.set('n', '<F6>', function() require('dap').terminate() end)
vim.keymap.set('n', '<F10>', function() require('dap').step_over() end)
vim.keymap.set('n', '<F11>', function() require('dap').step_into() end)
vim.keymap.set('n', '<F12>', function() require('dap').step_out() end)
vim.keymap.set('n', '<Leader>b', function() require('dap').toggle_breakpoint() end)
vim.keymap.set('n', '<Leader>B', function() require('dap').set_breakpoint() end)
vim.keymap.set('n', '<Leader>lp', function() require('dap').set_breakpoint(nil, nil, vim.fn.input('Log point message: ')) end)
vim.keymap.set('n', '<Leader>dr', function() require('dap').repl.open() end)
vim.keymap.set('n', '<Leader>dl', function() require('dap').run_last() end)
vim.cmd("command CppOpenDebugTemplateConfig :vsplit | :wincmd l | :e debug-config/dap-cpp-debugconf.lua")
vim.cmd("command CppCreateDebugTemplateConfig :execute ':silent !mkdir debug-config' | :execute ':silent !cp ~/.config/nvim/lua/setup/dap-cpp-debugconf.lua debug-config' | :CppOpenDebugTemplateConfig ")
vim.cmd("command CppAddConfig :call v:lua.require('./debug-config/dap-cpp-debugconf')")
--

-- copy
vim.keymap.set({'n','v'},'<Leader>y','"+y')
vim.keymap.set('n','<Leader>yy','"+yy')
--

--paste
vim.keymap.set({'n','v'},'<Leader>p','"+p')
vim.keymap.set({'n','v'},'<Leader>P','"+P')
--

-- splits
vim.keymap.set('n','<C-w>v','<cmd>vsplit<cr><C-w>l')
vim.keymap.set('n','<C-w>s','<cmd>split<cr><C-w>j')
--

--terminal
vim.keymap.set('t','<ESC>','<C-\\><C-N>')
--

 vim.keymap.set('c', '<tab>', '<C-z>', { silent = false }) -- to fix cmp
