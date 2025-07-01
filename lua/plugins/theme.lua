return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    lazy = false,
    config = function()
      -- Protege contra erro se o plugin ainda não estiver instalado
      local ok, catppuccin = pcall(require, "catppuccin")
      if not ok then
        vim.notify("Catppuccin theme not found!", vim.log.levels.WARN)
        return
      end

      catppuccin.setup({
        flavour = "mocha", -- ou "mocha", "macchiato", "latte"
        transparent_background = false,
        styles = {
          comments = {},
          strings = {},
        },
        integrations = {
          telescope = true,
          cmp = true,
          treesitter = true,
          native_lsp = {
            enabled = true,
          },
        },
      })

      vim.cmd.colorscheme("catppuccin")
    end,
  },
}
