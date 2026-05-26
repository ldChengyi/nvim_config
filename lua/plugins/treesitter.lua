-- Syntax parsing and highlighting.
-- Treesitter installs parsers for your common languages and enables better
-- highlighting and indentation than regex-based syntax files.
return {
  {
      "nvim-treesitter/nvim-treesitter",
      build = ":TSUpdate",
      config = function ()
        local configs = require("nvim-treesitter.configs")

        configs.setup({
          ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "elixir", "heex", "javascript", "typescript", "tsx", "json", "css", "html", "rust", "go", "markdown", "markdown_inline" },
          sync_install = false,
          highlight = { enable = true },
          indent = { enable = true },
        })
    end
 }
}
