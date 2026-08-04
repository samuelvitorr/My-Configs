return {
  "Hashino/doing.nvim",
  lazy = false,
  opts = {
    message_timeout = 2000,
    doing_prefix = "Doing: ",
    ignored_buffers = { "NvimTree" },
    show_remaining = true,
    show_messages = true,
    edit_win_config = { width = 50, height = 15, border = "rounded" },
    winbar = { enabled = false },
    store = { file_name = ".tasks", sync_tasks = false },
  },
  init = function()
    vim.api.nvim_create_autocmd("User", {
      pattern = "VeryLazy",
      once = true,
      callback = function()
        vim.schedule(function()
          local ok, doing = pcall(require, "doing")
          if not ok then
            return
          end
          local lualine_ok, lualine = pcall(require, "lualine")
          if not lualine_ok then
            return
          end
          local config = require("lualine.config").get_config()
          table.insert(config.sections.lualine_x, doing.status)
          lualine.setup(config)
        end)
      end,
    })
  end,
  keys = {
    { "<leader>da", function() require("doing").add() end, desc = "Doing Add" },
    { "<leader>de", function() require("doing").edit() end, desc = "Doing Edit" },
    { "<leader>dn", function() require("doing").done() end, desc = "Doing Done" },
    { "<leader>dt", function() require("doing").toggle() end, desc = "Doing Toggle" },
  },
}
