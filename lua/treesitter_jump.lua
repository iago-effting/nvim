local M = {}

local ts_utils = require("nvim-treesitter.ts_utils")

-- Nós que queremos considerar como "saltáveis"
local target_types = {
  function_definition = true,
  call = true,
  module = true,
  def = true,
  defp = true,
  defmodule = true,
  attribute = true,
}

local function is_target_node(node)
  return node and target_types[node:type()]
end

function M.jump_next()
  local cursor_node = ts_utils.get_node_at_cursor()
  if not cursor_node then return end

  local root = ts_utils.get_root_for_node(cursor_node)
  if not root then return end

  local start_row = cursor_node:start()

  local function find_next(node)
    for child in node:iter_children() do
      if child:start() > start_row and is_target_node(child) then
        return child
      end
      local nested = find_next(child)
      if nested then return nested end
    end
  end

  local target = find_next(root)

  if target then
    local row, col = target:start()
    vim.api.nvim_win_set_cursor(0, { row + 1, col + 1 })
  else
    vim.notify("Nenhum próximo bloco encontrado.", vim.log.levels.INFO)
  end
end

-- pula para o corpo do primeiro nó pai que seja módulo ou função
function M.jump_inside()
  local node = ts_utils.get_node_at_cursor()
  while node do
    local type = node:type()
    if type == "function" or type == "def" or type == "defp" or type == "defmodule" or type == "describe" then
      local start_row, start_col, end_row, end_col = node:range()
      for child in node:iter_children() do
        local child_row = child:start()
        if child_row > start_row then
          vim.api.nvim_win_set_cursor(0, { child_row + 1, 1 })
          return
        end
      end
      vim.api.nvim_win_set_cursor(0, { start_row + 2, 1 })
      return
    end
    node = node:parent()
  end
  vim.notify("Nenhum módulo ou função encontrado", vim.log.levels.INFO)
end

return M
