"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Maintainer:
"       Amir Salihefendic — @amix3k
"
" Additions_by: aloha
"
" Awesome_version:
"       Get this config, nice color schemes and lots of plugins!
"
"       Install the awesome version from:
"
"           https://github.com/amix/vimrc
"
" Sections:
"    -> 我添加的内容
"    -> General
"    -> VIM user interface
"    -> Colors and Fonts
"    -> Text, tab and indent related
"    -> Visual mode related
"    -> Moving around, tabs and buffers
"    -> Status line
"    -> Editing mappings
"    -> vimgrep searching and cope displaying
"    -> Spell checking
"    -> Misc
"    -> Helper functions
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


"""""""""""""""""""""""""""
" => 我添加的内容
"""""""""""""""""""""""""""
set nocompatible
set number                          " 行首显示数字
set relativenumber                  " 行首显示相对数字
set cursorline                      " 突出显示光标所在行
set textwidth=500                   " 设置行宽
set nowrap                          " 不自动折行
" set cpo-=n
set showbreak=➜\                    " 或者 let &showbreak = '➜ '
" set wrapmargin=0
" set linebreak
" set sidescrolloff=0
" set laststatus=2                  " 0/1/2
set showmatch
set matchtime=5
set smartindent                     " 为C语言设置自动缩进
au filetype c,cpp set cindent       " C样式缩进
" set spell spelllang=en_us
" set nospell
" set autochdir                     " 自动切换到当前文件所在目录
set noautochdir                     " 使用 <leader>. 手动切换到当前目录
set autoread
set wildmenu
set modifiable
set splitright
set ch=1            " Make command line two lines high
set mousehide       " Hide the mouse when typing text
filetype plugin indent on
" 显示特殊字符
set listchars=eol:↵,tab:<->,trail:•,extends:>,precedes:<    " trail 与　space 冲突
set list
set showcmd

" +----------------------+
" |       透明背景       |
" +----------------------+
" 需要终端的支持，terminator 和 Tilix 支持透明背景
if has('linux')
    au VimEnter * hi Normal ctermfg=252 ctermbg=none
endif

" +----------------------+
" |      编码和语言      |
" +----------------------+
" Avoid garbled characters in Chinese language windows OS
set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936
set termencoding=utf-8
set encoding=utf-8
let $LANG='zh_CN' 
set langmenu='zh_CN'
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim


" +---------------------------------------------+
" |   退格键，可删除缩进、行尾、光标前的字符    |
" +---------------------------------------------+
" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l


" +--------------------------------------------+
" |    normal模式的中文字符（windows中无效）   |
" +--------------------------------------------+
if !has('win16') && !has('win32')
    nnoremap ： :
    nnoremap ； ;
    nnoremap 、 /
    nnoremap ． .
endif

" +----------------------+
" |       快捷键         |
" +----------------------+
" <leader>
let g:mapleader = "\<space>"

inoremap ii <esc>

nnoremap J 3j
nnoremap K 3k

nnoremap Y y$

"noremap <F2> <ESC>:tabnew<CR>
"noremap <F3> <ESC>:tabclose<CR>

command Q call Quitall()
function Quitall()
    qa
endfunction

" 快速切换到当前编辑的文件所在的目录
" nnoremap <silent> <leader>. :cd %:p:h<CR>
noremap <leader>. :cd %:p:h<cr>:pwd<cr>

nnoremap <C-Tab> :bn<cr>
nnoremap <C-S-Tab> :bp<cr>

" +-----------------------------------------+
" |  折叠命令syntax/indent模式 (vim 自带)   |
" +-----------------------------------------+
" zc 折叠
" zC 对所在范围内所有嵌套的折叠点进行折叠
" zo 展开折叠
" zO 对所在范围内所有嵌套的折叠点展开
" [z 到当前打开的折叠的开始处。
" ]z 到当前打开的折叠的末尾处。
" zj 向下移动到达下一个折叠的开始处。关闭的折叠也被计入。
" zk 向上移动到前一折叠的结束处。关闭的折叠也被计入。
" zR 打开全部折叠
" zM 关闭所有折叠
" 
" 其他命令
" zd 删除光标所在的折叠
" zE 删除所有折叠
set foldlevel=999 "打开文件时不折叠，为了避免随机折叠问题

" +---------------------+
" |       窗口操作      |
" +---------------------+
func FullScreen()
     " GUI is running or is about to start.
    if (has("win16") || has("win32")) && has("gui_running")
        simalt ~x
    elseif has('linux')
        "if exists("+lines")
        "    set lines=9999
        "endif
        "if exists("+columns")
        "    set columns=9999
        "endif
    endif
    let g:Full_Screen = 1
endfunc

func ShrinkScreen()
    if has("win16") || has("win32") && has("gui_running")
        set lines=35 columns=100
    elseif has('linux')
        echo "Not used for linux."
    "    set lines=25 columns=75
    endif
    let g:Full_Screen = 0
endfunc

func ToggleFullScreen()
    if g:Full_Screen == 0
        call FullScreen()
    else
        call ShrinkScreen()
    endif
endfunc

" 1. ,+空格 切换全屏和小屏(只支持windows，需要在其他系统中使用的话可以修改上面的两个函数)
nnoremap <leader><space> :call ToggleFullScreen()<cr>

au VimEnter * call FullScreen()

function BigWindow()
    call FullScreen()
    NERDTree
    TagbarOpen
endfunction

function SmallWindow()
    call ShrinkScreen()
    if exists("g:NERDTree")   " vim-plug 中设置不会自动启动，未启动时 Vim 会报错
        NERDTreeClose
    endif
    TagbarClose
endfunction

" 2. Bwin/Swin转换屏幕显示内容（也会改变Gvim窗口大小）
" 注意 Bwin 会打开 NERDTree 和 TagList, 退出时会不能全部退出，可以使用 :qa 或我定义的 :Q
command Bwin call BigWindow()
command Swin call SmallWindow()

" 3. 打开终端（cmd.exe），在终端中执行 exit 即可退出终端
nnoremap <leader>ter :terminal<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Sets how many lines of history VIM has to remember
set history=500

" Enable filetype plugins
filetype plugin on
filetype indent on

" Set to auto read when a file is changed from the outside
set autoread
au FocusGained,BufEnter * checktime

" With a map leader it's possible to do extra key combinations
" Fast saving
nmap <leader>w :w!<cr>

" :W sudo saves the file 
" (useful for handling the permission-denied error)
command! W execute 'w !sudo tee % > /dev/null' <bar> edit!


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set 3 lines to the cursor - when moving vertically using j/k
set so=3

"Turn on the Wild menu
set wildmenu

" Ignore compiled files
set wildignore=*.o,*~,*.pyc
if has("win16") || has("win32")
    set wildignore+=.git\*,.hg\*,.svn\*
else
    set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
endif

"Always show current position
set ruler

" Height of the command bar
set cmdheight=1

" A buffer becomes hidden when it is abandoned
set hid

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases 
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch 

" Don't redraw while executing macros (good performance config)
set lazyredraw 

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch 
" How many tenths of a second to blink when matching brackets
" 高亮显示配对括号时，当前括号会每 2/10 秒闪烁一次
set mat=2

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Properly disable sound on errors on MacVim
if has("gui_macvim")
    autocmd GUIEnter * set vb t_vb=
endif

" Add a bit extra margin to the left
set foldcolumn=1


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable syntax highlighting
syntax enable 

" Enable 256 colors palette in Gnome Terminal
if $COLORTERM == 'gnome-terminal'
    set t_Co=256
endif

try
    colorscheme molokai
    "colorscheme desert
catch
endtry

set background=dark

" Set extra options when running in GUI mode
if has("gui_running")
    set guioptions-=T
    set guioptions-=e
    set t_Co=256
    set guitablabel=%M\ %t
endif

" Set utf8 as standard encoding and en_US as the standard language
" set encoding=utf8 已设置

" Use Unix as the standard file type
set ffs=unix,dos,mac


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

" Linebreak on 500 characters
set lbr
set tw=500

set ai "Auto indent
set si "Smart indent
"set wrap "Wrap lines


""""""""""""""""""""""""""""""
" => Visual mode related

""""""""""""""""""""""""""""""
" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
vnoremap <silent> # :<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Moving around, tabs, windows and buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Map <Space> to / (search) and Ctrl-<Space> to ? (backwards search)
" map <space> /
" map <C-space> ?

" Disable highlight when <leader><cr> is pressed
map <silent> <leader><cr> :noh<cr>

" Smart way to move between windows
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-h> <C-w>h
map <C-l> <C-w>l

" Close the current buffer
map <leader>bd :Bclose<cr>:tabclose<cr>gT

" 关闭缓冲区，保留窗口
command! Bd call <SID>BufcloseCloseIt()

" Close all the buffers
map <leader>ba :bufdo bd<cr>

"map <leader>l :bnext<cr>
"map <leader>h :bprevious<cr>

" Useful mappings for managing tabs
map <leader>tn :tabnew
map <leader>tc :tabclose<cr>
map <leader>to :tabonly<cr>
map <leader>tm :tabmove 
map <leader>t<leader> :tabnext 

" Let 'tt' toggle between this and the last accessed tab
let g:lasttab = 1
nmap <Leader>tt :exe "tabn ".g:lasttab<CR>
au TabLeave * let g:lasttab = tabpagenr()


" Opens a new tab with the current buffer's path
" Super useful when editing files in the same directory
map <leader>te :tabedit <C-r>=expand("%:p:h")<cr>/

" Switch CWD to the directory of the open buffer
"map <leader>cd :cd %:p:h<cr>:pwd<cr>

" Specify the behavior when switching between buffers 
try
  set switchbuf=useopen,usetab,newtab
  set stal=2
catch
endtry

" Return to last edit position when opening files (You want this!)
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif


""""""""""""""""""""""""""""""
" => Status line
""""""""""""""""""""""""""""""
" Always show the status line
set laststatus=2

" Format the status line
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l\ \ Column:\ %c


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Editing mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remap VIM 0 to first non-blank character
map 0 ^

" Move a line of text using ALT+[jk] or Command+[jk] on mac
nmap <M-j> mz:m+<cr>`z
nmap <M-k> mz:m-2<cr>`z
vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z

if has("mac") || has("macunix")
  nmap <D-j> <M-j>
  nmap <D-k> <M-k>
  vmap <D-j> <M-j>
  vmap <D-k> <M-k>
endif

" Delete trailing white space on save, useful for some filetypes ;)
fun! CleanExtraSpaces()
    let save_cursor = getpos(".")
    let old_query = getreg('/')
    silent! %s/\s\+$//e
    call setpos('.', save_cursor)
    call setreg('/', old_query)
endfun

if has("autocmd")
    "autocmd BufWritePre *.txt,*.js,*.py,*.wiki,*.sh,*.coffee :call CleanExtraSpaces()
    autocmd BufWritePre *.c,*.cpp,*.h,*.txt,*.js,*.py,*.wiki,*.sh,*.coffee :call CleanExtraSpaces()
endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Spell checking
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Pressing ,ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr>

" Shortcuts using <leader>
map <leader>sn ]s
map <leader>sp [s
map <leader>sa zg
map <leader>s? z=


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Misc
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remove the Windows ^M - when the encodings gets messed up
noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

" Quickly open a buffer for scribble
map <leader>q :e ~/buffer<cr>

" Quickly open a markdown buffer for scribble
map <leader>x :e ~/buffer.md<cr>

" Toggle paste mode on and off
map <leader>pp :setlocal paste!<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Helper functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Returns true if paste mode is enabled
function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    endif
    return ''
endfunction

" Don't close window, when deleting a buffer
command! Bclose call <SID>BufcloseCloseIt()
function! <SID>BufcloseCloseIt()
    let l:currentBufNum = bufnr("%")
    let l:alternateBufNum = bufnr("#")

    if buflisted(l:alternateBufNum)
        buffer #
    else
        bnext
    endif

    if bufnr("%") == l:currentBufNum
        new
    endif

    if buflisted(l:currentBufNum)
        execute("bdelete! ".l:currentBufNum)
    endif
endfunction

function! CmdLine(str)
    call feedkeys(":" . a:str)
endfunction 

function! VisualSelection(direction, extra_filter) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", "\\/.*'$^~[]")
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'gv'
        call CmdLine("Ack '" . l:pattern . "' " )
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction
