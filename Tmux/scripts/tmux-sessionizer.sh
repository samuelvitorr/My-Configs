#!/usr/bin/env bash

set -euo pipefail

# 🔥 diretórios (zoxide + fallback)
DIRS=$(
    (
        zoxide query -l 2>/dev/null || true
        fd . ~/Documentos ~/Projetos -t d 2>/dev/null
    ) | awk '!seen[$0]++'
)

# 🚀 seleção com preview em bash (CORREÇÃO PRINCIPAL)
SELECTED=$(
    echo "$DIRS" | fzf \
        --height 100% \
        --layout reverse \
        --border \
        --prompt "🚀 Projetos: " \
        --preview "bash -c '
echo \"📁 {}\"
echo \"-------------------------\"

if [ -d \"{}/.git\" ]; then
  echo \"🌿 Git:\"
  git -C {} status -sb 2>/dev/null
  echo \"\"
fi

echo \"📂 Arquivos:\"
ls -lah {} | head -n 20
'" \
        --preview-window right:60%:wrap
)

# ❌ nada selecionado
[ -z "$SELECTED" ] && exit 0

# 🔑 nome da sessão
NAME=$(basename "$SELECTED" | tr . _)

# 🔥 cria sessão se não existir
if ! tmux has-session -t "$NAME" 2>/dev/null; then
    tmux new-session -ds "$NAME" -c "$SELECTED"
fi

# ⚡ troca para sessão
tmux switch-client -t "$NAME"
