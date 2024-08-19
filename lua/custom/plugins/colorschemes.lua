return {
  {
    "tjdevries/colorbuddy.nvim",
    config = function()
      vim.cmd.colorscheme "gruvbuddy"

      local bg = "#222222"
      vim.api.nvim_set_hl(0, "Normal", { bg = bg })
      vim.api.nvim_set_hl(0, "ColorColumn", { bg = "#303030" })
      vim.api.nvim_set_hl(0, "LineNr", { bg = bg })
    end,
  },
}
