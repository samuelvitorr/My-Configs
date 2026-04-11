-- lua/plugins/formatter.lua
return {
  {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },
    opts = {
      formatters_by_ft = {
        -- ✅ JavaScript/TypeScript usando Prettier padrão
        javascript = { "prettier" },
        typescript = { "prettier" },
        javascriptreact = { "prettier" },
        typescriptreact = { "prettier" },
        vue = { "prettier" },
        css = { "prettier" },
        scss = { "prettier" },
        less = { "prettier" },
        html = { "prettier" },
        json = { "prettier" },
        yaml = { "prettier" },
        markdown = { "prettier" },
        graphql = { "prettier" },

        -- ✅ Lua usando Stylua com config personalizado
        lua = { "stylua" },

        -- ✅ Python usando múltiplos formatadores (Ruff)
        python = {
          "ruff_fix",               -- auto-fixável
          "ruff_format",           -- formatador
          "ruff_organize_imports", -- organizar imports
        },

        -- ✅ Outros
        sh = { "shfmt" },
        rust = { "rustfmt" },
        java = { "google-java-format" },
        toml = { "taplo" },
        php = { "php-cs-fixer" },      -- você pode substituir ou remover se quiser
        ruby = { "rubocop" },          -- ou "rufo" se preferir
      },

      -- ✅ Exemplo: Stylua com config personalizado (opcional)
      formatters = {
        stylua = {
          command = "stylua",
          args = {
            "--respect-ignores",
            "--stdin-filepath",
            "$FILENAME",
            "--config-path",
            os.getenv("HOME") .. "/dotfiles/nvim/config_files/stylua.toml",
            "-",
          },
        },
      },

      -- ✅ Opções extras
      format_on_save = {
        timeout_ms = 500,
        lsp_fallback = "fallback",
      },
      notify_on_error = true,
      notify_no_formatters = true,
      log_level = vim.log.levels.ERROR,

      -- ✅ Impede herança de outras configs se estiver usando LazyVim
      inherit = false,
    },
  },
}

