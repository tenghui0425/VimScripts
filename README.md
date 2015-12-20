#VimScripts
##安装说明
将克隆下来的VimScripts重命名为.vim，然后运行install.sh:  
<pre><code>mv ~/.vim ~/.vim.bak # 备份之前自己的vim配置，若不存在则不用此操作  
mv VimScripts ~/.vim  
sh ~/.vim/install.sh</code></pre>

bin/generate\_clang\_complete.sh用于生成c/c++自动补全的.clang\_complete文件
，请在工程根目录下运行，或者在工程根目录下的vim命令模式下运行
&lt;leader&gt;gc, &lt;leader&gt; 为vim的一个设置变量，默认为'\'。

使用csupport，可以在.vim/resource/csupport下修改Templates模板，使其支持自己的信息。  

使用bash-support，可以在.vim/resource/bash-support下修改Templates模板，使其支持自己的信息。  

在.vimrc中将g:use\_chinese\_doc设为1则使用中文文档。  
若不成功，请运行:BundleInstall   

##说明  
对于要使用cscope的项目，在项目根路径生成cscope的数据库，用以下命令：
<pre><code>cscope -Rbkq</code></pre>
设置CSCOPE\_DB\_PATH的系统变量指向项目的根路径。 最后不要以'/'结尾。例如：  
<pre><code>export CSCOPE_DB_PATH=~/project</code></pre>

加入插件，在 ~/.vim/vimrcs/ 下加入一个.vimrc后缀的脚本，在脚本开头调用PluginAdd命令
加载插件，脚本下面可以加入其他的配置。例如：
<pre><code>PluginAdd 'a.vim'</code></pre>  
对于不使用的插件，可以有以下操作：  
-  将其移到unused\_vimrcs目录下(建议)  
-  将其脚本删除  
-  将其.vimrc的后缀重命名为其他  
-  在脚本的开头加上 finish  

##建议
在crontab中加入clear\_bak\_un\_file.sh的执行，比如每天21:00执行  
0 21 * * * ~/bin/clear\_bak\_un\_file.sh > /dev/null 2>&1  

##注意
- vim版本要求7.0以上，否则很多配置用不了，会直接不加载配置。
- 若退出vim时报未定义的变量b:NERDTree的错误，请将
~/.vim/bundle/nerdtree/plugin/NERD\_tree.vim下augroup NERDTree
的autocmd BufWinLeave注释掉。  
- YouCompleteMe的安装说明请参考其文档。  

##自编译vim建议  
加入以下的属性  
- --with-features=huge：支持最大特性
- --enable-rubyinterp：启用Vim对ruby编写的插件的支持
- --enable-pythoninterp：启用Vim对python编写的插件的支持
- --enable-luainterp：启用Vim对lua编写的插件的支持
- --enable-perlinterp：启用Vim对perl编写的插件的支持
- --enable-multibyte：多字节支持 可以在Vim中输入中文
- --enable-cscope：Vim对cscope支持
- --enable-gui=gtk2：gtk2支持,也可以使用gnome，表示生成gvim

##依赖程序
- git:用于版本管理
- ctags:tags，如tagbag等要用到
- clang:clang\_complete要用于
- cscope(可选，没有则不能使用cscope)
- doxygen(可选，用于生成代码文档)
- sbcl:common lisp的编译器，slimv用到
- xterm:运行lisp解析器服务器

##键映射  
以下model, n对应normal, i对应insert, v对应visual, c对应console  

|map|model|script|describe|
|---|:---|:---|:---|
|&lt;leader&gt;ev|n|global|水平切分窗口打开.vimrc|
|&lt;leader&gt;sv|n|global|加载.vimrc|
|&lt;F12&gt;|n|global|逆时间切换窗口|
|&lt;c-left&gt;|n|global|移到左边窗口|
|&lt;c-down&gt;|n|global|移到下边窗口|
|&lt;c-up&gt;|n|global|移到上边窗口|
|&lt;c-right&gt;|n|global|移到右边窗口|
|&lt;leader&gt;h|n|global|移到左边窗口|
|&lt;leader&gt;j|n|global|移到下边窗口|
|&lt;leader&gt;k|n|global|移到上边窗口|
|&lt;leader&gt;l|n|global|移到右边窗口|
|j|n|global|gj|
|gj|n|global|j|
|k|n|global|gk|
|gk|n|global|k|
|&lt;leader&gt;p|n|global|paste toggle|
|[1|n|global|diff时取窗口1的内容|
|[2|n|global|diff时取窗口2的内容|
|[3|n|global|diff时取窗口3的内容|
|[4|n|global|diff时取窗口4的内容|
|]1|n|global|diff时将内容放到窗口1|
|]2|n|global|diff时将内容放到窗口2|
|]3|n|global|diff时将内容放到窗口3|
|]4|n|global|diff时将内容放到窗口4|
|&lt;c-k&gt;|c|global|命令行上滚|
|&lt;c-j&gt;|c|global|命令行下滚|
|&lt;Space&gt;|n|global|za|
|&lt;leader&gt;as|n|a.vim|在源文件和头文件中切换|
|&lt;leader&gt;gc|n|clang\_complete|在当前目录生成.clang\_complete|
|&lt;C-\\&gt;s|n|cscope|查找这个C符号|
|&lt;C-\\&gt;g|n|cscope|查找这个定义|
|&lt;C-\\&gt;c|n|cscope|查找调用这个函数的函数|
|&lt;C-\\&gt;t|n|cscope|查找这个字符串|
|&lt;C-\\&gt;e|n|cscope|查找这个egrep匹配模式|
|&lt;C-\\&gt;f|n|cscope|查找这个文件|
|&lt;C-\\&gt;i|n|cscope|查找#include这个文件的文件|
|&lt;C-\\&gt;d|n|cscope|查找被这个函数调用的函数|
|&lt;C-@&gt;s|n|cscope|查找这个C符号,|水平切分窗口   
|&lt;C-@&gt;g|n|cscope|查找这个定,|水平切分窗口义  
|&lt;C-@&gt;c|n|cscope|查找调用这个函数的函,|水平切分窗口数  
|&lt;C-@&gt;t|n|cscope|查找这个字符,|水平切分窗口串  
|&lt;C-@&gt;e|n|cscope|查找这个egrep匹配模,|水平切分窗口式  
|&lt;C-@&gt;f|n|cscope|查找这个文,|水平切分窗口件  
|&lt;C-@&gt;i|n|cscope|查找#include这个文件的文,|水平切分窗口件  
|&lt;C-@&gt;d|n|cscope|查找被这个函数调用的函,|水平切分窗口数  
|&lt;C-@&gt;&lt;C-@&gt;s|n|cscope|查找这个C符号,|竖直切分窗口   
|&lt;C-@&gt;&lt;C-@&gt;g|n|cscope|查找这个定,|竖直切分窗口义  
|&lt;C-@&gt;&lt;C-@&gt;c|n|cscope|查找调用这个函数的函,|竖直切分窗口数  
|&lt;C-@&gt;&lt;C-@&gt;t|n|cscope|查找这个字符,|竖直切分窗口串  
|&lt;C-@&gt;&lt;C-@&gt;e|n|cscope|查找这个egrep匹配模,|竖直切分窗口式  
|&lt;C-@&gt;&lt;C-@&gt;f|n|cscope|查找这个文,|竖直切分窗口件  
|&lt;C-@&gt;&lt;C-@&gt;i|n|cscope|查找#include这个文件的文,|竖直切分窗口件  
|&lt;C-@&gt;&lt;C-@&gt;d|n|cscope|查找被这个函数调用的函,|竖直切分窗口数  
|&lt;leader&gt;tg|n|ctags|在当前目录生成tags|
|&lt;leader&gt;mt|n|minibufexpl|触发minibuf窗口|
|&lt;leader&gt;mf|n|minibufexpl|跳到minibuf中|
|&lt;c-l&gt;|n|minibufexpl|minibuf中的下一个文件|
|&lt;c-h&gt;|n|minibufexpl|minibuf中的上一个文件|
|&lt;leader&gt;nt|n|nerdtree|触发nerdtree|
|&lt;leader&gt;tt|n|tagbar or taglist|触发tagbar or taglist|
|&lt;leader&gt;ta|n|tagbar or taglist|触发tagbar和nerdtree|
|&lt;leader&gt;bi|n|vundle|Bundle安装插件|
|&lt;leader&gt;wm|n|winmanager|触发winmanager|
|&lt;leader&gt;qk|n|quickfix|上一条错误警告处|
|&lt;leader&gt;qj|n|quickfix|下一条错误警告处|
|&lt;leader&gt;qc|n|quickfix|关闭quickfix|
|&lt;leader&gt;qo|n|quickfix|打开quckfix|
|&lt;leader&gt;dx|ni|Doxygen|生成函数和类注释|
|&lt;leader&gt;da|ni|Doxygen|生成文件注释|
|&lt;leader&gt;dl|ni|Doxygen|生成证书注释|
|&lt;leader&gt;gu|n|Gundo|GundoToogle|
|&lt;leader&gt;vt|n|vimshell|在tab中打开一个VimShell|
|&lt;leader&gt;vs|n|vimshell|在当前打开一个VimShell|
|&lt;leader&gt;uf|n|unite|进行Unite file的查找|
|&lt;leader&gt;ur|n|unite|进行Unite file\_rec的查找|
|&lt;leader&gt;ub|n|unite|进行Unite buffer的查找|
|&lt;leader&gt;a=|nv|tabular|进行全局的等号对齐|
|&lt;leader&gt;a:|nv|tabular|进行全局的冒号对齐|
|MM|n|vim-bookmarks|toggle一个bookmark|
|MI|n|vim-bookmarks|toggle一个annotate|
|MA|n|vim-bookmarks|显示所有的bookmark和annotate|
|MJ|n|vim-bookmarks|跳到下一个bookmark|
|MK|n|vim-bookmarks|跳到上一个bookmark|
|MC|n|vim-bookmarks|清除bookmark|
|MX|n|vim-bookmarks|清除所有的bookmark|
|MU|n|vim-bookmarks|bookmark上移|
|MD|n|vim-bookmarks|bookmark下移|

