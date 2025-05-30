local dap = require('dap')
local dapui = require("dapui")

dapui.setup()
require("nvim-dap-virtual-text").setup()

-- Optional: Auto open/close UI on debug events
dap.listeners.after.event_initialized["dapui_config"] = function()
	dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
	dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
	dapui.close()
end

dap.adapters.lldb = {
	type = 'executable',
	command = '/Users/bells307/.local/bin/lldb-vscode',
	name = "lldb"
}

dap.configurations.rust = {
	{
		name = "Launch Rust",
		type = "lldb",
		request = "launch",
		program = function()
			return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/target/debug/', 'file')
		end,
		cwd = '${workspaceFolder}',
		stopOnEntry = false,
		args = {},
	}
}

dap.adapters.go = function(callback, _)
	local handle
	local pid_or_err
	local port = 38697
	handle, pid_or_err = vim.loop.spawn("dlv", {
		args = { "dap", "-l", "127.0.0.1:" .. port },
		detached = true
	}, function(code)
		handle:close()
		print("Delve exited with exit code: " .. code)
	end)
	vim.defer_fn(function()
		callback({ type = "server", host = "127.0.0.1", port = port })
	end, 100)
end

dap.configurations.go = {
	{
		type = "go",
		name = "Debug",
		request = "launch",
		program = "${file}",
	},
}

vim.keymap.set('n', '<F5>', function() require 'dap'.continue() end)
vim.keymap.set('n', '<F10>', function() require 'dap'.step_over() end)
vim.keymap.set('n', '<F11>', function() require 'dap'.step_into() end)
vim.keymap.set('n', '<F12>', function() require 'dap'.step_out() end)
vim.keymap.set('n', '<Leader>db', function() require 'dap'.toggle_breakpoint() end)
vim.keymap.set('n', '<Leader>dB', function() require 'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: ')) end)
vim.keymap.set("n", "<Leader>du", function() require("dapui").toggle() end)
vim.keymap.set("n", "<Leader>de", function() require("dapui").eval() end)
vim.keymap.set("v", "<Leader>de", function() require("dapui").eval() end)
