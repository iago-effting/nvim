local M = {}

local function camel_to_snake_case(str)
  return str:gsub("(%u)", "_%1"):gsub("^_", ""):lower()
end

function M.from_cursor()
  local word = vim.fn.expand("<cword>")

  -- Captura Modulo.funcao ou só funcao
  local line = vim.api.nvim_get_current_line()
  local mod, func = string.match(line, "([%w%.]+)%.([%w_]+)")
  if not mod then
    mod = word
  end

  -- Caminho do arquivo do módulo
  local path = "lib/" .. camel_to_snake_case(mod:gsub("%.", "/")) .. ".ex"

  if vim.fn.filereadable(path) == 0 then
    vim.notify("Arquivo não encontrado: " .. path, vim.log.levels.WARN)
    return
  end

  -- Abre o módulo
  vim.cmd("edit " .. path)

  -- Se tiver função, procura ela
  if func then
   vim.defer_fn(function()
  local escaped = vim.fn.escape(func, "\\")
  local patterns = {
    "\\v^\\s*defp?\\s+" .. escaped .. "\\s*\\(",  -- def func(
    "\\v^\\s*defp?\\s+" .. escaped .. "\\s+do",   -- def func do
  }

  local found = false
  for _, pat in ipairs(patterns) do
    if vim.fn.search(pat, "w") > 0 then
      found = true
      break
    end
  end

  if not found then
    vim.notify("Função '" .. func .. "' não encontrada", vim.log.levels.WARN)
  end
end, 100)
  end
end

return M
