" 设置leader键
let mapleader=","

" 启用vundle
set nocompatible	" be iMproved, required
filetype off		" required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

"
" github
"
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" YCM
Plugin 'Valloric/YouCompleteMe'
" YCM配置
autocmd InsertLeave * if pumvisible() == 0|pclose|endif			" 离开插入模式后自动关闭预览窗口"
let g:ycm_collect_identifiers_from_tags_files = 1				" 开启 YCM基于标签引擎
let g:ycm_collect_identifiers_from_comments_and_strings = 1		" 注释与字符串中的内容也用于补全
let g:syntastic_ignore_files=[".*\.py$"]
let g:ycm_seed_identifiers_with_syntax = 1						" 语法关键字补全
let g:ycm_complete_in_comments = 1
let g:ycm_confirm_extra_conf = 0								" 关闭加载.ycm_extra_conf.py提示
let g:ycm_key_list_select_completion = ['<c-n>', '<Down>']		" 映射按键,没有这个会拦截掉tab, 导致其他插件的tab不能用.
let g:ycm_key_list_previous_completion = ['<c-p>', '<Up>']
let g:ycm_complete_in_comments = 1								" 在注释输入中也能补全
let g:ycm_complete_in_strings = 1								" 在字符串输入中也能补全
let g:ycm_collect_identifiers_from_comments_and_strings = 1		" 注释和字符串中的文字也会被收入补全
let g:ycm_global_ycm_extra_conf='~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
let g:ycm_show_diagnostics_ui = 0								" 禁用语法检查
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<CR>"			" 回车即选中当前项
nnoremap <c-j> :YcmCompleter GoToDefinitionElseDeclaration<CR>	" 跳转到定义处
let g:ycm_min_num_of_chars_for_completion=2						" 从第2个键入字符就开始罗列匹配项"

" 状态栏美化插件
Plugin 'vim-airline/vim-airline'
" 启用powerline
let g:powerline_pycmd="py3"
" 显示颜色
set t_Co=256
set laststatus=2
" 使用powerline打过补丁的字体
let g:airline_powerline_fonts = 1
" 开启tabline
let g:airline#extensions#tabline#enabled = 1
" tabline中当前buffer两端的分隔字符
let g:airline#extensions#tabline#left_sep = ' '
" tabline中未激活buffer两端的分隔字符
let g:airline#extensions#tabline#left_alt_sep = ' '
" tabline中buffer显示编号
let g:airline#extensions#tabline#buffer_nr_show = 1
" 映射切换buffer的键位
nnoremap [b :bp<CR>
nnoremap ]b :bn<CR>
" 映射<leader>num到num buffer
map <leader>1 :b 1<CR>
map <leader>2 :b 2<CR>
map <leader>3 :b 3<CR>
map <leader>4 :b 4<CR>
map <leader>5 :b 5<CR>
map <leader>6 :b 6<CR>
map <leader>7 :b 7<CR>
map <leader>8 :b 8<CR>
map <leader>9 :b 9<CR>

" markdown语法高亮
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
" 打开Latex支持
let g:vim_markdown_math = 1
" 启用删除线
let g:vim_markdown_strikethrough = 1
" TOC窗口自动调整
let g:vim_markdown_toc_autofit = 1

" markdown目录插件
Plugin 'mzlogin/vim-markdown-toc'
" 储存时自动更新目录
let g:vmt_auto_update_on_save = 1
" 删除较低层次目录
" autocmd BufNewFile *.md exec ":call RToc()"
" autocmd BufRead *.md exec ":call RToc()"
" function RToc()
" 	 exe "/-toc .* -->"
"    let lstart=line('.')
"    exe "/-toc -->"
"    let lnum=line('.')
"    execute lstart.",".lnum."g/           /d"
" endfunction
" 按<F7>插入目录
autocmd FileType markdown nnoremap <silent> <F7> :GenTocGFM<CR>

" 数学公式预览插件
Plugin 'iamcco/mathjax-support-for-mkdp'

" 浏览器预览
Plugin 'iamcco/markdown-preview.vim'
let g:mkdp_path_to_chrome = "/usr/bin/google-chrome-stable"
" 按<F8>开启预览
" 普通模式
nmap <silent> <F8> <Plug>MarkdownPreview 
" 插入模式
imap <silent> <F8> <Plug>MarkdownPreview
" 按<F9>关闭预览
" 普通模式
nmap <silent> <F9> <Plug>StopMarkdownPreview
" 插入模式
imap <silent> <F9> <Plug>StopMarkdownPreview

" 关键词触发替换插件
Plugin 'SirVer/ultisnips'
" 设置tab键为触发键
let g:UltiSnipsExpandTrigger = '<tab>'
" 设置向后跳转键
let g:UltiSnipsJumpForwardTrigger = '<tab>'
" 设置向前跳转键
let g:UltiSnipsJumpBackwardTrigger = '<S-tab>'
" 设置文件目录
let g:UltiSnipsSnippetDirectories = "/home/sjliu/.vim/bundle/ultisnips/markdown.snippets"
" 设置打开配置文件时为垂直打开
let g:UltiSnipsEditSplit = "vertical"

" 图片插入插件
Plugin 'ferrine/md-img-paste.vim'
" 设置默认储存文件夹
let g:mdip_imgdir = 'pic'
" 设置默认图片名称
let g:mdip_imgname = 'image'
" 设置快捷键<C-p>
autocmd FileType markdown nnoremap <silent> <C-p> :call mdip#MarkdownClipboardImage()<CR>F%i

"
" vim-scripts
"
" 提供源代码符号的结构化视图
Plugin 'taglist.vim'
" 按F3显示
map <F3> :TlistToggle<CR>
let Tlist_Use_Right_Window=1
let Tlist_Show_One_File=1
let Tlist_Exit_OnlyWindow=1
let Tlist_WinWidt=25

" 目录树
Plugin 'The-NERD-tree'
" 按F2显示当前目录树
map <F2> :NERDTreeToggle<CR>
let NERDTreeWinSize=25

" 代码缩进提示
Plugin 'indentLine.vim'

" 自动补全符号
Plugin 'delimitMate.vim'

"
" 非github
"

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" 补全文件
autocmd BufNewFile *.cpp,*.[ch],*.sh,*.java exec ":call SetTitle()"
func SetTitle() 
	if &filetype == 'sh' 
		call setline(1, "##########################################################################") 
		call append(line("."), "# File Name: ".expand("%")) 
		call append(line(".")+1, "# Author: sjliu") 
		call append(line(".")+2, "# mail: sjliu98@163.com") 
		call append(line(".")+3, "# Created Time: ".strftime("%c")) 
		call append(line(".")+4, "#########################################################################") 
		call append(line(".")+5, "#!/bin/zsh")
		call append(line(".")+6, "PATH=/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl")
		call append(line(".")+7, "export PATH")
		call append(line(".")+8, "")
	else 
		call setline(1, "/*************************************************************************") 
		call append(line("."), "	> File Name: ".expand("%")) 
		call append(line(".")+1, "	> Author: sjliu") 
		call append(line(".")+2, "	> Mail: sjliu98@163.com ") 
		call append(line(".")+3, "	> Created Time: ".strftime("%c")) 
		call append(line(".")+4, " ************************************************************************/") 
		call append(line(".")+5, "")
	endif
	if &filetype == 'cpp'
		call append(line(".")+6, "#include<iostream>")
		call append(line(".")+7, "using namespace std;")
		call append(line(".")+8, "")
	endif
	if &filetype == 'c'
		call append(line(".")+6, "#include<stdio.h>")
		call append(line(".")+7, "")
	endif
	if &filetype == 'java'
		call append(line(".")+6,"public class ".expand("%"))
		call append(line(".")+7,"")
	endif
	" 自动定位到文末
	autocmd BufNewFile * normal G
endfunc

" 文件被改动时自动载入
set autoread

" quickfix模式
:set makeprg=g++\ -Wall\ \ %
autocmd FileType c,cpp map <buffer> <leader><space> :w<cr>:make<cr>

" 代码补全
set completeopt=preview,menu

" 允许插件
filetype plugin on

" 共享剪贴板
set clipboard=unnamed

" 从不备份
set nobackup

" 自动保存
set autowrite

" 打开状态栏标尺
set ruler

" 突出显示当前行
set cursorline

" 设置magic模式
set magic

" 隐藏工具栏
set guioptions-=T

" 隐藏菜单栏
set guioptions-=m

" 设置在状态行显示的信息
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ %{strftime(\"%d/%m/%y\ -\ %H:%M\")}
set statusline=[%F]%y%r%m%*%=[Line:%l/%L,Column:%c][%p%%]

" 启用手工折叠
set foldcolumn=0

" 启用缩进折叠
set foldmethod=indent 

" 根据指定级别折叠所进
set foldlevel=3 

" 启动折叠
set foldenable

" 使用vim键盘模式
set nocompatible

" 语法高亮
syntax on

" 在处理未保存或只读文件的时候，弹出确认
set confirm

" 自动缩进
set autoindent
set cindent

" Tab键的宽度
set tabstop=4

" 统一缩进为4
set softtabstop=4
set shiftwidth=4

" 不要用空格代替制表符
set noexpandtab

" 在行和段开始处使用制表符
set smarttab

" 显示行号
set number

" 历史记录数
set history=1000

" 禁止生成临时文件
set nobackup
set noswapfile

" 搜索忽略大小写
set ignorecase

" 搜索逐字符高亮
set hlsearch
set incsearch

" 行内替换
set gdefault

" 编码设置
set enc=utf-8
set fencs=utf-8,ucs-bom,shift-jis,gb18030,gbk,gb2312,cp936

" 语言设置
set langmenu=zh_CN.UTF-8
set helplang=cn

" 总是显示状态行
set laststatus=2

" 命令行（在状态行下）的高度，默认为1，这里是2
"set cmdheight=2

" 侦测文件类型
filetype on

" 为特定文件类型载入相关缩进文件
filetype indent on

" 保存全局变量
set viminfo+=!

" 带有如下符号的单词不要被换行分割
set iskeyword+=_,$,@,%,#,-

" 字符间插入的像素行数目
set linespace=0

" 增强模式中的命令行自动完成操作
set wildmenu

" 使回格键（backspace）正常处理indent, eol, start等
set backspace=2

" 允许backspace和光标键跨越行边界
set whichwrap+=<,>,h,l

" 可以在buffer的任何地方使用鼠标（类似office中在工作区双击鼠标定位）
set mouse=a
set selection=exclusive
set selectmode=mouse,key

" 通过使用: commands命令，告诉我们文件的哪一行被改变过
set report=0

" 在被分割的窗口间显示空白，便于阅读
set fillchars=vert:\ ,stl:\ ,stlnc:\

" 高亮显示匹配的括号
set showmatch

" 匹配括号高亮的时间（单位是十分之一秒）
set matchtime=1

" 光标移动到buffer的顶部和底部时保持3行距离
set scrolloff=3

" C程序自动缩进
set smartindent

" 高亮显示普通txt文件（需要txt.vim脚本）
au BufRead,BufNewFile *  setfiletype txt

" 自动补全
:inoremap ( ()<ESC>i
:inoremap ) <c-r>=ClosePair(')')<CR>
:inoremap [ []<ESC>i
:inoremap ] <c-r>=ClosePair(']')<CR>
:inoremap " ""<ESC>i
:inoremap ' ''<ESC>i
function! ClosePair(char)
	if getline('.')[col('.') - 1] == a:char
		return "\<Right>"
	else
		return a:char
	endif
endfunction
filetype plugin indent on 

" 打开文件类型检测
set completeopt=longest,menu
