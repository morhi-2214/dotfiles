
zinit light zsh-users/zsh-completions
zinit light marlonrichert/zsh-autocomplete

# [bat ~] batコマンドを使える（見やすいcatコマンドみたいなもの）
# バイナリとしてダウンロードしてpathを通している
zinit ice as"program" from"gh-r" mv"bat* -> bat" pick"bat/bat"
zinit light sharkdp/bat
## 以下はただのエイリアス設定
if builtin command -v bat > /dev/null; then
  alias cat="bat"
fi