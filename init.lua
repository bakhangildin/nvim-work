local nvim_venv_path = "/home/hangildin/.pyenv/versions/nvim_venv"
if vim.loop.fs_stat(nvim_venv_path) then
  vim.env.PYENV_VERSION = "nvim_venv"
  vim.env.PYENV_ACTIVATE_SHELL = 1
  vim.env.PYENV_VIRTUAL_ENV = "/home/hangildin/.pyenv/versions/3.8.9/envs/nvim_venv"
  vim.env.VIRTUAL_ENV = "/home/hangildin/.pyenv/versions/3.8.9/envs/nvim_venv"
else
  print("no nvim_venv found ::", nvim_venv_path)
end

vim.g.mapleader = " "

local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system { "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath }
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      {
        "Failed to clone lazy.nvim:\n",
        "ErrorMsg",
      },
      {
        out,
        "WarningMsg",
      },
      {
        "\nPress any key to exit...",
      },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({ import = "custom/plugins" }, {
  change_detection = {
    notify = false,
  },
})
