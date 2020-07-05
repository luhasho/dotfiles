"##################################################
"バックアップ関連
"##################################################
set nobackup
set noundofile
"swapファイル無しにする
set noswapfile
":set swapfile

"##################################################
"動作関連
"##################################################
"同時スクロール scbでもOK
"set scrollbind
"同時スクロール時に縦横ジャンプ操作を同期
set scrollopt=ver,hor,jump
"クリップボード連携
set clipboard=unnamed
"タブ入力時のスペース数
set tabstop=4
"インデントのスペース数
set shiftwidth=4
" <Tab>押下時に<Tab>ではなく、スペースを挿入する
set expandtab
" 新しいウィンドウを下に開く
set splitbelow
" 新しいウィンドウを右に開く
set splitright
"文字コードの設定
set encoding=utf-8
set fileencodings=ucs-bom,cp932,utf-8
"set fileencodings=ucs-bom,iso-2022-jp,euc-jp,sjis,cp932,utf-8

"##################################################
"検索関連
"##################################################
"ハイライト
set hlsearch
noh
"インクリメンタルサーチ
set incsearch
" 大文字小文字を区別しない(検索時)
set ignorecase
" ただし大文字を含んでいた場合は大文字小文字を区別する(検索時)
set smartcase


"##################################################
"表示関連
"##################################################
"行番号を表示
set number
set relativenumber

"コマンドライン行数
set cmdheight=2
" ターミナルの右端で文字を折り返さない
set nowrap
"スクロールバー等
"set guioptions=gmrLtTba
set guioptions=gmrLtTb
	"b=水平スクロールバー表示
	"a=ビジュアルモードで選択時にクリップボードを共有

"現在の行を強調表示
set cursorline
"現在の行を強調表示(縦)
"set cursorcolumn
"行末の1文字先までカーソルを移動できるように＋矩形選択時に行末以降選択可能に
set virtualedit=onemore
set virtualedit+=block

"シンタックス
syntax enable




"##################################################
"ステータスバー関連
"##################################################
"let $mode_ban=1
"let g:mode_name='aa'
function! SetStatusLine()
    if mode() =~ 'i'
        let c = 1
        let mode_name = 'Insert'
    elseif mode() =~ 'n'
        let c = 2
        let mode_name = 'Normal'
    elseif mode() =~ 'R'
        let c = 3
        let mode_name = 'Replace'
    elseif mode() =~ 'c'
        let c = 4
        let mode_name = 'Command'
    else
        let c = 5
        let mode_name = 'Visual'
    endif

let moji_code=has('multi_byte')&&&fileencoding!=''?&fileencoding:&encoding

"ステータスラインのフォーマットは、直接文字列を入れるので、\ でのエスケープは必要なし
    return "%" . c . "*[" . mode_name . "]%*"
        \ . '%t'
        \ . '%m'
        \ . '%r'
        \ . '%h'
        \ . '%w'
        \ . ' '
        \ . '/' . moji_code
        \ . '/' . '%{&ff}' . '/' . '%b(H:%B)'
        \ . '%='
        \ . '' . '列=%v' . ' 行=%l/%L'
        \ . '[%p%%]'
endfunction

set statusline=%!SetStatusLine()

"コマンドラインモード時に再描画する
augroup StatusLineRedraw
    autocmd!
    autocmd CmdlineEnter * redraws
augroup END

"カーソル位置表示（statuslinedeで設定するためコメントアウト）
"set ruler
set laststatus=2
":set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=%04l,%04v][%p%%]\ [LEN=%L]
"ファイル名 %F=フルパス、%f相対パス、%t=ファイル名のみ
"set statusline+=%t
""修正フラグ
"set statusline+=%m
""読込専用フラグ
"set statusline+=%r
""ヘルプフラグ
"set statusline+=%h
""プレビューフラグ
"set statusline+=%w
""スペース追加
"set statusline+=\ 
""文字コード
"set statusline+=[ASCII:\%b\(H:%B\)]
""ここより右寄せ
"set statusline+=%=
"
""列表示
"set statusline+=[列=%v]
""行表示／総行数
"set statusline+=[行=%l\/%L]
""パーセント表示
"set statusline+=[%p%%]
""文字コード表示
"set statusline+=[%{has('multi_byte')&&\&fileencoding!=''?&fileencoding:&encoding}]

"コマンド候補の表示
set wildmenu


"##################################################
"色関係の設定
"##################################################
"ターミナル内での色設定を有効化
"set t_Co=256
set termguicolors

"カラースキーマの設定 (※この設定の後に各highlight の設定をする)
colorscheme evening
"ステータスラインの色
"highlight StatusLine guifg=#c4ff0e guibg=#000000
highlight StatusLine guifg=SpringGreen guibg=bg
highlight StatusLineTermNC guifg=bg guibg=DarkCyan
"DarkCyan
"MediumSpringGreen
"DarkSlateGray
"OliveDrab
"
"カーソルラインの色
highlight CursorLine term=underline cterm=underline guibg=black
"
"モードの色指定
" 挿入
highlight User1 gui=bold guibg=red guifg=white
" ノーマル
highlight User2 gui=bold guibg=blue guifg=white
" 置換
highlight User3 gui=bold guibg=coral guifg=black
" コマンドライン
highlight User4 gui=bold guibg=lightred guifg=black
" ビジュアル
highlight User5 gui=bold guibg=magenta guifg=white

"色確認
"so $VIMRUNTIME/syntax/colortest.vim


"##################################################
"バックスペース効かない対応 ※本PCでは設定しなくても問題ないが設定
"##################################################
set backspace=indent,eol,start
"set backspace=2
"0  ":set backspace=" と同じ (Vi互換)
"1  ":set backspace=indent,eol" と同じ
"2  ":set backspace=indent,eol,start" と同じ


"##################################################
"エラーフォーマット
"##################################################
"set errorformat+=%f\|%l\ col\ %c\|\ %m
"set errorformat=%m

"##################################################
"タブ、空白、改行の可視化
"##################################################
set list
set listchars=tab:>-,trail:_,extends:>,precedes:<,nbsp:,
set listchars+=,eol:↲
"タブ、行末スペース、折り返した行の行末、折り返した行の行頭、ノーブレークスペース
"eol:x  改行

"set ambiwidth=double
"set ambiwidth=double  "Display double-width symbols properly

highlight NonText    ctermbg=None ctermfg=59 guibg=NONE guifg=darkgray
highlight SpecialKey ctermbg=None ctermfg=59 guibg=NONE guifg=cyan


"NonText
"   eol, extends, precedes
"SpecialKey
"   nbsp, tab, trail



"##################################################
"全角スペースをハイライト表示
"##################################################
function! ZenkakuSpace()
    highlight ZenkakuSpace cterm=reverse ctermfg=DarkMagenta gui=reverse guifg=DarkMagenta
endfunction

if has('syntax')
    augroup ZenkakuSpace
        autocmd!
        autocmd ColorScheme       * call ZenkakuSpace()
        autocmd VimEnter,WinEnter * match ZenkakuSpace /　/
    augroup END
    call ZenkakuSpace()
endif


"##################################################
"日時入力
"##################################################
"imap ,dt <C-R>=strftime("%Y-%m-%d(%a)")<CR>
inoremap <silent> <C-Space>d <C-R>=strftime("%Y-%m-%d(%a)")<CR>
inoremap <silent> <C-Space>dt <C-R>=strftime("%Y-%m-%d(%a) %H:%M")<CR>
inoremap <silent> <C-Space>t <C-R>=strftime("%H:%M")<CR>


nnoremap <silent> <Space>d <ESC>i<C-R>=strftime("%Y-%m-%d(%a)")<CR><ESC><right>
nnoremap <silent> <Space>t <ESC>i<C-R>=strftime("%H:%M")<CR><ESC><right>

"##################################################
"受付メモ作成
"##################################################
nnoremap <silent> <Space>tel :r ~\dotfiles\telmemo.txt<CR>jjf\|l<ESC>i<C-R>=strftime("%H:%M")<CR><ESC><right>Di<SPACE>\|<ESC>T\|ji


"##################################################
"YAMAHAルータConfigのコメント検索
"##################################################
nnoremap <silent> <Space>rtx /\v^#(.*Rev\.\|clear.config\|save)@!.*\|^$<CR>
":g//d<CR>:noh<CR>


"##################################################
"ノーマルモードでのEnter
"##################################################
nnoremap <CR> i<CR><ESC>


"##################################################
" カーソル位置から行末まで、コピー
"##################################################
nnoremap Y y$

"##################################################
"CTRL + 上下左右キー で画面分割のサイズ変更
"##################################################
nnoremap <C-right> <C-W>>
nnoremap <C-left> <C-W><
nnoremap <C-up> <C-W>+
nnoremap <C-down> <C-W>-


"##################################################
"SHIFT + 左右キー で水平カーソル移動
"##################################################
nnoremap <S-right> zl
nnoremap <S-left> zh



"##################################################
"行番号の表示を絶対表示、相対表示に切替する
"##################################################
nnoremap <F3> :set relativenumber!<CR>


"##################################################
"挿入モードでのESC時に IMEをオフにする
"##################################################
inoremap <ESC> <ESC>:set iminsert=0<CR>:<BS>


"##################################################
" [ って打ったら [] って入力されてしかも括弧の中にいる(以下同様)
"##################################################
inoremap [ []<left>
inoremap ( ()<left>
inoremap { {}<left>


"######################################################################
"
" プラグイン関連
"
"######################################################################
"##################################################
" NERDTree の自動起動
"##################################################
autocmd vimenter * NERDTree


"##################################################
" vim-PukiWiki 設定
"##################################################
""vim
	" PukiWiki のサイト情報 "
	let g:pukiwiki_config = {
	\	"LocalWiki" : {
	\		"url" : "http://10.30.224.132/Kanagawa/",
	\		"top" : "TOP",
	\	},
	\}

""	\		"url" : "http://127.0.0.1/pukiwiki/",
""	\		"top" : "FrontPage",


filetype plugin indent on


"##################################################
" PrevimOpen 設定
"##################################################
" MAC/UNIX用
"let g:previm_open_cmd = 'open -a Google\ Chrome'
"Windows用
let g:previm_open_cmd = 'chrome.exe'
"Windowsに PATH を通す必要あり(下記を追加)
"path %path%;C:\Program Files (x86)\Google\Chrome\Application\;


augroup PrevimSettings
    autocmd!
    autocmd BufNewFile,BufRead *.{md,mdwn,mkd,mkdn,mark*} set filetype=markdown
augroup END

nnoremap <silent> <C-p> :PrevimOpen<CR> " Ctrl-pでプレビュー
   " 自動で折りたたまないようにする
   let g:vim_markdown_folding_disabled=1
   let g:previm_enable_realtime = 1

let g:vim_markdown_toc_autofit = 1


"##################################################
" dein Scripts
"##################################################
if &compatible
  set nocompatible
endif
" Add the dein installation directory into runtimepath
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('~/.cache/dein')
  call dein#begin('~/.cache/dein')

  " Let dein manage dein
  " Required:
"  call dein#add('~\.cache\dein\repos\github.com\Shougo\dein.vim')
  call dein#add('~/.cache/dein/repos/github.com/Shougo/dein.vim')
  call dein#add('Shougo/deoplete.nvim')
  if !has('nvim')
    call dein#add('roxma/nvim-yarp')
    call dein#add('roxma/vim-hug-neovim-rpc')
  endif

  " Add or remove your plugins here like this:
  "call dein#add('Shougo/neosnippet.vim')
  "call dein#add('Shougo/neosnippet-snippets')
  call dein#end()
  call dein#save_state()
endif

filetype plugin indent on
"syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif
"End dein Scripts-------------------------
"##################################################
"
"
