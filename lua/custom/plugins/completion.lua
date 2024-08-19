return {
  {
    "hrsh7th/nvim-cmp",
    lazy = false,
    priority = 100,
    dependencies = {
      "L3MON4D3/LuaSnip",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-cmdline",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-path",
      "hrsh7th/nvim-cmp",
      "onsails/lspkind.nvim",
      "saadparwaiz1/cmp_luasnip",
    },
    config = function()
      require "custom.completion"
    end,
  },
}
