return {
  {
    "goolord/alpha-nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    event = "VimEnter",
    config = function()
      local alpha = require("alpha")
      local dashboard = require("alpha.themes.dashboard")

      -- Define o highlight customizado para a logo usando a cor do Catppuccin Pink
      vim.api.nvim_set_hl(0, "AlphaLogo", { fg = "#f5c2e7", bold = true })

      dashboard.section.header.val = {
        "███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗",
        "████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║",
        "██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║",
        "██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║",
        "██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║",
        "╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝",
        "",
        "                   [ @samuelvitorr ]              ",
      }

      -- Aplica o highlight customizado na logo
      dashboard.section.header.opts.hl = "AlphaLogo"

      dashboard.section.buttons.val = {
        dashboard.button("f", "  Find file", ":Telescope find_files<CR>"),
        dashboard.button("n", "  New file", ":ene <BAR> startinsert <CR>"),
        dashboard.button("r", "  Recent files", ":Telescope oldfiles<CR>"),
        dashboard.button("g", "  Find text", ":Telescope live_grep<CR>"),
        dashboard.button("c", "  Config", ":e $MYVIMRC <CR>"),
        dashboard.button("q", "  Quit", ":qa<CR>"),
      }

      dashboard.section.footer.val = "Samuel Vitor ✨   LazyVim Ready"
      dashboard.section.footer.opts.hl = "Constant"

      alpha.setup(dashboard.config)
    end,
  },

  -- Força desativação do snacks_picker
  { import = "lazyvim.plugins.extras.editor.snacks_picker", enabled = false },

  -- Também desativa o mini.starter se estiver presente
  { "nvim-mini/mini.starter", enabled = false },
}



