#!/usr/bin/env bash
# Guarda contra arquivo de save corrompido (vazio) do tmux-resurrect.
# Se `last` aponta para um save vazio, re-aponta para o save nao-vazio mais
# recente. Se nao existir nenhum save valido, remove `last`: o restore entao
# nao roda e a sessao inicial sobrevive (sem tmux[exited]).
dir="${HOME}/.tmux/resurrect"
last="${dir}/last"
[ -e "$last" ] || exit 0
[ -s "$last" ] && exit 0

corrupt="$(basename "$(readlink "$last" 2>/dev/null)")"
prev="$(find "$dir" -maxdepth 1 -name 'tmux_resurrect_*.txt' -type f -size +0c \
        ! -name "$corrupt" -printf '%T@\t%p\n' 2>/dev/null | sort -rn | head -1 | cut -f2-)"
if [ -n "$prev" ]; then
    ln -sf "$(basename "$prev")" "$last"
else
    rm -f "$last"
fi
exit 0
