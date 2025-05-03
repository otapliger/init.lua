return {
  "saghen/blink.cmp",
  version = "1.*",
  opts = {
    keymap = {
      preset = "none",
      -- Action
      ["<C-e>"] = { "hide", "show", "fallback" },
      ["<CR>"] = { "accept", "fallback" },
      -- Selection
      ["<Tab>"] = { "select_next", "snippet_forward", "fallback" },
      ["<S-Tab>"] = { "select_prev", "snippet_backward", "fallback" },
      -- Documentation
      ["<C-b>"] = { "scroll_documentation_up", "fallback" },
      ["<C-f>"] = { "scroll_documentation_down", "fallback" },
      ["<C-space>"] = { "show", "show_documentation", "hide_documentation" },
    },
    appearance = {
      nerd_font_variant = "mono",
    },
    sources = {
      default = { "lsp", "path" },
    },
    completion = {
      documentation = {
        auto_show = true,
        window = {
          border = "single",
          winhighlight = "Normal:NoiceCmdline,FloatBorder:NoicePopupmenuBorder,CursorLine:NoicePopupmenuSelected,Search:None",
        },
      },
      menu = {
        border = "single",
        winhighlight = "Normal:NoiceCmdline,FloatBorder:NoicePopupmenuBorder,CursorLine:NoicePopupmenuSelected,Search:None",
      },
    },
  },
  opts_extend = {
    "sources.default",
  },
}
