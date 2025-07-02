return {
  -- Mason: gerenciador de LSPs
  { "williamboman/mason.nvim", config = true },

  -- Mason-lspconfig com handler desativado para elixirls
  {
    "williamboman/mason-lspconfig.nvim",
    opts = {
      ensure_installed = { "elixirls" },
      automatic_installation = true,
      handlers = {
        -- Desativa o carregamento automático do elixirls
        ["elixirls"] = function() end,
      },
    },
  },

  -- Integração moderna com Elixir
  {
    "elixir-tools/elixir-tools.nvim",
    -- event = { "BufReadPre", "BufNewFile" },
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("elixir").setup({
        elixirls = {
          enable = true,
          elixirLS = {
            enableTestLenses = true,
            suggestSpecs = false,
            fetchDeps = false,
            dialyzerEnabled = true,
          },
          on_attach = function(client, _)
            if client.server_capabilities.semanticTokensProvider then
              client.server_capabilities.semanticTokensProvider = nil
            end
          end,
        },
      })
    end,
  },

  -- Treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = { "elixir", "heex", "eex", "lua" },
        highlight = { enable = true },
      })
    end,
  },
}
