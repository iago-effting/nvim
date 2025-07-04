return {
  -- Gerenciador de LSP (apenas Mason sem instalar elixirls diretamente)
  { "williamboman/mason.nvim", config = true },

  -- Bridge entre mason e lspconfig (facilita setup automático)
  {
    "williamboman/mason-lspconfig.nvim",
    opts = {
      ensure_installed = { "elixirls" },
    },
  },

  -- Configuração manual dos LSPs (inclui :LspInfo e afins)
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("lspconfig") -- garante comandos como :LspInfo
    end,
  },

  -- Integração moderna com Elixir
  {
    "elixir-tools/elixir-tools.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("lspconfig").elixirls.setup({}) -- sobrescreve e impede conflito

      require("elixir").setup({
        elixirls = {
          enable = true,
          elixirLS = {
            enableTestLenses = false,
            suggestSpecs = false,
            fetchDeps = false,
            dialyzerEnabled = false,
          },
          on_attach = function(client, bufnr)
            -- Desabilita semantic tokens se estiver ativo (evita conflitos visuais)
            if client.server_capabilities.semanticTokensProvider then
              client.server_capabilities.semanticTokensProvider = nil
            end
          end,
        },
      })
    end,
  },

  -- Treesitter para Elixir/HEEx/EEx
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
