-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local function map(mode, lhs, rhs, opts)
  local options = { noremap = true, silent = true }
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- Fix quiting nvim better
map("n", "<leader>c", "<cmd>:bd<cr>", { desc = "Close Current Buffer" })

map("n", "<C-j>", "3j")
map("n", "<C-k>", "3k")
map("n", "<C-h>", "3h")
map("n", "<C-l>", "3l")
map("n", "<leader>b", "<cmd>BlameToggle<cr>", { desc = "Gitblame" })
map("n", "<leader>fw", "<cmd>Telescope live_grep<cr>")
map("n", "<C-enter>", "A;<Esc>")

-- Add mappings to switch windows with Ctrl+Shift+direction keys
map("n", "<C-S-h>", "<C-w>h", { desc = "Move to left window" })
map("n", "<C-S-j>", "<C-w>j", { desc = "Move to below window" })
map("n", "<C-S-k>", "<C-w>k", { desc = "Move to above window" })
map("n", "<C-S-l>", "<C-w>l", { desc = "Move to right window" })

--path copy
vim.api.nvim_create_user_command("Cap", function()
  local path = vim.fn.expand("%:p")
  vim.fn.setreg("+", path)
  vim.notify('Copied "' .. path .. '" to the clipboard!')
end, {})
