-- Buffer tabline.
-- bufferline displays open buffers as tabs, integrates with nvim-tree,
-- and adds shortcuts for switching and closing buffers.
return {
	{
		"akinsho/bufferline.nvim",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		config = function()
			local accent = "#66ccff" -- 高亮色:激活标签 / File Explorer
			local fg     = "#d8dee9" -- 普通文字
			local dim    = "#6c7a96" -- 未选中标签文字(压暗)

			require("bufferline").setup({
				highlights = {
					-- 填充区与未选中标签:透明背景
					fill               = { bg = "none" },
					background         = { bg = "none", fg = dim },
					buffer_visible     = { bg = "none", fg = fg },
					-- 激活的 buffer 标签:亮蓝文字
					buffer_selected    = { bg = "none", fg = accent, bold = true },
					-- 分隔线
					separator          = { bg = "none", fg = "none" },
					separator_visible  = { bg = "none", fg = "none" },
					separator_selected = { bg = "none", fg = accent },
					-- 关闭按钮
					close_button          = { bg = "none", fg = dim },
					close_button_visible  = { bg = "none", fg = fg },
					close_button_selected = { bg = "none", fg = accent },
					-- 激活指示条
					indicator_selected = { bg = "none", fg = accent },
					indicator_visible  = { bg = "none", fg = "none" },
					-- 修改标记
					modified           = { bg = "none", fg = dim },
					modified_visible   = { bg = "none", fg = fg },
					modified_selected  = { bg = "none", fg = accent },
					-- 左侧 offset 区分隔线
					offset_separator   = { bg = "none", fg = accent },
				},
				options = {
					mode = "buffers",
					separator_style = "thin",
					always_show_bufferline = true,
					indicator = {
						style = "none", -- 不要任何指示符(下划线/竖条)
					},
					offsets = {
						{
							filetype = "NvimTree",
							text = "File Explorer",
							text_align = "center",
							separator = true,
							highlight = "BufferLineOffsetText", -- 指向下方自定义组
						},
					},
				},
			})

			-- 左侧 File Explorer 标题:亮蓝文字 + 透明背景
			local function set_offset_hl()
				vim.api.nvim_set_hl(0, "BufferLineOffsetText", {
					fg = accent,
					bg = "none",
					bold = true,
				})
			end
			set_offset_hl()
			-- 切换 colorscheme 后重新应用,防止被重置
			vim.api.nvim_create_autocmd("ColorScheme", {
				callback = set_offset_hl,
			})

			-- 缓冲区切换 / 关闭快捷键
			vim.keymap.set("n", "<Tab>", "<Cmd>BufferLineCycleNext<CR>", { desc = "Next Buffer" })
			vim.keymap.set("n", "<S-Tab>", "<Cmd>BufferLineCyclePrev<CR>", { desc = "Previous Buffer" })

			vim.keymap.set("n", "<leader>bd", function()
				local current = vim.api.nvim_get_current_buf()
				vim.cmd("bprevious")
				vim.cmd("bdelete " .. current)
			end, { desc = "Close Buffer" })
		end,
	},
}
