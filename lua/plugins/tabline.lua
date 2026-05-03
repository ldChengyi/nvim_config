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
      require("bufferline").setup({
        options = {
          mode = "buffers",
          separator_style = "thin",
          always_show_bufferline = true,
          offsets = {
            {
              filetype = "NvimTree",
              text = "File Explorer",
              text_align = "center",
              separator = true,
            },
          },
        },
      })

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
