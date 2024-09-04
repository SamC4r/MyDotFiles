-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.g.mapleader = " "

vim.scriptencoding = "utf-8"
vim.opt.encoding = "utf-8"
vim.opt.fileencoding = "utf-8"

vim.opt.number = true

vim.opt.title = true

vim.opt.hlsearch = true
vim.opt.backup = false
vim.opt.showcmd = true
vim.opt.cmdheight = 0
vim.opt.laststatus = 0
vim.opt.expandtab = true
vim.opt.scrolloff = 10
vim.opt.inccommand = "split"
vim.opt.ignorecase = true
vim.opt.smarttab = true
vim.opt.breakindent = true
vim.opt.expandtab = true
vim.opt.wrap = false
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.splitkeep = "cursor"
vim.opt.mouse = "a"
vim.o.tabstop = 2 -- A TAB character looks like 4 spaces
vim.o.expandtab = true -- Pressing the TAB key will insert spaces instead of a TAB character
vim.o.softtabstop = 2 -- Number of spaces inserted instead of a TAB character
vim.o.shiftwidth = 2 -- Number of spaces inserted when indenting
local opt = vim.opt
opt.shiftwidth = 2
vim.o.mousemoveevent = true

-- Add asterisks in block comments
vim.g.autoformat = false
vim.cmd("filetype plugin on")
vim.g.calendar_google_api_key = 'AIzaSyBLUd-6l-9MTZeH0OhuuDvDT3ECfMCP5Vw'
vim.g.calendar_google_client_id = '428980087236-6rov92pmst66pb6tju7n8rlqjh4jnr4p.apps.googleusercontent.com'
vim.g.calendar_google_client_secret = 'AIzaSyBqiaL8WECkTcaillX9v4LXIEGc9Idrq5Q'
vim.o.background="light"
