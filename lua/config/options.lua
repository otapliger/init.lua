-- Remove netwr menu banner
vim.g.netrw_banner = 0

-- Setup remaps and options before loading plugins
vim.opt.signcolumn = "yes"
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.scrolloff = 24
vim.opt.wrap = true
vim.opt.number = true
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.relativenumber = true
vim.opt.termguicolors = true
vim.opt.cursorline = true
vim.opt.showmode = false

-- Folds sets
vim.opt.foldlevelstart = 99
vim.opt.foldmethod = "indent"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"

-- Filling
vim.opt.fillchars:append({
  eob = " ",
})
