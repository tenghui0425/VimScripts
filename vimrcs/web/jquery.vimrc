"==============================================================
"    file: jquery.vimrc
"   brief: 
" VIM Version: 7.4
"  author: tenfyzhong
"   email: 364755805@qq.com
" created: 2016-04-14 14:09:13
"==============================================================
PluginAdd 'nono/jquery.vim'

augroup JQUERY
    au!
    au BufRead,BufNewFile jquery.*.js set ft=javascript syntax=jquery
augroup END
