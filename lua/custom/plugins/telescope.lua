return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "kkharji/sqlite.lua",
  },
  config = function()
    require "custom.telescope"
  end,
}
