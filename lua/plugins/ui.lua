-- General UI plugins.
-- Configures the OneDark theme, devicons, lualine statusline,
-- notifications, noice command UI, and which-key shortcut hints.
return {
  -- 🎨 主题
	{
	  "navarasu/onedark.nvim",
	  priority = 1000,
	  config = function()
		require("onedark").setup({
		  style = "cool",
		  transparent = true,
		  lualine = {
			transparent = true,
		  },
		  colors = {
			fg   = "#cdd3df", -- 普通文字基色，往白调
			grey = "#8b95a7", -- 注释/次要文字，往白调
		  },
		  highlights = {
			Comment      = { fg = "#abb2bf" },
			["@comment"] = { fg = "#abb2bf" }, -- 注释提亮
		  },
		})
		require("onedark").load() -- 放最后，触发上面的 autocmd
	  end,
	},

}
