return {
  "frabjous/knap",
  event = "VeryLazy",
  config = function()
    vim.g.knap_settings = {
      markdownengine = "pandoc",
      mdtohtmlcommand = "pandoc -s -t html5 --self-contained",
      htmltohtmlcommand = "cat",
      textomarkdowncommand = "pandoc -s -f html -t markdown",
      markdowntohtmlcommand = "pandoc -s -t html5",
      delay = 500,
    }
  end,
  keys = {
    { "<leader>kp", function() require("knap").toggle_preview() end, desc = "Toggle preview" },
    { "<leader>kj", function() require("knap").jump_to_preview() end, desc = "Jump to preview" },
  },
}
