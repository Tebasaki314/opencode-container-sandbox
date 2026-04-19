# OpenCode Docker Sandbox

OpenCodeを安全、かつ最強のZsh環境で利用するためのテンプレートです。

## 🌟 特徴
- **隔離環境**: ホストOSを汚さず、安全なサンドボックスでコードを実行。
- **リッチな操作感**: Oh My Zsh + 自動補完 + シンタックスハイライト。
- **設定同期**: `.zshrc` や `opencode.json` をホスト側で直接編集可能。

## ビルドと起動

```shell
docker compose up -d --build
```

## コンテナに入る

```shell
docker compose exec opencode zsh
```