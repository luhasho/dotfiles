#alias設定
alias gv='gvim.exe'
alias gst='git status'
alias ls='ls -F --color=always --show-control-chars'
#alias less='less -R'
#環境変数LESSを修正するパターン
#export LESS='-R'

#Windowコマンドの文字化け用(cp932をutf-8に変換する)
function wincmd() {
   CMD=$1
   shift
   $CMD $* 2>&1 | iconv -f cp932 -t utf-8
}
alias ping='wincmd ping'
alias ipconfig='wincmd ipconfig'
