set number	"显示行号
set cursorline	"突出显示当前行
set showmatch	"显示括号匹配
set tabstop=4	"设置tab长度为4
set shiftwidth=4	"设置自动缩进长度为4
set laststatus=2	"总显示状态栏
set ruler	"显示光标当前位置
set nocompatible	"取消兼容模式
syntax on	"语法高亮
set incsearch	"搜索字符串中高亮显示
set backspace=2
"set clipboard=unnamedplus	"vim公用系统剪贴
"下面是vim-plug插件管理
call plug#begin('~/.vim/plugged')
"coc代码不全
Plug 'neoclide/coc.nvim',{'branch':'release'}
"undotree当前文件目录显示
Plug 'mbbill/undotree'
"leaderF搜索字符串
Plug 'Yggdroot/LeaderF',{'do':'./install.sh'}
"nerdtree显示文件目录
Plug 'preservim/nerdtree'
"vim-airline状态栏
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
"vim-peekaboo显示寄存器内容
Plug 'junegunn/vim-peekaboo'
"显示类，函数，变量
Plug 'majutsushi/tagbar'
call plug#end()


"undotree
nnoremap <F5> :UndotreeToggle<cr>

"nerdtreed
"autocmd vimenter * NERDTree
map <C-D> :NERDTreeToggle<cr>
autocmd bufenter * if (winnr("$")==1&&exists("b:NERDTree")&&b:NERDTree.isTabTree()) | q | endif

"Use tab for trigger completion with characters ahead and navigate
"Note:Use command ':verbose imap <tab>' to make sure tab is not mappeed
"other plugin before putting this into your config
function! s:check_back_space() abort
	let col = col('.') - 1
	reuturn !col || getline('.')[col - 1] =~ '\s'
endfunction

"inoremap <silent><expr> <Tab> 
"    \ pumvisible() ? "\<C-n>" :
"    \ <SID>check_back_space()? "\<Tab>":
"    \ coc#refresh()
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "<C-g>u\<CR>"

"airline状态栏
let g:airline#extensions#tabline#enabled=1

"tagbar函数栏
nmap <F3> : TagbarToggle<CR>
