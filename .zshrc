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

# 通常のプロンプト
PROMPT=$tmp_prompt
# セカンダリのプロンプト(コマンドが2行以上の時に表示される)
PROMPT2=$tmp_prompt2

# 右側のプロンプト
RPROMPT=$tmp_rprompt

# スペル訂正用プロンプト
SPROMPT=$tmp_sprompt

# git設定
RPROMPT="%{${fg[cyan]}%}[%~]%{${reset_color}%}"
autoload -Uz vcs_info
setopt prompt_subst
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' stagedstr "%F{yellow}!"
zstyle ':vcs_info:git:*' unstagedstr "%F{red}+"
zstyle ':vcs_info:*' formats "%F{green}%c%u[%b]%f"
zstyle ':vcs_info:*' actionformats '[%b|%a]'
precmd () { vcs_info }
RPROMPT=$RPROMPT'${vcs_info_msg_0_}'


##############################################
# Env settings
##############################################
# 環境変数設定
export LANG=ja_JP.UTF-8
export GOPATH=$HOME/go
export GOROOT=$( go env GOROOT )
export GOMYREPO=$GOPATH/src/github.com/gotchane
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin
export PATH="$HOME/.rbenv/bin:$PATH"
export PATH=$HOME/.nodebrew/current/bin:$PATH
export GREP_OPTIONS='--color=auto'
eval "$(rbenv init -)"

alias ctags="`brew --prefix`/bin/ctags"
alias codegrep="find . -path ./.git -prune -o -path ./log -prune -o -type f -print0 | xargs -0 grep -n -E $1"
