##################################
############# PROMPT #############
##################################

#PROMPT='%F{8}$%f '
#PROMPT='%F{243}%1~ %f%F{White}%f  '
PROMPT='%F{#888888}%1~%f %F{White}%f  '

##################################
############# BÁSICO #############
##################################

autoload -U compinit
compinit
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}'

HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.zsh_history
setopt INC_APPEND_HISTORY
setopt SHARE_HISTORY
xset r rate 300 50

##################################
############# ALIAS ##############
##################################

alias ls='ls --color=auto'
alias la='ls -a'
alias ll='ls -l'
alias lla='ls -al'
alias rm='rm -r'
alias cp='cp -r'

alias bashrc='nvim .bashrc'
alias zshconfig="nvim ~/.zshrc"
alias ohmyzsh="nvim ~/.oh-my-zsh"
alias update="sudo apt update && sudo apt upgrade"
alias remove="sudo apt autoremove"
alias neofetch="neofetch --kitty Downloads/Outros/neofetch/2.png"   
neofetch

##################################
############# COLORS #############
##################################

#LS_COLORS='rs=0:di=1;97:fi=1;90';
LS_COLORS='rs=0:di=1;94:fi=1;37:ln=1;34'
export LS_COLORS

##################################
############# EXPORT #############
##################################

export ZSH=$HOME/.oh-my-zsh

export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH=~/.cargo/bin:~/.local/bin:$PATH

##################################
############# THEME  #############
##################################

ZSH_THEME="arrow"

##################################
############# PLUGINS ############
##################################

plugins=(
  git
  colored-man-pages
)

##################################
############# SOURCE  ############
##################################

source $ZSH/oh-my-zsh.sh
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

##################################
############# EDITOR  ############
##################################

if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='nvim'
else
   export EDITOR='nvim'
fi


PATH=~/.console-ninja/.bin:$PATH