-- Automatic bracket and quote pairing.
-- nvim-autopairs inserts matching pairs while typing in insert mode.
return {
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = function()
      require("nvim-autopairs").setup()
    end,
  },
}
