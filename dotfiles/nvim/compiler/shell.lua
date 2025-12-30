function shell_compiler()
	if vim.env.current_compiler ~= nil then
		return nil
	end
	vim.env.current_compiler = "shell"

	vim.o.makeprg = "%"
	vim.o.errorformat="%f:\\ line\\ %l:\\ %m"
end

shell_compiler()

