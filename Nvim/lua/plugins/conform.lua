return {
  "stevearc/conform.nvim",
  opts = {
    -- ✅ Aqui removemos `format_on_save` e deixamos o LazyVim controlar
    notify_on_error = false,

    formatters_by_ft = {
      lua = { "stylua" },
      python = { "black" },
      java = { "google-java-format" },
      javascript = { "prettier" },
      typescript = { "prettier" },
      typescriptreact = { "prettier" },
      javascriptreact = { "prettier" },
      json = { "prettier" },
      html = { "prettier" },
      css = { "prettier" },
      scss = { "prettier" },
      yaml = { "prettier" },
      markdown = { "prettier" },
      sh = { "shfmt" },
      php = { "php-cs-fixer" },
      ruby = { "rubocop" }, -- ou "rufo"
      rust = { "rustfmt" },
    },
  },
}

