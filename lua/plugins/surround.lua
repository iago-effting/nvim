return {
  {
    "kylechui/nvim-surround",
    version = "*", -- usa sempre a versão mais recente estável
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup({
        keymaps = {
            normal = "<leader>s",     -- add surround
            normal_cur = "<leader>ss",-- surround word under cursor
            normal_line = "<leader>sl",
            normal_cur_line = "<leader>sll",
            visual = "<leader>s",     -- surround selection
            delete = "<leader>sd",    -- delete surround
            change = "<leader>sc",    -- change surround
        }
    })
    end,
  },
}
