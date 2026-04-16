return {
	{
		"mfussenegger/nvim-dap",
		dependencies = {
			"leoluz/nvim-dap-go",
			-- "rcarriga/nvim-dap-ui",
			"igorlfs/nvim-dap-view",
			"theHamsta/nvim-dap-virtual-text",
			"nvim-neotest/nvim-nio",
			"williamboman/mason.nvim",
			"folke/neodev.nvim",
			"Jorenar/nvim-dap-disasm",
			{
				"mxsdev/nvim-dap-vscode-js",
				dependencies = {

					"microsoft/vscode-js-debug",
					-- After install, build it and rename the dist directory to out
					build = "npm install --legacy-peer-deps --no-save && npx gulp vsDebugServerBundle && rm -rf out && mv dist out",
				},
				config = function()
					---@diagnostic disable-next-line: missing-fields
					require("dap-vscode-js").setup({
						-- Path of node executable. Defaults to $NODE_PATH, and then "node"
						-- node_path = "node",

						-- Path to vscode-js-debug installation.
						debugger_path = vim.fn.resolve(vim.fn.stdpath("data") .. "/lazy/vscode-js-debug"),

						-- Command to use to launch the debug server. Takes precedence over "node_path" and "debugger_path"
						-- debugger_cmd = { "js-debug-adapter" },

						-- which adapters to register in nvim-dap
						adapters = {
							"chrome",
							"pwa-node",
							"pwa-chrome",
							"pwa-msedge",
							"pwa-extensionHost",
							"node-terminal",
						},

						-- Path for file logging
						-- log_file_path = "(stdpath cache)/dap_vscode_js.log",

						-- Logging level for output to file. Set to false to disable logging.
						-- log_file_level = false,

						-- Logging level for output to console. Set to false to disable console output.
						-- log_console_level = vim.log.levels.ERROR,
					})
				end,
			},
		},
		config = function()
			local js_based_languages = {
				"typescript",
				"javascript",
				"typescriptreact",
				"javascriptreact",
				"vue",
			}
			require("neodev").setup({
				library = { plugins = { "nvim-dap-ui" }, types = true },
			})
			local dap = require("dap")
			local ui = require("dap-view")
			require("dap-disasm").setup({
				-- Add disassembly view to elements of nvim-dap-ui
				dapui_register = true,

				-- Add disassembly view to nvim-dap-view
				dapview_register = true,

				-- If registered, pass section configuration to nvim-dap-view
				dapview = {
					keymap = "D",
					label = "Disassembly [D]",
					short_label = "󰒓 [D]",
				},

				-- Show winbar with buttons to step into the code with instruction granularity
				-- This settings is overriden (disabled) if the dapview integration is enabled and the plugin is installed
				winbar = {
					enabled = true,
					labels = {
						step_into = "Step Into",
						step_over = "Step Over",
						step_back = "Step Back",
					},
					order = {
						"step_into",
						"step_over",
						"step_back",
					},
				},
				-- The sign to use for instruction the exectution is stopped at
				sign = "DapStopped",

				-- Number of instructions to show before the memory reference
				ins_before_memref = 16,

				-- Number of instructions to show after the memory reference
				ins_after_memref = 16,

				-- Columns to display in the disassembly view
				columns = {
					"address",
					"instructionBytes",
					"instruction",
				},
			})

			ui.setup({
				winbar = {
					sections = { "watches", "scopes", "exceptions", "breakpoints", "threads", "repl", "disassembly" },
					show_keymap_hints = false,
				},
				windows = {

					size = 0.5,
					position = "right",
					terminal = {
						size = 0.5,
						position = "below",
					},
				},
			})

			dap.adapters.gdb = {
				type = "executable",
				command = "gdb",
				args = { "--interpreter=dap", "--eval-command", "set print pretty on" },
			}

			dap.adapters.cppdbg = {
				id = "cppdbg",
				type = "executable",
				command = "/home/kumang/.config/cpptools/extension/debugAdapters/bin/OpenDebugAD7",
			}

			dap.configurations.c = {
				{
					name = "Launch file",
					type = "cppdbg",
					request = "launch",
					program = function()
						return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
					end,
					cwd = "${workspaceFolder}",
					stopAtEntry = true,
					args = { "-exec set disassembly-flavor intel" },
				},
				-- {
				-- 	name = "Attach to gdbserver :1234",
				-- 	type = "cppdbg",
				-- 	request = "launch",
				-- 	MIMode = "gdb",
				-- 	miDebuggerServerAddress = "localhost:1234",
				-- 	miDebuggerPath = "/usr/bin/gdb",
				-- 	cwd = "${workspaceFolder}",
				-- 	program = function()
				-- 		return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
				-- 	end,
				-- },
			}

			dap.configurations.cpp = dap.configurations.c

			for _, language in ipairs(js_based_languages) do
				dap.configurations[language] = {
					-- Debug single nodejs files
					{
						type = "pwa-node",
						request = "launch",
						name = "Launch file",
						program = "${file}",
						cwd = vim.fn.getcwd(),
						sourceMaps = true,
					},
					-- Debug nodejs processes (make sure to add --inspect when you run the process)
					{
						type = "pwa-node",
						request = "attach",
						name = "Attach",
						processId = require("dap.utils").pick_process,
						cwd = vim.fn.getcwd(),
						sourceMaps = true,
					},
					-- Debug web applications (client side)
					{
						type = "pwa-chrome",
						request = "launch",
						name = "Launch & Debug Chrome",
						url = function()
							local co = coroutine.running()
							return coroutine.create(function()
								vim.ui.input({
									prompt = "Enter URL: ",
									default = "http://localhost:3000",
								}, function(url)
									if url == nil or url == "" then
										return
									else
										coroutine.resume(co, url)
									end
								end)
							end)
						end,
						webRoot = vim.fn.getcwd(),
						protocol = "inspector",
						sourceMaps = true,
						userDataDir = false,
					},
					-- Divider for the launch.json derived configs
					{
						name = "----- ↓ launch.json configs ↓ -----",
						type = "",
						request = "launch",
					},
				}
			end

			require("dap-go").setup()

			require("nvim-dap-virtual-text").setup({
				display_callback = function(variable)
					local name = string.lower(variable.name)
					local value = string.lower(variable.value)
					if name:match("secret") or name:match("api") or value:match("secret") or value:match("api") then
						return "*****"
					end

					if #variable.value > 15 then
						return " " .. string.sub(variable.value, 1, 15) .. "... "
					end

					return " " .. variable.value
				end,
			})

			vim.keymap.set("n", "<leader>db", dap.toggle_breakpoint, { desc = "Debug: add breakpoint" })
			vim.keymap.set("n", "<leader>dx", dap.run_to_cursor, { desc = "Debug: run to cursor" })
			vim.keymap.set("n", "<leader>dq", dap.terminate, { desc = "Debug: Quit debugger" })

			vim.keymap.set("n", "<leader>dc", dap.continue, { desc = "Debugger continue" })
			vim.keymap.set("n", "<leader>dsi", dap.step_into, { desc = "Debugger step into" })
			vim.keymap.set("n", "<leader>dso", dap.step_over, { desc = "Debugger step over" })
			vim.keymap.set("n", "<leader>dst", dap.step_out, { desc = "Debugger step out" })
			vim.keymap.set("n", "<leader>dsb", dap.step_back, { desc = "Debugger step back" })
			vim.keymap.set("n", "<leader>dr", dap.restart, { desc = "Debugger restart" })
			vim.keymap.set("n", "<leader>du", function()
				ui.toggle(true)
			end, { desc = "Toggle Debugger" })

			dap.listeners.before.attach.dapui_config = function()
				ui.open()
			end
			dap.listeners.before.launch.dapui_config = function()
				ui.open()
			end
			dap.listeners.before.event_terminated.dapui_config = function()
				ui.close(true)
			end
			dap.listeners.before.event_exited.dapui_config = function()
				ui.close(true)
			end
		end,
	},
}
