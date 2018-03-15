"-----------------------------------
"for dein.vim
"-----------------------------------

if &compatible
  set nocompatible
endif
set runtimepath+=~/.vim/dein/repos/github.com/Shougo/dein.vim

call dein#begin(expand('~/.vim/dein'))

call dein#add('Shougo/dein.vim')

" My Bundles here:
" Solarized Colorscheme  
call dein#add('altercation/vim-colors-solarized')

" desert colorscheme
call dein#add('fugalh/desert.vim')

" QFixHowm 
call dein#add('fuenor/qfixhowm.git')

" Unite and create user interfaces
call dein#add('Shougo/unite.vim')

" Powerful file explorer implemented by Vim script
call dein#add('Shougo/vimfiler')

" Interactive command execution in Vim
call dein#add('Shougo/vimproc', {'build': 'make'})

" Next generation completion framework after neocomplcache.
call dein#add('Shougo/neocomplete')

"Run commands quickly. 
call dein#add('thinca/vim-quickrun')

" Vim plugin that displays tags in a window, ordered by scope
call dein#add('majutsushi/tagbar')

" Go development plugin for Vim
call dein#add('fatih/vim-go')

" vim plugin providing godef support
call dein#add('dgryski/vim-godef')

" Extra plugin for golang
call dein#add('vim-jp/vim-go-extra')

" velocity syntax for vim
call dein#add('lepture/vim-velocity')

" Molokai color scheme for Vim
call dein#add('tomasr/molokai')

" A dark color scheme for Vim
call dein#add('w0ng/vim-hybrid')

" vim interface to Web API
call dein#add('mattn/webapi-vim')

" Vim plugin: A framework to read/write fake:path
call dein#add('kana/vim-metarw')

" This plugin provides some functions of Hatena-Blog by using AtomPub API.
call dein#add('moznion/hateblo.vim')

" Realtime preview by Vim. (Markdown, reStructuredText, textile)
call dein#add('kannokanno/previm')

" Open URI with your favorite browser from your most favorite editor
call dein#add('tyru/open-browser.vim')

" Dark powered asynchronous completion framework for neovim/Vim8
call dein#add('Shougo/deoplete.nvim')
if !has('nvim')
  call dein#add('roxma/nvim-yarp')
  call dein#add('roxma/vim-hug-neovim-rpc')
endif

call dein#end()
call dein#save_state()

if dein#check_install()
  call dein#install()
endif

filetype plugin indent on

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

"undoファイルを作らない
set noundofile

"保存されていないファイルがあるときでも別のファイルを開く
set hidden

"tmpファイルの保存先
"set directory=~/.vim/tmp
"set backupdir=~/.vim/tmp
"set undodir=~/.vim/tmp
 
"ヤンクをクリップボードにコピー
set clipboard=unnamed

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
colorscheme molokai

"yamlの拡張子に変更
autocmd BufRead,BufNewFile *.vm set filetype=velocity
autocmd BufRead,BufNewFile *.template set filetype=yaml

"-----------------------------------
"for edit
"-----------------------------------
 
"バックスペースで以下を削除可能に
"indent:行頭の空白
"eol: 改行
"start:挿入位置より前の文字
set backspace=indent,eol,start      
 
" 現在日時を入力
nmap <C-o><C-o> <ESC>a<C-r>=strftime("%Y%m%d_")<CR>

" 選択した部分を検索
vnoremap * "zy:let @/ = @z<CR>n


"-----------------------------------
"for vimproc
"-----------------------------------

let g:vimproc#download_windows_dll = 1

"-----------------------------------
"for vim-go
"-----------------------------------
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1

"-----------------------------------
"for Neocomplete 
"-----------------------------------
"let g:neocomplete#sources#omni#input_patterns.go = '\h\w\.\w*'

"-----------------------------------
"for VimFiler 
"-----------------------------------
" ショートカットキー設定
nnoremap <F6> :VimFiler -split -simple -winwidth=40 -no-quit 
nnoremap <F7> :UniteBookmarkAdd
nnoremap <F8> :Unite bookmark

" 編集中ファイルをエクスプローラで開く
nnoremap <Leader>e :silent ! start . <CR>

" auto_cd有効
let g:vimfiler_enable_auto_cd = 1

" セーフモード無効状態で起動
let g:vimfiler_safe_mode_by_default = 0

" bookmark時の移動
autocmd FileType vimfiler call unite#custom_default_action('directory', 'cd')

"-----------------------------------
"for vim-quickrun
"-----------------------------------
"quickrunでgo testを走らせる
autocmd BufRead,BufNewFile *_test.go set filetype=go.test
let g:quickrun_config = {}
let g:quickrun_config['go.test'] = {'command' : 'go', 'exec' : ['%c test']}

"-----------------------------------
""for Tagbar
"-----------------------------------
let g:tagbar_left = 0
let g:tagbar_autofocus = 1
nmap <F9> :TagbarToggle<CR>

"-----------------------------------
" for QFixHowm
"-----------------------------------

"QFixHowmキーマップ
let QFixHowm_Key = 'g'

"howm_dirはファイルを保存したいディレクトリを設定。
let howm_dir             = '~/note/memo'
"howmファイル読込の際、howm_fileencodingに強制設定する
let QFixHowm_ForceEncoding = 1
let howm_fileformat      = 'unix'
let howm_filename = '%Y/%m/%Y-%m-%d-%H%M%S.md'
let QFixHowm_DiaryFile = 'diary/%Y/%m/%Y-%m-%d-000000.howm'

" マルチエンコーディングgrepを使用する
let MyGrep_MultiEncoding = 1


"-----------------------------------
" for previm
"-----------------------------------
let g:previm_open_cmd = 'open -a /Applications/Google\ Chrome.app'
augroup PrevimSettings
    autocmd!
    autocmd BufNewFile,BufRead *.{md,mdwn,mkd,mkdn,mark*} set filetype=markdown
augroup END

"-----------------------------------
" for deplete.nvim
"-----------------------------------
let g:deoplete#enable_at_startup = 1
