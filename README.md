#VimScripts
##安装说明：
将克隆下来的VimScripts重命名为.vim，然后运行install.sh:  
	mv ~/.vim ~/.vim.bak # 备份之前自己的vim配置，若不存在则不用此操作  
	mv VimScripts ~/.vim  
	sh ~/.vim/install.sh  

bin/generate_clang_complete.sh用于生成c/c++自动补全的.clang_complete文件，请
在工程根目录下运行，或者在工程根目录下的vim命令模式下运行<leader>gc,<leader>
为vim的一个设置变量，默认为'\'。

使用csupport，可以在.vim/templates下修改Templates模板，使其支持自己的信息，

##注意
- neocomplcache和clang_complete会冲突，只能使用一个。
- vim-powerline会与clang_complete冲突，建议不使用。

##需要安装的软件：
- git
- ctags
- clang
- cscope(可选，没有则不能使用cscope)
- doxygen(可选，用于生成代码文档)


##快捷键绑定
**[global : normal]**  
&lt;leader&gt;ev: 	水平切分窗口打开.vimrc  
&lt;leader&gt;sv: 	加载.vimrc  
&lt;F12&gt;: 			逆时间切换窗口  
&lt;c-left&gt;: 		移到左边窗口  
&lt;c-down&gt;: 		移到下边窗口  
&lt;c-up&gt;: 		移到上边窗口  
&lt;c-right&gt;: 		移到右边窗口  
&lt;leader&gt;h: 		移到左边窗口  
&lt;leader&gt;j: 		移到下边窗口  
&lt;leader&gt;k: 		移到上边窗口  
&lt;leader&gt;l: 		移到右边窗口  

**[a.vim : normal]**  
&lt;leader&gt;as: 	在源文件和头文件中切换  

**[clang_complete : normal]**  
&lt;leader&gt;gc: 	在当前目录生成.clang_complete  

**[cscope : normal]**  
&lt;C-\_&gt;s:  
&lt;C-\_&gt;g:  
&lt;C-\_&gt;c:  
&lt;C-\_&gt;t:  
&lt;C-\_&gt;e:  
&lt;C-\_&gt;f:  
&lt;C-\_&gt;i:  
&lt;C-\_&gt;d:  
&lt;C-Space&gt;s:  
&lt;C-Space&gt;g:  
&lt;C-Space&gt;c:  
&lt;C-Space&gt;t:  
&lt;C-Space&gt;e:  
&lt;C-Space&gt;f:  
&lt;C-Space&gt;i:  
&lt;C-Space&gt;d:  
&lt;C-Space&gt;&lt;C-Space&gt;s:  
&lt;C-Space&gt;&lt;C-Space&gt;g:  
&lt;C-Space&gt;&lt;C-Space&gt;c:  
&lt;C-Space&gt;&lt;C-Space&gt;t:  
&lt;C-Space&gt;&lt;C-Space&gt;e:  
&lt;C-Space&gt;&lt;C-Space&gt;i:  
&lt;C-Space&gt;&lt;C-Space&gt;d:  

**[ctags : normal]**  
&lt;leader&gt;tg: 	在当前目录生成tags  

**[minibufexpl.vim : normal]**  
&lt;leader&gt;mbo: 	打开minibuf窗口  
&lt;leader&gt;mbc: 	关闭minibuf窗口  
&lt;leader&gt;mbt: 	触发minibuf窗口  
&lt;leader&gt;mbk: 	minibuf中的下一个文件  
&lt;leader&gt;mbj: 	minibuf中的上一个文件  
&lt;c-l&gt;: 			minibuf中的下一个文件  
&lt;c-h&gt;: 			minibuf中的上一个文件  

**[minibufexpl.vim : insert]**  
&lt;c-l&gt;: 			minibuf中的下一个文件  
&lt;c-h&gt;: 			minibuf中的上一个文件  

**[nerdtree : normal]**  
&lt;leader&gt;nt: 	触发nerdtree  

**[tagbar or taglist : normal]**  
&lt;leader&gt;tt: 	触发tagbar or taglist  
&lt;leader&gt;ta: 	触发tagbar和nerdtree  

**[vundle.vimrc : normal]**  
&lt;leader&gt;bi: 	Bundle安装插件  

**[winmanager : normal]**  
&lt;leader&gt;wm: 	触发winmanager  

**[quickfix : normal]**  
&lt;leader&gt;qk:		上一条错误警告处  
&lt;leader&gt;qj: 	下一条错误警告处  
&lt;leader&gt;qc:		关闭quickfix  
&lt;leader&gt;qo:		打开quckfix  

**[Doxygen : normal]**  
&lt;leader&gt;dx: 	生成函数和类注释  
&lt;leader&gt;da: 	生成文件注释  
&lt;leader&gt;dl: 	生成证书注释  

**[Doxygen : insert]**  
&lt;leader&gt;dx: 	生成函数和类注释  
&lt;leader&gt;da: 	生成文件注释  
&lt;leader&gt;dl: 	生成证书注释  

**[Gundo : normal]**  
&lt;leader&gt;gu: 	GundoToogle  
