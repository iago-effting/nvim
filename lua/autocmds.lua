vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = "*",
  callback = function()
    vim.schedule(function()
      local mode = vim.api.nvim_get_mode().mode
      if mode == "i" or mode == "ic" then
        vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Esc>", true, false, true), "n", false)
      end
    end)
  end,
})

-- bug
-- Desabilita format on save do LSP
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    client.server_capabilities.documentFormattingProvider = false
  end,
})

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if client.name == "elixirls" then
      client.server_capabilities.documentFormattingProvider = false
      client.server_capabilities.documentRangeFormattingProvider = false
      client.server_capabilities.textDocumentSync = vim.lsp.protocol.TextDocumentSyncKind.None
    end
  end,
})

vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*",
  callback = function()
    local filename = vim.api.nvim_buf_get_name(0)
    local ok = os.rename(filename, filename) -- tenta renomear o próprio arquivo (simula acesso exclusivo)
    if not ok then
      vim.cmd("silent! write!") -- força o salvamento
      vim.notify("⚠ Arquivo estava bloqueado. Usado :w!", vim.log.levels.WARN)
    end
  end,
})