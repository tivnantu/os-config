export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="agnoster"
plugins=(
    z
    git
    sudo
    aliases
    extract
    history
    copypath
    copyfile
    copybuffer
    safe-paste
    zsh-256color
    colored-man-pages
    zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

setopt nonomatch
setopt hist_ignore_all_dups

export BAT_THEME="gruvbox-dark"
export PATH="$PATH:$HOME/.rvm/bin"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.local/share/JetBrains/Toolbox/scripts:$PATH"
export DOCKER_HOST=unix://$XDG_RUNTIME_DIR/docker.sock

alias glm="glgg --date=format:'%H:%M:%S' --pretty=format:'%Cred%h%Creset - %C(bold green)(%ar ~ %ad)%Creset %C(bold blue)<%an>%Creset%C(yellow)%d%Creset %s' -16"
alias gbdd='gb | rg -xv "^\* $(gb --show-current)" | xargs git branch -D'

function setproxy(){
    ip_addr=127.0.0.1
    proxy_port=7890
    export https_proxy=http://"$ip_addr":"$proxy_port"
    export http_proxy=http://"$ip_addr":"$proxy_port"
    export all_proxy=socks5://"$ip_addr":"$proxy_port"
    export no_proxy="localhost, 127.0.0.1, ::1"
}

function unsetproxy() {
    unset https_proxy
    unset http_proxy
    unset all_proxy
    unset no_proxy
}

function cdtmp() {
    tempdirlog='/tmp/tempdir.log'
    if [ $# -eq 0 ] && [ -f "$tempdirlog" ]; then
        cd "$(tail -n 1 $tempdirlog)"
    elif [ "$1" = "-l" ]; then
        cat -n $tempdirlog
    elif [ "$1" = "-n" ]; then
        tempDir=$(mktemp -d)
        echo "${tempDir}"
        echo "${tempDir}" >>"$tempdirlog"
        cd "${tempDir}"
    elif $(echo "$1" | grep -q '[0-9]'); then
        cd "$(sed -n "$1,$1p" $tempdirlog)"
    else
        tempDir=$(mktemp -d)
        echo "${tempDir}"
        echo "${tempDir}" >>"$tempdirlog"
        cd "${tempDir}"
    fi
}

function shortdir() {
    prompt_dir() {
        prompt_segment blue $CURRENT_FG '%1d'
    }
}
