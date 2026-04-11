-- Configuração do sistema de diagnósticos do Neovim
vim.diagnostic.config({
  virtual_lines = false, -- não mostrar linhas virtuais
  virtual_text = false,  -- não mostrar texto virtual
  underline = true,      -- sublinhar erros/avisos
  signs = true,          -- mostrar sinais na coluna lateral
  float = {
    border = "single",
    format = function(diagnostic)
      local code = diagnostic.code
      if not code and diagnostic.user_data and diagnostic.user_data.lsp then
        code = diagnostic.user_data.lsp.code
      end
      return string.format(
        "%s (%s)%s",
        diagnostic.message,
        diagnostic.source or "LSP",
        code and (" [" .. code .. "]") or ""
      )
    end,
  },
})

