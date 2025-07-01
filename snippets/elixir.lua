local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local fmt = require("luasnip.extras.fmt").fmt

local utils = require("utils.elixir_snippets")

return {
  s("modtest", fmt([[
    defmodule {}Test do
      use ExUnit.Case, async: true

      describe "{}/{}" do
        test "{}" do
          {}
        end
      end
    end
  ]], {
    f(function() return utils.guess_module_name() end),
    i(1, "function_name"),
    i(2, "arity"),
    i(3, ""),
    i(4, ""),
  })),
}
