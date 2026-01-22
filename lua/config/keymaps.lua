-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

if vim.tbl_contains(LazyVim.config.json.data.extras, "plugins.extras.sakkada.reset") then
  local map = LazyVim.safe_keymap_set
  --
  -- better up/down
  vim.keymap.del("n", "j")
  vim.keymap.del("n", "<Down>")
  vim.keymap.del("n", "k")
  vim.keymap.del("n", "<Up>")

  -- https://github.com/mhinz/vim-galore#saner-behavior-of-n-and-n
  vim.keymap.del("n", "n")
  vim.keymap.del("x", "n")
  vim.keymap.del("o", "n")
  vim.keymap.del("n", "N")
  vim.keymap.del("x", "N")
  vim.keymap.del("o", "N")

  vim.keymap.del({ "n", "t" }, "<c-_>")
  vim.keymap.del({ "n", "t" }, "<c-/>")

  vim.keymap.del("x", ">")
  vim.keymap.del("x", "<")

  map("t", ";j", "<c-\\><c-n>", { noremap = true })
end
