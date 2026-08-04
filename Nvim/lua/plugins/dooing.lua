return {
  "atiladefreitas/dooing",
  keys = {
    { "<leader>td", "<cmd>Dooing<CR>", desc = "Dooing Toggle" },
  },
  opts = {
    window = { width = 55, height = 20, border = "rounded", position = "center" },
    timestamp = { enabled = true },
    per_project = { enabled = true, default_filename = "dooing.json", auto_gitignore = false, on_missing = "prompt" },
    nested_tasks = { enabled = true },
    due_notifications = { enabled = true },
  },
}
