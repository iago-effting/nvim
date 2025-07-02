return {
  {
    "neovim/nvim-lspconfig",
    opts = {},
    config = function()
      -- Evita que o elixirls seja ativado automaticamente pelo lspconfig
      require("lspconfig").elixirls.setup({})
    end,
  },
}