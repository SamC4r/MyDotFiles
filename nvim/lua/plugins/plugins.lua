return {

    {
        "Civitasv/cmake-tools.nvim",
    },
    {
        "tikhomirov/vim-glsl",
    },
    {
        "equalsraf/neovim-gui-shim",
    },
    {
        "tenxsoydev/size-matters.nvim",
    },
    {
        "petertriho/nvim-scrollbar",
    },
    {
        "akinsho/bufferline.nvim",
    },

    {
        "xeluxee/competitest.nvim",
        dependencies = "MunifTanjim/nui.nvim",
        config = function()
            require("competitest").setup()
        end,
    },

    {
        "windwp/nvim-autopairs",
        config = true,
        -- use opts = {} for passing setup options
        -- this is equalent to setup({}) function
    },
    {
        "tenxsoydev/size-matters.nvim",
    },
    {
        -- amongst your other plugins
        { "akinsho/toggleterm.nvim", version = "*", config = true },
        -- or
    },
    {
        "nvim-treesitter/nvim-treesitter",
        ensure_installed = { 'norg' },
        opts = { highlight = { enable = true } },
    },
    {'nvim-lua/plenary.nvim'},
    {
        "Civitasv/cmake-tools.nvim"
    },

}
