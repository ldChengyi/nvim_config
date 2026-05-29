return {
  -- ⌨️ 快捷键提示：默认布局
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    config = function()
      require("which-key").setup({
        preset = "helix",    
        })
    end,
  },

}
