-- ~/.config/nvim/lua/settings.lua
-- Configurações básicas do Neovim

-- Mostrar número das linhas
vim.opt.number = true
vim.opt.relativenumber = false

-- Espaços e tabulação
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true

-- Busca
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.incsearch = true
vim.opt.hlsearch = true

-- Aparência
vim.opt.termguicolors = true
vim.opt.signcolumn = "yes"
vim.opt.wrap = true

-- Scroll
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8

-- Histórico e undo
vim.opt.history = 1000
vim.opt.undofile = true

-- Encoding
-- vim.opt.encoding = "utf-8"
vim.opt.fileencoding = "utf-8"

-- Atualização mais rápida
vim.opt.updatetime = 300
vim.opt.timeoutlen = 500

-- Cursor em bloco
vim.opt.guicursor = { 'a:ver25' }

-- Desativar sons
vim.opt.errorbells = false
vim.opt.visualbell = false

-- Tenta manter o cursor mais ao centro no scroll
vim.opt.scrolloff = math.floor(vim.o.lines / 3)
vim.opt.sidescrolloff = 8

vim.opt.sessionoptions =
  "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"

vim.cmd("syntax on")

-- Render tabs and white spaces
vim.opt.list = true
vim.opt.listchars = "tab:>-,trail:-,lead:·,eol:¬"

-- restaura posição do cursor
vim.cmd([[
  autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") |
    \ exe "normal! g`\"" | endif
]])

-- highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank({ higroup = "IncSearch", timeout = 1000 })
  end,
})

-- Configuração dos diagnósticos (LSP)
vim.diagnostic.config({
  virtual_text = {
    prefix = "●", -- pode trocar para "■", "▎", "● " etc
    spacing = 4,
    source = "if_many", -- mostra nome do LSP se houver mais de um
  },
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = true,
})


