local set = vim.keymap.set

set("i", "jj", "<ESC>")

set("v", "J", ":m '>+1<CR>gv=gv")
set("v", "K", ":m '<-2<CR>gv=gv")
set("n", "J", "mzJ`z")

set("n", "<C-d>", "<C-d>zz")
set("n", "<C-u>", "<C-u>zz")

set("n", "n", "nzzzv")
set("n", "N", "Nzzzv")

set("n", "<C-j>", "<cmd>cnext<CR>zz")
set("n", "<C-k>", "<cmd>cprev<CR>zz")

-- Toggle hlsearch if it's on, otherwise just do "enter"
set("n", "<CR>", function()
  ---@diagnostic disable-next-line: undefined-field
  if vim.v.hlsearch == 1 then
    vim.cmd.nohl()
    return ""
  else
    return 13
  end
end, { expr = true })

set("n", "<M-j>", "<c-w><c-j>")
set("n", "<M-k>", "<c-w><c-k>")
set("n", "<M-l>", "<c-w><c-l>")
set("n", "<M-h>", "<c-w><c-h>")
set("n", "<M-q>", "<c-w><c-q>")

set("t", "<M-j>", "<c-\\><c-n><c-w><c-j>")
set("t", "<M-k>", "<c-\\><c-n><c-w><c-k>")
set("t", "<M-l>", "<c-\\><c-n><c-w><c-l>")
set("t", "<M-h>", "<c-\\><c-n><c-w><c-h>")
set("t", "<M-q>", "<c-\\><c-n><c-w><c-q>")

set("n", "<M-,>", "<c-w>5<")
set("n", "<M-.>", "<c-w>5>")
set("n", "<M-+>", "<C-W>+")
set("n", "<M-->", "<C-W>-")
set("n", "<M-=>", "<C-W>=")
