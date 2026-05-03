-- Command-line and notification UI.
-- noice.nvim improves command messages, popup menus, and routes notifications
-- through nvim-notify in the lower-right corner.
return {
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    },
    config = function()
      -- 让 notify 作为默认提示（右下角小框）
      vim.notify = require("notify")

      require("notify").setup({
        stages = "fade",
        timeout = 3000,
        background_colour = "#000000",
        render = "default",
      })

      require("noice").setup({
        -- ⭐ 命令行在上方
        cmdline = {
          enabled = true,
          view = "cmdline_popup",
        },

        -- 消息系统
        messages = {
          enabled = true,
        },

        -- 使用 notify（右下角提示）
        notify = {
          enabled = true,
          view = "notify",
        },

        -- 补全 UI
        popupmenu = {
          enabled = true,
        },

        -- 🔥 过滤烦人的提示（重点）
        routes = {
        },
      })
    end,
  },
}
