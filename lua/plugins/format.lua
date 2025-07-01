return {
  "stevearc/conform.nvim",
  event = { "BufWritePre" },
  config = function()
    require("conform").setup({
      formatters_by_ft = {
        elixir = {}, -- vazio = usa LSP fallback direto
        heex = {},
        eex = {},
      },
      format_on_save = function(bufnr)
        return {
          timeout_ms = 3000,
          lsp_fallback = true,
        }
      end,
    })
  end,
}
