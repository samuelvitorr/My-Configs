return {
  {
    "goolord/alpha-nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    event = "VimEnter",
    config = function()
      local alpha = require("alpha")
      local dashboard = require("alpha.themes.dashboard")

      vim.api.nvim_set_hl(0, "AlphaLogo", { fg = "#cba6f7", bold = true })
      vim.api.nvim_set_hl(0, "AlphaButtons", { fg = "#cdd6f4" })

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
      dashboard.section.header.opts.hl = "AlphaLogo"

      dashboard.section.buttons.val = {
        dashboard.button("f", "  Find file", ":Telescope find_files<CR>"),
        dashboard.button("n", "  New file", ":ene <BAR> startinsert <CR>"),
        dashboard.button("r", "  Recent files", ":Telescope oldfiles<CR>"),
        dashboard.button("g", "  Find text", ":Telescope live_grep<CR>"),
        dashboard.button("c", "  Config", ":e $MYVIMRC <CR>"),
        dashboard.button("q", "  Quit", ":qa<CR>"),
      }

      dashboard.section.footer.val = "Samuel Vitor 🐦‍⬛ LazyVim Ready"
      dashboard.section.footer.opts.hl = "Constant"

      local function centered_padding()
        local height = vim.o.lines - vim.o.cmdheight - 4
        local content_height = 10
        local padding = math.max(0, math.floor((height - content_height) / 2))
        return padding
      end

      dashboard.config.opts.layout = {
        { type = "padding", val = centered_padding() },
        dashboard.section.header,
        { type = "padding", val = 1 },
        dashboard.section.buttons,
        { type = "padding", val = 1 },
        dashboard.section.footer,
      }

      dashboard.config.opts.redraw_on_resize = false

      alpha.setup(dashboard.config)

      vim.api.nvim_create_autocmd("BufEnter", {
        pattern = "alpha*",
        callback = function()
          vim.opt.scrolloff = 9999
          vim.opt.sidescrolloff = 9999
          vim.cmd([[
            nnoremap <buffer> <Up> <Nop>
            nnoremap <buffer> <Down> <Nop>
            nnoremap <buffer> <PageUp> <Nop>
            nnoremap <buffer> <PageDown> <Nop>
            nnoremap <buffer> k <Nop>
            nnoremap <buffer> j <Nop>
          ]])
        end,
      })

      vim.api.nvim_create_autocmd("BufLeave", {
        pattern = "alpha*",
        callback = function()
          vim.opt.scrolloff = 10
          vim.opt.sidescrolloff = 8
        end,
      })
    end,
  },
}
