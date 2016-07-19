##############################################
## Option settings
###############################################

# viモードを使用
bindkey -v

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
setopt correct

##############################################
# View settings
##############################################

# 色の設定
export LSCOLORS=Exfxcxdxbxegedabagacad

# 補完時の色の設定
export LS_COLORS='di=01;34:ln=01;35:so=01;32:ex=01;31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'

# ZLS_COLORSとは？
export ZLS_COLORS=$LS_COLORS

# lsコマンド時、自動で色がつく(ls -Gのようなもの？)
export CLICOLOR=true

# 補完候補に色を付ける
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

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

PROMPT=$tmp_prompt    # 通常のプロンプト
PROMPT2=$tmp_prompt2  # セカンダリのプロンプト(コマンドが2行以上の時に表示される)
RPROMPT=$tmp_rprompt  # 右側のプロンプト
SPROMPT=$tmp_sprompt  # スペル訂正用プロンプト

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

export LANG=ja_JP.UTF-8
export GOPATH=$HOME/.golang
export GOROOT=$( go env GOROOT )
export PATH=$GOPATH/bin:$PATH
