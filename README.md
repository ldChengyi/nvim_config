# Neovim Config

Personal Neovim configuration using Lua and lazy.nvim.

## Structure

- `init.lua` loads the core settings and plugin setup.
- `lua/core/options.lua` contains editor options.
- `lua/core/keymaps.lua` contains custom keymaps.
- `lua/config/lazy.lua` bootstraps and configures lazy.nvim.
- `lua/plugins/` contains plugin specs and plugin-specific settings.

## Install

Clone this repo as your Neovim config:

```sh
git clone <your-repo-url> ~/.config/nvim
```

Open Neovim and lazy.nvim will install the configured plugins.
