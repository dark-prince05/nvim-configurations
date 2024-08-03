return {
	{
		"folke/tokyonight.nvim",
		priority = 1000, -- make sure to load this before all the other start plugins
		config = function()
			require("tokyonight").setup({
				style = "night",
				transparent = true,
				terminal_colors = true,
				styles = {
					sidebars = "transparent",
					floats = "transparent",
				},
				on_highlights = function(hl, c)
					-- Customize line number colors to white
					hl.LineNr = { fg = "#FFFFFF" }
					hl.CursorLineNr = { fg = "#FFFFFF" }
					hl.LineNrAbove = { fg = "#FFFFFF" }
					hl.LineNrBelow = { fg = "#FFFFFF" }
					-- Customize comments color to white
					hl.Comment = { fg = "#6f6ded", italic = true }
				end,
			})
			-- load the colorscheme here
			vim.cmd([[colorscheme tokyonight]])
		end,
	},
}
