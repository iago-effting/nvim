return {
  "phaazon/hop.nvim",
  branch = "v2", -- importante: usa a versão mais estável
  config = function()
    require("hop").setup()
    
    local hop = require("hop")
    local directions = require("hop.hint").HintDirection

    -- Atalhos básicos
    vim.keymap.set("", "f", function()
      hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true })
    end, { remap = true, desc = "Hop forward to char" })

    vim.keymap.set("", "F", function()
      hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true })
    end, { remap = true, desc = "Hop backward to char" })

    vim.keymap.set("", "t", function()
      hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true, hint_offset = -1 })
    end, { remap = true, desc = "Hop till char (after)" })

    vim.keymap.set("", "T", function()
      hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true, hint_offset = 1 })
    end, { remap = true, desc = "Hop till char (before)" })

    -- Para palavras visíveis
    vim.keymap.set("n", "<leader>w", function()
      hop.hint_words()
    end, { desc = "Hop to word" })

    -- Hop para padrões como funções ou blocos
    vim.keymap.set("n", "<leader>p", function()
    require("hop").hint_patterns({}, [[\<\(def\|fn\|do\|case\|end\|if\|else\|receive\|use\|@doc\|@moduledoc\)]])
    end, { desc = "Hop para blocos/padrões Elixir" })
  end,
}
