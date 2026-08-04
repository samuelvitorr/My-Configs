# ==============================================================================
# Fish Configuration
# ==============================================================================

# ------------------------------------------------------------------------------
# Sistema
# ------------------------------------------------------------------------------

if status is-interactive
    if set -q TMUX
        if test (tmux display-message -p '#{window_index}') = 0
            if test (tmux display-message -p '#{pane_index}') = 0
                fastfetch
            end
        end
    else
        fastfetch
    end
end

# ------------------------------------------------------------------------------
# Paths
# ------------------------------------------------------------------------------

fish_add_path ~/.local/bin
fish_add_path ~/.cargo/bin
fish_add_path ~/.spicetify
fish_add_path ~/.opencode/bin
fish_add_path ~/.mimocode/bin
fish_add_path ~/.lmstudio/bin
fish_add_path ~/.rbenv/bin

# PNPM
set -gx PNPM_HOME ~/.local/share/pnpm
fish_add_path $PNPM_HOME

# ------------------------------------------------------------------------------
# Homebrew
# ------------------------------------------------------------------------------

if test -x /home/linuxbrew/.linuxbrew/bin/brew
    eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
end

# ------------------------------------------------------------------------------
# Prompt
# ------------------------------------------------------------------------------

starship init fish | source

# ------------------------------------------------------------------------------
# Ferramentas
# ------------------------------------------------------------------------------

zoxide init fish | source

if command -sq rbenv
    rbenv init - fish | source
end

# ------------------------------------------------------------------------------
# Variáveis de ambiente
# ------------------------------------------------------------------------------

set -gx SPACEFISH_PROMPT_ADD_NEWLINE false

set -gx FZF_DEFAULT_OPTS "
--color=bg+:#1e1e2e,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8
--color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc
--color=marker:#f5e0dc,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8
--border=rounded
"

# ------------------------------------------------------------------------------
# Aliases
# ------------------------------------------------------------------------------

alias l="ls -la"

alias ls="eza \
    --color=always \
    --long \
    --git \
    --no-filesize \
    --icons=always \
    --no-time \
    --no-user \
    --no-permissions"

alias cd="z"
alias cdi="zi"

alias update="sudo pacman -Syuu"

# ------------------------------------------------------------------------------
# Funções
# ------------------------------------------------------------------------------

function cat --description "cat usando bat"
    command bat $argv
end

function setbrilho
    set display 1
    set perfil balanceado

    if test (count $argv) -ge 1
        set perfil $argv[1]
    end

    if test (count $argv) -ge 2
        set display $argv[2]
    end

    switch $perfil
        case noite
            set values 10 10 12 20 16 10 18 10 1A 10

        case quente
            set values 10 10 12 20 16 14 18 10 1A 5

        case balanceado
            set values 10 15 12 25 16 12 18 12 1A 12

        case dia
            set values 10 25 12 35 16 15 18 15 1A 15

        case '*'
            echo "Perfil inválido."
            echo "Perfis disponíveis:"
            echo "  noite"
            echo "  quente"
            echo "  balanceado"
            echo "  dia"
            return 1
    end

    echo "Aplicando perfil '$perfil' no display $display..."

    for i in (seq 1 2 (count $values))
        sudo ddcutil \
            --display $display \
            setvcp $values[$i] \
            $values[(math $i + 1)]
    end
end

# ------------------------------------------------------------------------------
# Rclone (desabilitado)
# ------------------------------------------------------------------------------

# rclone mount nextcloud: ~/Nextcloud \
#     --vfs-cache-mode full \
#     --vfs-cache-max-size 5G \
#     --vfs-cache-max-age 24h \
#     --cache-dir /media/hd_ext/rclone-cache \
#     --daemon
