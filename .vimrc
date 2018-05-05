"                         __                           __
"    ____ ___  ____  ____/ /________  __  ______  ____/ /
"   / __ `__ \/ __ \/ __  / ___/ __ \/ / / / __ \/ __  / 
"  / / / / / / /_/ / /_/ (__  ) /_/ / /_/ / / / / /_/ /  
" /_/ /_/ /_/\____/\____/____/\____/\____/_/ /_/\____/   
" 
" mail: modsound@gmail.com
"
" -----------------------------------------------------------------------
" Dein: {{{
" -----------------------------------------------------------------------

" assign a directory for vimscript
let s:dein_dir = expand('~/.vim/dein')
" assign a directory for dein.vim
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

if &compatible
	set nocompatible
endif

" install dein.vim, if it does not exists
if !isdirectory(s:dein_repo_dir)
	execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
endif
execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')

" import plugins
if dein#load_state(s:dein_dir)
  " assign a directory for toml file
  let g:rc_dir = expand('~/')

  " assign a toml file
  let s:toml = g:rc_dir . '.dein.toml'
  if filereadable(s:toml)
    call dein#load_toml(s:toml, {'lazy': 0})
  endif

  " assign a toml file for lazy loading
  let s:lazy_toml = g:rc_dir . '.dein_lazy.toml'
  if filereadable(s:lazy_toml)
    call dein#load_toml(s:lazy_toml, {'lazy': 1})
  endif

	call dein#begin(s:dein_dir)
	call dein#load_toml(s:toml)

	call dein#end()
	call dein#save_state()
endif

" install plugins, if not installed
if has('vim_starting') && dein#check_install()
	call dein#install()
endif

" }}}

" -----------------------------------------------------------------------
" Basic Settings: {{{
" -----------------------------------------------------------------------
syntax enable
filetype plugin indent on          " import plugin for filetype and indent

" indent
set tabstop=2                      " use space not tab
set shiftwidth=2                   " auto indent shiftwidth=n
set expandtab                      " insert not tab but space
set softtabstop=2                  " when set expandtab, softtabstop=n means space
set autoindent                     " set indent as previous line
set smartindent
set smarttab                       " if at bol, insert number count shiftwidth set, else insert space number tabstop set 

" status & command line
set cmdheight=1                    " set command line height
set laststatus=2                   " show statusline
set showcmd                        " show command in statusline

" backup % swap file
set nobackup                       " no backup file
set noswapfile                     " no swao file
set noundofile                     " no undo file

" search
set helplang=ja,en                 " prefer japanese help
set hlsearch                       " enable hilight search
set incsearch                      " enable increment search
set ignorecase                     " ignore case

" fold
set foldenable
set foldlevel=5                    " open fold, if possible
set foldmethod=marker              " set fold marker
set foldtext=FoldCCtext()          " set plugin for fold

" move
set nostartofline                  " 行頭に移動しない
set whichwrap=b,s,h,l,<,>,[,]      " 行を跨いで移動できる

" show
set number                         " show line number
set numberwidth=3
set shortmess+=I                   " no startup logo
set showmatch matchtime=1          " 対応する括弧を強調表示する
set display+=lastline              " 画面最後の行をできるだけ表示する
set scrolloff=2                    " スクロール時の上下余白設定
if exists('&ambiwidth')
  set ambiwidth=double             " マルチバイト表示がずれないようにする
endif
set signcolumn=yes                 " alway show signcolumn

" colorscheme
augroup Colorscheme
  autocmd!
  autocmd ColorScheme * highlight LineNr guibg=#242424
augroup END

set background=dark                " colorschemeの傾向
if has('termguicolors')            " True color対応
  set termguicolors
endif
colorscheme wombat                 " colorscheme
highlight link EndOfBuffer Ignore  " no tilde at end of buffer

set clipboard+=unnamedplus,unnamed " share clipboard to OS
set autoread                       " auto read, if the other buffer changed
set confirm                        " コマンド実行時、バッファが変更されていたらファイル保存の確認を求める
set wildmenu                       " コマンドモードで入力候補を表示する
set backspace=indent,eol,start     " バックスペースで削除できるものを指定
set splitbelow                     " if split, new window opens below
set splitright                     " if split, new window opens below
set noequalalways                  " no window size auto adjust
set isk+=-                         " set keyword to include text object

" show 2bytes space
hi ZenkakuSpace cterm=underline ctermfg=lightblue guibg=darkgray
match ZenkakuSpace /　/

" ファイルオープン時、最後にカーソルがあった場所に移動する
augroup OpenPreviousCursor
  autocmd!
  autocmd BufRead * if line("'\"") > 0 && line("'\"") <= line("$") |
  \ exe "normal g`\"" | endif
augroup END

" set indent for python
augroup fileTypeIndent
  autocmd!
  " python
  autocmd Filetype python setlocal smartindent
    \ cinwords=if,elif,else,for,while,try,except,finally,def,class
    \ softtabstop=2 shiftwidth=2 tabstop=2 expandtab
augroup END

" }}}

" -----------------------------------------------------------------------
" Basic Key Mappings: {{{
" -----------------------------------------------------------------------

" prefix key
let mapleader = "\<Space>"

" open .vimrc
nnoremap <silent><Leader>e. :<C-u>edit ~/dotfiles/.vimrc<CR>
" import current buffer
nnoremap <silent><Leader>s. :<C-u>execute "source " expand("%:p")<CR>

" open dein.toml
nnoremap <silent><Leader>e, :<C-u>edit ~/.dein.toml<CR>

" close buffer
nnoremap <silent>q :<C-u>bdelete<CR>

" change to normal mode
inoremap <silent>jj <ESC>

" 空行を挿入する
nnoremap <silent>; :<C-u>call append(expand('.'), '')<CR>j

" 表示行で移動する
noremap j gj
noremap k gk

" Insert Modeのカーソル移動
inoremap <C-h> <Left>
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-l> <Right>

" page scroll
nnoremap <CR> <C-f>

" delete hilight search
nnoremap <silent><BS> :let @/ = ""<CR>

" move window to the other window
nnoremap <silent><TAB>      :<C-u>wincmd w<CR> " go to next window
nnoremap <silent><S-TAB>    :<C-u>wincmd W<CR> " back to previous window

" move to blankline
nnoremap <silent><C-j> :<C-u>keepjumps normal! }<CR>
nnoremap <silent><C-k> :<C-u>keepjumps normal! {<CR>

" change buffer
nnoremap <silent><C-n> :<C-u>bnext<CR>
nnoremap <silent><C-p> :<C-u>bprevious<CR>

" change window size
nnoremap <silent><Up>    <C-w>-
nnoremap <silent><Down>  <C-w>+
nnoremap <silent><Left>  <C-w>>
nnoremap <silent><Right> <C-w><

" close folding
nnoremap <expr>h col('.') == 1 && foldlevel(line('.')) > 0 ? 'zc' : 'h'
" open folding
nnoremap <expr>l foldclosed(line('.')) != -1 ? 'zo' : 'l'

" move to the end of the sentences after pasting
vnoremap <silent>y y`]
vnoremap <silent>p p`]
nnoremap <silent>p p`]

" open terminal
nnoremap <silent><Leader>t :<C-u>terminal<CR>

" }}}

" -----------------------------------------------------------------------
" Plugin Settings: {{{
" -----------------------------------------------------------------------

" -----------------------------------------------------------------------
" vimfiler {{{
" -----------------------------------------------------------------------

" Settings: {{{

  if dein#tap('vimfiler')
    let g:vimfiler_max_directories_history = 0
    let g:vimfiler_as_default_explorer = 1
    let g:vimfiler_no_default_key_mappings = 1
    let g:vimfiler_file_icon = "-"
    let g:vimfiler_readonly_file_icon = "𐄂"
    let g:vimfiler_tree_closed_icon = "‣"
    let g:vimfiler_tree_leaf_icon = " "
    let g:vimfiler_tree_opened_icon = "▾"
    let g:vimfiler_marked_file_icon = "✓"
    call vimfiler#custom#profile('default', 'context', {
      \ 'auto_cd': 0,
      \ 'safe': 0,
      \ 'split': 1,
      \ 'toggle': 1,
      \ 'no_quit': 1,
      \ 'simple': 1,
    \ })
  endif

" }}} /Settings:

" Keymaps: {{{

  " open
  nnoremap <silent><Leader>v :<C-u>VimFiler -buffer-name=explore<CR>

  " initialize
  augroup VimFilerInit
    autocmd! 
    autocmd FileType vimfiler call s:vimfiler_settings()
  augroup END

  " control vimfiler
  function! s:vimfiler_settings()
    nmap <buffer> e <Plug>(vimfiler_edit_file)
    nmap <buffer> o <Plug>(vimfiler_edit_file)
    nmap <buffer> c <Plug>(vimfiler_mark_current_line)<Plug>(vimfiler_copy_file)
    nmap <buffer> m <Plug>(vimfiler_mark_current_line)<Plug>(vimfiler_move_file)
    nmap <buffer> n <Plug>(vimfiler_mark_current_line)<Plug>(vimfiler_new_file)
    nmap <buffer> N <Plug>(vimfiler_mark_current_line)<Plug>(vimfiler_make_directory)
    nmap <buffer> d <Plug>(vimfiler_mark_current_line)<Plug>(vimfiler_delete_file)
    nmap <buffer> r <Plug>(vimfiler_mark_current_line)<Plug>(vimfiler_rename_file)
    nmap <buffer> j <Plug>(vimfiler_loop_cursor_down)
    nmap <buffer> k <Plug>(vimfiler_loop_cursor_up)
    nmap <buffer> h <Plug>(vimfiler_smart_h)
    nmap <buffer> l <Plug>(vimfiler_smart_l)
    nmap <buffer> gg <Plug>(vimfiler_cursor_top)
    nmap <buffer> t <Plug>(vimfiler_expand_tree_recursive)
    nmap <buffer> . <Plug>(vimfiler_toggle_visible_ignore_files)
    nmap <buffer> a <Plug>(vimfiler_choose_action)
    nmap <buffer> S <Plug>(vimfiler_popup_shell)
    nmap <buffer> s <Plug>(vimfiler_execute_shell_command)
    nmap <buffer> gr <Plug>(vimfiler_grep)
    nmap <buffer> gf <Plug>(vimfiler_find)
  endfunction

  " keymaps for rails directory (required vim-rails)
  if dein#tap('vim-rails')
    noremap  [vimfiler] <Nop>
    map      <Leader><Leader> [vimfiler]
    nnoremap <silent><expr>[vimfiler]m ':VimFiler -buffer-name=explore '.b:rails_root.'/app/models<CR>'
    nnoremap <silent><expr>[vimfiler]v ':VimFiler -buffer-name=explore '.b:rails_root.'/app/views<CR>'
    nnoremap <silent><expr>[vimfiler]c ':VimFiler -buffer-name=explore '.b:rails_root.'/app/controllers<CR>'
    nnoremap <silent><expr>[vimfiler]h ':VimFiler -buffer-name=explore '.b:rails_root.'/app/helpers<CR>'
    nnoremap <silent><expr>[vimfiler]a ':VimFiler -buffer-name=explore '.b:rails_root.'/app/assets<CR>'
    nnoremap <silent><expr>[vimfiler]d ':VimFiler -buffer-name=explore '.b:rails_root.'/db<CR>'
    nnoremap <silent><expr>[vimfiler]t ':VimFiler -buffer-name=explore '.b:rails_root.'/test<CR>'
    nnoremap <silent><expr>[vimfiler]g ':e '.b:rails_root.'/Gemfile<CR>'
    nnoremap <silent><expr>[vimfiler]r ':e '.b:rails_root.'/config/routes.rb<CR>'
  endif

" }}} /Keymaps:

" }}} /vimfiler

" -----------------------------------------------------------------------
" vim-rails {{{
" -----------------------------------------------------------------------
" provides usefule command to build rails application

" Keymaps: {{{

  " create partial file
  vnoremap R :<C-u>'<,'>Extract layouts/

" }}} /Keymaps:

" }}} /vim-rails

" -----------------------------------------------------------------------
" unite {{{
" -----------------------------------------------------------------------
" provides interface for any souces 

" Settings: {{{

  if dein#tap('unite')
    call unite#custom#profile('default', 'context', {
      \ 'no_quit': 1,
    \ })

  endif

  let g:unite_no_default_keymappings = 1

" }}} /Settings:

" Keymaps: {{{

  " set keymaps in unite mode
  augroup UniteInit
    autocmd!
    autocmd FileType unite call s:unite_my_settings()
  augroup END

  function! s:unite_my_settings()
    nmap <buffer>i <Plug>(unite_insert_enter)
    nmap <buffer>e <Plug>(unite_do_default_action)
    nmap <buffer>q <Plug>(unite_exit)
    nmap <buffer>j <Plug>(unite_loop_cursor_down)
    nmap <buffer>k <Plug>(unite_loop_cursor_up)
  endfunction

" }}} /Keymaps:

" }}} /unite

" -----------------------------------------------------------------------
" neoyank {{{
" -----------------------------------------------------------------------
" browses a history of yank registers

" Settings: {{{

  let g:neoyank#limit = 50

" }}} /Settings:

" Keymaps: {{{

  " open histories
  nnoremap <Leader>y :<C-u>Unite history/yank<CR>

" }}} /Keymaps:

" }}} /neoyank

" -----------------------------------------------------------------------
" automatic {{{
" -----------------------------------------------------------------------

" Settings: {{{

  let g:automatic_default_set_config = {
    \ 'width': '40',
    \ 'move': 'right',
  \ }

  let g:automatic_config = [
    \ {
    \   'match': {'filetype': 'help'},
    \   'set': {
    \     'width': '50%',
    \   },
    \ },
    \ {
    \   'match': {'bufname': 'explore'},
    \   'set': {
    \     'is_close_focus_out': 1,
    \   },
    \ },
    \ {
    \   'match': {'bufname': '\[quickrun output\]'},
    \   'set': {
    \     'height': '11',
    \     'move': 'bottom',
    \   },
    \ },
    \ {
    \   'match': {'bufname': '[[*]unite[]*]'},
    \   'set': {
    \     'height': '11',
    \     'move': 'bottom',
    \   },
    \ },
  \ ]

" }}} /Settings:

" }}} /automatic

" -----------------------------------------------------------------------
" buftabline {{{
" -----------------------------------------------------------------------

" Settings: {{{

  " always show tabline
  let g:buftabline_show = 2
  " set tab color
  hi! BufTabLineHidden guifg=#888888 guibg=#151515
  hi! link BufTabLineActive Normal
  hi! BufTabLineFill guibg=#242424
  hi! link BufTabLineCurrent Function

  " indicate buffer's state
  let g:buftabline_indicators=1

" }}} /Settings:

" }}} /buftabline

" -----------------------------------------------------------------------
" quickrun {{{
" -----------------------------------------------------------------------

" Settings: {{{

  " default
  let g:quickrun_config = {
    \ '_': {
    \ 'runner': 'vimproc',
    \ 'runner/vimproc/updatetime': 40,
    \ 'outputter/buffer/close_on_empty': 1,
    \ 'outputter/buffer/running_mark': 'running...',
    \ },
  \ }
  " ruby
  let g:quickrun_config['ruby'] = {
    \ 'command': 'pry',
    \ 'cmdopt': '--simple-prompt',
    \ 'runner/process_manager/load': "load '%s'",
    \ 'runner/process_manager/prompt': '>> ',
  \ }
  " rspec
  let g:quickrun_config['ruby.rspec'] = {
    \ 'command': "rspec",
    \ 'cmdopt': 'bundle exec',
    \ 'exec': '%o %c %s',
  \ }

" }}} /Settings:

" Keymaps: {{{

  " run
  nnoremap <Leader>q :<C-u>QuickRun<CR>

" }}} /Keymaps:

" }}} /quickrun

" -----------------------------------------------------------------------
" neocomplete {{{
" -----------------------------------------------------------------------

" Settings: {{{

  if has('lua')
    let g:neocomplete#disable_auto_complete = 0
    " 大文字を入力するまで大文字小文字の区別をしない
    let g:neocomplete#enable_smart_case = 1
    let g:neocomplete#enable_camel_case = 1
    let g:neocomplete#enable_underbar_completion = 1
    " シンタックス補完を開始する文字数
    let g:neocomplete#sources#syntax#min_keyword_length = 3
    let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'
    " 起動時に有効化する
    let g:neocomplete#enable_at_startup = 1
    " 自動補完を開始する文字数
    let g:neocomplete#auto_completion_start_length = 2
    " 手動補完を開始する文字数
    let g:neocomplete#manual_completion_start_length = 0
    " 最小のキーワード文字数
    let g:neocomplete#min_keyword_length = 3
    " enable fuzzy searching
    let g:neocomplete#enable_fuzzy_completion = 1
    " insert delimiter automatically
    let g:neocomplete#enable_auto_delimiter = 1

    " filetypeの認識
    if !exists('g:neocomplete#same_filetypes')
      let g:neocomplete#same_filetypes = {}
    endif
    let g:neocomplete#same_filetypes.ruby = 'eruby'
    let g:neocomplete#same_filetypes.html = 'css'

    " set keyword
    if !exists('g:neocomplete#keyword_patterns')
        let g:neocomplete#keyword_patterns = {}
    endif
    let g:neocomplete#keyword_patterns['default'] = '\h\w*'

    " set dictionaries
    let s:neco_dicts_dir = '~/.vim/dein/repos/github.com/pocke/dicts/'
    if isdirectory(s:neco_dicts_dir)
      let g:neocomplete#sources#dictionary#dictionaries = {
        \ 'ruby': s:neco_dicts_dir . 'ruby.dict',
        \ 'javascript': s:neco_dicts_dir . 'jquery.dict',
      \ }
    endif

    " バッファを開いたらキャッシュする
    autocmd BufReadPost,BufEnter,BufWritePost :neocompleteCachingBuffer <buffer>
    
    " enable omnifunc
    autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
    autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
    autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
    autocmd FileType ruby,eruby setlocal omnifunc=rubycomplete#Complete
    " enable neocomplete completion using jedi
    autocmd FileType python setlocal omnifunc=jedi#completions
    " disable jedi docstring
    autocmd FileType python setlocal completeopt-=preview
    " async completion by using monster
    let g:monster#completion#rcodetools#backend = "async_rct_complete"
    if !exists('g:neocomplete#sources#omni#input_patterns')
      let g:neocomplete#sources#omni#input_patterns = {
        \  "python": '\%([^. \t]\.\|^\s*@\|^\s*from\s.\+import \|^\s*from \|^\s*import \)\w*',
        \  "ruby": '[^. *\t]\.\w*\|\h\w*::',
      \ }
    endif

    let g:neocomplete#sources#vim#complete_functions = {
      \ 'Unite' : 'unite#complete_source',
      \ 'VimFiler' : 'vimfiler#complete',
    \ }
  endif

" }}} /Settings:

" Keymaps: {{{

  " execute
  inoremap <expr><S-J> pumvisible() ? "\<C-n>" : "\<S-J>"
  inoremap <expr><S-K> pumvisible() ? "\<C-p>" : "\<S-K>"
  inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"

" }}} /Keymaps:

" }}} /neocomplete

" -----------------------------------------------------------------------
" macdict {{{
" -----------------------------------------------------------------------

" Keymaps: {{{

  " refer
  vnoremap <silent>// y:<C-u>MacDict<Space><C-r>*<CR>
  nnoremap // :<C-u>MacDict<Space>

" }}} /Keymaps:

" }}} /macdict

" -----------------------------------------------------------------------
" lightline {{{
" -----------------------------------------------------------------------

" Settings: {{{

  " arrange contents in statusline
  let g:lightline = {
    \ 'colorscheme': 'wombat',
    \ 'active': {
    \   'left': [
    \      ['mode', 'paste'],
    \      ['fugitive', 'filename'],
    \   ]
    \ },
    \ 'component_function': {
    \   'filename': 'StatusIcon',
    \   'fugitive': 'LightlineFugitive'
    \ }
  \ }

  " content - show current path
  function! StatusIcon()
    return ('' != expand('%:t') ? expand('%:p'): '[No Name]') .
      \ ('' != ModifiedIcon() ? ' ' . ModifiedIcon(): '')
  endfunction

  " content - show modified icon
  function! ModifiedIcon()
    if &modified
      return "+"
    else
      return ""
    endif
  endfunction

  " content - show git branch
  function! LightlineFugitive()
    return exists('*fugitive#head') ? fugitive#head(): ''
  endfunction

" }}} /Settings:

" }}} /lightline

" -----------------------------------------------------------------------
" vim-anzu {{{
" -----------------------------------------------------------------------
" helps being aware of searching position

" Settings: {{{

  " format setting
  let g:anzu_status_format = "Searching... "."%p(%i/%l)"

" }}} /Settings:

" Keymaps: {{{

  " execute
  nmap n <Plug>(anzu-jump-n)<Plug>(anzu-echo-search-status)
  nmap N <Plug>(anzu-jump-N)<Plug>(anzu-echo-search-status)

" }}} /Keymaps:

" }}} /vim-anzu

" -----------------------------------------------------------------------
" caw.vim {{{
" -----------------------------------------------------------------------

" Keymaps: {{{

  " comment toggle
  nmap cc <Plug>(caw:hatpos:toggle)

" }}} /Keymaps:

" }}} /caw.vim

" -----------------------------------------------------------------------
" vim-parenmatch {{{
" -----------------------------------------------------------------------

" Settings: {{{

  " disable default parenmatch
  let g:loaded_matchparen = 1

" }}} /Settings:

" }}} /vim-parenmatch

" -----------------------------------------------------------------------
" openbrowser {{{
" -----------------------------------------------------------------------

" Mappings: {{{

  " open URI or word under the cursor
	vmap <Enter> <Plug>(openbrowser-smart-search)

" }}} /Mappings:

" }}} /openbrowser

" -----------------------------------------------------------------------
" vim-over {{{
" -----------------------------------------------------------------------

" Mappings: {{{

  nnoremap rep :OverCommandLine<CR>%s/<C-r><C-w>//gc<Left><Left><Left>

" }}} /Mappings:

" }}} /vim-over

" -----------------------------------------------------------------------
" jedi {{{
" -----------------------------------------------------------------------
" python completion

" Settings: {{{

  " disable completion Function by this plugin
  let g:jedi#completions_enabled = 0
  let g:jedi#auto_vim_configuration = 0
  " disable showing args
  let g:jedi#show_call_signatures = 0

" }}} Settings:

" }}} jedi

" -----------------------------------------------------------------------
" vim-easy-align {{{
" -----------------------------------------------------------------------
" provides command aligning words

" Keymaps: {{{

  " align
  vmap <Leader><CR> <Plug>(EasyAlign)

" }}} /Keymaps:

" }}} /vim-easy-align

" -----------------------------------------------------------------------
" fugitive {{{
" -----------------------------------------------------------------------
" is git command wrapper

" Keymaps: {{{

  " git basic command
  nmap <Space>g [git]
  nnoremap [git]a :<C-u>Gwrite<CR>
  nnoremap [git]s :<C-u>Gstatus<CR>
  nnoremap [git]c :<C-u>Gcommit<CR>
  nnoremap [git]d :<C-u>Gvdiff<CR>
  nnoremap [git]p :<C-u>Git push origin master<CR>

" }}} /Keymaps:

" }}} /fugitive

" -----------------------------------------------------------------------
" agit {{{
" -----------------------------------------------------------------------
" git log viewer and execute git command

" Keymaps: {{{

  " show histories
  nnoremap [git]l :<C-u>Agit<CR>
  " refer old files simply
  nnoremap [git]f :<C-u>AgitFile<CR>
  " rebase
  nmap [git]r <Plug>(agit-git-rebase-i)

" }}} /Keymaps:

" }}} /agit

" -----------------------------------------------------------------------
" vim-signify {{{
" -----------------------------------------------------------------------

" Settings: {{{

  " set what VCS to check for
  let g:signify_vcs_list = [ 'git' ]

  " set signcolumn color
  highlight SignColumn        guibg=#242424
  highlight SignifySignAdd    guibg=#242424
  highlight SignifySignDelete guibg=#242424 
  highlight SignifySignChange guibg=#242424 

" }}} /Settings:

" Keymaps: {{{

  " jump to next/previous hunk
  nmap <leader>gj <plug>(signify-next-hunk)
  nmap <leader>gk <plug>(signify-prev-hunk)

" }}} /Keymaps:

" }}} /vim-signify

" -----------------------------------------------------------------------
" memolist {{{
" -----------------------------------------------------------------------

" Settings: {{{

  let g:memolist_path = $HOME."/Dropbox/memo" " 保存先の指定
  let g:memolist_memo_suffix = "md"           " 保存形式の指定
  let g:memolist_filename_prefix_none = 1     " ファイル名のprefixをなしに
  let g:memolist_vimfiler = 1
  let g:memolist_vimfiler_option = "-buffer-name=explore"

" }}} /Settings:

" Keymaps: {{{

  " show memolist
  nnoremap <silent><Leader>m :MemoList<CR>

" }}} /Keymaps:

" }}} /memolist

" -----------------------------------------------------------------------
" vim-monster {{{
" -----------------------------------------------------------------------
" completes ruby code using rcodetools

" Settings: {{{

  " set async completion
  let g:monster#completion#rcodetools#backend = "async_rct_complete"

" }}} /Settings:

" }}} /vim-monster

" -----------------------------------------------------------------------
" ctrlsf {{{
" -----------------------------------------------------------------------

" Settings: ctrlsf {{{

  let g:ctrlsf_ackprg = '/usr/local/bin/rg' " set grep program
  let g:ctrlsf_populate_qflist = 1
  let g:ctrlsf_position = 'bottom'
  let g:ctrlsf_auto_close = 1
  let g:ctrlsf_winsize = '40%'
  let g:ctrlsf_context = '-C 3'
  let g:ctrlsf_case_sensitive = 'smart'
  let g:ctrlsf_default_view_mode = 'compact'
  let g:ctrlsf_absolute_file_path = 0

" }}} /Settings: ctrlsf

" Keymaps: ctrlsf {{{

  nnoremap <Leader>f :<C-u>CtrlSF<Space>

" }}} /ctrlsf

" -----------------------------------------------------------------------
" vim-json {{{
" -----------------------------------------------------------------------

" Settings: {{{

  let g:vim_json_syntax_conceal = 0

" }}} /Settings:

" }}} /vim-json

" -----------------------------------------------------------------------
" foldCC {{{
" -----------------------------------------------------------------------

" Settings: {{{

  let g:foldCCtext_tail = 'v:foldend-v:foldstart+1'

" }}} /Settings:

" }}} /foldCC

" -----------------------------------------------------------------------
" clever-f {{{
" -----------------------------------------------------------------------

" Settings: {{{

  let g:clever_f_smart_case = 1

" }}} /Settings:

" }}} /clever-f

" -----------------------------------------------------------------------
" open-browser {{{
" -----------------------------------------------------------------------

" Keymaps: {{{

  " keymaps
  nmap <silent><Leader><CR> <Plug>(openbrowser-smart-search)

" }}} /Keymaps:

" }}} /open-browser

" -----------------------------------------------------------------------
" vim-smartword {{{
" -----------------------------------------------------------------------

" Keymaps: {{{

  " keymaps
  map w <Plug>(smartword-w)
  map b <Plug>(smartword-b)

" }}} /Keymaps:

" }}} /vim-smartword

" -----------------------------------------------------------------------
" braceless {{{
" -----------------------------------------------------------------------

" Settings: {{{

  autocmd Filetype python BracelessEnable +indent +highlight

" }}} /Settings:

" }}} /vim-operator-surround

" -----------------------------------------------------------------------
" vim-textmanip {{{
" -----------------------------------------------------------------------

" Keymaps: {{{

  " move block
  vmap <C-j> <Plug>(textmanip-move-down)
  vmap <C-k> <Plug>(textmanip-move-up)
  vmap <C-h> <Plug>(textmanip-move-left)
  vmap <C-l> <Plug>(textmanip-move-right)

" }}} /Keymaps:

" }}} /vim-textmanip

" }}} /Plugin Settings:

" }}} /vimrc

