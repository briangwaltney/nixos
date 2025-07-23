require "nvchad.mappings"

local map = vim.keymap.set
local cmp = require "cmp"

-- {{{ Normal mode

map("n", ";", ":", { desc = "CMD enter command mode" })
map("n", "ma", "zMzz", { desc = "close all folds and center" })
map("n", "mr", "zR", { desc = "open all folds" })
map("n", "mi", "za", { desc = "toggle current fold" })
map("n", "<leader>s", ":w!<CR>", { desc = "save" })
map("n", "Q", "@q", { desc = "run macro q" })
map("n", "<leader><leader>r", ":LspRestart<CR>", { desc = "restart lsp" })
map("n", "<leader>F", "<cmd> Telescope find_files follow= true no_ignore=true hidden=true <CR>", { desc = "Find all" })
map("n", "F", function()
  vim.diagnostic.open_float { border = "rounded" }
end, { desc = "LSP Hove" })
map("n", "L", function()
  require("nvchad.tabufline").next()
end, { desc = "Go to next buffer" })
map("n", "H", function()
  require("nvchad.tabufline").prev()
end, { desc = "Go to next buffer" })

map("n", "U", "<C-r>", { desc = "undo" })
map("n", "n", "nzzzv", { desc = "find next and center" })
map("n", "N", "Nzzzv", { desc = "find prev and center" })
map("n", "{", "<C-u>zz", { desc = "half page up" })
map("n", "}", "<C-d>zz", { desc = "half page down" })
map("n", "<Esc>", ":noh<CR>", { desc = "clear highlights" })
map("n", "gd", function()
  vim.lsp.buf.definition()
end, { desc = "go to def" })
map("n", "gD", function()
  vim.lsp.buf.declaration()
end, { desc = "go to def" })
map("n", "K", function()
  vim.lsp.buf.hover()
end, { desc = "lsp hover" })

-- -------------------------------------------------------------------------------- }}}
-- {{{ Insert mode

map("i", "<C-f>", function()
  if cmp.visible() then
    cmp.close()
  else
    cmp.complete()
  end
end, { desc = "Trigger code completion helpers" })
map("i", "<Up>", function()
  if cmp.visible() then
    cmp.select_prev_item()
  end
end, { desc = "Enable arrows when selecting code completion" })
map("i", "<Down>", function()
  if cmp.visible() then
    cmp.select_next_item()
  end
end, { desc = "Enable arrows when selecting code completion" })

-- -------------------------------------------------------------------------------- }}}
-- {{{ Disabled Mappings
local nomap = vim.keymap.del

-- nomap("n", "<leader>n")
-- nomap("n", "<tab>n")
-- nomap("n", "<S-tab>n")

-- ---------------------------------------------------------------------------------- }}}
