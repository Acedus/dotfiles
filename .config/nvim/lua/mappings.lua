require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

-- Add this new mapping for codelens
map("n", "<leader>cl", function()
  vim.lsp.codelens.run()
end, { desc = "Run codelens" })
