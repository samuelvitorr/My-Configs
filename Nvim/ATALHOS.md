# Neovim - Atalhos e Comandos

## Atalhos Globais

| Atalho | Descrição |
|--------|-----------|
| `Espaço` | Leader key |
| `jj` | Sair do modo Insert |
| `<C-s>` | Salvar arquivo |
| `<C-q>` | Salvar e sair |
| `<C-h/j/k/l>` | Navegar entre splits |

---

## Leader Shortcuts

### Arquivo e Buffers

| Atalho | Descrição |
|--------|-----------|
| `<leader>w` | Salvar arquivo |
| `<leader>h` | Limpar busca |
| `<leader>ba` | Fechar todos os buffers |
| `<leader>bd` | Fechar buffer atual |
| `<Tab>` | Próximo buffer |
| `<S-Tab>` | Buffer anterior |
| `<leader><tab>` | Alternar último buffer |

### Busca (Telescope)

| Atalho | Descrição |
|--------|-----------|
| `<leader>ff` | Buscar arquivos |
| `<leader>fg` | Grep live |
| `<leader>fb` | Listar buffers |
| `<leader>fh` | Help tags |
| `<leader>fo` | Arquivos recentes |
| `<leader>fc` | Fuzzy search no buffer |
| `<leader>fr` | Resume última busca |
| `<leader>fs` | Símbolos do documento |

### LSP e Diagnostics

| Atalho | Descrição |
|--------|-----------|
| `gd` | Ir para definição |
| `K` | Hover |
| `<leader>rn` | Renomear |
| `<leader>ca` | Code action |
| `gl` | Diagnostic float |
| `<leader>dt` | Toggle diagnostics |
| `<leader>f` | Formatar arquivo |

### Wrap e Comentários

| Atalho | Descrição |
|--------|-----------|
| `<leader>wp` | Wrap com parênteses `( )` |
| `<leader>wq` | Wrap com aspas simples `' '` |
| `<leader>wQ` | Wrap com aspas duplas `" "` |
| `<leader>ws` | Wrap com colchetes `[ ]` |
| `<leader>wc` | Wrap com chaves `{ }` |
| `<leader>wb` | Wrap com backtick \` \` |
| `<leader>wh` | Wrap com `< >` |

### Visual

| Atalho | Descrição |
|--------|-----------|
| `<leader>ww` | Toggle softwrap |
| `<leader>ss` | Toggle spell check |

---

## Plugins

### Neo-tree

| Atalho | Descrição |
|--------|-----------|
| `<leader>e` | Toggle Neo-tree |

### Telescope

| Atalho | Descrição |
|--------|-----------|
| `<leader>ff` | Find files |
| `<leader>fg` | Live grep |
| `<leader>fb` | Buffers |
| `<leader>fh` | Help tags |
| `<leader>fo` | Oldfiles |
| `<leader>fc` | Fuzzy current buffer |
| `<leader>fr` | Resume |
| `<leader>fs` | Document symbols |

### LazyGit

| Atalho | Descrição |
|--------|-----------|
| `<leader>gg` | Abrir LazyGit |

### Neotest

| Atalho | Descrição |
|--------|-----------|
| `<leader>tt` | Rodar teste mais próximo |
| `<leader>tf` | Rodar testes do arquivo |
| `<leader>ts` | Toggle resumo de testes |

### Todo Comments

| Atalho | Descrição |
|--------|-----------|
| `<leader>td` | Lista de todos |

### KNAP (Markdown Preview)

| Atalho | Descrição |
|--------|-----------|
| `<leader>kp` | Toggle preview |
| `<leader>kj` | Pular para preview |

### DBee (Database)

| Atalho | Descrição |
|--------|-----------|
| `<leader>db` | Toggle DBee |

---

## Comandos Vim

| Comando | Descrição |
|---------|-----------|
| `:w` | Salvar |
| `:q` | Sair |
| `:wq` | Salvar e sair |
| `:qa` | Sair todos |
| `:bdelete` | Fechar buffer |
| `:CloseAllBuffers` | Fechar todos buffers |
| `:ReloadConfig` | Recarregar config |
| `:Neotree` | Comandos Neo-tree |
| `:LazyGit` | Abrir LazyGit |
| `:TodoTelescope` | Lista todos |

---

## Spell Check

Idiomas configurados: `pt_br`, `pt`, `en_us`, `en`

---

## Estrutura de Arquivos

```
nvim/
├── init.lua
├── lua/
│   ├── config/
│   │   ├── init.lua
│   │   ├── lazy.lua
│   │   ├── options.lua
│   │   ├── keymaps.lua
│   │   ├── lsp.lua
│   │   ├── theme.lua
│   │   └── utils.lua
│   └── plugins/
│       └── *.lua
├── config_files/
│   ├── stylua.toml
│   └── prettierrc.json
└── spell/
```

---

## Configurações do Tema

- **Tema**: Catppuccin Mocha
- **Estilo**: Dark
