set -x LC_ALL en_US.UTF-8
set -x EDITOR vim
set -x GPG_TTY (tty)
set -x FZF_DEFAULT_COMMAND fd --type f --exclude .git --exclude node_modules

set -x NIX_PROFILES "/nix/var/nix/profiles/default $HOME/.nix-profile"
set -x NIX_SSL_CERT_FILE "$HOME/.nix-profile/etc/ssl/certs/ca-bundle.crt"
set -x NIX_PATH /nix $HOME/.nix-defexpr/channels

set -x PATH $HOME/.nix-profile/bin $PATH
set -x PATH $HOME/.npm-global/bin:$PATH
set -x PATH /opt/local/bin:/opt/local/sbin:$PATH

# don't store any less(1) history
set -x LESSHISTFILE /dev/null

# forward ports but in background
function delman_start
  ssh -f -N -M -S /tmp/delman.ssh delman -L 8000:localhost:8000 -L 3000:localhost:3000 -L 8000:localhost:8000
end

# stop port forwarding
function delman_end
  ssh -S /tmp/delman.ssh -O exit delman
end

# short any github url to human memorable url
function gitio
  curl https://git.io/ -i -F "url=https://github.com/$argv[1]" -F "code=$argv[2]"
end

# yes
function cat
  bat $argv
end

# exa is cute
function ls
  exa $argv
end

# pardon my tyop
function sl
  ls $argv
end

# rg is rocksss
function grep
  rg $argv
end

# fuck find
function find
  fd $argv
end

# this one is cute
function gl
  git log --graph --oneline --all
end

# this is too
function gll
  git log --oneline --decorate --all --graph --stat
end

# commonly i use this to report to my client
function gld
  git log --oneline --all --pretty=format:\"%h%x09%an%x09%ad%x09%s\"
end

# silence is fucking gold
function fish_title
  echo ""
end

starship init fish | source
