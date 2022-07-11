# aliases

# Git系
alias gb='git branch'
alias gp='git pull'
alias gpom='git pull origin master'
alias gcl='git clone'
alias gch='git checkout'
alias gg='git grep'
alias ga='git add'
alias ga.='git add .'
alias gd='git diff'
alias gl='git log'
alias gchm='git checkout master'
alias gchb='git checkout -b'
alias gfu='git fetch upstream'
alias gfo='git fetch origin'
alias gmod='git merge origin/develop'
alias gmud='git merge upstream/develop'
alias gmom='git merge origin/master'
alias gcom='git commit -m'
alias gpo='git push origin'
alias gs='git stash -u'
alias gsl='git stash list'
alias gsu='git stash -u'
alias gsp='git stash pop'

# vim系
alias v='vim'
alias vi='vim'

# ls系
alias ls='ls -gG'
alias la='ls -aG'
alias ll='ls -lG'
# ディレクトリはlsした時、黄緑で表示される
export LSCOLORS=Cxfxcxdxbxegedabagacad

# exaをlsの代替として用いる場合
# if [[ $(command -v exa) ]]; then
#   alias e='exa --icons --git'
#   alias l=e
#   alias ls=e
#   alias ea='exa -a --icons --git'
#   alias la=ea
#   alias ee='exa -aahl --icons --git'
#   alias ll=ee
#   alias et='exa -T -L 3 -a -I "node_modules|.git|.cache" --icons'
#   alias lt=et
#   alias eta='exa -T -a -I "node_modules|.git|.cache" --color=always --icons | less -r'
#   alias lta=eta
#   alias l='clear && ls'
# fi

# 良く移動するcd系
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

# 処理確認系
alias rm='rm -i'
alias mv='mv -i'
alias cp='cp -i'

# よく使う系
alias m='mkdir'
alias n='npm run'
alias y='yarn run'
alias c='clear'
alias h='history'

# zsh系
alias zsh='vim ~/.zshrc'
alias szsh='source ~/.zshrc'

# docker系
alias dr='docker-compose restart'
alias ds='docker-compose stop'

# dockerコンテナに入る。deで実行できる
alias de='docker exec -it $(docker ps | peco | cut -d " " -f 1) /bin/bash'

## 以下はただのエイリアス設定
if builtin command -v bat > /dev/null; then
  alias cat="bat"
fi