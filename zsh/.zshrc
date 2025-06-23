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
export PATH="$HOME/go/bin:$PATH"
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

alias c.='cd ..'
alias l='eza --icons=always'
alias ls='eza --icons=always'
alias ll='eza -l --icons=always -M --no-user --no-time --total-size --icons=always'
alias la='eza -a --icons=always'
alias lt='eza -T --icons=always'
alias grep='grep --color=auto'
alias c='clear'
alias pin='sudo pacman -S'
alias prm='sudo pacman -Rns'
alias yin='yay -S'
alias yrm='yay -R'
alias fin='flatpak install'
alias frm='flatpak uninstall'
alias bin='brew install'
alias brm='brew uninstall'
alias conf='helix ~/conf'
alias s='spf .'
alias shutdown='shutdown 0'
alias sys='btop'
alias matrix='cmatrix -absr'
alias md='mkdir -p'
alias mf='touch'
alias logout='hyprctl dispatch exit'
alias vs='code .; exit'
alias h='helix .'
alias e='exit'
alias rga='rg --hidden --no-ignore'
alias ff='fastfetch'
alias disk='dust -r'
alias zen='flatpak run app.zen_browser.zen&'
alias sky='astroterm -cCu'
alias wiki='wiki-tui'

# Keybinds
bindkey "^[[3~" delete-char
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word

mdc() {
    mkdir -p "$1" && cd "$1"
}
