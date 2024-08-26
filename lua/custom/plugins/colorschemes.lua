return {
  {
    "tjdevries/colorbuddy.nvim",
    config = function()
      vim.cmd.colorscheme "gruvbuddy"

      local bg = "#222222"
      vim.api.nvim_set_hl(0, "Normal", { bg = bg, fg = "#dddddd" })
      vim.api.nvim_set_hl(0, "ColorColumn", { bg = "#303030" })
      vim.api.nvim_set_hl(0, "LineNr", { bg = bg })
      vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#181818" })
      vim.api.nvim_set_hl(0, "DiagnosticUnnecessary", { link = "DiagnosticUnnecessary" })
    end,
  },
  {
    "folke/tokyonight.nvim",
    lazy = false,
    config = function()
      --vim.cmd.colorscheme "tokyonight-night"
      --vim.api.nvim_set_hl(0, "DiagnosticUnnecessary", { link = "DiagnosticUnnecessary" })
    end
  }
}
