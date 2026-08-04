return {
  "nvzone/timerly",
  dependencies = "nvzone/volt",
  cmd = "TimerlyToggle",
  keys = {
    { "<leader>T", "<cmd>TimerlyToggle<CR>", desc = "Timerly Toggle" },
  },
  init = function()
    vim.api.nvim_create_user_command("Timer", function()
      vim.o.showtabline = 0
      vim.o.laststatus = 0
      vim.wo.number = false
      vim.o.scl = "no"
      vim.o.cmdheight = 0
      vim.cmd("TimerlyToggle")
    end, {})
  end,
  opts = {},
}
