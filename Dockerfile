FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive
ENV LANG=C.UTF-8

RUN apt-get update && apt-get install -y --no-install-recommends \
    curl ca-certificates sudo git zsh vim fonts-powerline python3 python3-pip \
    && rm -rf /var/lib/apt/lists/*

RUN useradd -m -s /bin/zsh opencode && \
    echo "opencode ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

USER opencode
WORKDIR /home/opencode

# --- Oh My Zsh 関連 ---
# ZSH環境変数を明示
ENV ZSH=/home/opencode/.oh-my-zsh

# インストールスクリプトを実行。
# KEEP_ZSHRC=yes を環境変数に渡すことで、既存の.zshrcへの干渉を最小限にします。
# また、--unattended フラグで対話形式をスキップします。
RUN KEEP_ZSHRC=yes sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

# プラグインのクローン（~/.zshrcの内容とは独立してディレクトリに配置される）
RUN git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions && \
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# OpenCode のインストール
RUN curl -fsSL https://opencode.ai/install | bash

CMD ["tail", "-f", "/dev/null"]