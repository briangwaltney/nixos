require "nvchad.options"

vim.g.mapleader = " "
vim.opt.scrolloff = 16
vim.opt.relativenumber = true
vim.opt.spelllang = "en_us"
vim.opt.spell = true
vim.opt.fillchars = { fold = " ", eob = " ", foldclose = " " }
vim.opt.foldmethod = "marker"
vim.opt.foldlevel = 99
vim.opt.timeoutlen = 400
vim.g.lua_snippets_path = vim.fn.stdpath "config" .. "/lua/custom/lua_snippets"
vim.opt.clipboard = 'unnamedplus'
vim.env.CARGO_TARGET_DIR = vim.fn.expand("~/.cargo/target")

-- {{{ Turn off comment continue comments

vim.api.nvim_create_autocmd("FileType", {
  pattern = "*",
  callback = function()
    vim.opt_local.formatoptions:remove "r"
  end,
})

-- ---------------------------------------------------------------------------------- }}}
-- {{{ Random highlights

vim.cmd "hi DiagnosticUnderlineError gui=undercurl guisp=#fca5a5"
vim.cmd "hi DiagnosticUnderlineOk gui=undercurl"
vim.cmd "hi DiagnosticUnderlineHint gui=undercurl"
vim.cmd "hi DiagnosticUnderlineInfo gui=undercurl"
vim.cmd "hi DiagnosticUnderlineWarn gui=undercurl"

-- ---------------------------------------------------------------------------------- }}}
