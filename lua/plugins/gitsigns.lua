-- Git integration: 行号旁显示增删改标记,hunk 跳转与预览。
return {
	"lewis6991/gitsigns.nvim",
	event = { "BufReadPre", "BufNewFile" },
	opts = {
		signs = {
			add          = { text = "▎" },
			change       = { text = "▎" },
			delete       = { text = "" },
			topdelete    = { text = "" },
			changedelete = { text = "▎" },
			untracked    = { text = "▎" },
		},
		current_line_blame = false, -- 想要行内 blame 改成 true
		current_line_blame_opts = {
			delay = 500,
			virt_text_pos = "eol",
		},
		on_attach = function(bufnr)
			local gs = require("gitsigns")
			local function map(mode, l, r, desc)
				vim.keymap.set(mode, l, r, { buffer = bufnr, desc = desc })
			end
			-- hunk 跳转
			map("n", "]c", function() gs.nav_hunk("next") end, "Next Hunk")
			map("n", "[c", function() gs.nav_hunk("prev") end, "Prev Hunk")
			-- hunk 操作
			map("n", "<leader>hp", gs.preview_hunk, "Preview Hunk")
			map("n", "<leader>hs", gs.stage_hunk, "Stage Hunk")
			map("n", "<leader>hr", gs.reset_hunk, "Reset Hunk")
			map("n", "<leader>hb", function() gs.blame_line({ full = true }) end, "Blame Line")
			map("n", "<leader>hd", gs.diffthis, "Diff This")
			map("n", "<leader>hB", gs.toggle_current_line_blame, "Toggle Line Blame")
		end,
	},
}
