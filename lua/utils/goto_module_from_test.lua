local M = {}

function M.from_test_file()
  local path = vim.fn.expand("%:p") -- caminho completo do buffer atual

  if not path:match("/test/") or not path:match("_test%.exs$") then
    vim.notify("Este não parece ser um arquivo de teste", vim.log.levels.WARN)
    return
  end

  local module_path = path
    :gsub("/test/", "/lib/")
    :gsub("_test%.exs$", ".ex")

  -- Cria diretórios se necessário
  local dir = vim.fn.fnamemodify(module_path, ":h")
  if vim.fn.isdirectory(dir) == 0 then
    vim.fn.mkdir(dir, "p")
  end

  -- Cria arquivo vazio se não existir
  if vim.fn.filereadable(module_path) == 0 then
    local fd = io.open(module_path, "w")
    if fd then fd:close() end
    vim.notify("Arquivo criado: " .. module_path, vim.log.levels.INFO)
  end

  vim.cmd("edit " .. module_path)
end

return M
