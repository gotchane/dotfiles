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

" A vim theme inspired by Atom's default dark theme
call dein#add('gosukiwi/vim-atom-dark')

" A dark Vim/Neovim color scheme inspired by Atom's One Dark syntax theme.
call dein#add('joshdick/onedark.vim')

" The colorscheme featuring Japanese traditional colors.
call dein#add('aereal/vim-colors-japanesque')

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

" CoffeeScript support for vim
call dein#add('kchmck/vim-coffee-script')

" Ease your git workflow within Vim
call dein#add('jreybert/vimagit')

" Vim plugin for the Perl module / CLI script 'ack'
call dein#add('mileszs/ack.vim')

" Dark powered asynchronous completion framework for neovim/Vim8
call dein#add('Shougo/deoplete.nvim')

" Active fork of kien/ctrlp.vim—Fuzzy file, buffer, mru, tag, etc finder.
call dein#add('ctrlpvim/ctrlp.vim')

" Perform the replacement in quickfix.
call dein#add('thinca/vim-qfreplace')

" endwise.vim: wisely add end in ruby, endfunction/endif/more in vim script, etc
call dein#add('tpope/vim-endwise')

" An extensible & universal comment vim-plugin that also handles embedded filetypes
call dein#add('tomtom/tcomment_vim')

" Automatically save changes to disk
call dein#add('vim-scripts/vim-auto-save')

" Vim/Ruby Configuration Files
call dein#add('vim-ruby/vim-ruby')

" rails.vim: Ruby on Rails power tools
call dein#add('tpope/vim-rails')

" rbenv.vim: Minimal rbenv support
call dein#add('tpope/vim-rbenv')

" bundler.vim: Lightweight support for Ruby's Bundler
call dein#add('tpope/vim-bundler')

" A Vim plugin for visually displaying indent levels in code
call dein#add('nathanaelkane/vim-indent-guides')

" neo-snippet plugin
call dein#add('Shougo/neosnippet.vim')

" The standard snippets repository for neosnippet
call dein#add('gotchane/neosnippet-snippets')

" Syntax Highlight for Vue.js components
call dein#add('posva/vim-vue')

" surround.vim: quoting/parenthesizing made simple
call dein#add('tpope/vim-surround')

" Run Rspec specs from Vim
call dein#add('thoughtbot/vim-rspec')

" dispatch.vim: Asynchronous build and test dispatcher
call dein#add('tpope/vim-dispatch')

" killring-alike plugin for neovim and vim 8 with no default mappings
call dein#add('bfredl/nvim-miniyank')

" Unobtrusive scratch window
call dein#add('mtth/scratch.vim')

" keep and restore fcitx state when leaving/re-entering insert mode
call dein#add('vim-scripts/fcitx.vim')

" A unite.vim plugin
call dein#add('ujihisa/unite-colorscheme')

" True Sublime Text style multiple selections for Vim
call dein#add('terryma/vim-multiple-cursors')

" Auto close parentheses and repeat by dot dot dot...
call dein#add('cohama/lexima.vim')

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
"set clipboard^=unnamed,unnamedplus
set clipboard+=unnamedplus

"タブの設定
set expandtab
set tabstop=2
set shiftwidth=2

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

" tags path
set tags+=.git/tags

set nocursorline

"-----------------------------------
"for vimrc
"-----------------------------------
nnoremap <Leader>e :e ~/.vimrc<CR>
nnoremap <Leader>1 :source ~/.vimrc<CR>

"-----------------------------------
"for view 
"-----------------------------------
 
"syntax
syntax on
 
"背景の明暗
"set background=dark

" TrueColor 設定
set termguicolors
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

"カラースキームの設定
colorscheme onedark

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
nmap <C-h><C-h> <ESC>a<C-r>=strftime("%Y%m%d_")<CR>

" 選択した部分を検索
vnoremap * "zy:let @/ = @z<CR>n

" Split window
nmap ss :split<Return><C-w>w
nmap sv :vsplit<Return><C-w>w

" Move window
map sh <C-w>h
map sk <C-w>k
map sj <C-w>j
map sl <C-w>l

" Move window
nmap st :tabnew<CR>
nmap sn gt
nmap sp gT

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
let g:go_fmt_autosave = 0
nnoremap mg :GoRun <CR>
nnoremap mf :GoFmt <CR>

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
nnoremap mq :VimFilerClose default

" 編集中ファイルをエクスプローラで開く
nnoremap <Leader>d :silent ! start . <CR>

" auto_cd有効
let g:vimfiler_enable_auto_cd = 0

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

"-----------------------------------
" for ack.vim
"-----------------------------------
if executable('rg')
  let g:ackprg = 'rg --vimgrep --no-heading --no-ignore-messages'
endif

cnoreabbrev Ack Ack!
vnoremap <Leader>g y:Ack! <C-r>=fnameescape(@")<CR><CR>

"-----------------------------------
" for ctrlp.vim
"-----------------------------------
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
if executable('rg')
  let g:ctrlp_user_command = 'rg --files %s'
  let g:ctrlp_use_caching = 0
endif

"-----------------------------------
" for ale
"-----------------------------------
let g:ale_linters = {'javascript': ['eslint'],}
let g:ale_linters_explicit = 1

"-----------------------------------
" for vim-rails
"-----------------------------------
let g:rails_ctags_arguments = ['--languages=Ruby --tag-relative --recurse --sort=yes  --append=no -f .git/tags']

"-----------------------------------
" for AutoSave
"-----------------------------------
if expand("%:p") =~ 'COMMIT_EDITMSG'
  let g:auto_save = 0
else
  let g:auto_save = 1
endif
let g:auto_save_events = ["InsertLeave"]

"-----------------------------------
" for vim-indent-guides
"-----------------------------------
let g:indent_guides_enable_on_vim_startup = 1

"-----------------------------------
" for neosnippet
"-----------------------------------
" Plugin key-mappings.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
let g:neosnippet#scope_aliases = {}
let g:neosnippet#scope_aliases['javascript'] = 'html,javascript'

imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
"imap <expr><TAB>
" \ pumvisible() ? "\<C-n>" :
" \ neosnippet#expandable_or_jumpable() ?
" \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif

"-----------------------------------
" for vim-surround
"-----------------------------------
nmap ff <Plug>Csurround"'
nmap tt <Plug>Csurround'"

"-----------------------------------
" for vim-rspec
"-----------------------------------
let g:rspec_command = "Dispatch bin/rspec {spec}"
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>

"-----------------------------------
" for nvim-miniyank
"-----------------------------------
map p <Plug>(miniyank-autoput)
map P <Plug>(miniyank-autoPut)

"-----------------------------------
" for vim-scratch
"-----------------------------------
let g:scratch_filetype = 'markdown'
let g:scratch_autohide = 0
let g:scratch_height = 10
