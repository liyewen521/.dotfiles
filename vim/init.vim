" Author: Yewen Li
" Create Date: 2020-11-07
" License: MIT


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 通用设置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader = " "           " 定义<leader>键
set nocompatible              " 设置不兼容原始vi模式
filetype on                   " 设置开启文件类型侦测
filetype plugin on            " 设置加载对应文件类型的插件
set noeb                      " 关闭错误的提示
syntax enable                 " 开启语法高亮功能
syntax on                     " 自动语法高亮
set t_Co=256                  " 开启256色支持
set cmdheight=2               " 设置命令行的高度
set showcmd                   " select模式下显示选中的行数
set ruler                     " 总是显示光标位置
set laststatus=2              " 总是显示状态栏
set number                    " 开启行号显示
set cursorline                " 高亮显示当前行
set whichwrap+=<,>,h,l        " 设置光标键跨行
set ttimeoutlen=0             " 设置<ESC>键响应时间
set virtualedit=block,onemore " 允许光标出现在最后一个字符的后面
set redrawtime=100000         " 高亮文档的行数上限
set wildmenu                  " 命令自动补全功能
set relativenumber            " 显示相对行号


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 代码缩进和排版
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set autoindent              " 设置自动缩进
set smartindent             " 智能的选择对其方式
filetype indent on          " 自适应不同语言的智能缩进
set expandtab               " 将制表符扩展为空格
set tabstop=4               " 设置编辑时制表符占用空格数
set shiftwidth=4            " 设置格式化时制表符占用空格数
set softtabstop=4           " 设置4个空格为制表符
set smarttab                " 在行和段开始处使用制表符
set wrap                    " 自动折行
set backspace=2             " 使用回车键正常处理indent,eol,start等
set sidescroll=10           " 设置向右滚动字符数
set nofoldenable            " 启动 Vim 时关闭折叠
set foldmethod=indent       " 缩进折叠模式，za打开或关闭当前折叠，
                            " zM关闭所有折叠，zR打开所有折叠


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 搜索设置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set hlsearch            " 高亮显示搜索结果
exec "nohlsearch"       
                        " 消除加载新的vim时还会显示上一次的搜索高亮
set incsearch           " 开启实时搜索功能
set ignorecase          " 搜索时大小写不敏感


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 缓存设置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nobackup            " 设置不备份
set noswapfile          " 禁止生成临时文件
set autoread            " 文件在vim之外修改过，自动重新读入
set autowrite           " 设置自动保存
set confirm             " 在处理未保存或只读文件的时候，弹出确认


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 编码设置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set langmenu=en_US.UTF-8
set termencoding=utf-8
set encoding=utf8
set fileencodings=utf8,ucs-bom,gbk,cp936,gb2312,gb18030


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 插件及配置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" @ vim-plug
call plug#begin('~/.config/nvim/plugged')
    " 主题
    Plug 'danilo-augusto/vim-afterglow'
    
    " 用于显示代码对齐线
    Plug 'Yggdroot/indentLine'
    
    " 状态栏美化及其主题
    Plug 'vim-airline/vim-airline'       
    Plug 'vim-airline/vim-airline-themes'
    " 
    " 彩色括号
    Plug 'luochen1990/rainbow'
    
    " 目录树
    Plug 'preservim/nerdtree'
    
    " 智能补全插件
    " Plug 'neoclide/coc.nvim', {'branch': 'release'}   " 升级会返回fatal: invalid reference: release
    Plug 'neoclide/coc.nvim'
    
    " 快速代码注释
    Plug 'tpope/vim-commentary'
    
    " 调试器
    Plug 'puremourning/vimspector'

    " 优化打开大文件
    Plug 'vim-scripts/LargeFile'

    " 用于在NerdTree上显示git信息
    " Plug 'Xuyuanp/nerdtree-git-plugin'
    
    " 代码对齐
    " Plug 'godlygeek/tabular'
    
    " 开始界面
    " Plug 'mhinz/vim-startify'
    
    " Plug 'fugalh/desert.vim'
    
    " 用于和ctags配合完成代码的分析和跳转
    " Plug 'vim-scripts/autoload_cscope.vim'
call plug#end()

" @ ctags
" set tags=./.tags,.tags,./tags,tags

" @ color scheme
colorscheme afterglow

" @ indentLine
let g:indent_guides_guide_size   = 1  " 指定对齐线的尺寸
let g:indent_guides_start_level  = 2  " 从第二层开始可视化显示缩进

" @ airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#buffer_nr_show = 0
let g:airline#extensions#tabline#formatter = 'default'
let g:airline_theme = 'afterglow'
let g:airline#extensions#keymap#enabled = 1
let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline#extensions#tabline#buffer_idx_format = {
        \ '0': '0 ',
        \ '1': '1 ',
        \ '2': '2 ',
        \ '3': '3 ',
        \ '4': '4 ',
        \ '5': '5 ',
        \ '6': '6 ',
        \ '7': '7 ',
        \ '8': '8 ',
        \ '9': '9 '
        \}
" 切换到前一个 tab
nmap <c-p> <Plug>AirlineSelectPrevTab
" 切换到后一个 tab
nmap <c-n> <Plug>AirlineSelectNextTab
" 退出当前的 tab
nmap <c-q> :bp<cr>:bd #<cr>
" 新建tab
nmap <c-t> :enew<cr>

" @ desert color scheme
" colorscheme desert

" @ rainbow
let g:rainbow_active = 1
let g:rainbow_conf = {
\   'guifgs': ['darkorange3', 'seagreen3', 'royalblue3', 'firebrick'],
\   'ctermfgs': ['lightyellow', 'lightcyan','lightblue', 'lightmagenta'],
\   'operators': '_,_',
\   'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
\   'separately': {
\       '*': {},
\       'tex': {
\           'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/'],
\       },
\       'lisp': {
\           'guifgs': ['darkorange3', 'seagreen3', 'royalblue3', 'firebrick'],
\       },
\       'vim': {
\           'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/', 'start=/{/ end=/}/ fold', 'start=/(/ end=/)/ containedin=vimFuncBody', 'start=/\[/ end=/\]/ containedin=vimFuncBody', 'start=/{/ end=/}/ fold containedin=vimFuncBody'],
\       },
\       'html': {
\           'parentheses': ['start=/\v\<((area|base|br|col|embed|hr|img|input|keygen|link|menuitem|meta|param|source|track|wbr)[ >])@!\z([-_:a-zA-Z0-9]+)(\s+[-_:a-zA-Z0-9]+(\=("[^"]*"|'."'".'[^'."'".']*'."'".'|[^ '."'".'"><=`]*))?)*\>/ end=#</\z1># fold'],
\       },
\       'css': 0,
\   }
\}

" @ nerdtree
" autocmd vimenter * NERDTree   " 自动开启Nerdtree
let g:NERDTreeWinSize = 25      " 设定NERDTree视窗大小
let NERDTreeShowBookmarks=1     " 开启Nerdtree时自动显示Bookmarks
" autocmd vimenter * if !argc()|NERDTree|endif      " 打开vim时如果没有文件自动打开NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif   " 当NERDTree为剩下的唯一窗口时自动关闭
" 设置树的显示图标
let g:NERDTreeDirArrowExpandable = '+'
let g:NERDTreeDirArrowCollapsible = '-'
let NERDTreeIgnore = ['\.pyc$']  " 过滤所有.pyc文件不显示
let g:NERDTreeShowLineNumbers=0 " 是否显示行号
let g:NERDTreeHidden=0     " 不显示隐藏文件
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
" 开启/关闭nerdtree快捷键
nnoremap <leader>n :NERDTreeToggle<CR>
let g:clipboard = {
  \ 'name': 'pbcopy',
  \ 'copy': {
  \    '+': 'pbcopy',
  \    '*': 'pbcopy',
  \  },
  \ 'paste': {
  \    '+': 'pbpaste',
  \    '*': 'pbpaste',
  \ },
  \ 'cache_enabled': 0,
  \ }


" @ coc-vim
" if hidden is not set, TextEdit might fail.
set hidden
" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup
 
" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300
 
" don't give |ins-completion-menu| messages.
set shortmess+=c
 
" always show signcolumns
set signcolumn=yes
 
" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
 
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
 
" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()
 
" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Or use `complete_info` if your vim support it, like:
" inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
 
" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
 
" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>
 
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction
 
" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')
 
" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)
 
" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)
 
augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end
 
" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)
 
" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)
 
" Create mappings for function text object, requires document symbols feature of languageserver.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)
 
" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')
 
" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)
 
" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" coc extension
let g:coc_global_extensions = ['coc-highlight', 'coc-clangd', 'coc-sh', 'coc-rls']

" @ tabular
" let g:tabular_loaded = 1

" @ vimspector
let g:vimspector_enable_mappings = 'HUMAN'
let g:vimspector_install_gadgets = [ 'debugpy', 'vscode-cpptools', 'CodeLLDB' ]

" @ LargeFile
let g:LargeFile=100  " 单位为MB
"" @ vim-cscope
"set nocst    "在cscope数据库添加成功的时候不在命令栏现实提示信息.
"set cspc=6  "cscope的查找结果在格式上最多显示6层目录.
"let g:autocscope_menus=0  "关闭autocscope插件的快捷健映射.防止和我们定义的快捷键冲突.

"" ctags 快捷键
"nmap ff <c-]>
"nmap ss <c-t>

""cscope相关的快捷键映射
""s:查找即查找C语言符号出现的地方
"nmap fs :cs find s <C-R>=expand("<cword>")<CR><CR>
""g:查找函数、宏、枚举等定义的位置
"nmap fg :cs find g <C-R>=expand("<cword>")<CR><CR>
""c:查找光标下的函数被调用的地方
"nmap fc :cs find c <C-R>=expand("<cword>")<CR><CR>
""t: 查找指定的字符串出现的地方
"nmap ft :cs find t <C-R>=expand("<cword>")<CR><CR>
""e:egrep模式查找,相当于egrep功能
"nmap fe :cs find e <C-R>=expand("<cword>")<CR><CR>
""f: 查找文件名,相当于lookupfile
"nmap fn :cs find f <C-R>=expand("<cfile>")<CR><CR>
""i: 查找当前文件名出现过的地方
"nmap fi :cs find i <C-R>=expand("<cfile>")<CR><CR>
""d: 查找本当前函数调用的函数
"nmap fd :cs find d <C-R>=expand("<cword>")<CR><CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 按键重映射设置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 分屏窗口移动
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" 复制当前选中到系统剪切板
vmap <leader><leader>y "+y

" 将系统剪切板内容粘贴到vim
nnoremap <leader><leader>p "+p

" 编辑vimrc相关配置文件
nnoremap <leader>e :edit $MYVIMRC<cr>

" 安装、更新、删除插件
nnoremap <leader><leader>i :PlugInstall<cr>
nnoremap <leader><leader>u :PlugUpdate<cr>
nnoremap <leader><leader>c :PlugClean<cr>

" 将Caps Lock映射到Esc
" au VimEnter * silent! !xmodmap -e 'clear Lock' -e 'keycode 0x42 = Escape'
" au VimLeave * silent! !xmodmap -e 'clear Lock' -e 'keycode 0x42 = Caps_Lock'
