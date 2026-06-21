# .zshrc
# Personal shell config. Nothing fancy, just the stuff I actually use.
# -- ML

# --- History ---
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt SHARE_HISTORY
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE

# --- Prompt ---
autoload -Uz vcs_info
precmd() { vcs_info }
zstyle ':vcs_info:git:*' formats ' (%b)'
setopt PROMPT_SUBST
PROMPT='%F{cyan}%n@%m%f %F{yellow}%~%f%F{green}${vcs_info_msg_0_}%f %# '

# --- Completion ---
autoload -Uz compinit
compinit
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

# --- Aliases ---
alias ll='ls -lah'
alias la='ls -A'
alias l='ls -CF'
alias grep='grep --color=auto'
alias ..='cd ..'
alias ...='cd ../..'

# Networking shortcuts -- IT life
alias myip='curl -s ifconfig.me'
alias ports='netstat -tulanp'
alias pingg='ping -c 4 8.8.8.8'

# Quick subnet calc lookup (see subnet-calc repo)
alias subcalc='python3 ~/projects/subnet-calc/subnet_calc.py'

# --- Editor ---
export EDITOR='vim'
export VISUAL='vim'

# --- Path ---
export PATH="$HOME/.local/bin:$PATH"

# --- Misc ---
setopt AUTO_CD
setopt CORRECT
DISABLE_AUTO_TITLE="true"

# Load local overrides if present (not tracked in this repo)
[ -f ~/.zshrc.local ] && source ~/.zshrc.local
