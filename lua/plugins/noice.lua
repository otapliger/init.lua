return {
  "folke/noice.nvim",
  dependencies = {
    "MunifTanjim/nui.nvim",
  },
  config = function()
    require("noice").setup({
      lsp = {
        override = {
          ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
          ["vim.lsp.util.stylize_markdown"] = true,
        },
      },
      presets = {
        bottom_search = false, -- use a classic bottom cmdline for search
        command_palette = true, -- position the cmdline and popupmenu together
        long_message_to_split = true, -- long messages will be sent to a split
        lsp_doc_border = true, -- add a border to hover docs and signature help
        inc_rename = false, -- enables an input dialog for inc-rename.nvim
      },
      views = {
        mini = {
          border = {
            padding = { 1, 1 },
          },
        },
        popup = {
          border = {
            style = "single",
          },
        },
        cmdline_popup = {
          border = {
            style = "single",
          },
        },
        cmdline_popupmenu = {
          border = {
            style = "single",
          },
        },
        confirm = {
          border = {
            style = "single",
          },
        },
        hover = {
          border = {
            style = "single",
          },
        },
      },
    })
  end,
}
