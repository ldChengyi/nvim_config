-- Snacks.nvim - QoL 工具合集。
-- 仅启用与现有插件不冲突的模块。
return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,  -- snacks 不能 lazy-load
	---@type snacks.Config
	opts = {
		-- 启动页
		dashboard = { enabled = true },

		-- 缩进引导线 + 当前作用域高亮
		indent = {
			enabled = true,
			animate = {
				enabled = true,
				style = "out",   -- 从光标向外扩散
				easing = "linear",
				duration = { step = 20, total = 500 },
			},
		},

		-- 平滑滚动
		scroll = {
			enabled = true,
			animate = {
				duration = { step = 10, total = 200 },
				easing = "linear",
			},
		},

		-- 装了就忘:大文件自动降级,启动提速
		bigfile = { enabled = true },
		quickfile = { enabled = true },

		-- 以下与现有插件冲突,显式关闭:
		notifier = { enabled = false },  -- 你已有 noice
		picker = { enabled = false },    -- 你已有 telescope
		explorer = { enabled = false },  -- 你已有 nvim-tree
		terminal = { enabled = false },  -- 你已有 toggleterm
		input = { enabled = false },     -- 可选,noice 也接管 input,先关
		statuscolumn = { enabled = false },
		words = { enabled = false },
		scope = { enabled = false },
	},
}
