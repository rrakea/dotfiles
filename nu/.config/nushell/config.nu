$env.config = {
  buffer_editor: "hx"
  show_banner: false
}

$env.PROMPT_COMMAND_RIGHT = ""
$env.TRANSIENT_PROMPT_COMMAND = ""
$env.PATH ++= ['~/.local/bin', '~/.cargo/bin', '~/go/bin']

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
  (pacman -Qdtq) | lines | each { |pkg|
    sudo pacman -Rns --noconfirm $pkg
  }

  let yres = yay -Qdtq
  yay -Rns yres

  sudo pacman -Scc
  yay -Scc
}

def apps [] {
  $env.PATH | each {|dir| ls $dir}
}

def dotfiles [] {
  cd ~/conf
  ls | where type == dir | get name | each {
    |pkg| stow $pkg
  }
}

def g [branch] {
  git add .
  git commit
  git pull origin $branch
  git push origin $branch
}

source ~/.zoxide.nu
source ~/.config/nushell/catppuccin_macchiato.nu

fastfetch
