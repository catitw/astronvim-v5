set shell := ["bash", "-c"]

# List all the just commands
default:
    @just --list

# -------------------------- Nix --------------------------

# Nix develop
[group('nix')]
develop flake=".#default":
  nix develop {{flake}}

# Update all the flake inputs
[group('nix')]
up:
  nix flake update --commit-lock-file

# ------------------------ Plugin --------------------------

# `:Lazy check`, to check for plugin updates
[group('plugin')]
lazy-check:
  nvim -c "lua require('lazy').check()"

# `:Lazy update`, to update plugins
[group('plugin')]
lazy-update:
  nvim -c "lua require('lazy').update()"

# `:Lazy sync`, to sync and clean plugins
[group('plugin')]
lazy-sync:
  nvim -c "lua require('lazy').sync()"

# `:AstroUpdate`, to update both Neovim plugins and Mason packages
[group('plugin')]
astro-update:
  nvim -c "AstroUpdate"

# ------------------------ Neovim --------------------------

[group('nvim')]
clear-nvim-cache:
  rm -rf ~/.local/share/nvim
  rm -rf ~/.local/state/nvim
  rm -rf ~/.cache/nvim
