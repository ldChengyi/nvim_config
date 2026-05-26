-- conform.nvim: 代码格式化。
return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	cmd = { "ConformInfo" },
	opts = {
		-- 各语言用的格式化工具,需先在系统装好对应工具
		formatters_by_ft = {
			lua = { "stylua" },
			python = { "black" },
			javascript = { "prettier" },
			typescript = { "prettier" },
			json = { "prettier" },
			html = { "prettier" },
			css = { "prettier" },
			markdown = { "prettier" },
			-- 其他语言按需添加
		},
		formatters = {
			prettier = {
				prepend_args = { "--use-tabs", "--tab-width", "4" },
			},
			stylua = {
				prepend_args = { "--indent-type", "Tabs", "--indent-width", "4" },
			},
		},
		-- 保存时自动格式化
		format_on_save = {
			timeout_ms = 1000,
			lsp_format = "fallback", -- 没有对应 formatter 时退回 LSP 格式化
		},
	},
	keys = {
		{
			"<leader>fmt",
			function()
				require("conform").format({ async = true, lsp_format = "fallback" })
			end,
			mode = { "n", "v" },
			desc = "Format Buffer",
		},
	},
}
