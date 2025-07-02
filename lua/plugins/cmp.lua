return {
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "L3MON4D3/LuaSnip",
    },
    config = function()
      local cmp = require("cmp")

      local kind_icons = {
        Function = "ƒ Function",
        Method   = "ƒ Method",
        Module   = "󰕳 Module",
        Struct   = "𝑺 Struct",
        Variable = " Var",
        Constant = "π Const",
      }

      cmp.setup({
        snippet = {
          expand = function(args)
            require("luasnip").lsp_expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ["<Tab>"] = function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            elseif require("luasnip").expand_or_jumpable() then
              require("luasnip").expand_or_jump()
            else
              fallback()
            end
          end,
          ["<S-Tab>"] = function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            elseif require("luasnip").jumpable(-1) then
              require("luasnip").jump(-1)
            else
              fallback()
            end
          end,
          ["<CR>"] = cmp.mapping.confirm({ select = true }),
          ["<C-Space>"] = cmp.mapping.complete(),
        }),
        sources = {
          { name = "nvim_lsp" },
          { name = "luasnip" },
        },
        window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        },
        formatting = {
          format = function(entry, item)
            -- Alinha ícones e tipos
            item.kind = string.format("%-12s", kind_icons[item.kind] or item.kind)

            -- Pega apenas (args) ou /arity do detail
            if entry.completion_item.detail then
              local short = entry.completion_item.detail
                :gsub(".*Kernel%.", "")  -- remove prefixos comuns
                :gsub(".*def", "def")    -- simplifica def nome
                :gsub(" *do *.*", "")    -- remove blocos `do`
              item.menu = short
            else
              item.menu = ""
            end

            return item
          end,
        },
        completion = {
          autocomplete = { require("cmp.types").cmp.TriggerEvent.TextChanged },
          completeopt = "menu,menuone,noselect",
          keyword_length = 2,
        },
        performance = {
          debounce = 60,
          throttle = 30,
          fetching_timeout = 100,
        },
      })
    end,
  },
}
