source /usr/share/defaults/etc/profile
export PATH=$PATH:$HOME/.local/bin:$HOME/ghq/github.com/rupa/z

neofetch

. $HOME/ghq/github.com/rupa/z/z.sh

# Use bash-completion, if available
[[ $PS1 && -f /usr/share/bash-completion/bash-completion ]] && \
	. /usr/share/bash-completion/bash-completion

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

#### Aliases ####

alias g="git"
alias v="nvim"

alias ls="exa -1lGF --icons --group-directories-first"
alias la="exa -1lGF --all --all --icons --group-directories-first"

alias ~="cd ~"
alias ..="cd .."
alias ...="cd ../.."
alias c="clear"
alias x="exit"

alias df="/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"
