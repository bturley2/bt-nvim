return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function () 
      local configs = require("nvim-treesitter.configs")

      configs.setup({
          ensure_installed = { 
				"c",
				"cpp",
				"go",
				"html",
				"java",
				"json",
				"lua",
				"markdown",
				"python",
				"query",
				"rust",
				"sql",
				"terraform",
				"toml", 
				"vim",
				"vimdoc",
				"yaml",
			},
          sync_install = false,
          highlight = { enable = true },
          indent = { enable = true },  
        })
    end
 }
