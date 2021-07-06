# 補完 #

# Tabを押すと補完が表示される
zinit ice wait'0'; zinit light zsh-users/zsh-completions
autoload -Uz compinit && compinit

# 履歴から入力中のコマンドを自動補完
zinit light zsh-users/zsh-autosuggestions

########

# anyframeのセットアップ
zinit light mollifier/anyframe

# powerlevel10k plugin
zinit ice depth=1; zinit light romkatv/powerlevel10k

# シンタックスハイライト
zinit light zdharma/fast-syntax-highlighting

# [git open] 現在のGitリポジトリをブラウザで開く
zinit light paulirish/git-open

# Ctrl+r でコマンド履歴を検索
zinit light zdharma/history-search-multi-word

# [bat ~] batコマンドを使える（見やすいcatコマンドみたいなもの）
# バイナリとしてダウンロードしてpathを通している
zinit ice as"program" from"gh-r" mv"bat* -> bat" pick"bat/bat"
zinit light sharkdp/bat
## 以下はただのエイリアス設定
if builtin command -v bat > /dev/null; then
  alias cat="bat"
fi
