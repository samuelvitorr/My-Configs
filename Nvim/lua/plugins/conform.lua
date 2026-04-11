return {
  "stevearc/conform.nvim",
  event = { "BufReadPre", "BufNewFile" },
  opts = {
    notify_on_error = false,
    -- No LazyVim, evite definir format_on_save manualmente aqui, 
    -- a menos que queira forçar um comportamento diferente do padrão da distro.
    -- O lsp_fallback: true abaixo garante que o LSP assuma se o formatador falhar.
    default_format_opts = {
      lsp_format = "fallback",
    },

    formatters_by_ft = {
      lua = { "stylua" },
      python = { "ruff_format" },
      javascript = { "prettier" },
      typescript = { "prettier" },
      typescriptreact = { "prettier" },
      javascriptreact = { "prettier" },
      svelte = { "prettier" },
      json = { "prettier" },
      html = { "prettier" },
      css = { "prettier" },
      scss = { "prettier" },
      yaml = { "prettier" },
      markdown = { "prettier" },
      sh = { "shfmt" },
      rust = { "rustfmt" },
      -- Removidos formatadores que estavam dando erro de "not found" no seu log
    },

    formatters = {
      prettier = {
        -- 'condition' é mais eficaz que 'precondition' para detectar se o projeto usa Prettier
        condition = function(self, ctx)
          return vim.fs.find({
            ".prettierrc",
            ".prettierrc.json",
            ".prettierrc.yml",
            ".prettierrc.yaml",
            ".prettierrc.js",
            "prettier.config.js",
            "prettier.config.cjs",
            "prettier.config.mjs",
            "package.json",
          }, { path = ctx.filename, upward = true })[1] ~= nil
        end,
      },
    },
  },
}