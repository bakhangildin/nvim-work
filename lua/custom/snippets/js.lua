for _, ft in ipairs { "javascript", "typescript", "javascriptreact", "typescriptreact" } do
  require("luasnip.session.snippet_collection").clear_snippets(ft)

  local ls = require "luasnip"
  local s = ls.snippet
  local i = ls.insert_node
  local fmt = require("luasnip.extras.fmt").fmt
  ls.add_snippets(ft, {
    s("log", fmt("console.log({});{}", { i(1), i(0) })),
  })
end
