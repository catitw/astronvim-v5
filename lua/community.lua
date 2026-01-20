-- AstroCommunity: import any community modules here
-- We import this file in `lazy_setup.lua` before the `plugins/` folder.
-- This guarantees that the specs are processed before any user plugins.

local community = {
  colorscheme = {
    catppuccin = {},
  },
  ["editing-support"] = {
    ["suda-vim"] = {},
  },
  ["fuzzy-finder"] = {
    ["fzf-lua"] = {},
    ["namu-nvim"] = {},
  },
  pack = {
    bash = {},
    cmake = {},
    cpp = {},
    docker = {},
    fish = {},
    go = {},
    ["html-css"] = {},
    hyprlang = {},
    java = {},
    jj = {},
    json = {},
    just = {},
    kotlin = {},
    lua = {},
    markdown = {},
    moonbit = {},
    nginx = {},
    nix = {},
    nushell = {},
    prettier = {},
    python = {},
    ["rainbow-delimiter-indent-blankline"] = {},
    rust = {},
    ["spring-boot"] = {},
    sql = {},
    tailwindcss = {},
    typescript = {},
    typst = {},
    verilog = {},
    vue = {},
    wgsl = {},
    xml = {},
    yaml = {},
    zig = {},
  },
  motion = {
    ["flash-nvim"] = {
      -- `s` to enter flash mode
    },
    ["mini-move"] = {
      -- alt + hjkl to move selection
    },
  },
  recipes = {
    ["astrolsp-no-insert-inlay-hints"] = {},
    ["auto-session-restore"] = {},
    ["heirline-clock-statusline"] = {},
    ["heirline-mode-text-statusline"] = {},
    ["heirline-tabline-buffer-number"] = {},
    neovide = {},
  },
  scrolling = {
    ["mini-animate"] = {},
  },
  startup = {
    ["mini-starter"] = {},
  },
  ["terminal-integration"] = {
    ["flatten-nvim"] = {},
  },
  utility = {
    ["live-preview"] = {},
    ["nvzone-menu"] = {},
  },
}

---Convert community table to LazySpec format (supports arbitrary nesting levels)
---@param community_table table The community configuration table
---@return LazySpec spec The formatted LazySpec
local function to_lazy_spec(community_table)
  local spec = { "AstroNvim/astrocommunity" }

  ---Recursively traverse the community table and build import specs
  ---@param tbl table The current level of the community table
  ---@param path string The accumulated path for the current level
  local function traverse(tbl, path)
    for key, value in pairs(tbl) do
      local current_path = path .. "." .. key
      if type(value) == "table" and next(value) ~= nil then
        -- Non-empty table: nested node, continue traversing
        traverse(value, current_path)
      else
        -- Empty table or non-table value: leaf node, create the import spec
        table.insert(spec, { import = current_path })
      end
    end
  end

  traverse(community_table, "astrocommunity")
  return spec
end

---@type LazySpec
return to_lazy_spec(community)
