return {
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = function()
      require("toggleterm").setup({
        size = 20,
        open_mapping = [[<c-\>]],
        shade_terminals = true,
        shading_factor = 2,
        start_in_insert = true,
        insert_mappings = true,
        persist_size = true,
        direction = "float",
        close_on_exit = true,
        float_opts = {
          border = "curved", -- borda arredondada
          winblend = 20,     -- transparência do terminal flutuante (0-100)
          highlights = {
            border = "Normal",
            background = "Normal",
          },
        },
      })

      -- Atalho para abrir/fechar terminal padrão toggleterm
      vim.api.nvim_set_keymap("n", "<leader>t", "<cmd>ToggleTerm<CR>", { noremap = true, silent = true })

      -- Terminal flutuante para lazygit
      local Terminal = require("toggleterm.terminal").Terminal
      local lazygit = Terminal:new({ cmd = "lazygit", hidden = true, direction = "float" })

      function _LAZYGIT_TOGGLE()
        lazygit:toggle()
      end

      vim.api.nvim_set_keymap("n", "<leader>gg", "<cmd>lua _LAZYGIT_TOGGLE()<CR>", { noremap = true, silent = true })
    end,
  },
}

