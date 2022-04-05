# aliases

# Git系
alias g='git'
alias gs='git status'
alias gb='git branch'
alias gp='git pull'
alias gpom='git pull origin master'
alias gcl='git clone'
alias gch='git checkout'
alias gco='git commit -m'
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
alias gpom='git push origin master'
alias gst='git stash'
alias gstl='git stash list'
alias gstu='git stash -u'
alias gstp='git stash pop'

# vim系
alias v='vim'
alias vi='vim'

# ls系
alias ls='ls -g'
alias la='ls -a'
alias ll='ls -l'

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

# mysql系(臨時)
alias mss='mysql.server start'
alias msstop='mysql.server stop'
alias msr='mysql -u root -p'
alias ps8000='php -S localhost:8000'
alias ps8080='php -S localhost:8080'
alias pa='php artisan'
alias cr='composer require'

# dockerコンテナに入る。deで実行できる
alias de='docker exec -it $(docker ps | peco | cut -d " " -f 1) /bin/bash'


# ブランチを簡単切り替え。git checkout lbで実行できる
alias -g lb='`git branch | peco --prompt "GIT BRANCH>" | head -n 1 | sed -e "s/^\*\s*//g"`'
