return {
  "hrsh7th/nvim-cmp",
  dependecies = {
    {
      "hrsh7th/cmp-path",
    },
  },
  config = function()
    local cmp = require("cmp")
    cmp.setup({
      sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "path" },
      }),
      mapping = {
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<CR>"] = cmp.mapping.confirm({
           behavior = cmp.ConfirmBehavior.Replace,
           select = true,
        }),
        ["<Tab>"] = function(fallback)
           if cmp.visible() then
              cmp.select_next_item()
           else
              fallback()
           end
        end,
        ["<S-Tab>"] = function(fallback)
           if cmp.visible() then
              cmp.select_prev_item()
           else
              fallback()
           end
        end,
        ["<Esc>"] = function(fallback)
          if cmp.visible() then
            cmp.abort()
          else
            fallback()
          end
        end
      },
      window = {
        completion = cmp.config.window.bordered({
          border = "single",
        }),
        documentation = cmp.config.window.bordered({
          border = "single",
        }),
      },
    })
  end,
}
