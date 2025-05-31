return {
  "nvim-telescope/telescope.nvim",
  version = "*",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope-file-browser.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
  },
  config = function()
    local telescope = require("telescope")
    local builtin = require("telescope.builtin")
    local actions = require("telescope.actions")
    local layout_strategies = require("telescope.pickers.layout_strategies")

    layout_strategies.fused = function(picker, max_columns, max_lines, layout_config)
      local fused = layout_strategies.vertical(picker, max_columns, max_lines, layout_config)
      fused.prompt.title = ""
      fused.results.title = ""

      if fused.preview then
        fused.preview.title = ""
        fused.preview.height = fused.preview.height + 1
        fused.preview.borderchars = { "─", "│", "─", "│", "┌", "┐", "┤", "├" }
        fused.results.borderchars = { "─", "│", "─", "│", "├", "┤", "┤", "├" }
      else
        fused.results.borderchars = { "─", "│", "─", "│", "┌", "┐", "┤", "├" }
      end

      fused.results.height = fused.results.height + 1
      fused.prompt.borderchars = { "─", "│", "─", "│", "├", "┤", "┘", "└" }
      return fused
    end

    telescope.setup({
      defaults = {
        initial_mode = "insert",
        layout_strategy = "fused",
        layout_config = {
          height = 0.8,
          width = 0.7,
        },
        path_display = { "truncate" },
        sorting_strategy = "descending",
        winblend = 0,
      },
      extensions = {
        fzf = {},
        file_browser = {
          previewer = true,
          grouped = true,
          hidden = true,
          use_fd = false,
          hijack_netrw = false,
          respect_gitignore = false,
          initial_mode = "normal",
        },
      },
    })

    telescope.load_extension("file_browser")
    telescope.load_extension("fzf")

    -- Find buffer
    vim.keymap.set("n", "<C-b>", function()
      builtin.buffers({
        ignore_current_buffer = true,
        sort_mru = true,
      })
    end, {})

    -- Find in-buffer
    vim.keymap.set("n", "<C-f>", function()
      local current_buffer_path = vim.fn.expand("%:p")
      if current_buffer_path ~= "" then
        builtin.current_buffer_fuzzy_find({
          sorting_strategy = "ascending",
          initial_mode = "insert",
          previewer = false,
        })
      end
    end, {})
  end,
}
