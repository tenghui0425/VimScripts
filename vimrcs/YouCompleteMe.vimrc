" YouCompleteMe
if g:MSWIN
    let g:use_supertab = 1
    call loader#core#LoadSingleVimrc(g:vimrc_path . '/supertab.vimrc', 1)
    finish
endif

let b:youcomplete_path = expand(g:bundle_path . "/YouCompleteMe/")
" 如果ycm的project目录已经存在，则去判断ycm是否可用
" 如果ycm不可用，则去加载supertab
if isdirectory(b:youcomplete_path)
    if !has('python')
        call vimlog#InfoLog('has no python, will load supertab')
        let g:use_supertab = 1
        call loader#core#LoadSingleVimrc(g:vimrc_path . '/supertab.vimrc', 1)
        finish
    endif

    let b:youcompleteme_lib_path = b:youcomplete_path . "third_party/ycmd/"
    if !(filereadable(b:youcompleteme_lib_path . "ycm_client_support.so") && filereadable(b:youcompleteme_lib_path . "ycm_core.so")
                \||filereadable(b:youcompleteme_lib_path . "ycm_client_support.dll") && filereadable(b:youcompleteme_lib_path . "ycm_core.dll"))
        call vimlog#InfoLog("has no compile YCM, will load supertab")
        let g:use_supertab = 1
        call loader#core#LoadSingleVimrc('~/.vim/vimrcs/supertab.vimrc', 1)
        finish
    endif
endif

" 如果ycm的project目录不存在，直接PluginAdd ycm，以便git clone ycm
" 如果ycm的project目录存在，且ycm可用，也PluginAdd ycm，以便加载ycm
PluginAdd 'Valloric/YouCompleteMe', {'pinned': 1}

let g:ycm_min_num_of_chars_for_completion 			= 1
let g:ycm_add_preview_to_completeopt 				= 0
let g:ycm_autoclose_preview_window_after_insertion 	= 1
let g:ycm_error_symbol                              = 'EE'
let g:ycm_warning_symbol                            = 'WW'
let g:ycm_collect_identifiers_from_comments_and_strings = 1
let g:ycm_key_detailed_diagnostics                  = '<leader>d'
let g:ycm_confirm_extra_conf                        = 0
let g:ycm_key_list_select_completion                = ['<C-n>', '<Down>'] 
let g:ycm_key_list_previous_completion              = ['<C-p>', '<Up>'] 

nnoremap <leader>jd :YcmCompleter GoTo<CR>

