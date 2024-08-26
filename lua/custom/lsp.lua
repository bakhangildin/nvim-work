require("neodev").setup {}
require("fidget").setup {}
require("mason").setup {}

local capabilities = vim.tbl_deep_extend(
  "force",
  {},
  vim.lsp.protocol.make_client_capabilities(),
  require("cmp_nvim_lsp").default_capabilities(),
  { semanticTokensProvider = nil }
)

local lspconfig = require "lspconfig"
local configs = require "lspconfig.configs"
local util = require "lspconfig.util"

--[[
$ go clean -modcache && go install github.com/lasorda/protobuf-language-server@latest
]]
configs["protobuf-language-server"] = {
  default_config = {
    cmd = { "protobuf-language-server" },
    filetypes = { "proto" },
    root_dir = util.root_pattern('.git'),
    -- single_file_support = true,
    settings = {
      ["additional-proto-dirs"] = { "/usr/bin/include" },
    },
  },
}

lspconfig["protobuf-language-server"].setup {}

local servers = {
  basedpyright = true,
  emmet_language_server = {
    filetypes = vim.list_extend(
      require("lspconfig.server_configurations.emmet_language_server").default_config.filetypes,
      { "templ" }
    ),
  },
  gopls = true,
  html = true,
  lua_ls = true,
  tailwindcss = true,
  templ = true,
  tsserver = true,
}

local servers_to_install = vim.tbl_filter(function(key)
  local t = servers[key]
  if type(t) == "table" then
    return not t.manual_install
  else
    return t
  end
end, vim.tbl_keys(servers))

require("mason").setup()
local ensure_installed = {
  "autopep8",
  { "basedpyright", version = "1.12.3", autoupdate = false, },
  "emmet_language_server",
  "goimports",
  "gopls",
  "html",
  "isort",
  "lua_ls",
  "prettierd",
  "stylua",
  "tailwindcss",
  "templ",
  "tsserver",
}

vim.list_extend(ensure_installed, servers_to_install)
require("mason-tool-installer").setup {
  ensure_installed = ensure_installed,
}

for name, c in pairs(servers) do
  local config = nil
  if c == true then
    config = {}
  else
    config = c
  end
  config = vim.tbl_deep_extend("force", {}, {
    capabilities = capabilities,
  }, config)
  lspconfig[name].setup(config)
end

vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("LspGroup", {}),
  callback = function(args)
    local bufnr = args.buf
    local client = assert(vim.lsp.get_client_by_id(args.data.client_id), "must have valid client")
    vim.opt_local.omnifunc = "v:lua.vim.lsp.omnifunc"
    local set = vim.keymap.set

    set("n", "gd", vim.lsp.buf.definition, { buffer = bufnr })
    set("n", "gr", vim.lsp.buf.references, { buffer = bufnr })
    set("n", "gD", vim.lsp.buf.declaration, { buffer = bufnr })
    set("n", "gT", vim.lsp.buf.type_definition, { buffer = bufnr })
    set("n", "K", vim.lsp.buf.hover, { buffer = bufnr })
    set("i", "<C-h>", vim.lsp.buf.signature_help, { buffer = bufnr })

    set("n", "[d", vim.diagnostic.goto_next, { buffer = bufnr })
    set("n", "]d", vim.diagnostic.goto_prev, { buffer = bufnr })
    set("n", "<leader>dq", vim.diagnostic.setqflist)

    set("n", "<space>rn", vim.lsp.buf.rename, { buffer = bufnr })
    set("n", "<space>ca", vim.lsp.buf.code_action, { buffer = bufnr })
    set("n", "<leader>f", function()
      require("conform").format {
        bufnr = bufnr,
        lsp_format = "first",
        quiet = true,
      }
    end)

    client.server_capabilities.semanticTokensProvider = nil
  end,
})

-- Autoformatting Setup
require("conform").setup {
  formatters_by_ft = {
    lua = { "stylua" },
    go = { "goimports" },
    python = { "isort", "autopep8" },
    javascript = { "prettierd" },
    typescript = { "prettierd" },
    javascriptreact = { "prettierd" },
    typescriptreact = { "prettierd" },
  },
}

vim.api.nvim_create_autocmd("BufWritePre", {
  group = vim.api.nvim_create_augroup("FormatOnSaveGroup", {}),
  callback = function(args)
    require("conform").format {
      bufnr = args.bufnr,
      lsp_format = "first",
      quiet = true,
    }
  end,
})

vim.diagnostic.config {
  float = {
    focusable = false,
    style = "minimal",
    border = "rounded",
    source = "always",
    header = "",
    prefix = "",
  },
}
