local plugins = {}

local function setup(opts)
	plugins = opts
end

local function sync()
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
		local repo, type, custom_name = unpack(entry)

		if type ~= "plugin" and type ~= "theme" then
			error("invalid type: " .. type)
		end

		if not repo then
			error("invalid repo")
		end

		local name = custom_name or repo:match(".+/(.+)")
		local install_dir = install_dirs[type] .. name

		if vim.fn.isdirectory(install_dir) == 0 then
			vim.fn.system({
				'git', 'clone', '--depth=1',
				'https://github.com/' .. repo .. '.git',
				install_dir
			})
			print('installed: ' .. name)
		else
			local result = vim.fn.systemlist({
				'git', '-C', install_dir, 'pull'
			})
			if vim.v.shell_error == 0 then
				if result[#result]:match("Already up to date.") then
					print('no changes: ' .. name)
				else
					print('updated: ' .. name)
				end
			else
				print('update error: ' .. name .. ': ' .. table.concat(result, '\n'))
			end
		end

		installed[type][name] = nil
	end

	for type, plugs in pairs(installed) do
		for plugin_name in pairs(plugs) do
			local install_dir = install_dirs[type] .. plugin_name
			vim.fn.delete(install_dir, 'rf')
			print('removed: ' .. plugin_name)
		end
	end
end

vim.api.nvim_create_user_command('SyncPlugins', sync, {})

return {
	setup = setup
}
