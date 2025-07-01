local M = {}

function M.guess_module_name()
  local filepath = vim.fn.expand("%:p") -- caminho absoluto
  local parts = {}

  -- pega o que está depois de lib/ ou test/
  local relevant = filepath:match("/[lt]ib/(.+)%.exs?$") or filepath:match("/test/(.+)%.exs?$")
  if not relevant then
    return "MyModule"
  end

  for part in string.gmatch(relevant, "[^/]+") do
    table.insert(parts, part)
  end

  -- remove _test se estiver no fim
  local last = parts[#parts]:gsub("%.exs$", "")
  last = last:gsub("_test$", "")
  parts[#parts] = last

  -- transforma snake_case em PascalCase
  for i, part in ipairs(parts) do
    parts[i] = part:gsub("(%w)([%w_]*)", function(a,b)
      return string.upper(a) .. b:gsub("_%w", function(x)
        return x:sub(2,2):upper()
      end)
    end)
  end

  return table.concat(parts, ".")
end

function M.get_current_function_signature()
  local line = vim.api.nvim_get_current_line()
  local func_name = line:match("^%s*defp?%s+([%w_]+)")
  local args = line:match("^%s*defp?%s+[%w_]+%((.-)%)")
  if not func_name then return "alguma_função" end

  local arity = 0
  if args then
    for _ in args:gmatch("[^,]+") do arity = arity + 1 end
  end

  return string.format("%s/%d", func_name, arity)
end


return M
