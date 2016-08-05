"-----------------------------------
"for Windows gVim
"-----------------------------------
colorscheme desert 
set clipboard=unnamed
let s:using_font= 'Osaka' . "\x81\x7c\x93\x99\x95\x9d"
let &guifont=s:using_font . ':h11cSHIFTJIS'
unlet s:using_font"
set linespace=0
au GUIEnter * simalt ~x
