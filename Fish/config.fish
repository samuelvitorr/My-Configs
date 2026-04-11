if set -q TMUX
    # não mostrar neofetch no tmux
else if test "$TERM" = xterm-kitty
    fastfetch
else
    neofetch
end

function setbrilho
    # Se nenhum argumento for passado, define valores padrão
    if test (count $argv) -ge 1
        set display $argv[1]
    else
        set display 1
    end

    if test (count $argv) -ge 2
        set brilho $argv[2]
    else
        set brilho 50
    end

    # Executa o comando real
    sudo ddcutil --display $display setvcp 10 $brilho
end


if status is-interactive
    # Commands to run in interactive sessions can go here
end

fish_add_path /home/samuel/.spicetify

starship init fish | source

set SPACEFISH_PROMPT_ADD_NEWLINE false
set -gx TERM xterm-256color

alias bat='bat'

function cat
    bat --theme="Catppuccin Mocha" $argv
end

alias l="ls -la"
alias ls="eza --color=always --long --git --no-filesize --icons=always --no-time --no-user --no-permissions"
alias cd="z"
alias update="sudo pacman -Syuu"

zoxide init fish | source

export FZF_CTRL_T_OPTS="
   --style full
   --walker-skip .git,node_modules,target
   --preview 'bat -n --color=always {}'
   --bind 'ctrl-/:change-preview-window(down|hidden|)'"

export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

# pnpm
set -gx PNPM_HOME "/home/samuel/.local/share/pnpm"
if not string match -q -- $PNPM_HOME $PATH
    set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end

eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

# Added by LM Studio CLI (lms)
set -gx PATH $PATH /home/samuel/.lmstudio/bin
# End of LM Studio CLI section



#rclone mount nextcloud: ~/Nextcloud \
	#  --vfs-cache-mode full \
	#  --vfs-cache-max-size 5G \
	#  --vfs-cache-max-age 24h \
	#  --cache-dir /media/hd_ext/rclone-cache \
	#  --daemon
