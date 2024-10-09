return{

    { "bluz71/vim-moonfly-colors", name = "moonfly", lazy = false, priority = 1000 },
    {
        "LazyVim/LazyVim",
        opts = {
            colorscheme = "moonfly",
        },
    },

    {'morhetz/gruvbox'},
    {'sainnhe/gruvbox-material'},
    {
        'kaiuri/nvim-juliana',
        lazy = false,
        opts = { --[=[ configuration --]=] },
        config = true,
    },
    {
        'maxmx03/solarized.nvim',
        lazy = false,
        priority = 1000,
        ---@type solarized.config
        opts = {},
        config = function(_, opts)
            vim.o.termguicolors = true
            vim.o.background = 'light'
            require('solarized').setup(opts)
            vim.cmd.colorscheme 'solarized'
        end,
    },
    {
        'loctvl842/monokai-pro.nvim'
    },
    {
        'navarasu/onedark.nvim'
    },
    { "EdenEast/nightfox.nvim" },
}
