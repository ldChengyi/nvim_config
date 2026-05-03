-- General UI plugins.
-- Configures the OneDark theme, devicons, lualine statusline,
-- notifications, noice command UI, and which-key shortcut hints.
return {
  -- 🎨 主题
  {
    "navarasu/onedark.nvim",
    priority = 1000,
    config = function()
      require("onedark").setup({
        style = "darker",
      })
      require("onedark").load()
    end,
  },

  -- 🔤 图标
  {
    "nvim-tree/nvim-web-devicons",
  },

  -- 📊 状态栏
  {
    "nvim-lualine/lualine.nvim",
    config = function()
      require("lualine").setup({
        options = {
          theme = "auto",
          section_separators = "",
          component_separators = "",
        },
      })
    end,
  },

  -- 🔔 右下角通知
  {
    "rcarriga/nvim-notify",
    config = function()
      vim.notify = require("notify")
      require("notify").setup({
        stages = "fade",
        timeout = 3000,
        background_colour = "#000000",
        render = "default",
      })
    end,
  },

  -- 🧠 noice：让 : 命令行显示在上方
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    },
    config = function()
      require("noice").setup({
        cmdline = {
          enabled = true,
          view = "cmdline_popup",
        },
        messages = {
          enabled = true,
        },
        notify = {
          enabled = true,
          view = "notify",
        },
        popupmenu = {
          enabled = true,
        },
      })
    end,
  },

  -- ⌨️ 快捷键提示：默认布局
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    config = function()
      require("which-key").setup()
    end,
  },
}
