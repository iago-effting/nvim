return {
  -- Gerenciador de LSP
  { "williamboman/mason.nvim", config = true },
  { "williamboman/mason-lspconfig.nvim", opts = { ensure_installed = { "elixirls" } } },
  { "neovim/nvim-lspconfig" },

  -- Integração Elixir
  {
    "elixir-tools/elixir-tools.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("elixir").setup({
        elixirls = { 
          enable = true,
          on_attach = function(client, bufnr)
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
