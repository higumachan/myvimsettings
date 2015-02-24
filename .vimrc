"カラースキーマを設定

syntax on

set autoindent
"バックアップファイルを作るディレクトリ
set backupdir=$HOME/.vimbackup
"ファイル保存ダイアログの初期ディレクトリをバッファファイル位置に設定
set browsedir=buffer 
"クリップボードをWindowsと連携
set clipboard=unnamed
"Vi互換をオフ
set nocompatible
"スワップファイル用のディレクトリ
set directory=$HOME/.vimbackup
"変更中のファイルでも、保存しないで他のファイルを表示
set hidden
"インクリメンタルサーチを行う
set incsearch
"タブ文字、行末など不可視文字を表示する
set list
"listで表示される文字のフォーマットを指定する
set listchars=tab:>\ ,extends:<
"行番号を表示する
set number
"シフト移動幅
set shiftwidth=4
"閉じ括弧が入力されたとき、対応する括弧を表示する
set showmatch
"新しい行を作ったときに高度な自動インデントを行う
set smartindent
"行頭の余白内で Tab を打ち込むと、'shiftwidth' の数だけインデントする。
set smarttab
"ファイル内の <Tab> が対応する空白の数
set tabstop=4
set whichwrap=b,s,h,l,<,>,[,]
"検索をファイルの先頭へループしない
set nowrapscan
set fileencoding=utf-8
set encoding=utf-8


" python実行
function! s:Exec()
    exe "!" . &ft . " %"
:endfunction         
command! Exec call <SID>Exec() 
map <silent> <C-P> :call <SID>Exec()<CR>
nmap bb :ls<CR>:buf 
nmap BB :ls<CR>:vs<CR>:buf 
map gb :bn<CR>
map gB :bp<CR>
map gw <C-W><C-W>
map bo :only<CR>
map cc \x
imap <C-@> <C-[>
imap <C-X> <C-[>
imap <C-F> <C-[>
imap <C-E> <C-Y>,

imap <C-k> <Plug>(neocomplcache_snippets_expand)
smap <C-k> <Plug>(neocomplcache_snippets_expand)

" cpp
autocmd FileType cpp setl autoindent
autocmd FileType cpp setl expandtab smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
autocmd FileType cpp setl  tabstop=4 shiftwidth=4 softtabstop=4

" python
filetype plugin on
autocmd FileType python setl autoindent
autocmd FileType python setl expandtab smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
autocmd FileType python setl  tabstop=4 shiftwidth=4 softtabstop=4

" coffee
autocmd FileType coffee setl autoindent
autocmd FileType coffee setl expandtab smartindent 
autocmd FileType coffee setl  tabstop=2 shiftwidth=2 softtabstop=2

" coffee
autocmd FileType html setl autoindent
autocmd FileType html setl expandtab smartindent 
autocmd FileType html setl  tabstop=2 shiftwidth=2 softtabstop=2




set t_Co=256
let g:molokai_original = 1


set nocompatible
filetype off

if has('vim_starting')
	  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

 call neobundle#begin(expand('~/.vim/bundle/'))

NeoBundleFetch 'Shougo/neobundle.vim'
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'thinca/vim-ref'
NeoBundle 'mitechie/pyflakes-pathogen'
NeoBundle 'mattn/webapi-vim'
NeoBundle 'mattn/gist-vim'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'Shougo/vimshell'
NeoBundle 'Shougo/vimproc', {
\ 'build' : {
\     'windows' : 'make -f make_mingw32.mak',
\     'cygwin' : 'make -f make_cygwin.mak',
\     'mac' : 'make -f make_mac.mak',
\     'unix' : 'make -f make_unix.mak',
\    },
\ }
NeoBundle "Shougo/unite.vim"
NeoBundle "Shougo/neomru.vim"
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle "Shougo/unite-build"
NeoBundle 'h1mesuke/unite-outline'
NeoBundle 'Lokaltog/vim-easymotion'
NeoBundle 'surround.vim'
NeoBundle 'python.vim'
NeoBundle 'atourino/jinja.vim'
NeoBundle 'wesleyche/SrcExpl'
NeoBundle 'wesleyche/Trinity'
NeoBundle 'taglist.vim'
NeoBundle 'vim-scripts/DrawIt'
NeoBundle 'mattn/emmet-vim'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'ervandew/supertab'
NeoBundle 'Rip-Rip/clang_complete'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'spolu/dwm.vim'

NeoBundle "airblade/vim-rooter"
if !empty(neobundle#get("vim-rooter"))
	let g:rooter_use_lcd = 1
	" files/directories for the root directory
	let g:rooter_patterns = ['tags', '.git', '.git/', '_darcs/',  '.hg/', '.bzr/', 'Makefile', 'GNUMakefile', 'GNUmakefile', '.svn/']
	" Automatically change the directory
	autocmd! BufEnter *.c,*.cc,*.cxx,*.cpp,*.h,*.hh,*.java,*.py,*.sh,*.rb,*.html,*.css,*.js :Rooter
endif

NeoBundle 'scrooloose/nerdcommenter.git'

NeoBundleLazy "majutsushi/tagbar", {  "autoload": { "commands": ["TagbarToggle"] }}

"NeoBundle 'davidhalter/jedi-vim'

 call neobundle#end()
"call pathogen#infect()

filetype plugin on
filetype indent on

let g:neocomplcache_enable_at_startup = 1
let g:neosnippet#snippets_directory='~/.vim/snippets'

" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
			\ "\<Plug>(neosnippet_expand_or_jump)"
			\: pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
			\ "\<Plug>(neosnippet_expand_or_jump)"
			\: "\<TAB>"

" For snippet_complete marker.
if has('conceal')
	set conceallevel=2 concealcursor=i
endif

"easy motion
" ホームポジションに近いキーを使う
let g:EasyMotion_keys='hjklasdfgyuiopqwertnmzxcvbHJKLASDFGYUIOPQWERTNMZXCVB'
" 「'」 + 何かにマッピング
let g:EasyMotion_leader_key="-"
" 1 ストローク選択を優先する
let g:EasyMotion_grouping=1
" カラー設定変更
hi EasyMotionTarget ctermbg=none ctermfg=red
hi EasyMotionShade  ctermbg=none ctermfg=blue

"tからはじまるpythonファイルをテストコードとする 
autocmd BufWinEnter,BufNewFile test*.py set filetype=python.test

" 自分の場合は Space q でquickrunを実行するようにしている 
silent! map <unique> <Space>q <Plug>(quickrun)

" quickrun.vim 用設定 
" ↑の2行あたりが既存なら↓の追加だけ 
"let g:quickrun_config['python.test'] = {'command': 'nosetests', 'exec': ['%c-v %s']}


autocmd FileType * setlocal formatoptions-=ro

" CTRL-hjklでウィンドウ移動
"nnoremap <C-j> <C-w>j
"nnoremap <C-k> <C-w>k
"nnoremap <C-l> <C-w>l
"nnoremap <C-h> <C-w>h

""" unite.vim
" 入力モードで開始する
" let g:unite_enable_start_insert=1
" バッファ一覧
let g:unite_enable_start_insert=1
let g:unite_source_history_yank_enable =1
let g:unite_source_file_mru_limit = 200
nnoremap <silent> ,uy :<C-u>Unite history/yank<CR>
nnoremap <silent> ,ub :<C-u>Unite buffer<CR>
" ファイル一覧
nnoremap <silent> ,uf :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
" レジスタ一覧
nnoremap <silent> ,ur :<C-u>Unite -buffer-name=register register<CR>
" 最近使用したファイル一覧
nnoremap <silent> ,um :<C-u>Unite file_mru<CR>
" 常用セット
nnoremap <silent> ,uu :<C-u>Unite buffer file_mru<CR>
" 全部乗せ
nnoremap <silent> ,ua :<C-u>UniteWithBufferDir -buffer-name=files buffer file_mru bookmark file<CR>

let g:unite_split_rule = 'botright'
noremap ,uo <ESC>:Unite -vertical -winwidth=40 outline<Return>

" ビルド
nnoremap <silent> ,mk :Unite build:make:-Cbuild<CR>

" ESCキーを2回押すと終了する
au FileType unite nnoremap <silent> <buffer> <ESC><ESC> q
au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>q


