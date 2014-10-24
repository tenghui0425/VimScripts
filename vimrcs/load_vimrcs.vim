" load_vimrc

let g:plugin_lists = {}
let b:vimrc_path    = "~/.vim/vimrcs/"
let b:bundle_path 	= "~/.vim/bundle/"

" 对未定义的变量设置默认值
function! SetVariablesDefault(name, value)
	if !exists(a:name)
		execute "let " . a:name " = " . a:value
	endif
endfunction


" 加载一个vimrc脚本 
function! LoadSingleVimrc(vimrc)
    execute "source " . a:vimrc
endfunction


" 加载~/.vim/vimrcs/目录下的所有.vimrc脚本
function! LoadVimrcs()
    " 先加载vundle，再加载其他插件
    call LoadSingleVimrc(b:vimrc_path . 'vundle.vim')
    if PluginExist('vundle')
        let l:vimrc_path_str    = globpath(b:vimrc_path, "*.vimrc")
        let l:vimrc_list        = split(l:vimrc_path_str)
        for vimrc in l:vimrc_list
            call LoadSingleVimrc(vimrc)
        endfor
    endif
endfunction

function! PluginExist(plugin_name)
    return globpath(b:bundle_path, a:plugin_name) != "" 
endfunction

" 输出错误信息
function! Error(msg)
	if g:error_message 
		echohl ErrorMsg | echom a:msg | echohl None
	endif
endfunction


" plugin为插件的全名
" 比如https://github.com/tenghui0425/jce-highlight
" 则plugin为tenghui0425/jce-highlight
function! BundlePlugin(plugin)
    if has_key(g:plugin_lists, a:plugin)
        return 1
    endif
    
    let g:plugin_lists[a:plugin] = 1
	execute "Bundle " . "'" . a:plugin . "'"
	let l:plugin_name   = split(a:plugin, "/")[-1]
    if PluginExist(l:plugin_name) == 0
        call Error(l:plugin_name . ' not exist')
        return 0
    else
        return 1
    endif
endfunction

com! -nargs=1 PluginAdd if BundlePlugin(<args>) == 0 | finish | endif

call SetVariablesDefault("g:error_message", 0)

" 若设置了环境变量NOVIMWARNING，则不进行任何警告
if $NOVIMWARNING
	let g:error_message 	= 0
endif

" 加载插件
" 注意：插件的配置必须以插件名加.vimrc命名
" 如a.vim的配置为a.vim.vimrc，放在vimrcs目录下


"  加载vimrcs目录下的所有脚本
call LoadVimrcs()
