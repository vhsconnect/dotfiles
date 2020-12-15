# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

set -o vi
shopt -s histappend
shopt -s checkwinsize

export EDITOR='nvim'
export VISUAL='nvim'
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

HISTCONTROL=ignoreboth
HISTSIZE=
HISTFILESIZE=

# AQUA="\[$(tput setaf 42)\]"
# RESET="\[$(tput sgr0)\]"

PS1='${debian_chroot:+($debian_chroot)}\[$(tput setaf 48)\]\h\[$(tput setaf 48)\]@\[$(tput setaf 48)\]\A \[$(tput setaf 11)\]\W$\[$(tput setaf 11)\]\[$(tput sgr0) '

# bash completion
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi


if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

#"alert" alias for long running commands
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

alias la='ls -A'
alias ll='ls -alF --block-size=M'
alias lss='ls -lS --block-size=M'
alias lsg='ls | grep'
alias dud='du -d 1 -h'
alias duf='du -sh *'
alias ff='find . -type f -name'
alias h='history'
alias hgrep='history | grep'
alias sgrep='grep -R -n -H -C 5 --exclude-dir={.git,.svn,.tldr,node_modules,Trash,vendor}'
alias vi='nvim `fzf`'
alias ytdl='youtube-dl -x --no-playlist'
alias cdconfig='cd ~/Repos/dotfiles/self/dotfiles/linux/ && ls -a'
alias todo='nvim ~/Documents/todo'
alias img='gthumb'
alias pdf='evince'
alias copyi='xclip -i -selection clipboard' #* 
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# fzf
export FZF_DEFAULT_COMMAND="ag --ignore /node_modules/ --ignore /.git/ --hidden -g ''"
export FZF_DEFAULT_OPTS="--height=60% --multi --preview='bat --theme=zenburn --style=numbers --color=always {}' --preview-window='hidden' --bind='ctrl-i:toggle-preview,ctrl-y:execute-silent(echo {+} | xclip -i -selection 'clipboard')' --color='bg:237,bg+:237,info:214,border:197,spinner:214' \
--color='hl:45,fg:252,header:199,fg+:45' \
--color='pointer:214,marker:233,prompt:233,hl+:214'"
export FZF_ALT_C_COMMAND="find . -type d \( -path ./.dbus -o -path ./.cache -o -path ./.gvfs \) -prune -false -o -name '*'"

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# package managers
export GEM_HOME="$HOME/gems"
export PATH="$HOME/gems/bin:$PATH"

export PATH="$HOME/.cabal/bin:$PATH"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
