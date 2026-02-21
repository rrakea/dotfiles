source /home/rrakea/.config/nushell/catppuccin_macchiato.nu

alias conf = hx ~/conf
alias c. = cd ..
alias l = ls
alias lss = ls | rg
alias c = clear
alias i = yay -S --needed
alias md = mkdir
alias mf = touch
alias rga = rg --hidden --no-ignore
alias fda = fd --hidden --no-ignore
alias disk = dust -r
alias h. = hx . 
alias sys = btop
alias irl = shutdown 0

alias osreload = hyprctl reload

$env.PATH ++= ['~/.local/bin', '~/.cargo/bin', '~/go/bin']

def v. [] {
  code . 
  exit
}

def --env mdc [dir] {
  md $dir
  cd $dir
}

def --env clone [link] {
  cd ~/clone/
  git clone $link --depth=1 --progress
  let name = basename $link ".git"
  cd name
}

def update [] {
  sudo pacman -Syu
  yay -Syu
  rustup update
}

def clean [] {
  let pres = pacman -Qdtq
  sudo pacman -Rns $pres

  let yres = yay -Qdtq
  yay -Rns yres

  sudo pacman -Scc
  yay -Scc
}

def apps [] {
  $env.PATH | each {|dir| ls $dir}
}

source "~/.zoxide.nu"
