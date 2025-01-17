return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"folke/neodev.nvim",
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			"WhoIsSethDaniel/mason-tool-installer.nvim",
			{ "j-hui/fidget.nvim", opts = {} },
			-- Autoformatting
			"stevearc/conform.nvim",
			-- Schema information
			"b0o/SchemaStore.nvim",
		},
		config = function()
			require("neodev").setup({
				-- library = {
				--   plugins = { "nvim-dap-ui" },
				--   types = true,
				-- },
			})

			local capabilities = nil
			if pcall(require, "cmp_nvim_lsp") then
				capabilities = require("cmp_nvim_lsp").default_capabilities()
			end

			local lspconfig = require("lspconfig")

			local servers = {
				bashls = true,
				lua_ls = true,
				rust_analyzer = true,
				cssls = true,
				tailwindcss = true,
				gopls = {
					settings = {
						gopls = {
							hints = {
								assignVariableTypes = true,
								compositeLiteralFields = true,
								compositeLiteralTypes = true,
								constantValues = true,
								functionTypeParameters = true,
								parameterNames = true,
								rangeVariableTypes = true,
							},
						},
					},
				},
				pyright = true,
				clangd = {
					cmd = {
						"clangd",
						"--background-index",
						"--clang-tidy",
					},
					init_options = {
						clangdFileStatus = true, -- Provides information about activity on clangd’s per-file worker thread
						usePlaceholders = true,
						completeUnimported = true,
						semanticHighlighting = true,
					},
				},
				-- NOTE: dont forget: sudo apt install libstdc++-12-dev

				ts_ls = {
					commands = {
						OrganizeImports = {
							function()
								local params = {
									command = "_typescript.organizeImports",
									arguments = { vim.api.nvim_buf_get_name(0) },
									title = "",
								}
								vim.lsp.buf.execute_command(params)
							end,
							description = "Organize Imports",
						},
					},
				},
				jsonls = {
					settings = {
						json = {
							schemas = require("schemastore").json.schemas(),
							validate = { enable = true },
						},
					},
				},
				eslint = true,
			}

			local servers_to_install = vim.tbl_filter(function(key)
				local t = servers[key]
				if type(t) == "table" then
					return not t.manual_install
				else
					return t
				end
			end, vim.tbl_keys(servers))

			require("mason").setup()
			local ensure_installed = {
				"clangd",
				"stylua",
				"lua_ls",
				"js-debug-adapter",
				"prettier",
				"eslint",
				"pyright",
				"gopls",
				"goimports",
				"delve",
			}

			vim.list_extend(ensure_installed, servers_to_install)
			require("mason-tool-installer").setup({ ensure_installed = ensure_installed })

			for name, config in pairs(servers) do
				if config == true then
					config = {}
				end
				config = vim.tbl_deep_extend("force", {}, {
					capabilities = capabilities,
				}, config)

				lspconfig[name].setup(config)
			end

			local disable_semantic_tokens = {
				lua = true,
			}

			vim.api.nvim_create_autocmd("LspAttach", {
				callback = function(args)
					local bufnr = args.buf
					local client = assert(vim.lsp.get_client_by_id(args.data.client_id), "must have valid client")

					vim.opt_local.omnifunc = "v:lua.vim.lsp.omnifunc"
					vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = 0, desc = "Code Definition" })
					vim.keymap.set("n", "gr", vim.lsp.buf.references, { buffer = 0, desc = "Code References" })
					vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { buffer = 0, desc = "Code Declaraction" })
					vim.keymap.set(
						"n",
						"<leader>o",
						":OrganizeImports<Cr>",
						{ silent = true, desc = "Code Imports Organize" }
					)
					vim.keymap.set(
						"n",
						"gT",
						vim.lsp.buf.type_definition,
						{ buffer = 0, desc = "Code type Definition" }
					)
					vim.keymap.set("n", "gh", vim.lsp.buf.hover, { buffer = 0, desc = "Code Hover" })
					vim.keymap.set("n", "<leader>cr", vim.lsp.buf.rename, { desc = "Code rename" })
					vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code Action" })
					vim.keymap.set(
						"n",
						"<leader>lr",
						"<cmd>LspRestart<CR>",
						{ silent = true, desc = "Lsp server restart" }
					)

					local filetype = vim.bo[bufnr].filetype
					if disable_semantic_tokens[filetype] then
						client.server_capabilities.semanticTokensProvider = nil
					end
				end,
			})

			-- Autoformatting Setup
			require("conform").setup({
				formatters_by_ft = {
					lua = { "stylua" },
					typescript = { "prettier" },
					typescriptreact = { "prettier" },
					javascript = { "prettier" },
					javascriptreact = { "prettier" },
					json = { "prettier" },
					html = { "prettier" },
					css = { "prettier" },
					scss = { "prettier" },
					markdown = { "prettier" },
					yaml = { "prettier" },
					go = { "goimports", "gofmt" },
				},
			})

			-- Customize prettier args
			require("conform.formatters.prettier").args = function(_, ctx)
				local prettier_roots = { ".prettierrc", ".prettierrc.json", "prettier.config.js" }
				local args = { "--stdin-filepath", "$FILENAME" }
				local config_path = vim.fn.stdpath("config")

				local localPrettierConfig = vim.fs.find(prettier_roots, {
					upward = true,
					path = ctx.dirname,
					type = "file",
				})[1]
				local globalPrettierConfig = vim.fs.find(prettier_roots, {
					path = type(config_path) == "string" and config_path or config_path[1],
					type = "file",
				})[1]
				local disableGlobalPrettierConfig = os.getenv("DISABLE_GLOBAL_PRETTIER_CONFIG")

				-- Project config takes precedence over global config
				if localPrettierConfig then
					vim.list_extend(args, { "--config", localPrettierConfig })
				elseif globalPrettierConfig and not disableGlobalPrettierConfig then
					vim.list_extend(args, { "--config", globalPrettierConfig })
				end

				local hasTailwindPrettierPlugin = vim.fs.find("node_modules/prettier-plugin-tailwindcss", {
					upward = true,
					path = ctx.dirname,
					type = "directory",
				})[1]

				if hasTailwindPrettierPlugin then
					vim.list_extend(args, { "--plugin", "prettier-plugin-tailwindcss" })
				end

				return args
			end

			vim.api.nvim_create_autocmd("BufWritePre", {
				pattern = "*",
				callback = function(args)
					require("conform").format({
						bufnr = args.buf,
						lsp_fallback = true,
						quiet = true,
					})
				end,
			})
		end,
	},
}
