vim.filetype.add { extension = { templ = "templ" } }

local opt = vim.opt

opt.formatoptions:remove "o"

opt.signcolumn = "yes"

opt.smartcase = true
opt.ignorecase = true

opt.splitbelow = true
opt.splitright = true

opt.number = true
opt.relativenumber = true

opt.wrap = false

opt.swapfile = false
opt.backup = false

opt.undofile = true

opt.incsearch = true

opt.termguicolors = true

opt.scrolloff = 4
opt.signcolumn = "yes"
opt.isfname:append "@-@"

opt.updatetime = 50

opt.colorcolumn = "80"

vim.opt.cursorline = true

vim.api.nvim_create_autocmd("TextYankPost", {
  group = vim.api.nvim_create_augroup("HighlightYank", {}),
  pattern = "*",
  callback = function()
    vim.highlight.on_yank {
      higroup = "IncSearch",
      timeout = 150,
    }
  end,
})
