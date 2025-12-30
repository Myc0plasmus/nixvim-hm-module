function c_compiler()
	if vim.env.current_compiler ~= nil then
		return nil
	end
	vim.env.current_compiler = "c"

	vim.o.makeprg = "ccompile_and_run %"
end

c_compiler()

