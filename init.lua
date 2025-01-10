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
require("mason-lspconfig").setup {
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
}


-- choose color
-- vim.o.background = "light" -- or "light" for light mode on 'gruvbox'
-- vim.cmd.colorscheme "gruvbox"
vim.cmd.colorscheme "catppuccin-frappe" -- catppuccin-latte, catppuccin-frappe, catppuccin-macchiato, catppuccin-mocha
-- vim.cmd.colorscheme "dayfox" -- dayfox, dawnfox, nightfox, nordfox, duskfox


-- set hotkeys for telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })

vim.g.have_nerd_font = true
vim.opt.breakindent = true
-- Enable mouse mode, can be useful for resizing splits
vim.opt.mouse = 'a'
vim.opt.cursorline = true

-- Make line numbers default, or add relative line numbers
vim.opt.number = true
-- vim.opt.relativenumber = true


-- Highlight when yanking (copying) text
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

vim.o.tabstop = 4
vim.o.expandtab = true
vim.o.softtabstop = 4
vim.o.shiftwidth = 4





