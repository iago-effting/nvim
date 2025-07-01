local M = {}
M.enabled = false

local group = vim.api.nvim_create_augroup("AutoRunTests", { clear = true })

function M.enable()
  if M.enabled then return end
  M.enabled = true
  vim.notify("AutoTest: ativado", vim.log.levels.INFO)

  vim.api.nvim_create_autocmd("BufWritePost", {
    group = group,
    pattern = "*_test.exs",
    callback = function()
      require("neotest").run.run(vim.fn.expand("%"))
    end,
    desc = "Executar teste automaticamente ao salvar",
  })
end

function M.disable()
  if not M.enabled then return end
  M.enabled = false
  vim.notify("AutoTest: desativado", vim.log.levels.INFO)
  vim.api.nvim_clear_autocmds({ group = group })
end

function M.toggle()
  if M.enabled then
    M.disable()
  else
    M.enable()
  end
end

return M
