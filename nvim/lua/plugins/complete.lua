
-- Ensure nvim-cmp is required
local cmp = require('cmp')

cmp.setup({
  mapping = {
    -- Navigate down in the autocomplete menu with Ctrl-n
    ['<C-j>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
    
    -- Navigate up in the autocomplete menu with Ctrl-p
    ['<C-k>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),

    -- You can add other mappings here as well, such as:
    -- Confirm selection with Enter
    ['<CR>'] = cmp.mapping.confirm({ select = true }),

    -- Scroll documentation with Ctrl-d and Ctrl-u
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-u>'] = cmp.mapping.scroll_docs(4),
  },

  -- Specify your sources
  sources = {
    { name = 'nvim_lsp' },
    { name = 'buffer' },
    { name = 'path' },
    -- Add more sources as needed
  },
})
