return {
  "saghen/blink.cmp",
  version = "1.*",
  opts = {
    keymap = {
      preset = "default",
      ["<CR>"] = { "accept", "fallback" },
      ["<Tab>"] = { "select_next", "snippet_forward", "fallback" },
      ["<S-Tab>"] = { "select_prev", "snippet_backward", "fallback" },
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
