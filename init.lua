require("config.lazy")

local supported_languages = {
	"bashls",
	"clangd",
	"gopls",
	-- "harper_ls", -- provides grammar support, faster alternative to grammarly
	-- "java_language_server",
	"jsonls",
	"lua_ls",
	"marksman",
	"pyright",
	"sqls",
	"taplo", -- toml
	"rust_analyzer",
	"yamlls",
}

require("mason").setup()
require("mason-lspconfig").setup({
	-- this step INSTALLS the following language servers
	ensure_installed = supported_languages,
	automatic_installation = true,
	-- this step STARTS each language server on localhost
	handlers = {
		function(server_name)
			local server = supported_languages[server_name] or {}
			require("lspconfig")[server_name].setup(server)
		end,
	},
})

-- configure autocompletion using 'cmp' to provide 'luasnip' suggestions
require("cmp").setup({
	-- REQUIRED - you must specify a snippet engine
	snippet = {
		expand = function(args)
			require("luasnip").lsp_expand(args.body)
		end,
	},
	window = {
		-- completion = cmp.config.window.bordered(),
		-- documentation = cmp.config.window.bordered(),
	},
	mapping = require("cmp").mapping.preset.insert({
		["<C-b>"] = require("cmp").mapping.scroll_docs(-4),
		["<C-f>"] = require("cmp").mapping.scroll_docs(4),
		["<C-Space>"] = require("cmp").mapping.complete(),
		["<C-e>"] = require("cmp").mapping.abort(),
		["<CR>"] = require("cmp").mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
	}),
	sources = require("cmp").config.sources({
		{ name = "nvim_lsp" },
		{ name = "luasnip" }, -- For luasnip users.
	}, {
		{ name = "buffer" },
	}),
})

-- add support for 'vim' syntax commands to the lua LSP
require("lspconfig").lua_ls.setup({
	on_init = function(client)
		local path = client.workspace_folders[1].name
		if vim.loop.fs_stat(path .. "/.luarc.json") or vim.loop.fs_stat(path .. "/.luarc.jsonc") then
			return
		end

		client.config.settings.Lua = vim.tbl_deep_extend("force", client.config.settings.Lua, {
			runtime = {
				-- Tell the language server which version of Lua you're using
				-- (most likely LuaJIT in the case of Neovim)
				version = "LuaJIT",
			},
			-- Make the server aware of Neovim runtime files
			workspace = {
				checkThirdParty = false,
				library = {
					vim.env.VIMRUNTIME,
					-- Depending on the usage, you might want to add additional paths here.
					-- "${3rd}/luv/library"
					-- "${3rd}/busted/library",
				},
				-- or pull in all of 'runtimepath'. NOTE: this is a lot slower
				-- library = vim.api.nvim_get_runtime_file("", true)
			},
		})
	end,
	settings = {
		Lua = {},
	},
})

-- initialize indentation marking
require("ibl").setup()

-- format on save for the specified languages
require("conform").setup({
	formatters_by_ft = {
		-- select the formatters by filetype
		-- You can customize some of the format options for the filetype (:help conform.format)
		lua = { "stylua" },
		python = { "isort", "black" },
		rust = { "rustfmt", lsp_format = "fallback" },
		-- Conform will run the first available formatter
		c = { "clang-format" },
		go = { "gofmt" },
		markdown = { "markdownfmt" },
	},
	format_on_save = {
		-- These options will be passed to conform.format()
		timeout_ms = 500,
		lsp_format = "fallback",
	},
})

-- choose color
-- vim.o.background = "light" -- or "light" for light mode on 'gruvbox'
-- vim.cmd.colorscheme "gruvbox"
vim.cmd.colorscheme("catppuccin-frappe") -- catppuccin-latte, catppuccin-frappe, catppuccin-macchiato, catppuccin-mocha
-- vim.cmd.colorscheme "dayfox" -- dayfox, dawnfox, nightfox, nordfox, duskfox

-- set hotkeys for telescope
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Telescope find files" })
vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Telescope live grep" })
vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Telescope buffers" })
vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Telescope help tags" })

vim.g.have_nerd_font = true
vim.opt.breakindent = true
-- Enable mouse mode, can be useful for resizing splits
vim.opt.mouse = "a"
vim.opt.cursorline = true

-- Make line numbers default, or add relative line numbers
vim.opt.number = true
-- vim.opt.relativenumber = true

-- Highlight when yanking (copying) text
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

vim.o.tabstop = 4
vim.o.expandtab = true
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
