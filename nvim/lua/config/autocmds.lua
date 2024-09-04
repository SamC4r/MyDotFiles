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
  indent = {
    char = "",
  },
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
