# TMUX CONFIG — GUIA COMPLETO

Esta é uma configuração de alto nível para o **Tmux**, otimizada para desenvolvedores que buscam produtividade máxima, navegação fluida via terminal e uso intensivo de janelas flutuantes (popups).

---

## ATALHOS PRINCIPAIS (CORE)

- **Prefixo:** `Ctrl + s`
- **Recarregar Configuração:** `Prefix + r`
- **Nova Sessão (Nome Custom):** `Prefix + n`

---

## NAVEGAÇÃO INTELIGENTE

| Comando             | Atalho              | Descrição                                     |
| :------------------ | :------------------ | :-------------------------------------------- |
| **FZF Windows**     | `Prefix + Ctrl + l` | Lista janelas com busca fuzzy e preview.      |
| **Navegação Panes** | `Alt + h/j/k/l`     | Movimentação estilo Vim entre painéis.        |
| **Mouse Mode**      | Ativado             | Suporte para seleção, scroll e resize manual. |

---

## GESTÃO DE SESSÕES (SESH)

O **Sesh** integra o Tmux ao seu ecossistema de arquivos de forma poderosa.

- **Abrir Menu:** `Prefix + K`

**Controles dentro do menu Sesh:**

- `Tab` / `Shift+Tab`: Navegar na lista.
- `Ctrl + A`: Mostrar todas as sessões.
- `Ctrl + T`: Filtrar apenas sessões do Tmux.
- `Ctrl + X`: Buscar via Zoxide.
- `Ctrl + F`: Buscar via diretórios (find).
- `Ctrl + D`: Deletar sessão.

---

## SESSIONIZER (PROJETOS RÁPIDOS)

- **Atalho:** `Prefix + f`
- **O que faz:** Utiliza `zoxide` e `fd` para listar seus projetos. Ao selecionar, o Tmux cria ou anexa a sessão automaticamente com o nome da pasta.

---

## POPUPS (SUPER PODERES)

Acesse ferramentas instantaneamente sem trocar de janela ou fechar seu editor.

| Ferramenta                      | Atalho              |
| :------------------------------ | :------------------ |
| **Terminal Flutuante (Toggle)** | `Prefix + Ctrl + w` |
| **Scratch Buffer**              | `Prefix + Ctrl + n` |
| **Python REPL**                 | `Prefix + Ctrl + p` |
| **Htop**                        | `Prefix + Ctrl + h` |
| **Just (Runner)**               | `Prefix + Ctrl + x` |
| **Popup Vazio (Custom)**        | `Prefix + Ctrl + t` |
| **Yazi (File Manager)**         | `Prefix + Ctrl + y` |
| **Lazygit**                     | `Prefix + Ctrl + g` |

---

## MENU DE CONFIGURAÇÃO

Acesse seus dotfiles rapidamente com `Prefix + d`.
O menu abre um popup centralizado para editar:

- `.fish`
- `.tmux.conf`
- `.nvim`

---

## MODO DE CÓPIA (VIM STYLE)

Entre no modo com `Prefix + [`.

- **v**: Iniciar seleção visual.
- **y**: Copiar para o clipboard do sistema (`xclip`).
- **Mouse**: Seleção automática integrada.

---

## PLUGINS & PERSISTÊNCIA

Gerenciados via **TPM** (Tmux Plugin Manager):

- `tmux-sensible`: Configurações base.
- `vim-tmux-navigator`: Sincronia de movimento com Neovim.
- `tmux-resurrect / continuum`: **Auto-save** a cada 10 min e restore automático no boot.
- `tmux-battery`: Status de energia na barra.
- `tmux-sessionx`: Interface avançada de sessões.

---

## MANUTENÇÃO

- **Instalar Plugins:** `Prefix + I`
- **Atualizar Plugins:** `Prefix + U`
- **Debug:** Execute `tmux -vv new` para logs detalhados.

---

## SOLUÇÃO DE PROBLEMAS

- **Menu não funciona:** Verifique se o `run-shell` está apontando para o binário correto e se há permissão de execução.
- **Clipboard:** Certifique-se de que o `xclip` está instalado (`sudo apt install xclip`).
- **Zoxide:** A integração depende do `zoxide` estar instalado e inicializado no seu shell.

---
