#!/bin/bash
dotfiles=(.zshrc .tmux.conf)

# .zshrc と .tmux.conf のシンボリックリンクをホームに作成
for file in "${dotfiles[@]}"; do
        ln -svf $file ~/
done