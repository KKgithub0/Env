set nocompatible              " be iMproved, required
filetype off                  " required

set nocompatible
"设置文件检测编码
set fileencodings=gbk,utf-8
"设置内部编码
set encoding=gbk
set termencoding=gbk
"设置新建文件保存编码
set fileencoding=gbk
"搜索忽略大小写
set ignorecase smartcase
"开启实时搜索功能
set incsearch
"高亮搜索
set hlsearch
set mouse=a
"显示行号
set nu!
"显示尺标
set ruler
"配色方案
colorscheme desert
"突出显示当前行
"set cursorline
"highlight CursorLine  cterm=NONE ctermbg=lightgray ctermfg=lightgray guibg=NONE guifg=NONE
"突出显示当前列
"set cursorcolumn
"highlight CursorColumn  cterm=NONE ctermbg=lightgray ctermfg=lightgray guibg=NONE guifg=NONE
"命令打开文件类型检测功能，它相当于文件类型检测功能的开关
filetype on
"运行环境载入不同插件 indent代表不同文件类型不同的缩排方式 .vim/indent
filetype plugin indent on
set completeopt=longest,menu
"语法高亮
syntax enable
syntax on
"自动缩进
"
set ts=4
set sw=4
set expandtab
set autoindent
"table键盘4空格
set tabstop=4
"set expandtab
"当使用移动(shift)命令时移动的字符数
set shiftwidth=4
"增强模式中的命令行自动完成操作,可以在命令行下Tab键给出命令列表
set wildmenu
set wildmode=longest:list,full
"显示状态栏
set laststatus=2
"基于缩进或语法进行代码折叠
set foldmethod=indent
"set foldmethod=syntax
set foldcolumn=0
"启动 vim 时关闭折叠代码
set nofoldenable
"定义快捷键的前缀，即<Leader>
let mapleader=";"

nnoremap <silent> <F12> :A<CR>
