vim.g.mapleader = " "

-- Configurações básicas
vim.opt.number = true
vim.opt.relativenumber = false

vim.opt.list = true
vim.opt.listchars = {
  space = "·",
  tab = "→ ",
  trail = "·",
  extends = "»",
  precedes = "«",
  nbsp = "␣",
}

-- aaaaaa
-- local ns = vim.api.nvim_create_namespace("full_cursor_highlight")

-- local function highlight_full_line()
--   local bufnr = vim.api.nvim_get_current_buf()
--   local winid = vim.api.nvim_get_current_win()
--   local row = vim.api.nvim_win_get_cursor(winid)[1] - 1

--   -- Limpa highlights antigos
--   vim.api.nvim_buf_clear_namespace(bufnr, ns, 0, -1)

--   -- Aplica highlight até o fim da linha visualmente
--   vim.api.nvim_buf_set_extmark(bufnr, ns, row, 0, {
--     end_row = row + 1,
--     hl_group = "CursorLine",
--     hl_eol = true,
--   })
-- end

-- vim.api.nvim_create_autocmd("CursorMoved", {
--   callback = highlight_full_line,
-- })

-- Instalação do Lazy.nvim se necessário
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("autocmds")

-- Carrega keymaps
require("keymaps")

-- Carrega plugins com URL formatado corretamente
require("lazy").setup("plugins", {
  git = {
    url_format = "https://github.com/%s.git", -- evita erro de terminal prompt
  },
})

-- Tema
vim.cmd.colorscheme("catppuccin")
pcall(require, "highlights")

