return {
	-- the colorscheme should be available when starting Neovim
	{
		"folke/tokyonight.nvim",
		lazy = false, -- make sure we load this during startup if it is your main colorscheme
		priority = 1000, -- make sure to load this before all the other start plugins
		config = function()
			-- load the colorscheme here
			vim.cmd([[colorscheme tokyonight]])
		end,
	},
	-- I have a separate config.mappings file where I require which-key.
	-- With lazy the plugin will be automatically loaded when it is required somewhere
	{ "folke/which-key.nvim", lazy = true },

	{
		"hrsh7th/nvim-cmp",
		-- load cmp on InsertEnter
		event = "InsertEnter",
		-- these dependencies will only be loaded when cmp loads
		-- dependencies are always lazy-loaded unless specified otherwise
		dependencies = {
			"hrsh7th/cmp-buffer", -- source for text in buffer
			"hrsh7th/cmp-path", -- source for file system paths
			"hrsh7th/cmp-nvim-lsp", -- LSP source
			"saadparwaiz1/cmp_luasnip", -- for autocompletion
			"L3MON4D3/LuaSnip", -- snippet engine
			"rafamadriz/friendly-snippets", -- useful snippets
			"onsails/lspkind.nvim", -- vs-code like pictograms
			"hrsh7th/cmp-cmdline"
		},
		config = function()
			-- ...
		end,
	},

	-- if some code requires a module from an unloaded plugin, it will be automatically loaded.
	-- So for api plugins like devicons, we can always set lazy=true
	{ "nvim-tree/nvim-web-devicons", lazy = true },

	-- you can use the VeryLazy event for things that can
	-- load later and are not important for the initial UI
	{ "stevearc/dressing.nvim", event = "VeryLazy" },

	{
		"Wansmer/treesj",
		keys = {
			{ "J", "<cmd>TSJToggle<cr>", desc = "Join Toggle" },
		},
		opts = { use_default_keymaps = false, max_join_length = 150 },
	},

	{
		"monaqa/dial.nvim",
		-- lazy-load on keys
		-- mode is `n` by default. For more advanced options, check the section on key mappings
		keys = { "<C-a>", { "<C-x>", mode = "n" } },
	},

	-- local plugins need to be explicitly configured with dir
	{ dir = "~/projects/secret.nvim" },

	-- you can use a custom url to fetch a plugin
	{ url = "git@github.com:folke/noice.nvim.git" },

	-- local plugins can also be configure with the dev option.
	-- This will use {config.dev.path}/noice.nvim/ instead of fetching it from Github
	-- With the dev option, you can easily switch between the local and installed version of a plugin
	{ "folke/noice.nvim", dev = true },

	{
		"nvim-tree/nvim-tree.lua",
		version = "*",
		lazy = true,
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},

	},

	{
		{ 
			'xeluxee/competitest.nvim',
			dependencies = 'MunifTanjim/nui.nvim',
			config = function() require('competitest').setup() end,
		}
	},

	{
		-- lazy
		{
			"sontungexpt/sttusline",
			dependencies = {
				"nvim-tree/nvim-web-devicons",
			},
			event = { "BufEnter" },
			config = function(_, opts)
				require("sttusline").setup {
					-- statusline_color = "#000000",
					statusline_color = "StatusLine",

					-- | 1 | 2 | 3
					-- recommended: 3
					laststatus = 3,
					disabled = {
						filetypes = {
							-- "NvimTree",
							-- "lazy",
						},
						buftypes = {
							-- "terminal",
						},
					},
					components = {
						"mode",
						"filename",
						"git-branch",
						"git-diff",
						"%=",
						"diagnostics",
						"lsps-formatters",
						"copilot",
						"indent",
						"encoding",
						"pos-cursor",
						"pos-cursor-progress",
					},
				}
			end,
		},
	},

	{'romgrk/barbar.nvim',
	dependencies = {
		'lewis6991/gitsigns.nvim', -- OPTIONAL: for git status
		'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
	},
	init = function() vim.g.barbar_auto_setup = false end,
	opts = {
		-- lazy.nvim will automatically call setup for you. put your options here, anything missing will use the default:
		-- animation = true,
		-- insert_at_start = true,
		-- …etc.
	},
	version = '^1.0.0', -- optional: only update when a new 1.x version is released
},
{
	'nvimdev/dashboard-nvim',
	event = 'VimEnter',
	config = function()
		require('dashboard').setup {
			-- config
		}
	end,
	dependencies = { {'nvim-tree/nvim-web-devicons'}},
	theme='hyper'
},
{
	{
		"christoomey/vim-system-copy"
	},
},
{

	"folke/todo-comments.nvim",
	dependencies = { "nvim-lua/plenary.nvim" },
	opts = {
		-- your configuration comes here
		-- or leave it empty to use the default settings
		-- refer to the configuration section below
	}


},
{
    'windwp/nvim-autopairs',
    config = true
    -- use opts = {} for passing setup options
    -- this is equalent to setup({}) function
},
{
	'tomasiser/vim-code-dark'
},
{
	'gkjgh/cobalt'
},
{
	'nvim-telescope/telescope.nvim',
	branch='0.1.x',
	dependencies = {
		'nvim-lua/plenary.nvim',
		{'nvim-telescope/telescope-fzf-native.nvim', build='make'},
		'nvim-tree/nvim-web-devicons',
	},
	config=function()
	end
},
{
	"stevearc/dressing.nvim",
	event="VeryLazy",
},


-- CMP


{
	"hrsh7th/nvim-cmp",
	event = "InsertEnter",
	dependencies = {
		"hrsh7th/cmp-buffer", -- source for text in buffer
		"hrsh7th/cmp-path", -- source for file system paths
		{
			"L3MON4D3/LuaSnip",
			-- follow latest release.
			version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
			-- install jsregexp (optional!).
			build = "make install_jsregexp",
		},
		"saadparwaiz1/cmp_luasnip", -- for autocompletion
		"rafamadriz/friendly-snippets", -- useful snippets
		"onsails/lspkind.nvim", -- vs-code like pictograms
		"hrsh7th/cmp-nvim-lsp-signature-help", -- Plugin for LSP signature help

	},
	config = function()
		local cmp = require("cmp")
		local luasnip = require("luasnip")
		local lspkind = require("lspkind")

		-- loads vscode style snippets from installed plugins (e.g. friendly-snippets)
		require("luasnip.loaders.from_vscode").lazy_load()

		cmp.setup({
			completion = {
				completeopt = "menu,menuone,preview,noselect",
			},
			snippet = { -- configure how nvim-cmp interacts with snippet engine
				expand = function(args)
					luasnip.lsp_expand(args.body)
				end,
			},
			mapping = cmp.mapping.preset.insert({
				["<C-k>"] = cmp.mapping.select_prev_item(), -- previous suggestion
				["<C-j>"] = cmp.mapping.select_next_item(), -- next suggestion
				["<C-b>"] = cmp.mapping.scroll_docs(-4),
				["<C-f>"] = cmp.mapping.scroll_docs(4),
				["<C-Space>"] = cmp.mapping.complete(), -- show completion suggestions
				["<C-e>"] = cmp.mapping.abort(), -- close completion window
				["<CR>"] = cmp.mapping.confirm({ select = false }),
			}),
			-- sources for autocompletion
			sources = cmp.config.sources({
				--{ name = "cmp_gl" },
				{ name = "nvim_lsp"},
				{ name = "vsnip"   },
				{ name = "compe"},
				{ name = "luasnip" }, -- snippets
				{ name = "buffer" }, -- text within current buffer
				{ name = "path" }, -- file system paths
				{ name = "nvim_lsp_signature_help" } 
			}),
			-- configure lspkind for vs-code like pictograms in completion menu
			formatting = {
				format = lspkind.cmp_format({
					maxwidth = 50,
					ellipsis_char = "...",
				}),
			},
		})
	end,
},


-- Mason bruh
--

{
	"williamboman/mason.nvim",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
	},
	config = function()
		-- import mason
		local mason = require("mason")

		-- import mason-lspconfig
		local mason_lspconfig = require("mason-lspconfig")

		local mason_tool_installer = require("mason-tool-installer")

		-- enable mason and configure icons
		mason.setup({
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
		})

		mason_lspconfig.setup({
			-- list of servers for mason to install
			ensure_installed = {
				--  "tsserver",
				"html",
				"cssls",
				--   "tailwindcss",
				"svelte",
				"lua_ls",
				--   "graphql",
				--  "emmet_ls",
				--   "prismals",
				"pyright",
				"clangd",
				"glsl_analyzer",
				"glslls"
			},
		})

		mason_tool_installer.setup({
			ensure_installed = {
				"prettier", -- prettier formatter
				"stylua", -- lua formatter
				"eslint_d",
				"cmakelint",
				"pylint",
				"flake8",
			},
		})
	end,

},

{
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		{ "antosha417/nvim-lsp-file-operations", config = true },
		{ "folke/neodev.nvim", opts = {} },
	},
	config = function()
		-- import lspconfig plugin
		local lspconfig = require("lspconfig")

		-- import mason_lspconfig plugin
		local mason_lspconfig = require("mason-lspconfig")

		-- import cmp-nvim-lsp plugin
		local cmp_nvim_lsp = require("cmp_nvim_lsp")

		local keymap = vim.keymap -- for conciseness
		local capabilities = cmp_nvim_lsp.default_capabilities(vim.lsp.protocol.make_client_capabilities())

		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("UserLspConfig", {}),
			callback = function(ev)
				-- Buffer local mappings.
				-- See `:help vim.lsp.*` for documentation on any of the below functions
				local opts = { buffer = ev.buf, silent = true }

				-- set keybinds
				opts.desc = "Show LSP references"
				keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts) -- show definition, references

				opts.desc = "Go to declaration"
				keymap.set("n", "gD", vim.lsp.buf.declaration, opts) -- go to declaration

				opts.desc = "Show LSP definitions"
				keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts) -- show lsp definitions

				opts.desc = "Show LSP implementations"
				keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts) -- show lsp implementations

				opts.desc = "Show LSP type definitions"
				keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts) -- show lsp type definitions

				opts.desc = "See available code actions"
				keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts) -- see available code actions, in visual mode will apply to selection

				opts.desc = "Smart rename"
				keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts) -- smart rename

				opts.desc = "Show buffer diagnostics"
				keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts) -- show  diagnostics for file

				opts.desc = "Show line diagnostics"
				keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts) -- show diagnostics for line

				opts.desc = "Go to previous diagnostic"
				keymap.set("n", "[d", vim.diagnostic.goto_prev, opts) -- jump to previous diagnostic in buffer

				opts.desc = "Go to next diagnostic"
				keymap.set("n", "]d", vim.diagnostic.goto_next, opts) -- jump to next diagnostic in buffer

				opts.desc = "Show documentation for what is under cursor"
				keymap.set("n", "K", vim.lsp.buf.hover, opts) -- show documentation for what is under cursor

				opts.desc = "Restart LSP"
				keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts) -- mapping to restart lsp if necessary
			end,
		})

		-- used to enable autocompletion (assign to every lsp server config)
		local capabilities = cmp_nvim_lsp.default_capabilities()

		-- Change the Diagnostic symbols in the sign column (gutter)
		-- (not in youtube nvim video)
		local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
		for type, icon in pairs(signs) do
			local hl = "DiagnosticSign" .. type
			vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
		end

		mason_lspconfig.setup_handlers({
			-- default handler for installed servers
			function(server_name)
				lspconfig[server_name].setup({
					capabilities = capabilities,
				})
			end,
			["svelte"] = function()
				-- configure svelte server
				lspconfig["svelte"].setup({
					capabilities = capabilities,
					on_attach = function(client, bufnr)
						vim.api.nvim_create_autocmd("BufWritePost", {
							pattern = { "*.js", "*.ts" },
							callback = function(ctx)
								-- Here use ctx.match instead of ctx.file
								client.notify("$/onDidChangeTsOrJsFile", { uri = ctx.match })
							end,
						})
					end,
				})
			end,
			["graphql"] = function()
				-- configure graphql language server
				lspconfig["graphql"].setup({
					capabilities = capabilities,
					filetypes = { "graphql", "gql", "svelte", "typescriptreact", "javascriptreact" },
				})
			end,
			["clangd"] = function()
				-- configure graphql language server
				lspconfig["clangd"].setup({
					capabilities = capabilities,
					filetypes = { "cpp","c" },

					cmd = {

						"clangd",
						"--background-index",
						"--suggest-missing-includes",
						"--clang-tidy",
					},
				})
			end, 
			["emmet_ls"] = function()
				-- configure emmet language server
				lspconfig["emmet_ls"].setup({
					capabilities = capabilities,
					filetypes = { "html", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less", "svelte" },
				})
			end,
			["lua_ls"] = function()
				-- configure lua server (with special settings)
				lspconfig["lua_ls"].setup({
					capabilities = capabilities,
					settings = {
						Lua = {
							-- make the language server recognize "vim" global
							diagnostics = {
								globals = { "vim" },
							},
							completion = {
								callSnippet = "Replace",
							},
						},
					},
				})
			end,
		})
	end,
},
{

	"L3MON4D3/LuaSnip",
	-- follow latest release.
	tag = "v2.3.0", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
	-- install jsregexp (optional!:).
	run = "make install_jsregexp"
},
{
	'navarasu/onedark.nvim'
},
{
	'vurentjie/cmp-gl'
},
{
	"ray-x/lsp_signature.nvim",
	event = "VeryLazy",
	opts = {},
	config = function(_, opts) require'lsp_signature'.setup(opts) end
},
{
	'nvim-lua/plenary.nvim'
},
{
	'stevearc/overseer.nvim',
	opts = {},
},
{
	-- amongst your other plugins
	{'akinsho/toggleterm.nvim', version = "*", opts= {

		start_in_insert = true,  }
	}
	-- or
},
{
	'Civitasv/cmake-tools.nvim'
},
{
	'tikhomirov/vim-glsl'
},
{
	'equalsraf/neovim-gui-shim'
},
{
	'tenxsoydev/size-matters.nvim'
},
{
	'petertriho/nvim-scrollbar'
},
{
	'akinsho/bufferline.nvim'
},
{ "bluz71/vim-moonfly-colors", name = "moonfly", lazy = false, priority = 1000 },
{ "bluz71/vim-nightfly-colors", name = "nightfly", lazy = false, priority = 1000 },

{
	'mcchrish/vim-no-color-collections'
},
{
	'zenbones-theme/zenbones.nvim'
},
{
	'dzfrias/noir.nvim'
},
{

'nvim-treesitter/nvim-treesitter'
},
{
"mellow-theme/mellow.nvim"
},
}

