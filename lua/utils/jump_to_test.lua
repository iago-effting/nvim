local M = {}

function M.create_test_file_with_skeleton()
  local current_file = vim.fn.expand("%:p")
  if not current_file:match("%.ex$") then
    vim.notify("Esse comando deve ser usado em um arquivo .ex", vim.log.levels.WARN)
    return
  end

  local test_file = current_file:gsub("/lib/", "/test/"):gsub("%.ex$", "_test.exs")
  local test_exists = vim.fn.filereadable(test_file) == 1

  if test_exists then
    vim.cmd("edit " .. test_file)
    vim.notify("Arquivo de teste já existe", vim.log.levels.INFO)
    return
  end

  -- Cria diretórios se necessário
  vim.fn.mkdir(vim.fn.fnamemodify(test_file, ":h"), "p")

  -- Deriva nome do módulo
  local relative = vim.fn.fnamemodify(test_file, ":t:r") -- ex1_test
  local module_name = relative:gsub("_test$", ""):gsub("^%l", string.upper)

  -- Conteúdo do teste
  local skeleton = {
    "defmodule " .. module_name .. "Test do",
    "  use ExUnit.Case, async: true",
    "",
    "  describe \"\" do",
    "    test \"\" do",
    "      assert true",
    "    end",
    "  end",
    "end",
  }

  -- Escreve o conteúdo no arquivo
  local fd = io.open(test_file, "w")
  for _, line in ipairs(skeleton) do
    fd:write(line .. "\n")
  end
  fd:close()

  -- Abre o novo arquivo de teste
  vim.cmd("edit " .. test_file)
  vim.notify("Arquivo de teste criado com esqueleto", vim.log.levels.INFO)
end

return M
