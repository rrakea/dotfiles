$env.config = {
  buffer_editor: "helix"
  show_banner: false
}

$env.PROMPT_COMMAND_RIGHT = ""
$env.TRANSIENT_PROMPT_COMMAND = ""
$env.PATH ++= ['~/.local/bin', '~/.cargo/bin', '~/go/bin']
$env.HELIX_RUNTIME = "~/.config/helix/runtime"

alias conf = helix ~/conf
alias c. = cd ..
alias l = ls
alias ls = ls -a
alias lss = ls | rg
alias c = clear
alias i = yay -S --needed
alias md = mkdir
alias mf = touch
alias rga = rg --hidden --no-ignore
alias fda = fd --hidden --no-ignore
alias disk = dust -r
alias h. = helix . 
alias sys = btop
alias irl = shutdown 0
alias osreload = hyprctl reload
alias hy = start-hyprland

def v. [] {
  code . 
  exit
}

def rosa [] {
  cd ~/code/rosa
  helix .
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

  let yres = (yay -Qdtq)
  sudo yay -Rns $yres

  sudo pacman -Scc
  yay -Scc
}

def dotfiles [] {
  cd ~/conf
  ls | where type == dir | get name | each {
    |pkg| stow $pkg
  }
}

def g [remote = "origin", branch = "main"] {
  git add .
  git commit
  git pull $remote $branch
  git push $remote $branch
}

def rpi [] {
  xhost +SI:localuser:root
  sudo rpi-imager
}

def apps [] {
  $env.PATH | each {
    |p| ls ($p | path expand)} | flatten 
}

def keygen [name, passphrase = ""] {
  let path = [$env.HOME, ".ssh", $name] | path join
  ssh-keygen -a 100 -t ed25519 -f $path -N $passphrase
  cat ([$path, ".pub"] | str join)
 }

source ~/.zoxide.nu
source ~/.config/nushell/catppuccin_macchiato.nu

fastfetch
