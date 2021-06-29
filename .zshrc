export PATH="/opt/homebrew/opt/mysql@5.7/bin:$PATH"
export PATH="/opt/homebrew/opt/m4/bin:$PATH"
eval "$(anyenv init -)"
export PATH="/opt/homebrew/opt/php@7.4/bin:$PATH"
export PATH="/opt/homebrew/opt/php@7.4/sbin:$PATH"
export PATH="/Users/h.mori/Library/Android/sdk/platform-tools:$PATH"
export DOCKER_CONTENT_TRUST=1

# zsh-completions(補完機能）の設定
if [ -e /opt/homebrew/share/zsh-completions ]; then
	fpath=(/opt/homebrew/share/zsh-completions $fpath)
fi
autoload -U compinit
compinit -u

# prompt
PROMPT='%m@%n %F{1}%~%f$ '


########################################
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
##############################

# コマンドのスペルを訂正
setopt correct

# 拡張globを有効にしてワイルドカードパターンを使える
setopt extended_glob

# 色を使用できるようにする
autoload -Uz colors

# 日本語のファイル名を表示可能にする
setopt print_eight_bit
colors

# cd なしでもディレクトリ移動可能
setopt auto_cd

#################################  HISTORY  #################################
# history
HISTFILE=$HOME/.zsh-history # 履歴を保存するファイル
HISTSIZE=100000             # メモリ上に保存する履歴のサイズ
SAVEHIST=1000000            # 上述のファイルに保存する履歴のサイズ

# share .zshhistory
setopt inc_append_history   # 実行時に履歴をファイルにに追加していく
setopt share_history        # 履歴を他のシェルとリアルタイム共有する

#################################  COMPLEMENT  #################################
# enable completion
autoload -Uz compinit && compinit

# 補完候補をそのまま探す -> 小文字を大文字に変えて探す -> 大文字を小文字に変えて探す
zstyle ':completion:*' matcher-list '' 'm:{[:lower:]}={[:upper:]}' '+m:{[:upper:]}={[:lower:]}'

### 補完方法毎にグループ化する。
zstyle ':completion:*' format '%B%F{blue}%d%f%b'
zstyle ':completion:*' group-name ''

### 補完侯補をメニューから選択する。
### select=2: 補完候補を一覧から選択する。補完候補が2つ以上なければすぐに補完する。
zstyle ':completion:*:default' menu select=2

#################################  OTHERS  #################################
# automatically change directory when dir name is typed
setopt auto_cd

# disable ctrl+s, ctrl+q
setopt no_flow_control

################## peco関連####################
# peco settings
# 過去に実行したコマンドを選択。ctrl-rにバインド
function peco-select-history() {
  BUFFER=$(\history -n -r 1 | peco --query "$LBUFFER")
  CURSOR=$#BUFFER
  zle clear-screen
}
zle -N peco-select-history
bindkey '^r' peco-select-history

# search a destination from cdr list
function peco-get-destination-from-cdr() {
  cdr -l | \
  sed -e 's/^[[:digit:]]*[[:blank:]]*//' | \
  peco --query "$LBUFFER"
}


### 過去に移動したことのあるディレクトリを選択。ctrl-uにバインド
function peco-cdr() {
  local destination="$(peco-get-destination-from-cdr)"
  if [ -n "$destination" ]; then
    BUFFER="cd $destination"
    zle accept-line
  else
    zle reset-prompt
  fi
}
zle -N peco-cdr
bindkey '^u' peco-cdr


# ブランチを簡単切り替え。git checkout lbで実行できる
alias -g lb='`git branch | peco --prompt "GIT BRANCH>" | head -n 1 | sed -e "s/^\*\s*//g"`'


# dockerコンテナに入る。deで実行できる
alias de='docker exec -it $(docker ps | peco | cut -d " " -f 1) /bin/bash'
export PGDATA=/opt/homebrew/var/postgres
