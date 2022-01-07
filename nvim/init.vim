" maintainer: modsound@gmail.com

" マップリーダーを指定(tomlの中でLeader使ったキーマップするため)
let mapleader = "\<Space>"

" -----------------------------------------------------------------------
" Dein:
" -----------------------------------------------------------------------
if &compatible
	set nocompatible
endif

" deinのインストール先を指定
let s:dein_path = expand('~/.cache/dein')
let s:dein_repo_path = s:dein_path . '/repos/github.com/Shougo/dein.vim'

" tomlファイルの場所を指定
let s:toml_path = expand('~/.config/nvim/vimrc.d/dein')
let s:toml = s:toml_path . '/plugins.toml'
let s:lazy_toml = s:toml_path . '/plugins-lazy.toml'

" deinがない場合インストールする
if &runtimepath !~# '/dein.vim'
  if !isdirectory(s:dein_repo_path)
    echo "Deinが見つからないのでインストールします"
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_path
  endif
  execute 'set runtimepath^=' . s:dein_repo_path
endif

" tomlの読み込み
if dein#load_state(s:dein_path)
  call dein#begin(s:dein_path)

  if filereadable(s:toml)
    call dein#load_toml(s:toml,      {'lazy': 0})
  endif
  if filereadable(s:lazy_toml)
    call dein#load_toml(s:lazy_toml, {'lazy': 1})
  endif

  call dein#end()
  call dein#save_state()
endif

filetype plugin indent on 
syntax enable

" プラグインをインストール
if dein#check_install()
	call dein#install()
endif

" -----------------------------------------------------------------------
" Basic Settings:
" -----------------------------------------------------------------------
" インデント
set tabstop=2                      " スペース何個で<Tab>にするか基準を指定
set shiftwidth=0                   " <<や>>, <Enter>などでインデントした場合のスペース数を指定(0の場合tabstopの値が使用される)
set expandtab                      " <Tab>を押すとスペース入力する(常にスペースを使用したい場合に設定する)

" コマンドライン
set cmdheight=1                    " メッセージ表示スペースを確保する行数指定
set laststatus=2                   " ステータスを常に表示
set showcmd                        " 入力中のコマンドを表示

" バックアップ
set nobackup                       " backupを作成しない
set noswapfile                     " swapfileを作成しない
set noundofile                     " undofileを作成しない

" 検索
set hlsearch                       " 検索結果を強調表示する
set incsearch                      " 最初の検索後を入力した時点で検索開始
set ignorecase                     " 大文字小文字を区別しない
set smartcase                      " 大文字が含まれる場合に大文字小文字を区別する
set wrapscan                       " 最後まで検索したら最初に戻る

" 移動
set nostartofline                  " 上下移動の際、X軸を維持する
set whichwrap=b,s,h,l,<,>,[,]      " 指定したキーの場合、行を跨いで移動する

" 最後に開いていた行に移動する
augroup OpenPreviousCursor
  autocmd!
  autocmd BufRead * if line("'\"") > 0 && line("'\"") <= line("$") |
  \ exe "normal g`\"" | endif
augroup END

" 表示
set number                         " 行数を表示する
set numberwidth=3                  " 行数表示の桁を指定する
set shortmess+=I                   " 起動時にロゴを表示しない
set showmatch matchtime=1          " 対応する括弧を強調表示する
set display+=lastline              " 1行が長くても省略せず最後まで表示する
set scrolloff=2                    " スクロール時に、指定した行数マージンをとる
set ambiwidth=double               " 2バイト文字の表示幅を全角にする
set signcolumn=yes                 " Sign列を常に表示する

" 2バイト文字を強調表示する
hi ZenkakuSpace cterm=underline ctermfg=lightblue guibg=red
match ZenkakuSpace /　/

" colorscheme
set background=dark                " 背景色指定
set termguicolors                  " TrueColorのsyntax hilightを有効にする
colorscheme lucius

" その他
set clipboard+=unnamedplus,unnamed " OSとクリップボードを共有する
set helplang=ja                    " 日本語のヘルプを使用する
set autoread                       " 他のバッファが変更されたら自動的に読み込み直す
set confirm                        " 変更した状態でバッファを閉じようとしたら確認する
set wildmenu                       " コマンドモードでtabキーを押すと補完候補を表示する
set backspace=indent,eol,start     " インサートモードでもバックスペースで削除する
set noequalalways                  " ウィンドウサイズの自動調整を無効にする
set isk+=-                         " ハイフンを単語に含める

" -----------------------------------------------------------------------
" Basic Key Mappings:
" -----------------------------------------------------------------------
" init.vimを開く
nnoremap <silent><Leader>e. :<C-u>edit ~/dotfiles/nvim/init.vim<CR>

" dein.tomlを開く
nnoremap <silent><Leader>e, :<C-u>edit ~/dotfiles/nvim/plugins.toml<CR>

" 現在のバッファを反映する
nnoremap <silent><Leader>s. :<C-u>execute "source " expand("%:p")<CR>

" バッファを閉じる
nnoremap <silent>q :<C-u>bdelete<CR>

" ノーマルモードに戻る
inoremap <silent>jj <ESC>

" 空行を挿入する
nnoremap <silent>; :<C-u>call append(expand('.'), '')<CR>j

" インデント
nnoremap <silent><Tab> >>
nnoremap <silent><S-Tab> <<

" ウィンドウサイズを変更する
nnoremap <silent><Up>    <C-w>-
nnoremap <silent><Down>  <C-w>+
nnoremap <silent><Left>  <C-w>>
nnoremap <silent><Right> <C-w><


" -----------------------------------------------------------------------
" ヤンク, ペースト
" -----------------------------------------------------------------------
" ペースト後の文字に移動する
vnoremap <silent>y y`]
vnoremap <silent>p p`]
nnoremap <silent>p p`]

" 行末までヤンクする
nnoremap Y y$

" ビジュアルモードで対象を選択して連続ペーストする
xnoremap p "_xP

" -----------------------------------------------------------------------
" 検索
" -----------------------------------------------------------------------
" カーソル下の文字をハイライトする
nnoremap <silent><Leader><Leader> :let @/ = '\<' . expand('<cword>') . '\>'<CR>:set hlsearch<CR>

" カーソル下の文字をハイライトしてから置換する
nmap # <Space><Space>:%s/<C-r>///g<Left><Left>

" 検索ハイライトを無効にする
nnoremap <silent><BS> :let @/ = ""<CR>

" -----------------------------------------------------------------------
" 移動
" -----------------------------------------------------------------------
" 表示行で移動する
noremap j gj
noremap k gk

" インサートモードで移動する
inoremap <C-h> <Left>
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-l> <Right>

" コマンドラインモードで移動する
cnoremap <C-a> <Home>
cnoremap <C-b> <Left>
cnoremap <C-d> <Del>
cnoremap <C-f> <Right>
cnoremap <C-n> <Down>
cnoremap <C-p> <Up>

" ページをスクロールする
nnoremap <CR> <C-f>

" 空行を移動する
nnoremap <silent><C-j> :<C-u>keepjumps normal! }<CR>
nnoremap <silent><C-k> :<C-u>keepjumps normal! {<CR>

" 他のウィンドウに移動する
nmap <silent><C-l> :<C-u>wincmd w<CR>
nmap <silent><C-h> :<C-u>wincmd W<CR>

" 他のバッファに移動する
nnoremap <silent><C-n> :<C-u>bnext<CR>
nnoremap <silent><C-p> :<C-u>bprevious<CR>

" -----------------------------------------------------------------------
" 画面分割
" -----------------------------------------------------------------------
" 分割する
nnoremap <silent><Leader>sp :<C-u>vs<CR><C-w>l

" ヘルプを右に表示する
command! -nargs=1 -complete=help H :vertical belowright help <args>
