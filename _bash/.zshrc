# ~/.zshrc: executed by zsh for non-login shells

# History configuration
HISTFILE=~/.zsh_history
HISTSIZE=1000
SAVEHIST=2000
setopt append_history       # Tương đương shopt -s histappend
setopt extended_history
setopt share_history
setopt hist_ignore_all_dups
setopt hist_ignore_space
export PATH=$PATH:/usr/local/bin

# Prompt configuration
autoload -Uz colors && colors
PROMPT="%F{green}%n@%m%f:%F{blue}%~%f$ "

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
eval "$(dircolors -b)"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

# Aliases
alias ll='ls -la'
alias la='ls -A'
alias l='ls -CF'
alias cls='clear'
alias g='git'
alias home='cd ~ && echo "Welcome home!"'
alias gin='git init'
alias ga='git add'
alias gst='git status'
alias gl='git log'
alias gremote='git remote -v'
alias bye='echo "Bye!" && exit'

# Git functions
gpup() {
  current_branch=$(git rev-parse --abbrev-ref HEAD)
  
  if [ -z "$(git status --porcelain)" ]; then
    echo "✅ Nothing to commit. Pushing branch '$current_branch'..."
  else
    echo "⚠️ You have uncommitted changes. Please commit first!"
    return 1
  fi
  
  git push origin "$current_branch"
}

alias gempty='git commit --allow-empty-message'

# neofetch
if [ -z "$FASTFETCH_RAN" ]; then
    neofetch
    export FASTFETCH_RAN=1
fi

# Bat
alias bat=batcat

# Auto CD
setopt autocd

# Completion system
autoload -Uz compinit
compinit
