return {
  {
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
      "vrischmann/tree-sitter-templ",
    },
    build = ":TSUpdate",
    lazy = false,
    config = function()
      require("nvim-treesitter.configs").setup {
        auto_install = false,
        ensure_installed = {
          "lua",
          "templ",
        },
        ignore_install = {},
        modules = {},
        sync_install = false,
        highlight = {
          enable = true,
        },
      }
    end,
  },
}
