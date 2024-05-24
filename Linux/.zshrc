export ZSH="$HOME/.oh-my-zsh"

# theme
ZSH_THEME="agnoster"

# plugin manager
ZSH_PLUGINS_PATH="${ZSH_CUSTOM:-$ZSH/custom}/plugins"

PLUGIN_FZF_TAB="$ZSH_PLUGINS_PATH/fzf-tab"
if [ ! -d "$PLUGIN_FZF_TAB" ]; then
  git clone https://github.com/Aloxaf/fzf-tab "$PLUGIN_FZF_TAB"
fi

PLUGIN_256COLOR="$ZSH_PLUGINS_PATH/zsh-256color"
if [ ! -d "$PLUGIN_256COLOR" ]; then
  git clone https://github.com/chrissicool/zsh-256color "$PLUGIN_256COLOR"
fi

PLUGIN_SYNTAX_HIGHLIGHTING="$ZSH_PLUGINS_PATH/zsh-syntax-highlighting"
if [ ! -d "$PLUGIN_SYNTAX_HIGHLIGHTING" ]; then
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "$PLUGIN_SYNTAX_HIGHLIGHTING"
fi

plugins=(
    z
    git
    sudo
    aliases
    extract
    fzf-tab
    history
    copypath
    copyfile
    safe-paste
    zsh-256color
    colored-man-pages
    zsh-syntax-highlighting
)

# source
source $ZSH/oh-my-zsh.sh
eval "$(fzf --zsh)"

# opt
setopt nonomatch
setopt hist_ignore_all_dups

# export
export BAT_THEME="gruvbox-dark"
export PATH="$PATH:$HOME/.rvm/bin"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.local/share/JetBrains/Toolbox/scripts:$PATH"
export DOCKER_HOST=unix://$XDG_RUNTIME_DIR/docker.sock

# alias
alias cpath="copypath"
alias cfile="copyfile"
alias glm="glgg --date=format:'%H:%M:%S' --pretty=format:'%Cred%h%Creset - %C(bold green)(%cr ~ 8+%cd)%Creset %C(bold blue)<%an>%Creset%C(yellow)%d%Creset %s' -16"
alias gbdd='gb | rg -xv "^\* $(gb --show-current)" | xargs git branch -D'

# func
function setproxy() {
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
