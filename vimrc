"禁用VI兼容模式
set nocompatible
" 格式化高亮
syntax on
" 括号匹配
set showmatch
" 显示行号
:set nu
" 指定颜色配置文件 /usr/share/vim/vim73/colors/desert.vim
:colorscheme desert
" php function dict
au FileType php setlocal dict+=~/.vim/dict/php_funclist.dict
"高亮光标所在行
set cul 
set ruler           " 显示标尺  
set showcmd         " 输入的命令显示出来，看的清楚些  
"set whichwrap+=<,>,h,l   " 允许backspace和光标键跨越行边界(不建议)  
set scrolloff=3     " 光标移动到buffer的顶部和底部时保持3行距离  
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ %{strftime(\"%y-%m-%d\ %H:%M\")}   "状态行显示的内容  
set laststatus=2    " 启动显示状态行(1),总是显示状态行(2)  
" 自动缩进
set autoindent
set cindent
" Tab键的宽度
set tabstop=4
" 统一缩进为4
set softtabstop=4
set shiftwidth=4
" 使用空格代替制表符
set expandtab
" 在行和段开始处使用制表符
set smarttab
"语言设置
set langmenu=zh_CN.UTF-8
" 设置中文帮助
set helplang=cn
" 总是显示状态行
set cmdheight=2
" 侦测文件类型
filetype on
" 载入文件类型插件
filetype plugin on
" 自动检测文件类型
filetype plugin indent on
" 语法检查
let g:syntastic_php_checkers=['php']


"新建.c,.h,.sh,.java文件，自动插入文件头 
autocmd BufNewFile *.sh,*.py exec ":call SetTitle()" 
"定义函数SetTitle，自动插入文件头 
func SetTitle() 
    "如果文件类型为.sh文件 
    if &filetype == 'sh' 
        call setline(1,"\#!/bin/bash") 
        call append(line("."), "") 
    elseif &filetype == 'python'
        call setline(1,"#!/usr/bin/env python")
        call append(line("."),"# coding=utf-8")
        call append(line(".")+1, "") 
    endif
endfunc 
autocmd BufNewFile * normal G

" 设置当文件被改动时自动载入
set autoread

"代码补全 
set completeopt=preview,menu

" 在处理未保存或只读文件的时候，弹出确认
set confirm
