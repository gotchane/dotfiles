"-----------------------------------
"for NeoBundle
"-----------------------------------

" Note: Skip initialization for vim-tiny or vim-small.
if 0 | endif

if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath^=~/.vim/bundle/neobundle.vim/

" Required:
call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" My Bundles here:
" Solarized Colorscheme  
NeoBundle 'altercation/vim-colors-solarized'

" desert colorscheme
NeoBundle 'fugalh/desert.vim'


" Unite and create user interfaces
NeoBundle 'Shougo/unite.vim'

" Powerful file explorer implemented by Vim script
NeoBundle 'Shougo/vimfiler'

" Interactive command execution in Vim
NeoBundle 'Shougo/vimproc'

" Vim plugin that displays tags in a window, ordered by scope
NeoBundle 'majutsushi/tagbar'

" Go development plugin for Vim
NeoBundle 'fatih/vim-go'

" vim plugin providing godef support
NeoBundle 'dgryski/vim-godef'

" Extra plugin for golang
NeoBundle 'vim-jp/vim-go-extra'

" vim-ft-goは最新版のvimを使えない場合のみ
NeoBundle 'google/vim-ft-go'

" Refer to |:NeoBundle-examples|.
" Note: You don't set neobundle setting in .gvimrc!

call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck

"-----------------------------------
"for general setting
"-----------------------------------
 
"行数字を表示
set number
 
"改行を削除できるようにする
set backspace=2
 
"swapfileを作らない
set noswapfile

"backupfileを作らない
set nobackup

"tmpファイルの保存先
"set directory=~/.vim/tmp
"set backupdir=~/.vim/tmp
"set undodir=~/.vim/tmp
 
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
colorscheme desert
 
"-----------------------------------
"for edit
"-----------------------------------
 
"バックスペースで以下を削除可能に
"indent:行頭の空白
"eol: 改行
"start:挿入位置より前の文字
set backspace=indent,eol,start      
 
" 現在日時を入力
nmap <C-o><C-o> <ESC>i<C-r>=strftime("%Y%m%d_")<CR>

" 選択した部分を検索
vnoremap * "zy:let @/ = @z<CR>n



"-----------------------------------
"for vim-go
"-----------------------------------
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1


"-----------------------------------
""for VimFiler 
"-----------------------------------
nnoremap <F10> :VimFiler -split -simple -winwidth=30 -no-quit 
nnoremap <F11> :UniteBookmarkAdd
nnoremap <F12> :Unite bookmark

" 編集中ファイルをエクスプローラで開く
nnoremap <Leader>e :silent ! start . <CR>

" auto_cd有効
let g:vimfiler_enable_auto_cd = 1


"-----------------------------------
""for Tagbar
"-----------------------------------
let g:tagbar_left = 0
let g:tagbar_autofocus = 1
nmap <F8> :TagbarToggle<CR>

