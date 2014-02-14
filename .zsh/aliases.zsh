alias 6="source ~/.zshrc"
alias 7="vim ~/.zshrc"

alias be="bundle exec"
alias gs="guard start"
alias begs="be guard start"

function cdgem {
  cd $(bundle list $1)
}
