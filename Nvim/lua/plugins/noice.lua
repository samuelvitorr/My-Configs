return {
  {
    "folke/noice.nvim",
    opts = {
      notify = {
        enabled = true,
      },
      presets = {
        bottom_search = true,
        command_palette = false,
        long_message_to_split = false,
        inc_rename = false,
        lsp_doc_border = false,
      },
      cmdline = {
        view = "cmdline",
      },
    },
  },
}
