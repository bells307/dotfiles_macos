local M = {}

local plugins = {}

function M.setup(opts)
	plugins = opts
end

local function sync()
	if vim.fn.executable("git") == 0 then
		error("Git is not installed")
	end

	local base_dir = vim.fn.stdpath('data') .. '/site/pack/'
	local install_dirs = {
		plugin = base_dir .. 'plugins/start/',
		theme = base_dir .. 'themes/start/',
	}

	local installed = { plugin = {}, theme = {} }
	for type, dir in pairs(install_dirs) do
		local items = vim.fn.readdir(dir)
		if items then
			for _, name in ipairs(items) do
				installed[type][name] = true
			end
		end
	end

	for _, entry in ipairs(plugins) do
		local repo, type, branch, custom_name = unpack(entry)

		if type ~= "plugin" and type ~= "theme" then
			error("invalid type: " .. type)
		end

		if not repo then
			error("invalid repo")
		end

		local name = custom_name or repo:match(".+/(.+)")
		local install_dir = install_dirs[type] .. name

		if vim.fn.isdirectory(install_dir) == 0 then
			local clone_args = { 'git', 'clone', '--depth=1' }
			if branch then
				table.insert(clone_args, '-b')
				table.insert(clone_args, branch)
			end
			table.insert(clone_args, 'https://github.com/' .. repo .. '.git')
			table.insert(clone_args, install_dir)

			vim.fn.system(clone_args)
			vim.notify('installed: ' .. name, vim.log.levels.INFO)
		else
			if branch then
				vim.fn.system({ 'git', '-C', install_dir, 'checkout', branch })
				if vim.v.shell_error ~= 0 then
					vim.notify('error switching branch: ' .. name, vim.log.levels.ERROR)
				end
			end

			local result = vim.fn.systemlist({
				'git', '-C', install_dir, 'pull'
			})
			if vim.v.shell_error == 0 then
				if result[#result]:match("Already up to date.") then
					vim.notify('no changes: ' .. name, vim.log.levels.INFO)
				else
					vim.notify('updated: ' .. name, vim.log.levels.INFO)
				end
			else
				vim.notify('update error: ' .. name .. ': ' .. table.concat(result, '\n', vim.log.levels.ERROR))
			end
		end

		installed[type][name] = nil
	end

	for type, plugs in pairs(installed) do
		for plugin_name in pairs(plugs) do
			local install_dir = install_dirs[type] .. plugin_name
			vim.fn.delete(install_dir, 'rf')
			vim.notify('removed: ' .. plugin_name, vim.log.levels.INFO)
		end
	end
end

vim.api.nvim_create_user_command('PlugSync', sync, {})

return M
