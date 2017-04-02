"Y_VIMRC 
"author cqm 
"email chester@hit.edu.cn
"Time: Wed Feb  3 16:40:07 CST 2016
"settings are as followed:

"---------------------------------START-------------------------------------------------


"""""""""""""""""""""""""""""""""""""""基本设置""""""""""""""""""""""""""""""""""""""""
" 设定默认解码 
set fenc=utf-8 
set fencs=utf-8,usc-bom,euc-jp,gb18030,gbk,gb2312,cp936 

" 支持256色，使得vim配色支持终端
set t_Co=256

" C缩进
set smartindent 
set cindent

" 设置背景和字体
colorscheme molokai
set guifont=Source\ Code\ Pro\ 14 

" 不要使用vi的键盘模式，而是vim自己的 
set nocompatible 

" history文件中需要记录的行数 
set history=1000 

" 在处理未保存或只读文件的时候，弹出确认 
set confirm

" 与windows共享剪贴板 
set clipboard+=unnamed 
 
" 侦测文件类型 
filetype off 
 
" 为特定文件类型载入相关缩进文件 
filetype indent on 
 
" 带有如下符号的单词不要被换行分割 
set iskeyword+=_,$,@,%,#,- 

" 语法高亮
syntax enable
syntax on 
 
"隐藏GUI的工具栏
set guioptions=P

" 不要备份文件 
set nobackup 

" 不要生成swap文件
setlocal noswapfile 
 
" 字符间插入的像素行数目 
set linespace=0 
 
" 在状态行上显示光标所在位置的行号和列号 
set ruler 
 
" 命令行（在状态行下）的高度，默认为1，这里是2 
set cmdheight=2 

" 使回格键（backspace）正常处理indent, eol, start等 
set backspace=indent,eol,start
 
" 允许backspace和光标键跨越行边界 
set whichwrap+=<,>,b,s,[,]
 
" 不让vim发出讨厌的滴滴声 
set noerrorbells 
 
" 高亮显示匹配的括号 
set showmatch 

" 匹配括号高亮的时间（单位是十分之一秒） 
set matchtime=5 
 
" 在搜索的时候忽略大小写 
set ignorecase 
 
" 不要高亮被搜索的句子（phrases） 
set nohlsearch 
 
" 在搜索时，输入的词句的逐字符高亮（类似firefox的搜索） 
set incsearch 
 
" 光标移动到buffer的顶部和底部时保持3行距离,窗口滚动最小距离 
set scrolloff=3 
 
" 2为总显示最后一个窗口的状态行
" 设为1则窗口数多于一个的时候显示最后一个窗口的状态行；
" 0不显示最后一个窗口的状态行 
set laststatus=2 
 
" 继承前一行的缩进方式，特别适用于多行注释 
""set autoindent 

" 显示行号
set number
 
" 制表符为4 
set tabstop=4 
 
" 统一缩进为4 
set softtabstop=4 
set shiftwidth=4 
 
" 不要用空格代替制表符 
set noexpandtab 
 
" 不要换行 
" set nowrap 
" set sidescroll=10
 
" 在行和段开始处使用制表符 
set smarttab 

" Ctrl+A全选，Ctrl+C复制，Ctrl+V粘贴
map <C-A> ggvG$ 
imap <C-A> <Esc>ggvG$
vmap <C-C> "+y<Esc>
map <C-V> "+p
imap <C-V> <Esc>"+pa

" 括号等的自动匹配
inoremap ( ()<Esc>i
inoremap [ []<Esc>i
inoremap { {}<Esc>i
inoremap ' ''<Esc>i
inoremap " ""<Esc>i

" 设置<leader>和<localleader>
let mapleader = ","
let maplocalleader = "."

" 可以折叠 
set foldenable 
set foldmethod=manual 

" 自动更新.vimrc
map <leader>vo <Esc>:vsp ~/.vimrc<CR>


""""""""""""""""""""""""""""""""""""""""Vundle管理插件""""""""""""""""""""""""""""""""""""""""
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'gmarik/vundle'
Plugin 'tpope/vim-fugitive'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'tpope/vim-rails.git'
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
Plugin 'L9'
Plugin 'FuzzyFinder'
Plugin 'git://git.wincent.com/command-t.git'
Plugin 'Valloric/YouCompleteMe'
Plugin 'Valloric/ListToggle'
Plugin 'scrooloose/syntastic'
Plugin 'davidhalter/jedi'
Plugin 'majutsushi/tagbar'
Plugin 'scrooloose/nerdtree'
Plugin 'Lokaltog/vim-powerline'
Plugin 'jeaye/color_coded'
Plugin 'octol/vim-cpp-enhanced-highlight'

call vundle#end()
filetype plugin indent on     " required

""""""""""""""""""""""""""""""""""""""""C语言的编译运行"""""""""""""""""""""""""""""""""""""""""
" <F5>编译C/py语言，<F6>运行
let g:syntastic_cpp_compiler = 'g++'  
let g:syntastic_cpp_compiler_options = '-std=c++11 -stdlib=libc++'
augroup ccompile
    autocmd Filetype c map <F5> <Esc>:w<CR>:!gcc % -std=c99 -g -o %< -lm <CR>
    autocmd Filetype cpp map <F5> <Esc>:w<CR>:!g++ % -std=c++11 -g -o %< -lm <CR>
    autocmd Filetype python map <F5> <Esc>:w<CR>:!python % <CR>
augroup END

augroup crun
    autocmd Filetype c map <F6> <Esc>:! ./%< <CR>
    autocmd Filetype cpp map <F6> <Esc>:! ./%< <CR>
augroup END

" 整行注释
augroup comment
    autocmd Filetype c noremap <buffer> <localleader>/ I//<Esc>
    autocmd Filetype cpp noremap <buffer> <localleader>/ I//<Esc>
	autocmd Filetype h noremap <buffer> <localleader>/ I//<Esc>
augroup END

augroup nocomment
    autocmd Filetype c noremap <buffer> <localleader>. ^xx
    autocmd Filetype cpp noremap <buffer> <localleader>. ^xx
	autocmd Filetype h noremap <buffer> <localleader>. ^xx
augroup END


" 大括号补全
autocmd Filetype c,cpp,h inoremap {<CR> {<CR>}<Esc>O


 
""""""""""""""""""""""""""""""""""""""""""各插件的配置""""""""""""""""""""""""""""""""""""""""""
""""""""""""" Ctags配置
""set tags=./tags,./*/tags
map <F7> <Esc>:!ctags -R <CR><CR>

""""""""""""" ycm配置
nnoremap <leader>gt :YcmCompleter GetType<CR>
nnoremap <leader>gp :YcmCompleter GetParent<CR>
nnoremap <leader>gg :YcmCompleter GoToDefinitionElseDeclaration<CR>
let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'
let g:ycm_confirm_extra_conf=0 "不再询问是否加载.ycm_extra_conf.py文件 
let g:ycm_complete_in_comments = 1  "注释也用补全
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_add_preview_to_completeopt = 0

""""""""""""" TagBar设置
map tb <Esc>:Tagbar <CR>

""""""""""""" NerdTree设置
map <F8> <Esc>:NERDTree <CR>

""""""""""""" color_coded设置
hi link StructDecl Type
hi link UnionDecl Type
hi link ClassDecl Type
hi link EnumDecl Type

""""""""""""""""""""""""""""""""""'纠正错误""""""""""""'""""""""""""""""""""""""""""""""""

abbreviate mian main
abbreviate retrun return


"----------------------------------------------END--------------------------------------------"

