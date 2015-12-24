"统一tab为4个空格
set tabstop=4
set softtabstop=4
set shiftwidth=4

"命令行高度
set cmdheight=4

"显示行号
set number

"显示标尺
set ruler

"配色风格
colorscheme koehler 

"设置退格键可删除的位置
set backspace=indent,eol,start

"设置新行同上一行的缩进相同
set autoindent

"设置历史列表长度
set history=50

"右下角显示完整的命令
set showcmd

"显示搜索单词高亮
set hlsearch

"不要自动换行
set nowrap

filetype plugin indent on

"去掉输入错误的系统提示音
set noeb

"语法高亮
syntax enable
syntax on

"突出显示当前选择行列
set cursorline
set cursorcolumn
"禁止生成临时文件
set nobackup
set noswapfile

"自动补全
:inoremap ( ()<esc>i
:inoremap ) <c-r>=ClosePair(')')<CR>
:inoremap { {}<esc>i
:inoremap } <c-r>=ClosePair('}')<CR>
:inoremap [ []<ESC>i
:inoremap ] <c-r>=ClosePair(']')<CR>

function! ClosePair(char)
	if getline('.')[col('.') - 1] == a:char
		return "\<Right>"
	else
		return a:char
	endif
endfunction

"设置编码
set encoding=utf-8
set fileencodings=utf-8,gbk,gb18030,gk2312
language messages zh_CN.utf-8

"gui中文乱码问题
if has("gui_running")
	source $VIMRUNTIME/delmenu.vim
	source $VIMRUNTIME/menu.vim	
else
	highlight CursorLine guibg=lightblue guifg=black ctermbg=DarkBlue 
	"ctermfg=red
	highlight CursorColumn guibg=lightblue ctermbg=lightgray guifg=black ctermfg=black
endif

call pathogen#infect()

set guifont=Monospace
set nocompatible
"let g:Powerline_symbols = 'fancy'


let Tlist_Show_One_File = 1
let Tlist_Exit_OnlyWindow = 1

let Tlist_Use_Right_Window = 1         "在右侧窗口中显示taglist
let Tlist_GainFocus_On_ToggleOpen = 1  "打开taglist时，光标保留在taglist窗口
let Tlist_Ctags_Cmd='ctags'  "设置ctags命令的位置

set completeopt=menu,menuone  
let OmniCpp_MayCompleteDot=1    "  打开  . 操作符
let OmniCpp_MayCompleteArrow=1  "打开 -> 操作符
let OmniCpp_MayCompleteScope=1  "打开 :: 操作符
let OmniCpp_NamespaceSearch=1   "打开命名空间
let OmniCpp_GlobalScopeSearch=1  
let OmniCpp_DefaultNamespace=["std"]  
let OmniCpp_ShowPrototypeInAbbr=1	"打开显示函数原型
let OmniCpp_SelectFirstItem = 2		"自动弹出时自动跳至第一个

nmap <S-L> :tabp <cr>
nmap <S-H> :tabn <cr>
nmap <C-S> :w <cr>
imap <C-S> <ESC>:w<cr>

nmap <A-r> :!ctags -R --languages=c++ --langmap=c++:+.inl -h +.inl --c++-kinds=+px --fields=+aiKSz --extra=+q <cr>

nmap <F2> :vertical resize -10 <cr>
nmap <F3> :vertical resize +10 <cr>
nmap <F4> :NERDTreeToggle <cr>
nmap <F5> :!build <cr>
nmap <F6> :!build clean <cr>
nmap <F11> :ctoggle <cr>
nmap <F12> : Tlist<CR>
