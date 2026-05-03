-- Custom keymaps.
-- This file defines your leader key and shortcuts for editing, buffers,
-- windows, terminal splits, search highlighting, and plugin actions.
vim.g.mapleader = " "

local keymap = vim.keymap

-- ---------- 插入模式 ---------- ---
keymap.set("i", "jk", "<ESC>")

-- ---------- 视觉模式 ---------- ---
-- 单行或多行移动
keymap.set("v", "J", ":m '>+1<CR>gv=gv")
keymap.set("v", "K", ":m '<-2<CR>gv=gv")


-- 视觉模式粘贴不污染寄存器
keymap.set("v", "p", '"_dp')

-- ---------- 正常模式 ---------- ---
-- 在终端中按 Esc 自动退出终端模式
keymap.set('t', 'jk', [[<C-\><C-n>]], { noremap = true })

-- 删除不影响复制
keymap.set({"n", "v"}, "<leader>dd", '"_d', {desc = "delete without yank"})


-- 取消高亮
keymap.set("n", "<leader>nh", ":nohl<CR>")

-- 切换buffer
keymap.set("n", "<A-L>", ":bnext<CR>")
keymap.set("n", "<A-H>", ":bprevious<CR>")

-- 打开终端
keymap.set("n","<leader>tv", function()
    vim.cmd("vsplit | terminal")
end, {desc = "Teminal Vertical"})

-- 垂直打开终端（在右侧）
keymap.set("n", "<leader>th", function()
  vim.cmd("split | terminal")
end, { desc = "Terminal Horizontal" })

-- ---------- 插件 ---------- ---
-- nvim-tree

keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>")



-- 切换屏幕 --
vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-l>", "<C-w>l")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")

-- 切换到行头行尾 --
vim.keymap.set({ "n", "x", "o" }, "<S-H>", "^", { desc = "Start of line" })
vim.keymap.set({ "n", "x", "o" }, "<S-L>", "$", { desc = "End of line" })


