# 🧠 Neovim Config (Elixir Focus)

Configuração do Neovim voltada para desenvolvimento em **Elixir**, com suporte a testes, navegação rápida e autoformatação.

---

## 📦 Plugins principais

| Plugin | Função |
|--------|--------|
| [lazy.nvim](https://github.com/folke/lazy.nvim) | Gerenciador de plugins |
| [catppuccin](https://github.com/catppuccin/nvim) | Tema com suporte a LSP |
| [elixir-tools.nvim](https://github.com/elixir-tools/elixir-tools.nvim) | LSP e suporte completo a Elixir |
| [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) | Highlight e estruturação inteligente |
| [neotest](https://github.com/nvim-neotest/neotest) | Execução de testes |
| [neotest-elixir](https://github.com/jfpedroza/neotest-elixir) | Adaptador Elixir para Neotest |
| [nvim-lualine/lualine.nvim](https://github.com/nvim-lualine/lualine.nvim) | Statusline |
| [nvim-tree/nvim-tree.lua](https://github.com/nvim-tree/nvim-tree.lua) | Explorer de arquivos |
| [nvim-telescope/telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) | Busca de arquivos, símbolos, histórico |
| [hop.nvim](https://github.com/phaazon/hop.nvim) | Movimentação rápida entre palavras |
| [conform.nvim](https://github.com/stevearc/conform.nvim) | Formatador automático de arquivos |
| [nvim-neotest/nvim-nio](https://github.com/nvim-neotest/nvim-nio) | Dependência necessária para o Neotest |

---

## 🧪 Testes em Elixir

Com suporte via `neotest`:

- Roda testes unitários e integrações
- Erros exibidos inline ou via painel

---

## 🛠️ Comandos e atalhos

| Atalho | Ação |
|--------|------|
| `<leader>ta` | Alternar testes automáticos ao salvar |
| `<leader>jm` | Ir para o módulo/função do cursor (MyApp.User.func) |
| `<leader><leader>` | Voltar ao arquivo anterior |
| `<leader>ff` | Buscar arquivos com Telescope |
| `<leader>fg` | Buscar texto com Telescope |
| `<leader>e` | Abrir/fechar o explorador de arquivos |
| `<leader>tt` | Executar teste atual |
| `<leader>tf` | Executar todo o arquivo |

---

## 🎨 Visual

- Tema: `Catppuccin Mocha`
- Ícones: `nvim-web-devicons`
- Suporte a statusline (lualine) com integração Git e LSP

---

## 🧪 Requisitos

- `neovim >= 0.11`
- `elixir-ls` instalado (pelo mason ou manualmente)
- `ripgrep`, `fd`, `git` instalados

---

## 📂 Estrutura

