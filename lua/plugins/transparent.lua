-- Transparent background.
-- Clears background colors so the terminal background shows through.
return {
	"xiyaowong/transparent.nvim",
	lazy = false,  -- 重要:不能 lazy-load
	priority = 999,  -- 在主题(1000)之后加载
	config = function()
		require("transparent").setup({
			extra_groups = {
				"NormalFloat",     -- Lazy / Mason / LspInfo 等浮动面板
				"NvimTreeNormal",  -- 文件树
				"NvimTreeNormalNC",
                "TabLine",       -- 新增
		        "TabLineFill",   -- 新增 
		        "TabLineSel",    -- 新增
			},
		})

		-- 清除动态生成的高亮组(图标等)
		require("transparent").clear_prefix("lualine")
		require("transparent").clear_prefix("NvimTree")

        -- render-markdown 是 ft 懒加载的,打开 md 文件后才注册高亮组,
		-- 所以挂一个 FileType 事件,在它加载后补清一次
		vim.api.nvim_create_autocmd("FileType", {
			pattern = "markdown",
			callback = function()
				require("transparent").clear_prefix("RenderMarkdown")
			end,
		})
	end,
}
