-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local keymap = vim.keymap
local opts = { noremap = true, silent = true }

-- keymap.set("n", "x", '"_x')
-- keymap.set("n","d",'"ad')
-- keymap.set("n","p",'"ap')
-- keymap.set("n","y",'"ay')
-- keymap.set("v","d",'"ad')
-- keymap.set("v","y",'"ay')

-- Increment/decrement
keymap.set("n", "+", "<C-a>")
keymap.set("n", "-", "<C-x>")

-- Select all
keymap.set("n", "<C-a>", "gg<S-v>G")

-- Save file and quit
keymap.set("n", "<Leader>w", ":update<Return>", opts)
keymap.set("n", "<Leader>q", ":quit<Return>", opts)
keymap.set("n", "<Leader>Q", ":qa<Return>", opts)


-- Tabs
keymap.set("n", "te", ":tabedit")
keymap.set("n", "<tab>", ":tabnext<Return>", opts)
keymap.set("n", "<s-tab>", ":tabprev<Return>", opts)
keymap.set("n", "tw", ":tabclose<Return>", opts)

-- Split window
keymap.set("n", "ss", ":split<Return>", opts)
keymap.set("n", "sv", ":vsplit<Return>", opts)

-- Move window
keymap.set("n", "sh", "<C-w>h")
keymap.set("n", "sk", "<C-w>k")
keymap.set("n", "sj", "<C-w>j")
keymap.set("n", "sl", "<C-w>l")

-- Resize window
keymap.set("n", "<C-S-h>", "<C-w><")
keymap.set("n", "<C-S-l>", "<C-w>>")
keymap.set("n", "<C-S-k>", "<C-w>+")
keymap.set("n", "<C-S-j>", "<C-w>-")

-- Diagnostics
keymap.set("n", "<C-j>", function()
  vim.diagnostic.goto_next()
end, opts)

vim.api.nvim_set_keymap("n", "<C-n>", ":Neotree toggle<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-b>", ":CompetiTest run <CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-t>", ":CompetiTest add_testcase <CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-e>", ":CompetiTest edit_testcase <CR>", { noremap = true, silent = true })

-- Map 's' to 'cc' in normal mode
vim.api.nvim_set_keymap("n", "s", "cc", { noremap = true })
vim.api.nvim_set_keymap("n", "<C-a>", "ggVG", { noremap = true })
vim.api.nvim_set_keymap("x", "<C-c>", '"+y', { noremap = true, silent = true })
vim.api.nvim_set_keymap("s", "<C-c>", '"+y', { noremap = true, silent = true })



function _G.toggle_background()
  if vim.o.background == "light" then
    vim.o.background = "dark"
  else
    vim.o.background = "light"
  end
end

-- Create the mapping
vim.api.nvim_set_keymap('n', '<leader>tt', ':lua toggle_background()<CR>', { noremap = true, silent = true })-- Templates





--DSU
vim.cmd([[command! -nargs=0 Dsu execute 'r!cat /home/sam/Documents/problemitas/templates/dsu-o1-implem.cpp']])
vim.cmd([[cnoreabbrev dsu Dsu]])

--Templ
vim.cmd([[command! -nargs=0 Template execute 'r!cat /home/sam/Documents/problemitas/templates/template.cpp']])
vim.cmd([[cnoreabbrev template Template]])

--debug
vim.cmd([[command! -nargs=0 Debug execute 'r!cat /home/sam/Documents/problemitas/templates/debug.cpp']])
vim.cmd([[cnoreabbrev debug Debug]])

--Bin pow
vim.cmd([[command! -nargs=0 Binpow execute 'r!cat /home/sam/Documents/problemitas/templates/binpow.cpp']])
vim.cmd([[cnoreabbrev binpow Binpow]])


--Mint
vim.cmd([[command! -nargs=0 Mint execute 'r!cat /home/sam/Documents/problemitas/templates/mint.cpp']])
vim.cmd([[cnoreabbrev mint Mint]])

