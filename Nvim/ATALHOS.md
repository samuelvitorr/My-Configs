# Neovim — Atalhos e Comandos

## Sistema

| Item | Configuração |
|---|---|
| Base | LazyVim |
| Leader | `Espaço` |
| Shell | fish (`set -gx TERM tmux-256color`) |
| Tmux | prefix `C-s`, default-terminal `tmux-256color` |
| Terminal | kitty (truecolor, graphics protocol) |
| Tema | Catppuccin Mocha (auto theme) |

## Atalhos Globais

| Atalho | Modo | Descrição |
|--------|------|-----------|
| `jj` | i | Sair do modo Insert |
| `<C-s>` | n,i | Salvar arquivo |
| `<C-q>` | n,i | Salvar e sair |
| `<C-h/j/k/l>` | n | Navegar entre splits |
| `+` / `-` | n | Incrementar/decrementar número |

## Leader Shortcuts

### Arquivos e Buffers

| Atalho | Descrição |
|--------|-----------|
| `<leader>w` | Salvar arquivo |
| `<leader>h` | Limpar busca (nohlsearch) |
| `<leader>ba` | Fechar todos os buffers |
| `<leader>bd` | Fechar buffer atual |
| `<leader>bu` | Reabrir último buffer |
| `<Tab>` | Próximo buffer |
| `<S-Tab>` | Buffer anterior |
| `<leader><tab>` | Alternar último buffer |

### Busca (Snacks Picker)

| Atalho | Descrição |
|--------|-----------|
| `<leader>ff` | Find files |
| `<leader>fg` | Git files |
| `<leader>fb` | Buffers |
| `<leader>fc` | Find config file |
| `<leader>fp` | Projects |
| `<leader>fr` | Recent files |
| `<leader><space>` | Buffers |
| `<leader>,` | Smart find |
| `<leader>/` | Grep |
| `<leader>:` | Command history |
| `<leader>ht` | Colorschemes |

### Grep e Texto

| Atalho | Descrição |
|--------|-----------|
| `<leader>sg` | Grep (live) |
| `<leader>sb` | Buffer lines |
| `<leader>sB` | Grep open buffers |
| `<leader>sw` | Grep word under cursor |
| `<leader>fc` | Fuzzy current buffer (Telescope) |
| `<leader>fo` | Oldfiles (Telescope) |

### LSP e Diagnostics

| Atalho | Descrição |
|--------|-----------|
| `gd` | Ir para definição |
| `gD` | Ir para declaração |
| `gr` | Referências |
| `gI` | Implementações |
| `gy` | Type definition |
| `K` | Hover |
| `<leader>rn` | Renomear |
| `<leader>ca` | Code action |
| `gl` | Diagnostic float |
| `<leader>dt` | Toggle diagnostics |
| `<leader>f` | Format file (conform) |

### Git

| Atalho | Descrição |
|--------|-----------|
| `<leader>gg` | LazyGit |
| `<leader>gb` | Git branches |
| `<leader>gl` | Git log |
| `<leader>gL` | Git log line |
| `<leader>gs` | Git status |
| `<leader>gS` | Git stash |
| `<leader>gd` | Git diff (hunks) |
| `<leader>gf` | Git log file |

### Visual / Wrap

| Atalho | Modo | Descrição |
|--------|------|-----------|
| `<leader>wp` | v | Wrap parênteses `( )` |
| `<leader>wq` | v | Wrap aspas simples `' '` |
| `<leader>wQ` | v | Wrap aspas duplas `" "` |
| `<leader>ws` | v | Wrap colchetes `[ ]` |
| `<leader>wc` | v | Wrap chaves `{ }` |
| `<leader>wb` | v | Wrap backtick `` ` `` |
| `<leader>wh` | v | Wrap HTML `< >` |
| `<leader>ww` | n | Toggle softwrap |
| `<leader>ss` | n | Toggle spell check |

## Plugins

### Neo-tree (Explorer)

| Atalho | Descrição |
|--------|-----------|
| `<leader>e` | Toggle Neo-tree |

### Telescope (fallback)

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

### Quick Todo

| Atalho | Descrição |
|--------|-----------|
| `<leader>qt` | Abrir lista de tarefas |
| `:QuickTodo` | Comando |

### Doing (task na statusline)

| Atalho | Descrição |
|--------|-----------|
| `<leader>da` | Adicionar tarefa |
| `<leader>de` | Editar tarefa |
| `<leader>dn` | Marcar como done |
| `<leader>dt` | Toggle conclusão |

### Dooing (task manager)

| Atalho | Descrição |
|--------|-----------|
| `<leader>td` | Abrir/fechar gerenciador |
| `:Dooing` | Comando |

### Timerly (Pomodoro)

| Atalho | Descrição |
|--------|-----------|
| `:Timer` | Abrir timer (esconde UI) |
| `:TimerlyToggle` | Comando direto |

### Todo Comments

| Atalho | Descrição |
|--------|-----------|
| `<leader>td` | Lista de todos (Telescope) |

### OpenCode (AI)

| Atalho | Modo | Descrição |
|--------|------|-----------|
| `<C-a>` | n,x | Perguntar ao opencode |
| `<C-x>` | n,x | Selecionar ação |
| `<C-.>` | n,t | Toggle painel |
| `go` | n,x | Adicionar range |
| `goo` | n | Adicionar linha |
| `<S-C-u>` | n | Scroll up |
| `<S-C-d>` | n | Scroll down |

### KNAP (Markdown Preview)

| Atalho | Descrição |
|--------|-----------|
| `<leader>kp` | Toggle preview |
| `<leader>kj` | Pular para preview |

### DBee (Database)

| Atalho | Descrição |
|--------|-----------|
| `<leader>db` | Toggle DBee |
| `:DBeeToggle` | Comando |

### Oil (File manager)

| Atalho | Descrição |
|--------|-----------|
| `-` | Abrir diretório pai |

### Which-key

| Atalho | Descrição |
|--------|-----------|
| `<leader>?` | Mostrar keymaps do buffer |

### Session

| Comando | Descrição |
|---------|-----------|
| `:SessionSave` | Salvar sessão |
| `:SessionRestore` | Restaurar sessão |
| `:SessionDelete` | Deletar sessão |

## Notificações

```
vim.notify() → Noice (routes + UI) → nvim-notify (renders)
LspProgress  → fidget (spinner) + snacks.notifier (popup)
vim.ui.select / vim.ui.input → Snacks
```

## Comandos Úteis

| Comando | Descrição |
|---------|-----------|
| `:w` | Salvar |
| `:q` | Sair |
| `:wq` | Salvar e sair |
| `:qa` | Sair todos |
| `:bdelete` | Fechar buffer |
| `:CloseAllBuffers` | Fechar todos buffers |
| `:ReloadConfig` | Recarregar config |
| `:Notify <msg> [level] [timeout]` | Testar notificação |
| `:CountWords` | Contar palavras no buffer |
| `:WrapIn <left> [right]` | Envolver seleção com caracteres |
| `:checkhealth` | Verificar status do sistema |
| `:Lazy` | Gerenciar plugins |
| `:Mason` | Gerenciar LSP/formatters |
| `:Telescope` | Buscas |
| `:Neotree` | Explorador de arquivos |
| `:LazyGit` | Git GUI |
| `:TodoTelescope` | Lista todos |
| `:QuickTodo` | Lista de tarefas |
| `:Dooing` | Gerenciador de tarefas |
| `:Timer` | Pomodoro |
| `:TimerlyToggle` | Alternar timer |
| `:DBeeToggle` | Database browser |

## Estrutura

```
~/.config/nvim/
├── init.lua
├── lazyvim.json
├── lazy-lock.json
├── stylua.toml
├── README.md
├── ATALHOS.md
├── spell/              # Dicionários (pt_BR, pt, en_US, en)
├── config_files/       # Configs externas (stylua, prettier)
└── lua/
    ├── config/
    │   ├── init.lua    # Bootstrap
    │   ├── lazy.lua    # Lazy.nvim setup
    │   ├── options.lua # Editor options
    │   ├── keymaps.lua # Keymaps custom
    │   ├── lsp.lua     # LSP config
    │   ├── theme.lua   # Theme overrides
    │   └── utils.lua   # Utility functions
    └── plugins/        # Plugin configs (one per file)
```

## Spell Check

Idiomas: `pt_br`, `pt`, `en_us`, `en`
Toggle: `<leader>ss`
