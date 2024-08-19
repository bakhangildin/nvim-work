return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "WhoIsSethDaniel/mason-tool-installer.nvim",
      "b0o/SchemaStore.nvim",
      "folke/neodev.nvim",
      "j-hui/fidget.nvim",
      "stevearc/conform.nvim",
      "williamboman/mason-lspconfig.nvim",
      "williamboman/mason.nvim",
    },
    config = function()
      require "custom.lsp"
    end,
  },
}
