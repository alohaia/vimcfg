"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Important:
"       This requires that you install https://github.com/amix/vimrc !
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""
" => vim-plug 插件管理
""""""""""""""""""""""""""""""
call plug#begin('~/.vim/plugins')

Plug 'junegunn/vim-plug'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Ack searching and cope displaying
"    requires ack.vim - it's much better than vimgrep/grep
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Run your favorite search tool from Vim, with an enhanced results list.
Plug 'https://github.com/mileszs/ack.vim'
" Use the the_silver_searcher if possible (much faster than Ack)
if executable('ag')
  let g:ackprg = 'ag --vimgrep --smart-case'
endif
" When you press gv you Ack after the selected text
vnoremap <silent> gv :call VisualSelection('gv', '')<CR>
" Open Ack and put the cursor in the right position
map <leader>g :Ack 
" When you press <leader>r you can search and replace the selected text
vnoremap <silent> <leader>r :call VisualSelection('replace', '')<CR>
" Do :help cope if you are unsure what cope is. It's super useful!
"
" When you search with Ack, display your results in cope by doing:
"   <leader>cc
"
" To go to the next search result do:
"   <leader>n
"
" To go to the previous search results do:
"   <leader>p
"
map <leader>bc :botright cope<cr>
map <leader>co ggVGy:tabnew<cr>:set syntax=qf<cr>pgg
map <leader>n :cn<cr>
map <leader>p :cp<cr>


Plug 'preservim/nerdcommenter'
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1
" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'
" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1
" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }
" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1
" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1
" Enable NERDCommenterToggle to check all selected lines is commented or not
let g:NERDToggleCheckAllLines = 1


" c++ stl高亮
Plug 'octol/vim-cpp-enhanced-highlight'
" 默认不高亮类作用域
let g:cpp_class_scope_highlight = 1
" 成员变量也是默认不显示
let g:cpp_member_variable_highlight = 1
" 声明中高亮类名
let g:cpp_class_decl_highlight = 1
" 模版突出显示
let g:cpp_experimental_template_highlight = 1
" 库突出显示
let g:cpp_concepts_highlight = 1


" +-----------+
" |    IDE    |
" +-----------+

Plug 'preservim/nerdtree' , {'on': ['NERDTreeToggle', 'NERDTree', 'NERDTreeFromBookmark', 'NERDTreeFind']}
let NERDTreeHijackNetrw = 1
let g:NERDTreeWinPos = "left"
let NERDTreeShowHidden=0
let NERDTreeShowBookmarks=1
" let NERDTreeIgnore = ['\.pyc$', '__pycache__']
let NERDTreeIgnore = ['\.pyc$', '__pycache__', '\.vscode$', 'tags',
                     \'\.exe$', '\.EXE$', '\.obj$', '\.OBJ$', '\.jpg$',
                     \'\.JPG', '\.png$', '\.PNG$', 'desktop.ini']
let g:NERDTreeWinSize=30
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
nnoremap <leader>nt :NERDTreeToggle<cr>
nnoremap <leader>nb :NERDTreeFromBookmark<Space>
nnoremap <leader>nf :NERDTreeFind<cr>

" 只剩下NERDTree时关闭窗口
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") &&
    \b:NERDTree.isTabTree()) | q | endif

Plug 'tpope/vim-vinegar'
let NERDTreeHijackNetrw = 0
Plug 'Xuyuanp/nerdtree-git-plugin'
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "M",
    \ "Staged"    : "S",
    \ "Deleted"   : "D",
    \ "Untracked" : "!",
    \ "Renamed"   : "»",
    \ "Unmerged"  : "⎇ ",
    \ "Dirty"     : "✖",
    \ "Clean"     : "✔",
    \ 'Ignored'   : '~',
    \ "Unknown"   : "?"
    \ }
"let g:NERDTreeIndicatorMapCustom = {
"    \ "Modified"  : "✹",
"    \ "Staged"    : "✚",
"    \ "Untracked" : "✭",
"    \ "Renamed"   : "➜",
"    \ "Unmerged"  : "═",
"    \ "Deleted"   : "✖",
"    \ "Dirty"     : "✗",
"    \ "Clean"     : "✔︎",
"    \ 'Ignored'   : '☒',
"    \ "Unknown"   : "?"
"    \ }
" 不显示 Ignored 状态(a heavy feature may cost much more time)
let g:NERDTreeShowIgnoredStatus = 1

" Tagbar,代替TagList
" 要用来编写C++程序，还需要安装(ctags还支持其他语言，详见 :h tagbar.txt)：
" universal-ctags/ctags
" enechaev/packcc
" 其他语言支持，见https://github.com/majutsushi/tagbar/wiki
Plug 'majutsushi/tagbar'
nnoremap <leader>tb :TagbarToggle<cr>
" 当 ctags 不在PATH指定的目录中时，需要自行指定 ctags 的路径
" let g:tagbar_ctags_bin = '...\ctags.exe'
" 跳转后自动关闭
let g:tagbar_autoclose = 0
let g:tagbar_autofocus = 0
let g:tagbar_left = 0
let g:tagbar_width = 40
let g:tagbar_zoomwidth = 0  " 只使用所需的最大列数
let g:tagbar_vertical = 0   " 指定垂直窗口中显示的行数，为0时使用水平窗口
let g:tagbar_sort = 0       " 1 to sort by name
let g:tagbar_case_insensitive = 0   " set to 1 to use case-insensitive comparision while sorting
let g:tagbar_compact = 1    " 隐藏顶部的帮助提示
let g:tagbar_indent = 2     " 缩进空格数
let g:tagbar_singleclick = 0
let g:tagbar_foldlevel = 99 " 展开的最大级数
let g:tagbar_iconchars = ['▸', '▾']
" 操作系统 encoding
" let g:tagbar_systemenc = 'cp936'
" Tagbar 状态栏显示内容
function! TagbarStatusFunc(current, sort, fname, flags, ...) abort
    let colour = a:current ? '%#StatusLine#' : '%#StatusLineNC#'
    let flagstr = join(flags, '')
    if flagstr != ''
        let flagstr = '[' . flagstr . '] '
    endif
    return colour . '[' . sort . '] ' . flagstr . fname
endfunction
let g:tagbar_status_func = 'TagbarStatusFunc'
let g:tagbar_use_cache = 1  " 使用缓存文件来加速 ctags 的解析

highlight TagbarVisiblityPrivate guifg=Red ctermfg=Red
highlight TagbarVisiblityProtected guifg=Blue ctermfg=Blue
highlight TagbarVisiblityPublic guifg=Green ctermfg=Green

let g:tagbar_type_cpp = {
            \ 'ctagstype' : 'c++',
            \ 'kinds'     : [
                \ 'd:macros:1:0',
                \ 'p:prototypes:1:0',
                \ 'g:enums',
                \ 'e:enumerators:0:0',
                \ 't:typedefs:0:0',
                \ 'n:namespaces',
                \ 'c:classes',
                \ 's:structs',
                \ 'u:unions',
                \ 'f:functions',
                \ 'm:members:0:0',
                \ 'v:variables:0:0'
            \ ],
            \ 'sro'        : '::',
            \ 'kind2scope' : {
                \ 'g' : 'enum',
                \ 'n' : 'namespace',
                \ 'c' : 'class',
                \ 's' : 'struct',
                \ 'u' : 'union'
            \ },
            \ 'scope2kind' : {
                \ 'enum'      : 'g',
                \ 'namespace' : 'n',
                \ 'class'     : 'c',
                \ 'struct'    : 's',
                \ 'union'     : 'u'
            \ }
        \ }


Plug 'vim-airline/vim-airline'
nnoremap <C-Tab> :bn<cr>
nnoremap <C-S-Tab> :bp<cr>
set laststatus=2 "1为关闭底部状态栏 2为开启"
set t_Co=256     "终端开启256色支持"

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
"let g:airline_powerline_fonts = 1
let g:airline_theme='molokai' "选择主题

" 显示buffers
let g:airline#extensions#tabline#enabled=1    "Smarter tab line: 显示窗口tab和buffers
let g:airline#extensions#tabline#left_sep = ''  "separater
let g:airline#extensions#tabline#left_alt_sep = ''  "separater
"let g:airline#extensions#tabline#left_alt_sep = ''  "separater
let g:airline#extensions#tabline#right_sep = ''  "separater
let g:airline#extensions#tabline#right_alt_sep = ''  "separater
"let g:airline#extensions#tabline#right_alt_sep = ''  "separater
let g:airline#extensions#tabline#formatter = 'default'  "formater

" NERDTree
let g:airline#extensions#nerdtree_status = 1

"let g:airline_left_sep = '»'
let g:airline_left_sep = ''
"let g:airline_left_alt_sep = ''  "separater
let g:airline_left_alt_sep = ''  "separater
"let g:airline_right_sep = '«'
let g:airline_right_sep = ''
"let g:airline_right_alt_sep = ''  "separater
let g:airline_right_alt_sep = ''  "separater
let g:airline_symbols.crypt = '🔒'
let g:airline_symbols.linenr = '☰ '
"let g:airline_symbols.linenr = '␊'
"let g:airline_symbols.linenr = '␤'
"let g:airline_symbols.linenr = '¶'
let g:airline_symbols.maxlinenr = '㏑'
"let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.branch = '⎇'
"let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
"let g:airline_symbols.paste = '∥'
let g:airline_symbols.spell = 'Ꞩ'
let g:airline_symbols.notexists = 'Ɇ'
let g:airline_symbols.whitespace = 'Ξ'

"配合 airline 使用的字体推荐:powerline/fonts

"airline主题
Plug 'vim-airline/vim-airline-themes'


" +------------ +
" |  ultisnips  |
" +------------ +
" 需要 vim 支持 python
" 需要使用 pip 安装 pynvim
Plug 'SirVer/ultisnips'            " improved vim-snipmate
let g:UltiSnipsSnippetDirectories=['plugins/vim-snippets/UltiSnips']
" 允许使用SnipMate代码段
let g:UltiSnipsEnableSnipMate=1
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<c-c>"
" 在代码段内跳转
let g:UltiSnipsJumpForwardTrigger="jj"
let g:UltiSnipsJumpBackwardTrigger="kk"
" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

Plug 'honza/vim-snippets'           " snips for snipmate and ultisnips


" +---------------------------+
" |   deoplete autocomplate   |
" +---------------------------+
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
" Use deoplete.
" See :help deoplete-options for a complete list of options.
let g:deoplete#enable_at_startup = 1


let g:plug_timeout = 300
Plug 'ycm-core/YouCompleteMe', { 'do': 'python3 ./install.py --clangd-completer'}
"let g:ycm_global_ycm_extra_conf='~/.vim/plugins/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
"let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/cpp/ycm/.ycm_extra_conf.py'
" 禁用syntastic来对python检查
let g:syntastic_ignore_files=[".*\.py$"] 
" 使用ctags生成的tags文件
let g:ycm_collect_identifiers_from_tag_files = 1
" 开启语义补全
" 在定义和声明之间跳转 "DefinitionElseDeclaration
nnoremap <leader>] :YcmCompleter GoTo <C-R>=expand("<cword>")<CR><CR>
"关键字补全
let g:ycm_seed_identifiers_with_syntax = 1
" 在接受补全后不分裂出一个窗口显示接受的项
set completeopt-=preview
" 不显示开启vim时检查ycm_extra_conf文件的信息
let g:ycm_confirm_extra_conf=0
" 每次重新生成匹配项，禁止缓存匹配项
let g:ycm_cache_omnifunc=0
" 在注释中也可以补全
let g:ycm_complete_in_comments=1
" 输入第一个字符就开始补全
let g:ycm_min_num_of_chars_for_completion=1
" 查询ultisnips提供的代码模板补全
let g:ycm_use_ultisnips_completer=1
"disable ycm 语法检查(syntastic)
let g:ycm_enable_diagnostic_signs = 0
let g:ycm_enable_diagnostic_highlighting = 0
" 错误标识符
let g:ycm_error_symbol='>>'
" 警告标识符
let g:ycm_warning_symbol='>*'
"让Vim的补全菜单行为与一般IDE一致(参考VimTip1228)
set completeopt=longest,menu
autocmd InsertLeave * if pumvisible() == 0|pclose|endif	"离开插入模式后自动关闭预览窗口
"inoremap <expr> <CR>       pumvisible() ? "\<C-y>" : "\<CR>"	"回车即选中当前项
"上下左右键的行为 会显示其他信息
inoremap <expr> <Down>     pumvisible() ? "\<C-n>" : "\<Down>"
inoremap <expr> <Up>       pumvisible() ? "\<C-p>" : "\<Up>"
inoremap <expr> <PageDown> pumvisible() ? "\<PageDown>\<C-p>\<C-n>" : "\<PageDown>"
inoremap <expr> <PageUp>   pumvisible() ? "\<PageUp>\<C-p>\<C-n>" : "\<PageUp>"
"youcompleteme  默认tab  s-tab 和自动补全冲突(已将 snip 补全快捷键设置为 <c-c>)
"let g:ycm_key_list_select_completion=['<c-n>']
"let g:ycm_key_list_select_completion = ['<Down>']
"let g:ycm_key_list_previous_completion=['<c-p>']
"let g:ycm_key_list_previous_completion = ['<Up>']
"关闭加载.ycm_extra_conf.py提示
"let g:ycm_confirm_extra_conf=0

" 生成.yacm_extra_conf.py
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable'}


" ale 异步语法检查插件
Plug 'dense-analysis/ale'
"错误和警告都处理完后关闭标志列
let g:ale_sign_column_always = 0
"高亮显示
let g:ale_set_highlights = 1
"自定义error和warning图标
let g:ale_sign_error = '✗'
let g:ale_sign_warning = '⚡'
"在vim自带的状态栏中整合ale
"let g:ale_statusline_format = ['XXH  %d','W  %d','OK']
"let g:ale_echo_msg_error_str = "E"
"let g:ale_echo_msg_warning_str = "W"
"自定义状态栏
let g:ale_statusline_format = ['✗ %d', '⚡ %d', '✔ OK']
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
"显示Linter名称,出错或警告等相关信息
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
"只有保存时才进行语法检测
"let g:ale_lint_on_text_changed = "never"
"打开文件时不进行检查
"let g:ale_lint_on_enter = 0
let g:ale_lint_on_insert_leave = 0
let g:ale_lint_on_enter = 1
"使用clang对c和c++进行语法检查，对python使用flake8进行语法检查
let g:ale_linters = {
\   'python': ['flake8'],
"\   'python': ['pylint'],
\   'c':['clang'],
\   'c++':['clang'],
\}
" ALEFix
" 使用 :ALEFixSuggest 命令可以查看更多 fixers
let g:ale_fixers = {
"\   'javascript': [
"\       'DoSomething',     " Function DoSomething need to be defined.
"\       'eslint',
"\       {buffer, lines -> filter(lines, 'v:val !=~ ''^\s*//''')},
"\   ],
\   'cpp': [
\       'remove_trailing_lines',
\       'trim_whitespace',
\       'clangtidy',
\   ],
\   'python': [
\       'remove_trailing_lines',
\       'trim_whitespace',
\       'add_blank_lines_for_python_control_statements',
\       'autopep8',
\   ],
\}
" Bind F8 to fixing problems with ALE
nmap <F8> <Plug>(ale_fix)
"前、后一个错误或警告
nmap sp <Plug>(ale_previous_wrap)
nmap np <Plug>(ale_next_wrap)
"开启／关闭语法检查
nmap <Leader>s :ALEToggle<CR>
"<Leader>d查看错误或警告的详细信息
nmap <Leader>d :ALEDetail<CR>


" vim-polyglot，开箱即用型的语法高亮包
Plug 'sheerun/vim-polyglot'
" 对css禁用此插件
let g:polyglot_disabled = ['css']


" +----------+
" |   git    |
" +----------+
" 在vim中使用git命令 :h fugitive.txt 以查看用法
Plug 'tpope/vim-fugitive'

" 在vim中显示文件变动
Plug 'airblade/vim-gitgutter'

" git commit 浏览器
Plug 'junegunn/gv.vim'


" +----------+
" |  others  |
" +----------+

" 自动格式化
Plug 'Chiel92/vim-autoformat'


Plug 'tpope/vim-surround'
vmap Si S(i_<esc>f)
au FileType mako vmap Si S"i${ _(<esc>2f"a) }<esc>

Plug 'tpope/vim-repeat'             " enables . command with vim-surround


Plug 'luochen1990/rainbow'
let g:rainbow_active = 1 "0 if you want to enable it later via :RainbowToggle
let g:rainbow_conf = {
\	'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick'],
\	'ctermfgs': ['lightblue', 'lightyellow', 'lightcyan', 'lightmagenta'],
\	'operators': '_,_',
\	'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
\	'separately': {
\		'*': {},
\		'markdown': {
\			'parentheses_options': 'containedin=markdownCode contained',
\		},
\		'tex': {
\			'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/'],
\		},
\		'lisp': {
\			'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick', 'darkorchid3'],
\		},
\		'vim': {
\			'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/', 'start=/{/ end=/}/ fold', 'start=/(/ end=/)/ containedin=vimFuncBody', 'start=/\[/ end=/\]/ containedin=vimFuncBody', 'start=/{/ end=/}/ fold containedin=vimFuncBody'],
\		},
\		'perl': {
\			'syn_name_prefix': 'perlBlockFoldRainbow',
\		},
\		'stylus': {
\			'parentheses': ['start=/{/ end=/}/ fold contains=@colorableGroup'],
\		},
\		'html': {
\			'parentheses': ['start=/\v\<((area|base|br|col|embed|hr|img|input|keygen|link|menuitem|meta|param|source|track|wbr)[ >])@!\z([-_:a-zA-Z0-9]+)(\s+[-_:a-zA-Z0-9]+(\=("[^"]*"|'."'".'[^'."'".']*'."'".'|[^ '."'".'"><=`]*))?)*\>/ end=#</\z1># fold'],
\		},
\		'css': 0,
\	}
\}


Plug 'ctrlpvim/ctrlp.vim', {'on': ['CtrlP', 'CtrlPBuffer']}
" 将 CtrlP 的工作目录设置为仓库根目录（找不到则设置为当前目录）
let g:ctrlp_working_path_mode = 'ra'
"let g:ctrlp_map = 
nnoremap <leader>j :CtrlP<cr>
nnoremap <leader>b :CtrlPBuffer<cr>
let g:ctrlp_max_height = 10
let g:ctrlp_custom_ignore = 'node_modules\|^\.DS_Store\|^\.git\|^\.coffee\|^\.vscode'


Plug 'tomasr/molokai'
"let g:molokai_original = 1
let g:rehash256 = 1     " under development, try to use 256 color version


Plug 'jiangmiao/auto-pairs'
" 开启/禁用 auto-pairs
let g:AutoPairsShortcutToggle='<M-P>'
" 将一对 pair 后面的内容移到 pair 中（在 pair 内按下快捷键）
let g:AutoPairsShortcutFastWrap='<M-e>'
let g:AutoPairsShortcutJump='<M-n>'
au FileType html let b:AutoPairs["<"]=">"
au FileType vim let b:AutoPairs = {'(':')', '[':']', '{':'}', "'":"'", '`':'`', '<':'>'} " 不配对双引号
" 使用 Backspace 删除时会删除 pair 中的另一个
let g:AutoPairsMapBs=1
" 让使用 <C-h> 删除时不会删除 pair 中的另一个
let g:AutoPairsMapCh=0
let g:AutoPairsMapSpace=1
" 将回车键映射为插入空行的操作
let g:AutoPairsMapCR=1

" FlyMode
let g:AutoPairsFlyMode=0
let g:AutoPairsShortcutBackInsert='<M-b>'


" 自动为某些语言添加 end/endif/endfunction ...
Plug 'https://github.com/tpope/vim-endwise'


Plug 'maxbrunsfeld/vim-yankstack'
nmap <leader>N <Plug>yankstack_substitute_older_paste
nmap <leader>P <Plug>yankstack_substitute_newer_paste
let g:yankstack_yank_keys = ['y', 'd']

" +--------------+
" |   markdown   |
" +--------------+

Plug 'amix/vim-zenroom2', {'for': 'markdown'}
let g:goyo_width=150
let g:goyo_margin_top = 2
let g:goyo_margin_bottom = 2

if has('win16') || has('win32')
    au filetype markdown nnoremap <silent> <leader>z :Goyo<cr> | simalt ~x<cr>
else 
    au filetype markdown nnoremap <silent> <leader>z :Goyo<cr>
endif

Plug 'junegunn/goyo.vim', {'for': 'markdown'}


" +--------------------+
" |   forked plugins   |
" +--------------------+

" 注意TagList不支持中文路径
" 需要安装 ctags
" Plug 'vim-scripts/taglist.vim', {'on': 'This Plugin is disabled.'} "{'on': ['Tlist', 'TlistOpen', 'TlistToggle']}
"set updatetime=4
"nnoremap <leader>tl :TlistToggle<cr>
"let g:Tlist_WinWidth=30
"let g:Tlist_Use_Right_Window=1
"let g:Tlist_Show_One_File=1
"let g:Tlist_Auto_Highlight_Tag=1
"let g:Tlist_Use_SingleClick=0
""let g:Tlist_Auto_Open=1
"let g:Tlist_Inc_Winwidth=1
"let g:Tlist_Exit_OnlyWindow=1


"Plug 'fholgado/minibufexpl.vim'
"let g:miniBufExplMapWindowNavVim = 1
"let g:miniBufExplMapWindowNavArrows = 1
"hi MBENormal               guifg=#808080 guibg=fg
"hi MBEChanged              guifg=#CD5907 guibg=fg
"hi MBEVisibleNormal        guifg=#5DC2D6 guibg=fg
"hi MBEVisibleChanged       guifg=#F1266F guibg=fg
"hi MBEVisibleActiveNormal  guifg=#A6DB29 guibg=fg
"hi MBEVisibleActiveChanged guifg=#F1266F guibg=fg


"Plug 'garbas/vim-snipmate'
"ino <C-j> <C-r>=snipMate#TriggerSnippet()<cr>
"snor <C-j> <esc>i<right><C-r>=snipMate#TriggerSnippet()<cr>
"let g:snipMate = {}
"let g:snipMate.snippet_version = 1
"let g:snipMate.scope_aliases = {}
"let g:snipMate.scope_aliases['cpp'] = 'c,cpp'
"let g:snipMate.decsription_in_completion = 1

"Plug 'MarcWeber/vim-addon-mw-utils'
"Plug 'tomtom/tlib_vim', {'on' : 'This plugin is disabled.'}              " needed by snipmate


"Plug 'itchyny/lightline.vim'
"let g:lightline = {
"      \ 'colorscheme': 'powerline',
"      \ 'active': {
"      \   'left': [ ['mode', 'paste'],
"      \             ['fugitive', 'readonly', 'filename', 'modified'] ],
"      \   'right': [ [ 'lineinfo' ], ['percent'] ]
"      \ },
"      \ 'component': {
"      \   'readonly': '%{&filetype=="help"?"":&readonly?"🔒":""}',
"      \   'modified': '%{&filetype=="help"?"":&modified?"+":&modifiable?"":"-"}',
"      \   'fugitive': '%{exists("*fugitive#head")?fugitive#head():""}'
"      \ },
"      \ 'component_visible_condition': {
"      \   'readonly': '(&filetype!="help"&& &readonly)',
"      \   'modified': '(&filetype!="help"&&(&modified||!&modifiable))',
"      \   'fugitive': '(exists("*fugitive#head") && ""!=fugitive#head())'
"      \ },
"      \ 'separator': { 'left': ' ', 'right': ' ' },
"      \ 'subseparator': { 'left': ' ', 'right': ' ' }
"      \ }


"Plug 'terryma/vim-multiple-cursors'
"let g:multi_cursor_use_default_mapping=0
"" Default mapping
"let g:multi_cursor_start_word_key      = '<C-n>'
"let g:multi_cursor_select_all_word_key = '<C-a>'
""?let g:multi_cursor_start_key           = 'g<C-n>'
""?let g:multi_cursor_select_all_key      = 'g<C-a>'
"let g:multi_cursor_next_key            = '<C-n>'
"let g:multi_cursor_prev_key            = '<C-p>'
"let g:multi_cursor_skip_key            = '<C-s>'
"let g:multi_cursor_quit_key            = '<Esc>'
"
""let g:multi_cursor_support_imap=0
""let g:multi_cursor_exit_from_visual_mode=0
""let g:multi_cursor_exit_from_insert_mode=0
"" 使 vim 命令可以正常使用
""let g:multi_cursor_normal_maps=
""    \{'@': 1, 'F': 1, 'T': 1, '[': 1, '\': 1, ']': 1, 
""    \ '!': 1, '"': 1, 'c': 1, 'd': 1, 'f': 1, 'g': 1, 
""    \ 'm': 1, 'q': 1, 'r': 1, 't': 1, 'y': 1, 'z': 1, 
""    \ '<': 1, '=': 1, '>': 1}
""let g:multi_cursor_visual_maps={'T': 1, 'a': 1, 't': 1, 'F': 1, 'f': 1, 'i': 1}
""
""" 避免在插入模式中与其他插件冲突
""function! Multiple_cursors_before()
""  if exists(':NeoCompleteLock')==2
""    exe 'NeoCompleteLock'
""  endif
""endfunction
""
""function! Multiple_cursors_after()
""  if exists(':NeoCompleteUnlock')==2
""    exe 'NeoCompleteUnlock'
""  endif
""endfunction
""
""" Default highlighting (see help :highlight and help :highlight-link)
""highlight multiple_cursors_cursor term=reverse cterm=reverse gui=reverse
""highlight link multiple_cursors_visual Visual

call plug#end()


"""""""""""""""""""""""""""""""""""""""""
" => Omni Completion
"""""""""""""""""""""""""""""""""""""""""
"set omnifunc=syntaxcomplete#Complete
"au BufNewFile,BufRead,BufEnter *.cpp,*.hpp set omnifunc=omni#cpp#complete#Main
"
"" ------------- For C++ -----------------
"" configure tags - add additional tags here or comment out not-used ones
"set tags+=~/.vim/tags/cpp/cpp
"set tags+=~/.vim/tags/cpp/gl
"set tags+=~/.vim/tags/cpp/sdl
"set tags+=~/.vim/tags/cpp/qt4
"" build tags of your own project with Ctrl-F12
"map <C-F12> :!ctags -R --sort=yes --c++-kinds=+p --fields=+iaS --extra=+q .
"
"let OmniCpp_NamespaceSearch = 1
"let OmniCpp_GlobalScopeSearch = 1
"let OmniCpp_ShowAccess = 1
"let OmniCpp_ShowPrototypeInAbbr = 1 " show function parameters
"let OmniCpp_MayCompleteDot = 1 " autocomplete after .
"let OmniCpp_MayCompleteArrow = 1 " autocomplete after ->
"let OmniCpp_MayCompleteScope = 1 " autocomplete after ::
"let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"]
"" automatically open and close the popup menu / preview window
"au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
"set completeopt=menuone,menu,preview " longest

" +--------------------------------+
" |   解决ycm和ultisnips的tab问题  |
" +--------------------------------+
" 禁用——使用不习惯
"function! g:UltiSnips_Complete()
"  call UltiSnips#ExpandSnippet()
"  if g:ulti_expand_res == 0
"    if pumvisible()
"      return "\<C-n>"
"    else
"      call UltiSnips#JumpForwards()
"      if g:ulti_jump_forwards_res == 0
"        return "\<TAB>"
"      endif
"    endif
"  endif
"  return ""
"endfunction
"
"function! g:UltiSnips_Reverse()
"  call UltiSnips#JumpBackwards()
"  if g:ulti_jump_backwards_res == 0
"    return "\<C-P>"
"  endif
"
"  return ""
"endfunction
"
"
"if !exists("g:UltiSnipsJumpForwardTrigger")
"  let g:UltiSnipsJumpForwardTrigger = "<tab>"
"endif
"if !exists("g:UltiSnipsJumpBackwardTrigger")
"  let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
"endif
"
"au InsertEnter * exec "inoremap <silent> " . g:UltiSnipsExpandTrigger     . " <C-R>=g:UltiSnips_Complete()<cr>"
"au InsertEnter * exec "inoremap <silent> " .     g:UltiSnipsJumpBackwardTrigger . " <C-R>=g:UltiSnips_Reverse()<cr>"
