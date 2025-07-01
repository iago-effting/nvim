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
