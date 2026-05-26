return {
	"nvim-treesitter/nvim-treesitter-context",
	dependencies = { "nvim-treesitter/nvim-treesitter" },
	lazy = false,  -- 改成不懒加载
	config = function()
		require("treesitter-context").setup({
			enable = true,
			max_lines = 3,
			min_window_height = 0,   -- 先设 0,排除窗口高度因素
			line_numbers = true,
			trim_scope = "outer",
			mode = "cursor",
		})
	end,
}
