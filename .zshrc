##################################
# Option settings
##################################

# 自動補完を有効にする
# コマンドの引数やパス名を途中まで入力して <Tab> を押すといい感じに補完してくれる
# 例： `cd path/to/<Tab>`, `ls -<Tab>`
autoload -U compinit; compinit

# 入力したコマンドが存在せず、かつディレクトリ名と一致するなら、ディレクトリに cd する
# # 例： /usr/bin と入力すると /usr/bin ディレクトリに移動
setopt auto_cd

# ↑を設定すると、 .. とだけ入力したら1つ上のディレクトリに移動できるので……
# 2つ上、3つ上にも移動できるようにする
alias ...='cd ../..'
alias ....='cd ../../..'



##################################
# Keybind settings
##################################

# viライクなキーバインド
bindkey -v


##################################
# View settings
##################################

# 色を使用
autoload -Uz colors
colors

##################################
# Env settings
##################################


# 日本語を使用
export LANG=ja_JP.UTF-8

# Goの環境変数
export GOPATH=$HOME/.golang
export GOROOT=$( go env GOROOT )
export PATH=$GOPATH/bin:$PATH
