-- Leader mapping
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Clear search highlights
vim.keymap.set("n", "<leader><space>", function()
  vim.cmd("nohlsearch")
end, {})

-- Disable
-- vim.keymap.set({ "n", "v", "i" }, "<Up>", "<Nop>", {})
-- vim.keymap.set({ "n", "v", "i" }, "<Down>", "<Nop>", {})
-- vim.keymap.set({ "n", "v", "i" }, "<Left>", "<Nop>", {})
-- vim.keymap.set({ "n", "v", "i" }, "<Right>", "<Nop>", {})
