-- Autocmds are automatically loaded on the VeryLazy event
--
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

require("competitest").setup({
  local_config_file_name = ".competitest.lua",

  floating_border = "rounded",
  floating_border_highlight = "FloatBorder",
  picker_ui = {
    width = 0.2,
    height = 0.3,
    mappings = {
      focus_next = { "j", "<down>", "<Tab>" },
      focus_prev = { "k", "<up>", "<S-Tab>" },
      close = { "<esc>", "<C-c>", "q", "Q" },
      submit = { "<cr>" },
    },
  },
  editor_ui = {
    popup_width = 0.4,
    popup_height = 0.6,
    show_nu = true,
    show_rnu = false,
    normal_mode_mappings = {
      switch_window = { "<C-h>", "<C-l>", "<C-i>" },
      save_and_close = "<C-s>",
      cancel = { "q", "Q" },
    },
    insert_mode_mappings = {
      switch_window = { "<C-h>", "<C-l>", "<C-i>" },
      save_and_close = "<C-s>",
      cancel = "<C-q>",
    },
  },
  runner_ui = {
    interface = "split",
    selector_show_nu = false,
    selector_show_rnu = false,
    show_nu = true,
    show_rnu = false,
    mappings = {
      run_again = "R",
      run_all_again = "<C-r>",
      kill = "K",
      kill_all = "<C-k>",
      view_input = { "i", "I" },
      view_output = { "a", "A" },
      view_stdout = { "o", "O" },
      view_stderr = { "e", "E" },
      toggle_diff = { "d", "D" },
      close = { "q", "Q" },
    },
    viewer = {
      width = 0.5,
      height = 0.5,
      show_nu = true,
      show_rnu = false,
      close_mappings = { "q", "Q" },
    },
  },
  popup_ui = {
    total_width = 0.8,
    total_height = 0.8,
    layout = {
      { 4, "tc" },
      { 5, { { 1, "so" }, { 1, "si" } } },
      { 5, { { 1, "eo" }, { 1, "se" } } },
    },
  },
  split_ui = {
    position = "right",
    relative_to_editor = true,
    total_width = 0.3,
    vertical_layout = {
      { 1, "tc" },
      { 1, { { 1, "so" }, { 1, "eo" } } },
      { 1, { { 1, "si" }, { 1, "se" } } },
    },
    total_height = 0.4,
    horizontal_layout = {
      { 2, "tc" },
      { 3, { { 1, "so" }, { 1, "si" } } },
      { 3, { { 1, "eo" }, { 1, "se" } } },
    },
  },

  save_current_file = true,
  save_all_files = false,
  compile_directory = ".",
  compile_command = {
    c = { exec = "gcc", args = { "-Wall", "$(FNAME)", "-o", "$(FNOEXT)" } },
    cpp = { exec = "g++", args = { "-Wall", "$(FNAME)", "-o", "$(FNOEXT)" } },
    rust = { exec = "rustc", args = { "$(FNAME)" } },
    java = { exec = "javac", args = { "$(FNAME)" } },
  },
  running_directory = ".",
  run_command = {
    c = { exec = "./$(FNOEXT)" },
    cpp = { exec = "./$(FNOEXT)" },
    rust = { exec = "./$(FNOEXT)" },
    python = { exec = "python", args = { "$(FNAME)" } },
    java = { exec = "java", args = { "$(FNOEXT)" } },
  },
  multiple_testing = -1,
  maximum_time = 5000,
  output_compare_method = "squish",
  view_output_diff = false,

  testcases_directory = ".",
  testcases_use_single_file = true,
  testcases_auto_detect_storage = true,
  testcases_single_file_format = "$(FNOEXT).testcases",
  testcases_input_file_format = "$(FNOEXT)_input$(TCNUM).txt",
  testcases_output_file_format = "$(FNOEXT)_output$(TCNUM).txt",

  companion_port = 27121,
  receive_print_message = true,
  template_file = false,
  evaluate_template_modifiers = false,
  date_format = "%c",
  received_files_extension = "cpp",
  received_problems_path = "$(CWD)/$(PROBLEM).$(FEXT)",
  received_problems_prompt_path = true,
  received_contests_directory = "$(CWD)",
  received_contests_problems_path = "$(PROBLEM).$(FEXT)",
  received_contests_prompt_directory = true,
  received_contests_prompt_extension = true,
  open_received_problems = true,
  open_received_contests = true,
  replace_received_testcases = false,
})
require("ibl").setup({
  scope = {
    enabled = false,
  },
})
vim.api.nvim_create_autocmd("FileType", {
  pattern = "lua",
  callback = function()
    vim.opt_local.shiftwidth = 4
    vim.opt_local.tabstop = 4
    vim.opt_local.softtabstop = 4
    vim.opt_local.expandtab = true
  end,
})
require("lspconfig").clangd.setup({
  hint_enable = false,
  on_attach = function(client, bufnr)
    -- Disable clangd's formatting capability, so it doesn't interfere with your settings
  end,

  setup = {}, -- If you have other setup configurations, they can go here
})
vim.api.nvim_create_autocmd("FileType", {
  pattern = "*",
  command = "setlocal formatoptions-=cro",
})
vim.api.nvim_create_autocmd("FileType", {
  pattern = "*",
  callback = function()
    vim.opt_local.formatoptions:remove({ "c", "r", "o" })
    vim.opt_local.indentkeys:remove("0#")
  end,
})
vim.api.nvim_create_autocmd("FileType", {
  pattern = "*",
  command = "setlocal formatoptions-=cro",
})

local osys = require("cmake-tools.osys")
require("cmake-tools").setup {
  cmake_command = "cmake", -- this is used to specify cmake command path
  ctest_command = "ctest", -- this is used to specify ctest command path
  cmake_use_preset = true,
  cmake_regenerate_on_save = true, -- auto generate when save CMakeLists.txt
  cmake_generate_options = { "-DCMAKE_EXPORT_COMPILE_COMMANDS=1" }, -- this will be passed when invoke `CMakeGenerate`
  cmake_build_options = {}, -- this will be passed when invoke `CMakeBuild`
  -- support macro expansion:
  --       ${kit}
  --       ${kitGenerator}
  --       ${variant:xx}
  cmake_build_directory = function()
    if osys.iswin32 then
      return "out\\${variant:buildType}"
    end
    return "out/${variant:buildType}"
  end, -- this is used to specify generate directory for cmake, allows macro expansion, can be a string or a function returning the string, relative to cwd.
  cmake_soft_link_compile_commands = true, -- this will automatically make a soft link from compile commands file to project root dir
  cmake_compile_commands_from_lsp = false, -- this will automatically set compile commands file location using lsp, to use it, please set `cmake_soft_link_compile_commands` to false
  cmake_kits_path = nil, -- this is used to specify global cmake kits path, see CMakeKits for detailed usage
  cmake_variants_message = {
    short = { show = true }, -- whether to show short message
    long = { show = true, max_length = 40 }, -- whether to show long message
  },
  cmake_dap_configuration = { -- debug settings for cmake
    name = "cpp",
    type = "codelldb",
    request = "launch",
    stopOnEntry = false,
    runInTerminal = true,
    console = "integratedTerminal",
  },
  cmake_executor = { -- executor to use
    name = "quickfix", -- name of the executor
    opts = {}, -- the options the executor will get, possible values depend on the executor type. See `default_opts` for possible values.
    default_opts = { -- a list of default and possible values for executors
      quickfix = {
        show = "always", -- "always", "only_on_error"
        position = "belowright", -- "vertical", "horizontal", "leftabove", "aboveleft", "rightbelow", "belowright", "topleft", "botright", use `:h vertical` for example to see help on them
        size = 10,
        encoding = "utf-8", -- if encoding is not "utf-8", it will be converted to "utf-8" using `vim.fn.iconv`
        auto_close_when_success = true, -- typically, you can use it with the "always" option; it will auto-close the quickfix buffer if the execution is successful.
      },
      toggleterm = {
        direction = "float", -- 'vertical' | 'horizontal' | 'tab' | 'float'
        close_on_exit = false, -- whether close the terminal when exit
        auto_scroll = true, -- whether auto scroll to the bottom
        singleton = true, -- single instance, autocloses the opened one, if present
      },
      overseer = {
        new_task_opts = {
            strategy = {
                "toggleterm",
                direction = "horizontal",
                autos_croll = true,
                quit_on_exit = "success"
            }
        }, -- options to pass into the `overseer.new_task` command
        on_new_task = function(task)
            require("overseer").open(
                { enter = false, direction = "right" }
            )
        end,   -- a function that gets overseer.Task when it is created, before calling `task:start`
      },
      terminal = {
        name = "Main Terminal",
        prefix_name = "[CMakeTools]: ", -- This must be included and must be unique, otherwise the terminals will not work. Do not use a simple spacebar " ", or any generic name
        split_direction = "horizontal", -- "horizontal", "vertical"
        split_size = 11,

        -- Window handling
        single_terminal_per_instance = true, -- Single viewport, multiple windows
        single_terminal_per_tab = true, -- Single viewport per tab
        keep_terminal_static_location = true, -- Static location of the viewport if avialable
        auto_resize = true, -- Resize the terminal if it already exists

        -- Running Tasks
        start_insert = false, -- If you want to enter terminal with :startinsert upon using :CMakeRun
        focus = false, -- Focus on terminal when cmake task is launched.
        do_not_add_newline = false, -- Do not hit enter on the command inserted when using :CMakeRun, allowing a chance to review or modify the command before hitting enter.
      }, -- terminal executor uses the values in cmake_terminal
    },
  },
  cmake_runner = { -- runner to use
    name = "terminal", -- name of the runner
    opts = {}, -- the options the runner will get, possible values depend on the runner type. See `default_opts` for possible values.
    default_opts = { -- a list of default and possible values for runners
      quickfix = {
        show = "always", -- "always", "only_on_error"
        position = "belowright", -- "bottom", "top"
        size = 10,
        encoding = "utf-8",
        auto_close_when_success = true, -- typically, you can use it with the "always" option; it will auto-close the quickfix buffer if the execution is successful.
      },
      toggleterm = {
        direction = "float", -- 'vertical' | 'horizontal' | 'tab' | 'float'
        close_on_exit = false, -- whether close the terminal when exit
        auto_scroll = true, -- whether auto scroll to the bottom
        singleton = true, -- single instance, autocloses the opened one, if present
      },
      overseer = {
        new_task_opts = {
            strategy = {
                "toggleterm",
                direction = "horizontal",
                autos_croll = true,
                quit_on_exit = "success"
            }
        }, -- options to pass into the `overseer.new_task` command
        on_new_task = function(task)
        end,   -- a function that gets overseer.Task when it is created, before calling `task:start`
      },
      terminal = {
        name = "Main Terminal",
        prefix_name = "[CMakeTools]: ", -- This must be included and must be unique, otherwise the terminals will not work. Do not use a simple spacebar " ", or any generic name
        split_direction = "horizontal", -- "horizontal", "vertical"
        split_size = 11,

        -- Window handling
        single_terminal_per_instance = true, -- Single viewport, multiple windows
        single_terminal_per_tab = true, -- Single viewport per tab
        keep_terminal_static_location = true, -- Static location of the viewport if avialable
        auto_resize = true, -- Resize the terminal if it already exists

        -- Running Tasks
        start_insert = false, -- If you want to enter terminal with :startinsert upon using :CMakeRun
        focus = false, -- Focus on terminal when cmake task is launched.
        do_not_add_newline = false, -- Do not hit enter on the command inserted when using :CMakeRun, allowing a chance to review or modify the command before hitting enter.
      },
    },
  },
  cmake_notifications = {
    runner = { enabled = true },
    executor = { enabled = true },
    spinner = { "⠋", "⠙", "⠹", "⠸", "⠼", "⠴", "⠦", "⠧", "⠇", "⠏" }, -- icons used for progress display
    refresh_rate_ms = 100, -- how often to iterate icons
  },
  cmake_virtual_text_support = true, -- Show the target related to current file using virtual text (at right corner)
}



