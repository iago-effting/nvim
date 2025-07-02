-- Remove o fundo e suaviza a cor do nome do módulo
vim.api.nvim_set_hl(0, "@module", { fg = "#cdd6f4", bg = "NONE" })
vim.api.nvim_set_hl(0, "@module.elixir", { fg = "#cdd6f4", bg = "NONE" })

-- docs
vim.api.nvim_set_hl(0, "CmpItemAbbr", { fg = "#cdd6f4" })         -- Texto principal
vim.api.nvim_set_hl(0, "CmpItemAbbrMatch", { fg = "#89b4fa", bold = true }) -- Texto que corresponde ao que está sendo digitado
vim.api.nvim_set_hl(0, "CmpItemAbbrMatchFuzzy", { fg = "#89b4fa", italic = true })
vim.api.nvim_set_hl(0, "CmpItemMenu", { fg = "#bac2de", italic = true })   -- Fonte (ex: LSP, Snippet)

vim.api.nvim_set_hl(0, "CmpItemKindFunction", { fg = "#a6e3a1" })
vim.api.nvim_set_hl(0, "CmpItemKindMethod", { fg = "#a6e3a1" })
vim.api.nvim_set_hl(0, "CmpItemKindVariable", { fg = "#f9e2af" })
vim.api.nvim_set_hl(0, "CmpItemKindKeyword", { fg = "#f38ba8" })
vim.api.nvim_set_hl(0, "CmpItemKindClass", { fg = "#f9e2af" })
vim.api.nvim_set_hl(0, "CmpItemKindModule", { fg = "#fab387" })
vim.api.nvim_set_hl(0, "CmpItemKindSnippet", { fg = "#94e2d5" })
vim.api.nvim_set_hl(0, "CmpItemKindText", { fg = "#cba6f7" })
