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

				tsserver = {
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
						{ silent = true, desc = "Code Declaraction" }
					)
					vim.keymap.set(
						"n",
						"gT",
						vim.lsp.buf.type_definition,
						{ buffer = 0, desc = "Code type Definition" }
					)
					vim.keymap.set("n", "gh", vim.lsp.buf.hover, { buffer = 0, desc = "Code Hover" })

					vim.keymap.set("n", ",cr", vim.lsp.buf.rename, { buffer = 0, desc = "Code rename" })
					vim.keymap.set("n", ",ca", vim.lsp.buf.code_action, { buffer = 0, desc = "Code Action" })

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
					javascript = { "prettier" },
				},
			})

			vim.api.nvim_create_autocmd("BufWritePre", {
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
