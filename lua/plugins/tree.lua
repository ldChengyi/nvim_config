-- File explorer plugin.
-- nvim-tree provides a project file tree and <leader>e toggles it.
return {
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require("nvim-tree").setup()

      vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", {
        desc = "Toggle File Tree",
      })
    end,
  },
}
