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
local toggleterm_terminal = require("toggleterm.terminal")

-- Resolved debug configuration

function get_debug_terminal()
  local term = toggleterm_terminal.get_last_focused()

  if not term then
    vim.notify(
      "No previously focused ToggleTerm terminal. Open one first.",
      vim.log.levels.ERROR
    )
    return nil
  end

  return term
end

-- Run a command in the existing ToggleTerm terminal.
-- Capture stdout separately so Cargo's JSON remains parseable.
function run_in_toggleterm(command, cwd, env, callback)
  local term = get_debug_terminal()
  if not term then
    return
  end

  cwd = cwd or vim.fn.getcwd()

  local json_file = vim.fn.tempname()
  local stderr_file = vim.fn.tempname()
  local status_file = vim.fn.tempname()

  local shell_command = {}

  -- Preserve Cargo environment variables.
  if env then
    for key, value in pairs(env) do
      table.insert(shell_command, key .. "=" .. vim.fn.shellescape(tostring(value)))
    end
  end

  vim.list_extend(shell_command, command)

  local quoted_command = {}
  for _, arg in ipairs(shell_command) do
    -- Environment assignments are already shell-quoted above.
    table.insert(quoted_command, arg)
  end

  local script = table.concat({
    "cd " .. vim.fn.shellescape(cwd) .. " || exit 125",
    "command -v jq >/dev/null || { echo 'Error: jq is required' >&2; exit 127; }",
    "set -o pipefail",
    table.concat(quoted_command, " ")
      .. " 2> >(tee "
      .. vim.fn.shellescape(stderr_file)
      .. " >&2)"
      .. " | tee "
      .. vim.fn.shellescape(json_file)
      .. " | jq -r 'select(.reason == \"compiler-message\") | .message.rendered // empty'",
    "rc=${PIPESTATUS[0]}",
    "printf '%s\\n' \"$rc\" > " .. vim.fn.shellescape(status_file),
  }, "\n")

  -- Run a child Bash in the existing terminal.
  term:send("bash -c " .. vim.fn.shellescape(script))

  local started = vim.uv.hrtime()
  local timeout_ns = 30 * 60 * 1000000000

  local function poll()
    if vim.fn.filereadable(status_file) == 0 then
      if vim.uv.hrtime() - started > timeout_ns then
        vim.notify(
          "Timed out waiting for Cargo build. Check ToggleTerm for errors.",
          vim.log.levels.ERROR
        )
        return
      end

      vim.defer_fn(poll, 100)
      return
    end

    local status = vim.fn.readfile(status_file)

    local exit_code = tonumber(status[1]) or 1
    local stdout = vim.fn.readfile(json_file)
    local stderr = vim.fn.readfile(stderr_file)

    -- Keep the files until the callback has parsed the output.
    callback(exit_code, stdout, stderr)

    vim.fn.delete(json_file)
    vim.fn.delete(stderr_file)
    vim.fn.delete(status_file)
  end

  vim.defer_fn(poll, 100)
end


vim.keymap.set('n', '<F5>', function() require("dap").continue() end)
vim.keymap.set('n', '<F6>', function() require('dap').terminate() end)
vim.keymap.set('n', '<F10>', function() require('dap').step_over() end)
vim.keymap.set('n', '<F11>', function() require('dap').step_into() end)
vim.keymap.set('n', '<F12>', function() require('dap').step_out() end)
vim.keymap.set('n', '<Leader>b', function() require('dap').toggle_breakpoint() end)
vim.keymap.set('n', '<Leader>B', function() require('dap').set_breakpoint() end)
vim.keymap.set('n', '<Leader>lp', function() require('dap').set_breakpoint(nil, nil, vim.fn.input('Log point message: ')) end)
vim.keymap.set('n', '<Leader>dr', function() require('dap').repl.open() end)
vim.keymap.set('n', '<Leader>dl', function() require('dap').run_last() end)
vim.keymap.set({'n', 'v'}, '<Leader>dh', function()
  require('dap.ui.widgets').hover()
end)
vim.keymap.set({'n', 'v'}, '<Leader>dp', function()
  require('dap.ui.widgets').preview()
end)
vim.keymap.set('n', '<Leader>df', function()
  local widgets = require('dap.ui.widgets')
  widgets.centered_float(widgets.frames)
end)
vim.keymap.set('n', '<Leader>ds', function()
  local widgets = require('dap.ui.widgets')
  widgets.centered_float(widgets.scopes)
end)
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

-- rust debug
local dap = require("dap")

function cargo_inspector(config, on_config)
  if not config.cargo then
    debug_program = config.program
    debug_cwd = config.cwd
    debug_adapter = config.type
    on_config(config)
    return
  end

  local final_config = vim.deepcopy(config)
  local cargo = final_config.cargo
  local cargo_args = cargo.args or {}

  local build_args = {}
  local test_args = {}
  local after_separator = false

  for _, arg in ipairs(cargo_args) do
    if arg == "--" and not after_separator then
      after_separator = true
    elseif after_separator then
      table.insert(test_args, arg)
    else
      table.insert(build_args, arg)
    end
  end

  if build_args[1] ~= "test" then
    vim.notify(
      "Cargo DAP helper supports cargo test configurations only.",
      vim.log.levels.ERROR
    )
    return
  end

  local filter
  local takes_value = {
    ["--package"] = true,
    ["-p"] = true,
    ["--manifest-path"] = true,
    ["--target"] = true,
    ["--target-dir"] = true,
    ["--profile"] = true,
    ["--features"] = true,
    ["--exclude"] = true,
  }

  local skip_value = false

  for i = 2, #build_args do
    local arg = build_args[i]

    if skip_value then
      skip_value = false
    elseif takes_value[arg] then
      skip_value = true
    elseif not arg:match("^%-") then
      filter = arg
      break
    end
  end

  if not filter then
    vim.notify(
      "Specify a test filter in launch.json.",
      vim.log.levels.ERROR
    )
    return
  end

  -- Build without running the test.
  local command = { "cargo" }
  vim.list_extend(command, build_args)
  table.insert(command, "--no-run")
  table.insert(command, "--message-format=json")

  local cwd = cargo.cwd or final_config.cwd or vim.fn.getcwd()

  run_in_toggleterm(command, cwd, cargo.env, function(exit_code, output, stderr)
    if exit_code ~= 0 then
      vim.notify(
        "Cargo test build failed (exit "
          .. exit_code
          .. "). See ToggleTerm for output.\n"
          .. table.concat(stderr, "\n"),
        vim.log.levels.ERROR
      )
      return
    end

    -- Collect executable test artifacts from Cargo JSON.
    local executables = {}

    for _, line in ipairs(output) do
      local ok, item = pcall(vim.json.decode, line)

      if ok
        and type(item) == "table"
        and item.reason == "compiler-artifact"
        and type(item.executable) == "string"
        and type(item.target) == "table"
        and item.target.test == true
      then
        table.insert(executables, item.executable)
      end
    end

    -- Find the binary containing the requested test.
    local matches = {}

    for _, executable in ipairs(executables) do
      local listed = vim.system({
        executable,
        filter,
        "--list",
      }, {
        cwd = cwd,
        env = cargo.env,
        text = true,
      }):wait()

      if listed.code == 0 then
        for line in (listed.stdout or ""):gmatch("[^\r\n]+") do
          if line:match(": test%s*$") then
            table.insert(matches, executable)
            break
          end
        end
      end
    end

    if #matches == 0 then
      vim.notify(
        "No test binary contains a test matching: " .. filter,
        vim.log.levels.ERROR
      )
      return
    end

    if #matches > 1 then
      vim.notify(
        "Multiple test binaries match '"
          .. filter
          .. "'. Narrow the filter.",
        vim.log.levels.ERROR
      )
      return
    end

    final_config.program = matches[1]
    final_config.cwd = cwd
    final_config.args = { filter }
    vim.list_extend(final_config.args, test_args)
    final_config.cargo = nil

    -- Finish resolving the DAP config first, so CodeLLDB can
    -- start its attach request before the test process launches.
    on_config(final_config)

  end)
end

dap.adapters.codelldb.enrich_config = cargo_inspector


local function strip_ansi(line)
  -- Strip CSI sequences, including colors (SGR), cursor
  -- movement, erase commands, and other terminal formatting.
  line = line:gsub("\27%[[0-?]*[ -/]*[@-~]", "")

  -- Strip OSC sequences, e.g. terminal titles and hyperlinks.
  line = line:gsub("\27%][^\7]*\7", "")
  line = line:gsub("\27%].-\27\\", "")

  return line
end

vim.api.nvim_create_user_command("Maketerm", function(opts)
  local source_buf = vim.api.nvim_get_current_buf()
  local makeprg = vim.bo[source_buf].makeprg
  local efm = vim.bo[source_buf].errorformat

  local cmd = makeprg
  if opts.args ~= "" then
    cmd = cmd .. " " .. opts.args
  end

  local output = {}
  local pending = ""

  -- Create a full-width terminal window.
  vim.cmd("botright 12new")
  local term_buf = vim.api.nvim_get_current_buf()

  vim.fn.termopen(cmd, {
    on_stdout = function(_, data)
      if not data then return end

      -- Job callbacks provide chunks, not complete lines.
      pending = pending .. table.concat(data, "\n")
      local lines = vim.split(pending, "\n", {
        plain = true,
      })

      pending = table.remove(lines) or ""

      vim.list_extend(output, lines)
    end,

    on_exit = function(_, code)
      if pending ~= "" then
        table.insert(output, pending)
      end

      vim.schedule(function()
        local clean_output = {}

        for _, line in ipairs(output) do
          table.insert(clean_output, strip_ansi(line))
        end

        local parsed = vim.fn.getqflist({
          lines = clean_output,
          efm = efm,
        })

        vim.fn.setqflist({}, " ", {
          title = cmd,
          items = parsed.items,
        })

        vim.notify("Build exited with code " .. code)
      end)
    end,
  })

  vim.cmd("startinsert")
end, { nargs = "*" })
