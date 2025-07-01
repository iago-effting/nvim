return {
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    lazy = false,
    config = function()
      require("lualine").setup({
        options = {
          theme = "catppuccin",
          icons_enabled = true,
          section_separators = "",
          component_separators = "",
          globalstatus = true,
        },
        sections = {
         lualine_a = { "mode" },
  lualine_b = { "branch", "diff" },
  lualine_c = {
    "filename",
    {
      "diagnostics",
      sources = { "nvim_lsp" },
      symbols = {
        error = " ",
        warn  = " ",
        info  = " ",
        hint  = " ",
      },
      diagnostics_color = {
        error = { fg = "#f38ba8" },
        warn  = { fg = "#f9e2af" },
        info  = { fg = "#89dceb" },
        hint  = { fg = "#94e2d5" },
      },
      update_in_insert = false,
    },
  },
  lualine_x = {
  {
    function()
      local clients = vim.lsp.get_active_clients({ bufnr = 0 })
      if #clients == 0 then return "" end
      local names = {}
      for _, client in pairs(clients) do
        table.insert(names, client.name)
      end
      return " " .. table.concat(names, ", ")
    end,
    icon = "",
    color = { fg = "#94e2d5" }, -- opcional: cor suave no estilo catppuccin
  },
  "encoding",
  "filetype",
},
  lualine_y = { "progress" },
  lualine_z = { "location" },
        },
      })
    end,
  },
}
