-- Fast cursor jumping.
-- flash.nvim lets you jump to visible text with "s" and use Treesitter-aware
-- structural jumps with "S".
return {
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    config = function()
      require("flash").setup()

      -- 推荐键位（覆盖 s）
      vim.keymap.set({ "n", "x", "o" }, "s", function()
        require("flash").jump()
      end, { desc = "Flash Jump" })

      vim.keymap.set({ "n", "x", "o" }, "S", function()
        require("flash").treesitter()
      end, { desc = "Flash Treesitter" })
    end,
  },
}
