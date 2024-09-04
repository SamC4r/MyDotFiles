-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
require("overseer").setup({
  templates = { "builtin", "user.cpp_build" },
})
require("scrollbar").setup()
local credentials_file = vim.fn.expand("~/.cache/calendar.vim/credentials.vim")
if vim.fn.filereadable(credentials_file) == 1 then
  vim.cmd('source ' .. credentials_file)
end

vim.o.background = "light" -- or "light" for light mode
vim.cmd([[colorscheme gruvbox]])

