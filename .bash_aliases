# ENV VARS
DEBFULLNAME='Hersh Nevgi'
DEBEMAIL='hersh@seermedical.com'

# LS
alias ll='ls -ahlF'
alias la='ls -A'
alias l='ls -CF'

# GENERAL
alias sudo='sudo '
alias gnome-backup='sudo cp ~/.config/dconf/user ~/.config/dconf/user.backup'
alias nf='neofetch'
alias cnf='clear && neofetch'
alias v='nvim'
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
alias kbq='setxkbmap us'
alias kbc='setxkbmap us -variant colemak'
alias rr='ranger'
alias p='ping'
alias pp='prettyping'
alias dh='du -a -h --max-depth=1'
alias tmux='tmux -2'
alias cb='xclip -selection c'
alias ddate='date +"%Y-%m-%d_%H%M%S"'
alias df='df -xsquashfs -xtmpfs'

# GIT
alias gs='git status'
alias gd='git diff'
alias gch='git checkout'
alias gchm='git checkout master'
alias glol='git log --decorate --pretty="format:%C(auto)%h %Cblue%ad%C(auto)%d %Creset%s" --date=short'
alias gcm='git commit -m'
alias gcam='git commit -a -m'
alias gau='git add -u'
alias gfixup='git commit --amend --no-edit'
alias gfixupm='git commit --amend'

# FUNCTIONS
unzipd() {
    if [[ $# != 1 ]]; then echo I need a single argument, the name of the archive to extract; return 1; fi
    target="${1%.zip}"
    unzip "$1" -d "${target##*/}"
}

# SEER
shv() {
	pepper -L "$1" grains.item hub_info:seer_hub_version
}

hub_camera_tunnel() {
	ssh -NL 8080:192.168.20.110:80 $1
}
