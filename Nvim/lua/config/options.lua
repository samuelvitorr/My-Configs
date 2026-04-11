-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- Mason PATH
vim.env.PATH = vim.env.PATH .. ":" .. vim.fn.stdpath("data") .. "/mason/bin"

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
vim.opt.scrolloff = 10
vim.opt.sidescrolloff = 8

-- Histórico e undo
vim.opt.history = 1000
vim.opt.undofile = true

-- Encoding
vim.opt.fileencoding = "utf-8"

-- Atualização mais rápida
vim.opt.updatetime = 300
vim.opt.timeoutlen = 500

-- Cursor em bloco
vim.opt.guicursor = { 'a:ver25' }

-- Desativar sons
vim.opt.errorbells = false
vim.opt.visualbell = false

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
