# nvim

LazyVim-based Neovim config ([@samuelvitorr](https://github.com/samuelvitorr)).

## Custom Plugins

| Plugin | Keymaps / Commands | Description |
|---|---|---|
| `quick-todo.nvim` | `<leader>qt`, `:QuickTodo` | Floating todo list |
| `doing.nvim` | `<leader>da`/`de`/`dn`/`dt` | Task tracking (add/edit/done/toggle). Status in lualine |
| `dooing` | `<leader>td` | Task manager with projects, nesting, due dates |
| `timerly` | `:Timer` or `:TimerlyToggle` | Pomodoro / stopwatch timer (hides UI) |
| `opencode.nvim` | `<C-a>` ask, `<C-x>` select, `<C-.>` toggle, `go`/`goo` operator | AI assistant (inline chat, edit, review) |

## Notification Chain

```
vim.notify() → Noice (routes + UI) → nvim-notify (renders)
LspProgress  → fidget (statusline spinner) + snacks.notifier (popup)
vim.ui.select/input → Snacks (picker / input) — Dressing disabled
```

## Keymaps

### Custom

| Key | Mode | Action |
|---|---|---|
| `<leader>qt` | n | QuickTodo open |
| `<leader>da` | n | doing: add task |
| `<leader>de` | n | doing: edit task |
| `<leader>dn` | n | doing: mark done |
| `<leader>dt` | n | doing: toggle task |
| `<leader>td` | n | dooing: task manager |
| `:Timer` | - | timerly toggle (hides UI) |
| `<C-a>` | n,x | opencode: ask |
| `<C-x>` | n,x | opencode: select action |
| `<C-.>` | n,t | opencode: toggle panel |
| `go` | n,x | opencode: add range |
| `goo` | n | opencode: add line |
| `<S-C-u>` | n | opencode: scroll up |
| `<S-C-d>` | n | opencode: scroll down |

### LazyVim defaults (partial)

| Key | Action |
|---|---|
| `<Space>` | which-key prefix |
| `gd` | LSP go to definition |
| `gr` | LSP references |
| `K` | LSP hover |
| `<leader>ff` | Find files |
| `<leader>fg` | Live grep |
| `<leader>e` | File explorer (Neo-tree) |
| `<leader>z` | Zen mode |
| `<leader>gg` | LazyGit |
| `gl` | Diagnostic float |
| `<leader>rn` | Rename |
| `<leader>ca` | Code action |

## LSP

Mason: clangd, cssls, html, jsonls, lua_ls, pyright, ruff, rust-analyzer, svelte, taplo, ts_ls, yamlls, oxfmt, stylua.

## Completion & AI

- **blink.cmp** — autocompletion (LSP, snippets, buffer, path, dadbod, codeium)
- **Codeium** — AI code completion
- **opencode.nvim** — AI assistant with inline edit, review, chat

## Formatters (conform)

prettier, stylua, ruff_format, shfmt, sqlfluff, fish_indent, ktlint, php_cs_fixer, rubocop, rustfmt.

## Colorscheme

Catppuccin Mocha (auto theme, integrations for aerial, alpha, bufferline, cmp, flash, fzf, gitsigns, lualine, mason, noice, notify, snacks, telescope, treesitter, which-key, etc).

## System Integration

- **Terminal multiplexer**: tmux 3.7 (default-terminal: tmux-256color, prefix: `C-s`)
- **Shell**: fish (`set -gx TERM tmux-256color`, starship prompt, zoxide, eza)
- **Terminal emulator**: kitty (truecolor, graphics protocol)
- **Session**: auto-session (auto-save/restore, git branch-aware)

## Notes

- Alpha dashboard enabled, Snacks dashboard disabled
- Snacks handles `vim.ui.select` (picker) and `vim.ui.input`, Dressing disabled
- Snacks notifier enabled for LspProgress popups, notify disabled (Noice handles)
- Fidget handles LspProgress spinner (does not conflict with snacks.notifier)
- Noice routes notifications, nvim-notify renders them
- DBee binary needs `:Lazy build nvim-dbee` after install
- Doing task shown in lualine, winbar disabled
- Snacks picker configured as primary picker (replaces Telescope for most UI)
