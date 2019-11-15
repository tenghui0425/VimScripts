"==============================================================
"    file: reftools.vim
"   brief: reftools的工具
"
"    nmap:
"     <leader>rtp 运行fixplurals
"     <leader>rts 运行fillstruct
"     <leader>rtw 运行fillswitch
" VIM Version: 8.0
"  author: tenfyzhong
"   email: tenfy@tenfy.cn
" created: 2019-11-15 09:28:09
"==============================================================
PluginAdd 'tenfyzhong/reftools.vim'

nmap <leader>rtp <Plug>(reftools#fixplurals)
nmap <leader>rts <Plug>(reftools#fillstruct)
nmap <leader>rtw <Plug>(reftools#fillswitch)
