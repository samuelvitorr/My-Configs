-- ~/.config/nvim/lua/plugins/neotree.lua
return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },

  config = function()
    -- Proteção contra erros em reloads
    local ok, neotree = pcall(require, "neo-tree")
    if not ok then
      return
    end

    neotree.setup({

      ------------------------------------------------------------------
      -- COMPORTAMENTO GERAL
      ------------------------------------------------------------------
      close_if_last_window = false, -- nunca fechar o nvim
      open_on_setup = false,
      open_on_setup_file = false,
      use_popups_for_input = false, -- evita bugs de janela

      ------------------------------------------------------------------
      -- FILESYSTEM
      ------------------------------------------------------------------
      filesystem = {
        hijack_netrw = false,
        filtered_items = {
          visible = false,
          hide_dotfiles = true,
          hide_gitignored = true,
        },
        follow_current_file = {
          enabled = true,
        },
        use_libuv_file_watcher = true,
      },

      ------------------------------------------------------------------
      -- JANELA
      ------------------------------------------------------------------
      window = {
        position = "left",
        width = 25,
        auto_expand_width = false,

        mappings = {
          ["<space>"] = "toggle_node",
          ["<cr>"] = "open",
          ["S"] = "open_split",
          ["s"] = "open_vsplit",
          ["q"] = "close_window",
        },
      },

      ------------------------------------------------------------------
      -- APARÊNCIA
      ------------------------------------------------------------------
      default_component_configs = {
        icon = {
          folder_closed = "",
          folder_open = "",
          folder_empty = "",
        },
        git_status = {
          symbols = {
            added     = "✚",
            modified  = "",
            deleted   = "✖",
            renamed   = "󰁕",
            untracked = "",
            ignored   = "",
            unstaged  = "󰄱",
            staged    = "",
            conflict  = "",
          },
        },
      },

      ------------------------------------------------------------------
      -- EVENTOS (CORREÇÃO DO BUG DE WINDOW ID)
      ------------------------------------------------------------------
      event_handlers = {
        {
          event = "neo_tree_window_after_open",
          handler = function()
            -- Impede restauração de janelas inválidas
            vim.cmd("stopinsert")
          end,
        },
      },
    })

    --------------------------------------------------------------------
    -- MAPEAMENTO SEGURO (NÃO USAR toggle)
    --------------------------------------------------------------------
    vim.keymap.set("n", "<leader>e", function()
      if vim.bo.filetype == "neo-tree" then
        pcall(vim.cmd, "Neotree close")
      else
        pcall(vim.cmd, "Neotree reveal")
      end
    end, { desc = "Neo-tree (safe toggle)" })
  end,
}
