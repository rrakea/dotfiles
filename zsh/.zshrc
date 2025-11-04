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

alias c.='cd ..'
alias l='eza --icons=always'
alias ls='eza --icons=always'
alias lss='eza --icons=always | rg '
alias ll='eza -a -l --icons=always -M --no-user --no-time --total-size --icons=always'
alias la='eza -a --icons=always'
alias lt='eza -T --icons=always --git-ignore'
alias c='clear'
alias pin='sudo pacman -S --needed'
alias prm='sudo pacman -Rns'
alias yin='yay -S --needed --needed'
alias yrm='yay -R'
alias yq='yay -S $(yay -Slq | fzf --height=30% --layout=reverse)'
alias fin='flatpak install'
alias frm='flatpak uninstall'
alias bin='brew install'
alias brm='brew uninstall'
alias conf='$EDITOR ~/conf'
alias shutdown='shutdown 0'
alias sys='btop'
alias matrix='cmatrix -absr'
alias md='mkdir -p'
alias mf='touch'
alias logout='hyprctl dispatch exit'
alias rga='rg --hidden --no-ignore'
alias ff='fastfetch'
alias disk='dust -r'
alias sky='astroterm -cCu'
alias wiki='wiki-tui'
alias sha='sha256sum'
alias shreload='source ~/.zshrc'
alias ai='copilot --banner --resume'
alias bonsai='cbonsai -li --color=255,255,255,255'
alias rain='terminal-rain'

# Keybinds
bindkey "^[[3~" delete-char
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word

mdc() {
    mkdir -p "$1" && cd "$1"
}

hxi() {
    if p=$(zoxide query -i); then
    	if [ -n "$p" ]; then
    		hx "$p"
    	fi
    fi
}

vxi() {
    if p=$(zoxide query -i); then
    	if [ -n "$p" ]; then
    		code "$p"
    	fi
    fi
}

# Move to dir at the end of yazi
function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	IFS= read -r -d '' cwd < "$tmp"
	[ -n "$cwd" ] && [ "$cwd" != "$PWD" ] && builtin cd -- "$cwd"
	rm -f -- "$tmp"
}

# kitten icat /home/rrakea/img/wallpaper/girl-ascii.png
# kitty @ scroll-window start

