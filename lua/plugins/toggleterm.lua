return {
  "akinsho/toggleterm.nvim",
  version = "*",

  opts = {
    open_mapping = [[<C-\>]],
    direction = "float",
    start_in_insert = true,
    persist_mode = true,
    persist_size = true,
  },

  config = function(_, opts)
    require("toggleterm").setup(opts)

    -- terminal 内用 Esc 退出
    vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]], { desc = "Exit terminal mode" })

    -- 👉 重点：你的快捷键
    vim.keymap.set("n", "<leader>t1", "<cmd>ToggleTerm 1<CR>", { desc = "Terminal 1" })
    vim.keymap.set("n", "<leader>t2", "<cmd>ToggleTerm 2<CR>", { desc = "Terminal 2" })
    vim.keymap.set("n", "<leader>t3", "<cmd>ToggleTerm 3<CR>", { desc = "Terminal 3" })
  end,
}
