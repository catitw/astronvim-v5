# AstroNvim Template

**NOTE:** This is for AstroNvim v6+

A template for getting started with [AstroNvim](https://github.com/AstroNvim/AstroNvim)

## 🛠️ Installation

#### Make a backup of your current nvim and shared folder

```shell
mv ~/.config/nvim ~/.config/nvim.bak
mv ~/.local/share/nvim ~/.local/share/nvim.bak
mv ~/.local/state/nvim ~/.local/state/nvim.bak
mv ~/.cache/nvim ~/.cache/nvim.bak
```

#### Clone the repository

```shell
git clone https://github.com/catitw/astronvim-conf.git ~/.config/nvim
```

#### Start Neovim

```shell
nvim
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

### Frequently Used Lua apis

#### Show messages

```nvim
:messages
```
