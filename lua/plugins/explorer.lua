return {
  "nvim-tree/nvim-tree.lua",
  dependencies = { "nvim-tree/nvim-web-devicons" }, -- ícones
  version = "*",
  lazy = false,
  config = function()
    require("nvim-tree").setup({
      view = {
        width = 30,
        side = "left",
      },
      git = {
        enable = true,
        ignore = false,
        timeout = 400,
      },
      renderer = {
        highlight_git = true,
        icons = {
          show = {
            git = true,
            folder = true,
            file = true,
            folder_arrow = true,
          },
        },
      },
      filters = {
        dotfiles = false,
        custom = {
          "^deps$",
          "^_build$",
          "^.elixir_ls$",
          "^.elixir-tools$",
          "erl_crash.dump",
          "^.git$"
        },
      },
    })
  end,
}
