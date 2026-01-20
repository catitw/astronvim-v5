# AstroNvim Config

**NOTE:** This is for AstroNvim v5+

Getting started with [AstroNvim](https://github.com/AstroNvim/AstroNvim)

## 🛠️ Installation

clone the repository:

```shell
git clone https://github.com/catitw/astronvim-v5.git ~/.config/nvim
```

## Notes

### Configure AstroNvim Plugins

> see aslo [Astronvim Documentation](https://docs.astronvim.com/configuration/customizing_plugins)

- extend the `table`:

  ```lua
  {
    "AstroNvim/astrocore",
    ---@type AstroCoreOpts
    opts = { -- extend the plugin options
      diagnostics = {
        -- disable diagnostics virtual text
        virtual_text = false,
      },
    },
  },
  ```

- extend the `list`:

  ```lua
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      -- list like portions of a table cannot be merged naturally and require the user to merge it manually
      -- check to make sure the key exists
      if not opts.ensure_installed then
        opts.ensure_installed = {}
      end
      vim.list_extend(opts.ensure_installed, {
        "lua",
        "vim",
        -- add more arguments for adding more treesitter parsers
      })
    end,
  },
  ```

### Disable plugin

```lua
return {
  { "max397574/better-escape.nvim", enabled = false },
}
```
