
"-----------------------------------
"for general setting
"-----------------------------------
 
"行数字を表示
set number
 
 
"改行を削除できるようにする
set backspace=2
 
"swapfileを作らない
set noswapfile

"tmpファイルの保存先
set directory=~/.vim/tmp
set backupdir=~/.vim/tmp
set undodir=~/.vim/tmp
 
"ヤンクをクリップボードにコピー
set clipboard=unnamed,autoselect 

"タブの設定
set expandtab
set tabstop=4
set shiftwidth=4

"不可視文字表示形式設定
set list

set lcs=tab:>-,eol:<,trail:-
"ステータスラインの設定 分けて書いた方が見易いと思う
set laststatus=2
set statusline=%n\:%y
set statusline+=[%{(&fenc!=''?&fenc:&enc)}]
set statusline+=[%{Getff()}]
set statusline+=%m%r\ %F%=[%l/%L]

function! Getff()
    if &ff == 'unix'
        return 'LF'
    elseif &ff == 'dos'
        return 'CR+LF'
    elseif &ff == 'mac'
        return 'CR'
    else
        return '?'
    endif
endfunction


"-----------------------------------
"for view 
"-----------------------------------
 
"syntax
syntax on
 
"背景の明暗
set background=dark
 
"カラースキームの設定
"colorscheme desert 
 
 
"-----------------------------------
"for edit
"-----------------------------------
 
"バックスペースで以下を削除可能に
"indent:行頭の空白
"eol: 改行
"start:挿入位置より前の文字
set backspace=indent,eol,start      
 

 
 
