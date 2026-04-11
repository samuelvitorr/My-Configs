return {
  {
    "goolord/alpha-nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    event = "VimEnter",
    config = function()
      local alpha = require("alpha")
      local dashboard = require("alpha.themes.dashboard")

      -- Define o highlight customizado para a logo usando a cor do Catppuccin Mauve
      vim.api.nvim_set_hl(0, "AlphaLogo", { fg = "#cba6f7", bold = true })

      -- **NOVO:** Define o highlight para o texto e ícones dos botões.
      -- Usando 'Text' do Catppuccin Mocha (#cdd6f4)
      vim.api.nvim_set_hl(0, "AlphaButtons", { fg = "#cdd6f4" })

      -- A cor do footer já está definida como 'Constant' no seu código:
      -- vim.api.nvim_set_hl(0, "Constant", { fg = "#f9e2af" }) -- Se não estiver definido pelo seu tema.
      -- O tema Catppuccin Mocha deve ter 'Constant' definido, então não é necessário aqui.

      -- (O restante do seu código para a logo e botões permanece o mesmo)
      dashboard.section.header.val = {
        "███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗",
        "████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║",
        "██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║",
        "██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║",
        "██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║",
        "╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝",
        "",
        "                   [ @samuelvitorr ]              ",
      }
      dashboard.section.header.opts.hl = "AlphaLogo"

      dashboard.section.buttons.val = {
        dashboard.button("f", "  Find file", ":Telescope find_files<CR>"),
        dashboard.button("n", "  New file", ":ene <BAR> startinsert <CR>"),
        dashboard.button("r", "  Recent files", ":Telescope oldfiles<CR>"),
        dashboard.button("g", "  Find text", ":Telescope live_grep<CR>"),
        dashboard.button("c", "  Config", ":e $MYVIMRC <CR>"),
        dashboard.button("q", "  Quit", ":qa<CR>"),
      }
      -- Os botões herdarão a cor de `AlphaButtons`.

      dashboard.section.footer.val = "Samuel Vitor 🐦‍⬛ LazyVim Ready"
      dashboard.section.footer.opts.hl = "Constant" -- Usará a cor Constant do Catppuccin Mocha

      alpha.setup(dashboard.config)
    end,
  },

  -- Força desativação do snacks_picker
  { import = "lazyvim.plugins.extras.editor.snacks_picker", enabled = false },

  -- Também desativa o mini.starter se estiver presente
  { "nvim-mini/mini.starter", enabled = false },
}
