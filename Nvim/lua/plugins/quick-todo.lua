return {
  "SyedAsimShah1/quick-todo.nvim",
  cmd = "QuickTodo",
  keys = {
    { "<leader>qt", "<cmd>QuickTodo<CR>", desc = "Quick Todo" },
  },
  opts = {
    window = {
      height = 0.5,
      width = 0.5,
      winblend = 0,
      border = "rounded",
    },
  },
  config = function(_, opts)
    require("quick-todo").setup(opts)
  end,
}
