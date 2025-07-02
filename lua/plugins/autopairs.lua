return {
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = function()
      require("nvim-autopairs").setup({
        check_ts = true, -- habilita suporte a treesitter para ignorar strings/comentários
      })

      -- Integração com nvim-cmp (se você usa)
      local cmp_status, cmp = pcall(require, "cmp")
      if cmp_status then
        local cmp_autopairs = require("nvim-autopairs.completion.cmp")
        cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
      end
    end,
  },
}
