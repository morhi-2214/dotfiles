# 補完 #

# TODO: とりあえず補完がFigと競合するので無効化している
# Tabを押すと補完が表示される
# zinit ice wait'0'; zinit light zsh-users/zsh-completions
# autoload -Uz compinit && compinit

# zinit light marlonrichert/zsh-autocomplete

########

# anyframeのセットアップ
zinit light mollifier/anyframe

# [bat ~] batコマンドを使える（見やすいcatコマンドみたいなもの）
# バイナリとしてダウンロードしてpathを通している
zinit ice as"program" from"gh-r" mv"bat* -> bat" pick"bat/bat"
zinit light sharkdp/bat
## 以下はただのエイリアス設定
if builtin command -v bat > /dev/null; then
  alias cat="bat"
fi