if set -q TMUX
    # não mostrar neofetch no tmux
else if test "$TERM" = xterm-kitty
    neofetch --kitty ~/Imagens/Icons/jGtoVFJV.jpg
else
    neofetch
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

# export PATH="$HOME/.rbenv/bin:$PATH"
# eval "$(rbenv init -)"

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
