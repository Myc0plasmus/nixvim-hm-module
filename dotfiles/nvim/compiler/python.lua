function python_compiler()
	if vim.env.current_compiler ~= nil then
		return nil
	end
	vim.env.current_compiler = "python"

	vim.o.makeprg = "python %"
end

python_compiler()

