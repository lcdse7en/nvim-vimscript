
colorscheme gruvbox
" colorscheme vegeta
" colorscheme wombat256mod

set encoding=utf-8                                              " utf-8编码
set t_Co=256                                                    " 开启256色支持
let &t_ut=''
set autochdir
set exrc
set secure
syntax on
filetype indent on
filetype on
filetype plugin on
let mapleader=" "                                               " 设置leader键为空格键
set nocompatible
" set fileencodings=ucs-bom,utf-8,gb2313,gb18030,gbk,cp936,latin1
set fileencodings=utf8,ucs-bom,gbk,cp936,gb2312,gb18030
set termencoding=utf-8
set ambiwidth=double
set autowrite
set matchtime=1
set fileformats=unix,dos,mac
set helplang=cn                                                 " 中文帮助文档
set nomodeline
set relativenumber                                              " 相对行号
set number                                                      " 绝对行号
"设置swp文件
set noswapfile

set viewoptions=cursor,folds,slash,unix
set wrap                                                        " 自动换行
set linebreak
set showcmd                                                     " 显示输入信息
set cursorline                                                  " 显示光标所在行
autocmd WinEnter * setlocal cursorline
autocmd WinLeave * setlocal nocursorline
"set cursorcolumn                                                " 显示光标所在列
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
autocmd BufWritePre * :%s/\s\+$//e

set wildmenu                                                    " 显示补全提示
set hlsearch

" 打开vim运行nohlsearch，取消高亮
exec "nohlsearch"
set shiftwidth=4                                                "自动缩进空白字符个数为4
set ts=4                                                        " 设置tab键长度为四个空格
set expandtab                                                   " 设置tab键替换为四个空格键

let g:vim_markdown_folding_disabled = 1
" 将文件中的tab键替换成空格
"map <LEADER>    :retab!<CR>
set incsearch                                                   " 一边输入一边高亮
set ignorecase                                                  " 忽略大小写
set smartcase                                                   " 智能大小写
set laststatus=2                                                " 设置状态栏在倒数第2行



" 自动缩进
set autoindent

set notimeout

set foldmethod=syntax
set foldlevel=99
let g:indentLine_concealcursor = ''
autocmd BufNewFile,BufRead *.md set nofoldenable


"======================================== 设置状态栏格式 ========================================
set mouse=a                                                     " 启用鼠标
set backspace=indent,eol,start                                  " 退格键可以退到上一行
set scrolloff=6                                                 " 光标行上下移动范围各缩小5行
"set ruler
"set transparency=11

" 设置背景透明
hi Normal ctermfg=252 ctermbg=none

" 寻找下一搜索结果，并将其置于屏幕中心
noremap = nzz
" 寻找上一搜索结果，并将其置于屏幕中心
noremap - Nzz
" 取消高亮
noremap <LEADER><CR> :nohlsearch<CR>
map s <nop>
" 保存
map S :w<CR>
" 退出
map Q :q<CR>
" 右分屏，聚焦右窗口
map sl :set splitright<CR>:vsplit<CR>:term<CR>
" 左分屏，聚焦左窗口
map sh :set nosplitright<CR>:vsplit<CR>
" 上分屏，聚焦上窗口
map sk :set nosplitbelow<CR>:split<CR>
" 下分屏，聚焦下窗口
map sj :set splitbelow<CR>:split<CR>
" 光标移至右窗口
map <LEADER>l <C-w>l
" 光标移至上窗口
map <LEADER>k <C-w>k
" 光标移至下窗口
map <LEADER>j <C-w>j
" 光标移至左窗口
map <LEADER>h <C-w>h

" 当前窗口移至右边
map <LEADER>L <C-w>L
" 当前窗口移至上边
map <LEADER>K <C-w>K
" 当前窗口移至下边
map <LEADER>J <C-w>J
" 当前窗口移至左边
map <LEADER>H <C-w>H


" 窗口上移
map <up> :res +5<CR>
" 窗口下移
map <down> :res -5<CR>
" 窗口左移
map <left> :vertical resize-5<CR>
" 窗口右移
map <right> :vertical resize+5<CR>
" 新建标签页
map tn :tabe<CR>
" 前一标签页
map t- :-tabnext<CR>
" 后一标签页
map t= :+tabnext<CR>


" find and replace
noremap \s :%s//g<left><left>


" 重新加载vim配置文件
" map rc :source $MYVIMRC<CR>
map rc :source ~/.config/nvim/init.vim<CR>




" 寻找两个相等的单词
map <LEADER>fd /\(\<\w\+\>\)\_s*\1
" 替换占空符
map <LEADER><LEADER> <ESC>/<CR>:nohlsearch<CR>c4l
" 选
nmap <C-a> ggVG
" 打开我的vimrc
map <LEADER>rc :e ~/.config/nvim/init.vim<CR>
" 复制到系统剪切板
map +y "+y
" 从系统剪切板粘贴
map +p "+p
" 插入模式下jj映射为<Esc>
inoremap jj <Esc>
"进入命令模式
nmap , :
"撤销
nmap u :u<Enter>
map tx :r !figlet
nmap <CR> o<Esc>
" nmap <LEADER>t :set splitright<CR>:vsplit<CR>:term<CR>
nmap <LEADER>s :set splitright<CR>:vsplit<CR>:term<CR>
"nmap <LEADER>ft :termNew<CR>
autocmd filetype python nnoremap <buffer> <LEADER>i :set splitright<CR>:vsplit<CR>:term<CR>iipython<CR>
autocmd filetype tex noremap <buffer> <LEADER>i :!python3 ~/scripts/pdf2img.py -i %<.pdf -f %:h -o %<<CR>

" 关闭nvim保存编辑记录
silent !mkdir -p ~/.config/nvim/tmp/backup
silent !mkdir -p ~/.config/nvim/tmp/undo
set backupdir=~/.config/nvim/tmp/backup,.
set directory=~/.config/nvim/tmp/backup,.
if has('persistent_undo')
    set undofile
    set undodir=~/.config/nvim/tmp/undo,.
endif

" Cursor shape
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

" 显示tab键和空格键
set list
set listchars=tab:▸\ ,trail:▫

map J 5j
map K 5k
map H 5h
map L 5l

" syntax sync minlines=50

function! MyStatusLine()
  return s:GetPaste()
        \. "%4*%{MyStatusGit()}%*"
        \. "%5*%{MyStatusGitChanges()}%* %{MyStatusCoc()} "
        \. "%6*%{get(b:, 'coc_current_function', '')}%*"
        \. " %f %{MyStatusModifySymbol()}"
        \. " %{MyStatusReadonly()}"
        \. "%=%-{&ft} %l,%c %P "
"%{&fenc}
endfunction

function! s:IsTempFile()
  if !empty(&buftype) | return 1 | endif
  if &previewwindow | return 1 | endif
  let filename = expand('%:p')
  if filename =~# '^/tmp' | return 1 | endif
  if filename =~# '^fugitive:' | return 1 | endif
  return 0
endfunction

function! s:GetPaste()
  if !&paste | return '' |endif
  return "%#MyStatusPaste# paste %*"
endfunction

function! MyStatusReadonly()
  if !&readonly | return '' |endif
  return "  "
endfunction

function! MyStatusCoc()
  if get(g:, 'did_coc_loaded', 0)
    return coc#status()
  endif
  return ''
endfunction

function! MyStatusModifySymbol()
  return &modified ? '⚡' : ''
endfunction

function! MyStatusGitChanges() abort
  if s:IsTempFile() | return '' | endif
  return get(b:, 'coc_git_status', '')
endfunction

function! MyStatusGit(...) abort
  let status = get(g:, 'coc_git_status', '')
  return empty(status) ? '' : '  '.status.' '
endfunction

function! SetStatusLine()
  if &previewwindow | return | endif
  if s:IsTempFile() | return | endif
  setl statusline=%!MyStatusLine()
  hi User6         guifg=#fe8019 guibg=#282828 gui=none
  hi User3         guifg=#e03131 guibg=#111111    gui=none
  hi MyStatusPaste guifg=#F8F8F0 guibg=#FF5F00 gui=none
  hi MyStatusPaste ctermfg=202   ctermbg=16    cterm=none
  hi User4 guifg=#f8f8ff guibg=#000000
  hi User5 guifg=#f8f9fa guibg=#343a40
endfunction

augroup statusline
  autocmd!
  autocmd BufEnter,BufNewFile,BufReadPost,ShellCmdPost,BufWritePost * call SetStatusLine()
  autocmd FileChangedShellPost,ColorScheme * call SetStatusLine()
augroup end


" ===
" === Terminal Behaviors
" ===
let g:neoterm_autoscroll = 1
autocmd TermOpen term://* startinsert
tnoremap <C-N> <C-\><C-N>
tnoremap <C-O> <C-\><C-N><C-O>
let g:terminal_color_0  = '#000000'
let g:terminal_color_1  = '#FF5555'
let g:terminal_color_2  = '#50FA7B'
let g:terminal_color_3  = '#F1FA8C'
let g:terminal_color_4  = '#BD93F9'
let g:terminal_color_5  = '#FF79C6'
let g:terminal_color_6  = '#8BE9FD'
let g:terminal_color_7  = '#BFBFBF'
let g:terminal_color_8  = '#4D4D4D'
let g:terminal_color_9  = '#FF6E67'
let g:terminal_color_10 = '#5AF78E'
let g:terminal_color_11 = '#F4F99D'
let g:terminal_color_12 = '#CAA9FA'
let g:terminal_color_13 = '#FF92D0'
let g:terminal_color_14 = '#9AEDFE'

highlight multiple_cursors_cursor term=reverse cterm=reverse gui=reverse
highlight link multiple_cursors_visual Visual

let g:instant_markdown_logfile = '/tmp/instant_markdown.log'
let g:instant_markdown_autostart = 1


augroup filetype_tex
    autocmd!
    autocmd filetype tex nnoremap <leader>bd:!buildchinesepdf.sh %<cr><cr>
    autocmd filetype tex nnoremap <leader>bb:!booklatex.sh %<cr><cr>
    autocmd filetype tex nnoremap <leader>pd:!start_zathura.sh %<cr><cr>
    autocmd FileType tex setlocal splitright




augroup END


" =============================================== 插件配置 ===============================================
call plug#begin('~/.config/nvim/plugged')
" Status line
" Plug 'theniceboy/eleline.vim'
" Plug 'ojroques/vim-scrollstatus'

" General Highlighter
Plug 'RRethy/vim-illuminate'

" Translation
Plug 'voldikss/vim-translator'


Plug 'luochen1990/rainbow'
Plug 'mg979/vim-xtabline'

" Taglist
Plug 'liuchengxu/vista.vim'


" Pretty Dress
Plug 'theniceboy/nvim-deus'

" Autoformat
Plug 'google/vim-maktaba'
Plug 'google/vim-codefmt'

" 启动页面
Plug 'mhinz/vim-startify'
Plug 'jiangmiao/auto-pairs'
Plug '907th/vim-auto-save'

"airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

"Icons
Plug 'ryanoasis/vim-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
"文件树
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'


" Plug 'tmhedberg/SimpylFold'

"Markdown
" Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }}
Plug 'iamcco/mathjax-support-for-mkdp'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
Plug 'suan/vim-instant-markdown'
Plug 'dhruvasagar/vim-table-mode', { 'on': 'TableModeToggle', 'for': ['text', 'markdown', 'vim-plug'] }
Plug 'mzlogin/vim-markdown-toc'
Plug 'dkarter/bullets.vim'
" Plug 'ferrine/md-img-paste.vim'
" Plug 'instant-markdown/vim-instant-markdown'

"coc
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'xuhdev/vim-latex-live-preview', {'for':'tex'}
Plug 'xuhdev/SingleCompile'
Plug 'jiangmiao/auto-pairs'
"
" ------------------------- surround & wildfire.vim --------------------------
Plug 'tpope/vim-surround'
Plug 'gcmt/wildfire.vim'
" ------------------------------------------------------------------------------

" 多光标操作
Plug 'terryma/vim-multiple-cursors'

" ------------------ snippets ------------------
Plug 'SirVer/ultisnips'
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
" Plug 'garbas/vim-snipmate'
Plug 'honza/vim-snippets'


"Plug 'preservim/nerdcommenter'
"注释
Plug 'tomtom/tcomment_vim'

Plug 'majutsushi/tagbar'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
" Plug 'gko/vim-coloresque'

Plug 'rking/ag.vim'

Plug 'mileszs/ack.vim'
"Plug 'davidhalter/jedi-vim'
" 浮动窗口
Plug 'voldikss/vim-floaterm'
" emmet
Plug 'mattn/emmet-vim'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}

"Latex
Plug 'lervag/vimtex'
Plug 'neoclide/coc-vimtex'
" Plug 'kevinhwang91/rnvimr'
Plug 'pechorin/any-jump.vim'

" Git
" Plug 'theniceboy/vim-gitignore', { 'for': ['gitignore', 'vim-plug'] }
" Plug 'fszymanski/fzf-gitignore', { 'do': ':UpdateRemotePlugins' }
" Plug 'mhinz/vim-signify'
" Plug 'airblade/vim-gitgutter'
" Plug 'cohama/agit.vim'
Plug 'kdheepak/lazygit.nvim'



" HTML, CSS, JavaScript, Typescript, PHP, JSON, etc.
Plug 'leafgarland/typescript-vim'
Plug 'elzr/vim-json'
Plug 'neoclide/jsonc.vim'
Plug 'othree/html5.vim'
Plug 'alvan/vim-closetag'

" Python
" Plug 'tmhedberg/SimpylFold', { 'for' :['python', 'vim-plug'] }
Plug 'Vimjas/vim-python-pep8-indent', { 'for' :['python', 'vim-plug'] }
Plug 'numirias/semshi', { 'do': ':UpdateRemotePlugins', 'for' :['python', 'vim-plug'] }
"Plug 'vim-scripts/indentpython.vim', { 'for' :['python', 'vim-plug'] }
"Plug 'plytophogy/vim-virtualenv', { 'for' :['python', 'vim-plug'] }
Plug 'tweekmonster/braceless.vim', { 'for' :['python', 'vim-plug'] }


Plug 'Yggdroot/indentLine'
" Go
Plug 'fatih/vim-go' , { 'for': ['go', 'vim-plug'], 'tag': '*' }
" vimwiki
Plug 'vimwiki/vimwiki'
Plug 'mattn/calendar-vim'

Plug 'morhetz/gruvbox'
Plug 'junegunn/goyo.vim'

" Bookmarks
Plug 'kshenoy/vim-signature'

Plug 'kien/rainbow_parentheses.vim'

" Taglist
Plug 'liuchengxu/vista.vim'

" Emoji
Plug 'junegunn/vader.vim'
Plug 'junegunn/vim-emoji'
Plug 'junegunn/vim-github-dashboard'

call plug#end()




source /home/se7en/.config/nvim/cursor.vim

" autocmd BufRead,BufNewFile *.md setlocal spell
