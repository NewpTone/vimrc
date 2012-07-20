" ===========================================================================
" For AlexYang
" ===========================================================================
" ====== 插件管理 ======
call pathogen#infect()

" ====== 基本设置 ======
" 显示当前的行号列号：
set ruler
" 在状态栏显示正在输入的命令
set showcmd
" 显示行号：
set number
" 为方便复制，用<F2>开启/关闭行号显示:
nnoremap <F2> :set nonumber!<CR>:set foldcolumn=0<CR>
" 编码
set fileencoding=utf-8
set encoding=utf-8

" 窗口切换快捷键修改
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

" ====== 自动检测文件类型并加载相应的设置 ======
syntax on
filetype plugin indent on
autocmd FileType python setlocal et sta sw=4 sts=4
autocmd FileType java setlocal et sta sw=4 sts=4
autocmd FileType php setlocal et sta sw=4 sts=4
autocmd FileType c setlocal et sta sw=4 sts=4
autocmd fileType cpp setlocal et sta sw=4 sws=4

" ====== 代码折叠 ======
autocmd FileType python setlocal foldmethod=indent
autocmd FileType java setlocal foldmethod=indent
autocmd FileType php setlocal foldmethod=indent
autocmd FileType c setlocal foldmethod=indent
autocmd fileType cpp setlocal foldmethod=indent

" 默认展开所有代码
set foldlevel=99
" 空格键作为快捷键
:nnoremap <space> za

" ====== 代码检查 ======
" 禁止PyFlakes使用QuickFix，这样在按下<F7>时会调用flake8，而有对于代码编辑时的错误仍能得到有效的提示
let g:pyflakes_use_quickfix = 0
" 如有需要，可设置忽略部分错误
let g:flake8_ignore="E501,W801,W802"
" Python文件使用Flake8
autocmd BufWritePost *.py call Flake8()

" ======= 代码补全 ======
" 让Vim的补全菜单行为与一般IDE一致(参考VimTip1228)
set completeopt+=longest
" 离开插入模式后自动关闭预览窗口
autocmd InsertLeave * if pumvisible() == 0|pclose|endif
 
" 回车即选中当前项
inoremap <expr> <CR>       pumvisible() ? "\<C-y>" : "\<CR>"
" 上下左右键的行为
inoremap <expr> <Down>     pumvisible() ? "\<C-n>" : "\<Down>"
inoremap <expr> <Up>       pumvisible() ? "\<C-p>" : "\<Up>"
inoremap <expr> <PageDown> pumvisible() ? "\<PageDown>\<C-p>\<C-n>" : "\<PageDown>"
inoremap <expr> <PageUp>   pumvisible() ? "\<PageUp>\<C-p>\<C-n>" : "\<PageUp>"

" ====== CTAGS ======
set tags=tags;/

" ====== TagList ======
" F4作为开关taglist的快捷键
nnoremap <silent> <F4> :TlistToggle<CR>
let Tlist_Show_One_File = 1 " 只显示一个文件的taglist
let Tlist_Exist_OnlyWindow = 1 " 如果taglist敞口
let Tlist_Use_Right_Window = 1 " 在窗口右侧
let Tlist_Sort_Type = "order" " sort by order or name
let Tlist_Display_Prototype = 0 " do not show prototypes and not tags in the taglist window.
let Tlist_Compart_Format = 1 " Remove extra information and blank lines from the taglist window.
let Tlist_GainFocus_On_ToggleOpen = 1 " Jump to taglist window on open.
let Tlist_Display_Tag_Scope = 1 " Show tag scope next to the tag name.
"let Tlist_Close_On_Select = 1 " Close the taglist window when a file or tag is selected.
let Tlist_Enable_Fold_Column = 0 " Don't Show the fold indicator column in the taglist window.
let Tlist_WinWidth = 30
" let Tlist_Ctags_Cmd = 'ctags --c++-kinds=+p --fields=+iaS --extra=+q --languages=c++'
" very slow, so I disable this
" let Tlist_Process_File_Always = 1 " To use the :TlistShowTag and the :TlistShowPrototype commands without the taglist window and the taglist menu, you should set this variable to 1.
" :TlistShowPrototype [filename] [linenumber]

" ====== Tagbar======
nmap <F5> :TagbarToggle<CR>
let tagbar_width = 30

" ====== NerdTree ======
" 打开 NerdTree
map <silent> <F3> :NERDTreeToggle<CR>
let NERDTreeIgnore = ['\.pyc$']

"进行版权声明的设置
""添加或更新头
map <F6> :call AddTitle()<cr>'s
function AddTitle()
    call append(0,"#!/usr/bin/python")
    call append(1,"# -*- coding: utf-8 -*-")
    echohl WarningMsg | echo "Successful in adding the copyright." | echohl None
endf
