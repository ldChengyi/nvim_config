vim.g.clipboard = {
  name = "OSC 52",                              -- 名字，随便起，方便你看 :checkhealth 时识别
  copy = {                                       -- 写剪贴板的方法
    ["+"] = require("vim.ui.clipboard.osc52").copy("+"),   -- 写 + 寄存器时调这个
    ["*"] = require("vim.ui.clipboard.osc52").copy("*"),   -- 写 * 寄存器时调这个
  },
  paste = {                                      -- 读剪贴板的方法
    ["+"] = require("vim.ui.clipboard.osc52").paste("+"),
    ["*"] = require("vim.ui.clipboard.osc52").paste("*"),
  },
}
