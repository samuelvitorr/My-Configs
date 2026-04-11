return {
  "kndndrj/nvim-dbee",
  dependencies = {
    "stevearc/dressing.nvim",
    "nvim-lua/plenary.nvim",
  },
  build = "./make.sh",
  config = function()
    require("dbee").setup()
  end,
  keys = {
    { "<leader>db", "<cmd>DBeeToggle<cr>", desc = "Toggle DBee" },
  },
}
