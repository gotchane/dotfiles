##############################################
## Option settings
###############################################

# viモードを使用
#bindkey -v

# ディレクトリ名の補完で末尾の / を自動的に付加し、次の補完に備える
setopt auto_param_slash

# ファイル名の展開でディレクトリにマッチした場合 末尾に / を付加
setopt mark_dirs

# 補完候補一覧でファイルの種別を識別マーク表示 (訳注:ls -F の記号)
setopt list_types

# 補完キー連打で順に補完候補を自動で補完
setopt auto_menu

# カッコの対応などを自動的に補完
setopt auto_param_keys

# コマンドラインでも # 以降をコメントと見なす
setopt interactive_comments

# コマンドラインの引数で --prefix=/usr などの = 以降でも補完できる
setopt magic_equal_subst


# ヒストリの設定
HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=100000

# 色変更モード使用
autoload -Uz colors
colors

# cdコマンドを省略して、ディレクトリ名のみの入力で移動
setopt auto_cd

# ヒストリーモードのバッファサイズ
HISTSIZE=100000
SAVEHIST=100000
HISTFILE=~/.zsh_history

# 補完
autoload -Uz compinit
compinit

# 自動でpushdを実行
setopt auto_pushd

# コマンドミスを修正
#setopt correct

##############################################
# View settings
##############################################

# 色の設定
export LSCOLORS=gxfxcxdxbxegedabagacag

# 補完時の色の設定
export LS_COLORS='di=01;34:ln=01;35:so=01;32:ex=01;31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'

# ZLS_COLORSとは？
export ZLS_COLORS=$LS_COLORS

# lsコマンド時、自動で色がつく(ls -Gのようなもの？)
export CLICOLOR=true

# lsがカラー表示になるようエイリアスを設定
case "${OSTYPE}" in
darwin*)
  # Mac
    alias ls="ls -GF"
    ;;
linux*)
  # Linux
    alias ls='ls -F --color'
    ;;
esac

##############################################
## Prompt settings
###############################################

#ファイル補完候補に色を付ける
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

# 一般ユーザ時
tmp_prompt="%{${fg[cyan]}%}%n%# %{${reset_color}%}"
tmp_prompt2="%{${fg[cyan]}%}%_> %{${reset_color}%}"
tmp_rprompt="%{${fg[green]}%}[%~]%{${reset_color}%}"
tmp_sprompt="%{${fg[yellow]}%}%r is correct? [Yes, No, Abort, Edit]:%{${reset_color}%}"

# rootユーザ時(太字にし、アンダーバーをつける)
if [ ${UID} -eq 0 ]; then
  tmp_prompt="%B%U${tmp_prompt}%u%b"
  tmp_prompt2="%B%U${tmp_prompt2}%u%b"
  tmp_rprompt="%B%U${tmp_rprompt}%u%b"
  tmp_sprompt="%B%U${tmp_sprompt}%u%b"
fi

autoload -Uz vcs_info
setopt prompt_subst
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' stagedstr "%F{yellow}!"
zstyle ':vcs_info:git:*' unstagedstr "%F{red}+"
zstyle ':vcs_info:*' formats "%F{green}%c%u[%b]%f"
zstyle ':vcs_info:*' actionformats '[%b|%a]'
precmd () { vcs_info }

# style of parrot os
PROMPT=$'%{$fg[red]%}┌[%{$fg_bold[brown]%}%n%{$reset_color%}%{$fg[yellow]%}@%{$fg_bold[blue]%}%m%{$reset_color%}%{$fg[red]%}][%{$fg[green]%}%~%{$reset_color%}%{$fg[red]%}]${vcs_info_msg_0_}
%{$fg[red]%}└──╼%{$fg_bold[yellow]%}$%{$reset_color%} '
PS2=$' %{$fg[green]%}|>%{$reset_color%} '

# セカンダリのプロンプト(コマンドが2行以上の時に表示される)
PROMPT2=$tmp_prompt2

# 右側のプロンプト
RPROMPT=''

# スペル訂正用プロンプト
SPROMPT=$tmp_sprompt

##############################################
# Env settings
##############################################
export LANG=ja_JP.UTF-8
export GOPATH=$HOME/go
export GOROOT=$( go env GOROOT )
export GOMYREPO=$GOPATH/src/github.com/gotchane
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin
export PATH="$HOME/.rbenv/bin:$PATH"
export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"
export PATH=$HOME/.nodenv/bin:$PATH
PATH=/opt/homebrew/bin:$PATH
export GREP_OPTIONS='--color=auto'
eval "$(rbenv init -)"
eval "$(nodenv init -)"

##############################################
# Alias settings
##############################################
alias ctags='`brew --prefix`/bin/ctags'
alias codegrep='find . -path ./.git -prune -o -path ./log -prune -o -type f -print0 | xargs -0 grep -n -E $1'
alias G='cd $(ghq root)/$(ghq list | peco)'
alias C='code $(ghq root)/$(ghq list | peco)'
alias gh='hub browse $(ghq list | peco | cut -d "/" -f 2,3)'
alias ap='ansible-playbook $(ghq root)/github.com/gotchane/mac-ansible/playbooks/macosx.yml'
alias ssh='~/dotfiles/scripts/ssh-change-bg'
alias be='bundle exec'
alias pb='curl -sH "Authorization: token ${GITHUB_API_TOKEN}" "https://api.github.com/repos/$(ghq list | sed s#github.com\/##g | peco)/pulls" | jq ".[] | { number: .number, title: .title, base: .base.ref, head: .head.ref }"'
alias tmuxg='tmux new-session \; source-file ~/.tmux.session.conf'
alias gad='git commit --amend --date "`date -R`"'
alias dot='cd ~/dotfiles'

##############################################
# Git alias settings
##############################################
alias g='git'
alias -g B='`git branch -a | peco --prompt "GIT BRANCH>" | head -n 1 | sed -e "s/^\*\s*//g"`'
alias -g R='`git remote | peco --prompt "GIT REMOTE>" | head -n 1`'
alias -g LR='`git branch -a | peco --query "remotes/ " --prompt "GIT REMOTE BRANCH>" | head -n 1 | sed "s/^\*\s*//" | sed "s/remotes\/[^\/]*\/\(\S*\)/\1/"`'

##############################################
# Function settings
##############################################
function al() {
  curl $1 -sL | xmllint --html --xpath 2>/dev/null "//head/title" - | sed -e "s;<title>;<a href=\"${1//&/\&}\" target=\"_blank\" rel=\"nofollow noopener\">;g" -e "s;</title>;</a>;g" | pbcopy ; pbpaste
}

function ml() {
  curl $1 -sL | xmllint --html --xpath 2>/dev/null "//head/title" - | sed -e "s;<title>;\[;g" -e "s;</title>;\]\(${1//&/\&}\);g" | pbcopy ; pbpaste
}

function sl() {
  echo -e "$@" | slackcat --channel daily --stream
}

function tp() {
  dir="cd $(ghq root)/$(ghq list | peco)"
  for _pane in $(tmux list-panes -a -F '#{pane_id}'); do
    tmux send-keys -t ${_pane} $dir C-m
  done
}

##############################################
# load env settings
##############################################
GITHUB_CREDENTIAL_FILE=~/.github_credentials
if [ -e $GITHUB_CREDENTIAL_FILE ]; then
  source $GITHUB_CREDENTIAL_FILE
fi

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
