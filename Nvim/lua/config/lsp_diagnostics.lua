-- Configuração global dos diagnósticos
vim.diagnostic.config({
  virtual_text = {
    prefix = "●",          -- símbolo antes do texto (pode trocar para "" ou "")
    source = "always",     -- sempre mostrar a origem (ex.: Pyright)
    spacing = 2,           -- espaço entre código e texto
    severity = nil,        -- mostra todos os níveis
  },
  signs = true,            -- ícones na coluna lateral
  underline = true,        -- sublinhar o erro no código
  update_in_insert = false,-- não atualizar em modo insert
  severity_sort = true,    -- ordenar por gravidade
})

-- Ícones personalizados para erros, avisos, etc.
local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

-- Mostrar popup automaticamente quando parar o cursor
vim.o.updatetime = 250 -- milissegundos parado para abrir
vim.cmd([[
  autocmd CursorHold * lua vim.diagnostic.open_float(nil, { focus = false, scope = "cursor" })
]])

-- Configuração LSP (exemplo com Pyright)
local lspconfig = require("lspconfig")

lspconfig.pyright.setup({
  capabilities = require('cmp_nvim_lsp').default_capabilities(),
  on_attach = function(client, bufnr)
    -- Atalhos úteis
    local opts = { noremap=true, silent=true, buffer=bufnr }
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
    vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
    vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
  end,
})

