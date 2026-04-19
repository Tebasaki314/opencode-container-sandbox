export ZSH="$HOME/.oh-my-zsh"

# テーマ設定
ZSH_THEME="agnoster"

# プラグイン設定
plugins=(
    git
    zsh-autosuggestions
    zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

# OpenCode パス設定
export PATH="/home/opencode/.local/bin:/home/opencode/.opencode/bin:$PATH"

# 日本語環境
export LANG=C.UTF-8

# エイリアス
alias ll='ls -alF'

# ログイン時に自動的に work ディレクトリへ移動
if [ -d "$HOME/work" ]; then
    cd "$HOME/work"
fi