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

vim.opt.breakindent = true
-- Enable mouse mode, can be useful for resizing splits
vim.opt.mouse = "a"
vim.opt.cursorline = true

-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 5

-- Make line numbers default, or add relative line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- Highlight when yanking (copying) text
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

-- set tab formatting
vim.o.tabstop = 4
vim.o.expandtab = true
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
