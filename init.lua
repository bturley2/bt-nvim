require("config.lazy")
require("mason").setup()
require("mason-lspconfig").setup {
	-- this step INSTALLS the following language servers
	ensure_installed = {
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
	},
	automatic_installation = true,
}

-- this step STARTS the following language servers on localhost
require("lspconfig").bashls.setup {}
require("lspconfig").clangd.setup {}
require("lspconfig").gopls.setup {}
require("lspconfig").jsonls.setup {}
require("lspconfig").lua_ls.setup {}
require("lspconfig").marksman.setup {}
require("lspconfig").pyright.setup {}
require("lspconfig").sqls.setup {}
require("lspconfig").taplo.setup {}
require("lspconfig").rust_analyzer.setup {}
require("lspconfig").yamlls.setup {}


-- set hotkeys for telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })

