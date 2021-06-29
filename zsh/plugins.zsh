# powerlevel10k plugin
zinit ice depth=1; zinit light romkatv/powerlevel10k

# シンタックスハイライト
zinit light zdharma/fast-syntax-highlighting

# 履歴から入力中のコマンドを自動補完
zinit light zsh-users/zsh-autosuggestions
bindkey '^j' autosuggest-accept

# [git open] 現在のGitリポジトリをブラウザで開く
zinit light paulirish/git-open

# [bat ~] batコマンドを使える（見やすいcatコマンドみたいなもの）
# バイナリとしてダウンロードしてpathを通している
zinit ice as"program" from"gh-r" mv"bat* -> bat" pick"bat/bat"
zinit light sharkdp/bat
## 以下はただのエイリアス設定
if builtin command -v bat > /dev/null; then
  alias cat="bat"
fi