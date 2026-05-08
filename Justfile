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

# `:AstroUpdate`, to update both Neovim plugins and Mason packages
[group('plugin')]
astro-update:
  nvim -c "AstroUpdate"


# `:Lazy sync`, to sync and clean plugins
[group('plugin')]
lazy-sync:
  nvim -c "lua require('lazy').sync()"

# ------------------------ Neovim --------------------------

[group('nvim')]
clear-nvim-cache:
  rm -rf ~/.local/share/nvim
  rm -rf ~/.local/state/nvim
  rm -rf ~/.cache/nvim
