return {
  "FabianWirth/search.nvim",
  dependencies = {
    "nvim-telescope/telescope.nvim",
  },
  config = function()
    local builtin = require("telescope.builtin")
    require("search").setup({
      initial_tab = 1,
      tabs = {
        { "Files", builtin.find_files },
        { "Grep", builtin.live_grep },
        { "Stashes", builtin.git_stash },
        { "Commits", builtin.git_commits },
      },
    })
    vim.keymap.set("n", "<C-p>", function()
      require("search").open()
    end)
  end,
}
