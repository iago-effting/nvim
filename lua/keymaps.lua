vim.keymap.set("n", "<C-s>", ":w<CR>", { desc = "Salvar arquivo" })
vim.keymap.set("i", "<C-s>", "<Esc>:w<CR>gi", { desc = "Salvar no modo insert" })

-- Telescope
vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<CR>", { desc = "Buscar arquivos" })
vim.keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep<CR>",  { desc = "Buscar por texto" })

-- Atalho para abrir/fechar o Explorer
vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", { desc = "Abrir/Fechar Explorer" })

-- SALTOS

-- Atalho para saltar para arquivo anterior
vim.keymap.set("n", "<leader><leader>", "<cmd>b#<CR>", { desc = "Voltar ao arquivo anterior" })

-- Atalho para saltar para a definição
vim.keymap.set("n", "<C-m>", function()
  require("utils.goto_module_from_test").from_test_file()
end, { desc = "Ir do teste para o módulo (Ctrl+M)" })

vim.keymap.set("n", "<C-g>", function()
  require("utils.jump_to_module").from_cursor()
end, { desc = "Ir para o módulo do cursor (Ctrl+O)" })

vim.keymap.set("n", "<C-t>", function()
  require("utils.jump_to_test").create_test_file_with_skeleton()
end, { desc = "Criar esqueleto de teste" })

-- Atalho para proximo bloco
vim.keymap.set("n", "<leader>n", function()
  require("treesitter_jump").jump_next()
end, { desc = "Pular para próximo bloco (TS)" })

-- TESTES

vim.keymap.set("n", "<leader>ta", function()
  require("utils.auto_test").toggle()
end, { desc = "Alternar Auto Teste ao Salvar" })

vim.keymap.set("n", "<leader>tt", function()
  require("neotest").run.run()
end, { desc = "Rodar teste atual" })

vim.keymap.set("n", "<leader>tf", function()
  require("neotest").run.run(vim.fn.expand("%"))
end, { desc = "Rodar arquivo de teste" })

vim.keymap.set("n", "<leader>to", function()
  require("neotest").output.open({ enter = true, auto_close = true })
end, { desc = "Abrir saída do teste" })

vim.keymap.set("n", "<leader>ts", function()
  neotest.summary.toggle()
end, { desc = "Resumo lateral dos testes" })

-- Mostrar resumo lateral
vim.keymap.set("n", "<leader>tr", function()
  require("neotest").summary.toggle()
end, { desc = "Abrir/fechar painel de testes" })

-- TERMINAL

vim.keymap.set("n", "<leader>th", "<cmd>ToggleTerm direction=horizontal<CR>", { desc = "Terminal Horizontal" })
vim.keymap.set("n", "<leader>tv", "<cmd>ToggleTerm direction=vertical<CR>", { desc = "Terminal Vertical" })

-- debuger
local ok, dap = pcall(require, "dap")
if ok then
  vim.keymap.set("n", "<F5>", dap.continue, { desc = "Continuar execução (F5)" })
  vim.keymap.set("n", "<F10>", dap.step_over, { desc = "Step over (F10)" })
  vim.keymap.set("n", "<F11>", dap.step_into, { desc = "Step into (F11)" })
  vim.keymap.set("n", "<F12>", dap.step_out, { desc = "Step out (F12)" })
  vim.keymap.set("n", "<leader>db", dap.toggle_breakpoint, { desc = "Toggle breakpoint" })
  vim.keymap.set("n", "<leader>dr", function() dap.repl.open() end, { desc = "Abrir REPL DAP" })
end

vim.keymap.set("n", "<leader>db", ":lua require'dap'.toggle_breakpoint()<CR>", { desc = "Toggle Breakpoint" })
vim.keymap.set("n", "<leader>dc", ":lua require'dap'.continue()<CR>", { desc = "Continue Debug" })
vim.keymap.set("n", "<leader>di", ":lua require'dap'.step_into()<CR>", { desc = "Step Into" })
vim.keymap.set("n", "<leader>do", ":lua require'dap'.step_over()<CR>", { desc = "Step Over" })
vim.keymap.set("n", "<leader>du", ":lua require'dapui'.toggle()<CR>", { desc = "Toggle DAP UI" })
vim.keymap.set("n", "<leader>dr", ":lua require'dap'.repl.open()<CR>", { desc = "Open REPL" })

vim.keymap.set("n", "<leader>dh", function()
  require("dap.ui.widgets").hover()
end, { desc = "Dap hover (avaliar variável)" })

vim.keymap.set("n", "<leader>ls", function()
  vim.opt.list = not vim.opt.list:get()
end, { desc = "Alternar visualização de espaços" })

-- linter
vim.keymap.set("n", "<leader>ld", vim.diagnostic.open_float, { desc = "Mostrar erro da linha" })
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Erro anterior" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Próximo erro" })

-- SNIPPETS
vim.keymap.set({ "i", "s" }, "<C-k>", function()
  require("luasnip").jump(1)
end, { desc = "Próximo campo do snippet" })

vim.keymap.set({ "i", "s" }, "<C-j>", function()
  require("luasnip").jump(-1)
end, { desc = "Campo anterior do snippet" })

-- Expandir snippet manualmente (caso use sem nvim-cmp)
vim.keymap.set({ "i", "s" }, "<C-l>", function()
  if require("luasnip").expand_or_jumpable() then
    require("luasnip").expand_or_jump()
  end
end, { desc = "Expandir snippet ou pular", silent = true })
