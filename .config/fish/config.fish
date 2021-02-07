set -x LC_ALL en_US.UTF-8
set -x EDITOR vim
set -x GPG_TTY (tty)
set -x FZF_DEFAULT_COMMAND fd --type f --exclude .git --exclude node_modules
set -x PATH /opt/local/bin:/opt/local/sbin:$PATH

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

