local helper_table = {}

helper_table.is_vue_project = function()
	local path = vim.fn.getcwd()

	if vim.fn.filereadable(path .. "/vite.config.js") == 1 then
		return true
	end

	local package_json = vim.fn.glob(path .. "/package.json")

	if vim.fn.filereadable(package_json) == 1 then
		local content = table.concat(vim.fn.readfile(package_json), " ")
		return content:find('"vue"') or content:find('"@vue/"') or content:find('"volar"')
	end

	return false
end

return helper_table
