# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time Oh My Zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

plugins=(git)

source $ZSH/oh-my-zsh.sh
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# History configuration
HISTFILE=~/.zsh_history
HISTSIZE=1000
SAVEHIST=2000
setopt append_history
setopt extended_history
setopt share_history
setopt hist_ignore_all_dups
setopt hist_ignore_space
export PATH=$PATH:/usr/local/bin

# Prompt configuration
autoload -Uz colors && colors

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
alias gl='git log --oneline --graph --decorate'
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
alias tree='find . -print | sed -e "s;[^/]*/;|____;g;s;____|; |;g"'

# neofetch
if command -v neofetch &> /dev/null; then
    neofetch
fi

# Bat
alias bat=batcat

# Auto CD
setopt autocd

# Completion system
autoload -Uz compinit
compinit
