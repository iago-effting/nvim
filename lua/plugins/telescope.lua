return {
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.5",
    dependencies = {
      "nvim-lua/plenary.nvim",
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
        cond = vim.fn.executable("make") == 1,
      },
    },
    config = function()
      local telescope = require("telescope")
      telescope.setup({
        defaults = {
          layout_strategy = "center",
          layout_config = {
            width = 0.6,
            height = 0.4,
            prompt_position = "top",
          },
          sorting_strategy = "ascending",
          winblend = 10,
          border = true,
          borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
          results_title = false,
          preview_title = false,
          file_ignore_patterns = {
            "%.beam$",       -- ignora arquivos .beam
            "^_build/",      -- ignora toda a pasta _build
            "%.app$",         -- opcional, ignora arquivos .app
            "%.dump$",         -- opcional, ignora arquivos .app
          },
        },
      })

      pcall(telescope.load_extension, "fzf")
    end,
  },
}
