vim.g.mapleader = " "

-- Configurações básicas
vim.opt.number = true
vim.opt.relativenumber = false

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
