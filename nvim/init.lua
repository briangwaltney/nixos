vim.g.mapleader = " "
vim.g.base46_cache = vim.fn.stdpath "data" .. "/base46/"
-- {{{ Goto last location when opening a buffer.

vim.api.nvim_create_autocmd("BufReadPost", {
  callback = function()
    local mark = vim.api.nvim_buf_get_mark(0, '"')
    local lcount = vim.api.nvim_buf_line_count(0)
    if mark[1] > 0 and mark[1] <= lcount then
      pcall(vim.api.nvim_win_set_cursor, 0, mark)
    end
  end,
})

-- ---------------------------------------------------------------------------------- }}}
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

-- bootstrap lazy and all plugins
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

if not vim.uv.fs_stat(lazypath) then
  local repo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system { "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath }
end

vim.opt.rtp:prepend(lazypath)

local lazy_config = require "configs.lazy"

-- load plugins
require("lazy").setup({
  {
    "NvChad/NvChad",
    lazy = false,
    branch = "v2.5",
    import = "nvchad.plugins",
  },

  { import = "plugins" },
}, lazy_config)

-- load theme
dofile(vim.g.base46_cache .. "defaults")
dofile(vim.g.base46_cache .. "statusline")

require "options"
require "autocmds"

vim.schedule(function()
  require "mappings"
end)
