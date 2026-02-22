if not vim.g.neovide then return {} end

return {
  "AstroNvim/astrocore",
  ---@type AstroCoreOpts
  opts = {
    options = {
      opt = {
        -- https://docs.astronvim.com/recipes/neovide/#_top
        guifont = "Maple Mono NF CN",
        linespace = 0,
      },

      g = {
        neovide_refresh_rate = 240,
        neovide_refresh_rate_idle = 5,

        neovide_cursor_vfx_mode = "torpedo",

        -- configure scaling
        neovide_scale_factor = 1.0,
        -- configure padding
        neovide_padding_top = 0,
        neovide_padding_bottom = 0,
        neovide_padding_right = 0,
        neovide_padding_left = 0,
      },
    },
  },
}
