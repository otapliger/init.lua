return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  lazy = false,
  config = function()
    require("neo-tree").setup({
      default_component_configs = {
        indent = {
          padding = 1,
          indent_size = 2,
          with_markers = true,
          indent_marker = "│",
          last_indent_marker = "└",
          highlight = "NeoTreeIndentMarker",
          expander_highlight = "NeoTreeExpander",
          expander_collapsed = "",
          expander_expanded = "",
          with_expanders = nil,
        },
        icon = {
          folder_open = "⠶",
          folder_closed = "⠶",
          folder_empty = "⠶",
        },
      },
      window = {
        position = "left",
        width = 32,
      },
      filesystem = {
        filtered_items = {
          visible = false,
          hide_by_name = {
            "node_modules",
          },
          never_show = {
            ".DS_Store",
          },
          never_show_by_pattern = {
            "._*",
          },
        },
        use_libuv_file_watcher = true,
      },
    })
    vim.keymap.set("n", "<Leader><Tab>", "<Cmd>Neotree toggle<CR>")
  end,
}
