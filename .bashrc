#alias�ݒ�
alias gv='gvim.exe'
alias gst='git status'
alias ls='ls -F --color=always --show-control-chars'
#alias less='less -R'
#���ϐ�LESS���C������p�^�[��
#export LESS='-R'

#Window�R�}���h�̕��������p(cp932��utf-8�ɕϊ�����)
function wincmd() {
   CMD=$1
   shift
   $CMD $* 2>&1 | iconv -f cp932 -t utf-8
}
alias ping='wincmd ping'
alias ipconfig='wincmd ipconfig'
