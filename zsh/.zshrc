# The following lines were added by compinstall
zstyle ':completion:*' completer _complete _ignored _correct _approximate
zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' '' '' 'l:|=* r:|=*'
zstyle :compinstall filename '/home/rrakea/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.config/zsh/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt nomatch
unsetopt autocd beep extendedglob notify
bindkey -e
# End of lines configured by zsh-newuser-install

export PATH="/home/rrakea/code/scripts:$PATH"
export PATH="/home/rrakea/.local/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/go/bin:$PATH"
export PATH="/opt/miniconda3/bin:$PATH"
export PATH="/opt/brew/bin:$PATH"
export HELIX_RUNTIME=~/src/helix/runtime

export EDITOR='hx'
export HELIX_RUNTIME=/home/rrakea/code/proj/helix-unmap/runtime
fpath=(/usr/share/zsh/site-functions $fpath)
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
eval "$(oh-my-posh init zsh --config ~/.config/zsh/self.omp.json)"
eval "$(thefuck --alias)"
eval "$(zoxide init --cmd cd zsh)"
source <(fzf --zsh)
source ~/clone/fzf-tab/fzf-tab.plugin.zsh

# fzf theme:
export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS'
    --highlight-line
    --border=none
    --info=inline-right
'
# Keybinds
bindkey "^[[3~" delete-char
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word

# Other Configs
source ~/.config/zsh/zsh_alias
source ~/.config/zsh/zsh_fn
