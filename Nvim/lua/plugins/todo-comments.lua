return {
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    event = "VeryLazy",
    opts = {},
    keys = {
      { "<leader>td", "<cmd>TodoTelescope<cr>", desc = "Todo list" },
    },
  },
}
