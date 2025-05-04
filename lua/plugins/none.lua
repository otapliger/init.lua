return {
  "nvimtools/none-ls.nvim",
  dependencies = {
    "nvimtools/none-ls-extras.nvim",
  },
  event = "VeryLazy",
  opts = function()
    local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
    local nls = require("null-ls")
    return {
      sources = {
        nls.builtins.formatting.stylua,
        nls.builtins.formatting.biome,
      },
      on_attach = function(client, bufnr)
        if client.supports_method("textDocument/formatting") then
          vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
          vim.api.nvim_create_autocmd("BufWritePre", {
            group = augroup,
            buffer = bufnr,
            callback = function()
              vim.lsp.buf.format({
                async = false,
              })
            end,
          })
        end
      end,
    }
  end,
}
