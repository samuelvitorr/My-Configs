-- ~/.config/nvim/lua/plugins/neotree.lua
return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- ícones bonitos
    "MunifTanjim/nui.nvim",
  },
  config = function()
    require("neo-tree").setup({
      -- Não abrir automaticamente no início
      open_on_setup = false,
      open_on_setup_file = false,

      -- Configurações do filesystem
      filesystem = {
        filtered_items = {
          visible = false,       -- não mostrar arquivos ocultos
          hide_dotfiles = true,  -- esconder arquivos que começam com .
          hide_gitignored = true,-- esconder arquivos ignorados pelo git
        },
      },

      -- Mapeamentos de teclas no Neo-tree
      window = {
          width = 25,
          mappings = {
            ["<space>"] = "toggle_node",
            ["<cr>"] = "open",
            ["S"] = "open_split",
            ["s"] = "open_vsplit",
          },
        },

      -- Aparência
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
    })
  end,
}

