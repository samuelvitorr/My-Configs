-- nvim/lua/plugins/lsp.lua
return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "mason-org/mason-lspconfig.nvim",
      "hrsh7th/cmp-nvim-lsp",
      {
        "folke/lazydev.nvim",
        ft = "lua",
        opts = {
          library = {
            { path = "${3rd}/luv/library", words = { "vim%.uv" } },
          },
        },
      },
    },
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      local on_attach = function(_, bufnr)
        local map = vim.keymap.set
        local opts = { buffer = bufnr, noremap = true, silent = true }

        map("n", "gd", vim.lsp.buf.definition, opts)
        map("n", "K", vim.lsp.buf.hover, opts)
        map("n", "<leader>rn", vim.lsp.buf.rename, opts)
        map("n", "<leader>ca", vim.lsp.buf.code_action, opts)
      end

      local lspconfig = require("lspconfig")

      require("mason-lspconfig").setup({
        automatic_enable = true,
        ensure_installed = {
          "ruff",
          "taplo",
          "lua_ls",
          "ts_ls",
          "pyright",
          "rust_analyzer",
          "clangd",
          "html",
          "cssls",
          "jsonls",
          "yamlls",
          "svelte",
        },
        handlers = {
          function(server_name)
            lspconfig[server_name].setup({
              on_attach = on_attach,
              capabilities = capabilities,
            })
          end,
        },
      })

      lspconfig.ruff.setup({
        on_attach = on_attach,
        capabilities = capabilities,
        settings = {
          ruff = {
            lint = {
              select = { "E", "F", "W", "I", "N", "UP", "B", "A", "C4", "C9", "ISC", "RUF", "PIE" },
              ignore = { "E501" },
            },
            format = {
              select = { "isort", "black" },
            },
          },
        },
      })
    end,
  },
}
