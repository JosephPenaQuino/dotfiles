local dap = require('dap')


-- dap.configurations.python = {
-- 	{
-- 		type = 'python',
-- 		request = 'launch',
-- 		name = "Launch file",
-- 		program = "${file}",
-- 		pythonPath = function()
-- 			return '/usr/bin/python'
-- 		end,
-- 	},
-- }



vim.keymap.set("n", "<leader>db", dap.toggle_breakpoint)
vim.keymap.set("n", "<leader>dc", dap.continue)
vim.keymap.set("n", "<leader>dd", dap.disconnect)
vim.keymap.set("n", "<leader>de", dap.step_out)
vim.keymap.set("n", "<leader>di", dap.step_into)
vim.keymap.set("n", "<leader>do", dap.step_over)
vim.keymap.set("n", "<leader>dr", dap.repl.open)
vim.keymap.set("n", "<leader>ds", dap.close)


-- set some custom styles for the debugger
local dap_breakpoint = {
	error = {
		text = "🟥",
		texthl = "LspDiagnosticsSignError",
		linehl = "",
		numhl = "",
	},
	rejected = {
		text = "",
		texthl = "LspDiagnosticsSignHint",
		linehl = "",
		numhl = "",
	},
	stopped = {
		text = "⭐️",
		texthl = "LspDiagnosticsSignInformation",
		linehl = "DiagnosticUnderlineInfo",
		numhl = "LspDiagnosticsSignInformation",
	},
}

vim.fn.sign_define("DapBreakpoint", dap_breakpoint.error)
vim.fn.sign_define("DapStopped", dap_breakpoint.stopped)
vim.fn.sign_define("DapBreakpointRejected", dap_breakpoint.rejected)


require("nvim-dap-virtual-text").setup {
	commented = true,
}
local dapui = require "dapui"
dapui.setup {} -- use default
dap.listeners.after.event_initialized["dapui_config"] = function()
	dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
	dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
	dapui.close()
end
require('dap.ext.vscode').load_launchjs(nil, {debugpy={'python'}})

local dap_python = require('dap-python')
dap_python.setup("python")
dap_python.test_runner = 'pytest'

