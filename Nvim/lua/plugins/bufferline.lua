return {
   {
    "akinsho/bufferline.nvim",
    optional = true,
    opts = {
      options = {
        diagnostics = "nvim_lsp",
        numbers = "ordinal",
        show_buffer_close_icons = true,
        show_close_icon = false,
        offsets = {
          {
            filetype = "neo-tree",
            text = "File Explorer",
            highlight = "Directory",
            text_align = "left",
          },
        },
      },
    },
  }
}






