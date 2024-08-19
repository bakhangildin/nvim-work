local data = assert(vim.fn.stdpath "data") --[[@as string]]

require("telescope").setup {
  extensions = {
    wrap_results = true,
    fzf = {},
    history = {
      path = data .. "telescope_history.sqlite3",
      limit = 100,
    },
    ["ui-select"] = {
      require("telescope.themes").get_dropdown {},
    },
  },
}

pcall(require("telescope").load_extension, "fzf")
pcall(require("telescope").load_extension, "smart_history")
pcall(require("telescope").load_extension, "ui-select")

local builtin = require "telescope.builtin"

vim.keymap.set("n", "<leader>sf", function()
  if not pcall(builtin.git_files) then
    builtin.find_files()
  end
end)
vim.keymap.set("n", "<leader>sa", builtin.find_files)
vim.keymap.set("n", "<leader>sh", builtin.help_tags)
vim.keymap.set("n", "<leader>sg", builtin.live_grep)
vim.keymap.set("n", "<leader>/", builtin.current_buffer_fuzzy_find)
vim.keymap.set("n", "<leader>sw", builtin.grep_string)
