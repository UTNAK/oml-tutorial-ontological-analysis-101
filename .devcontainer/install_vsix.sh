#!/bin/bash

# 実行済みフラグのパス
FLAG_FILE="/tmp/vsix_installed_flag"

# フラグファイルが存在しなければ実行
if [ ! -f "$FLAG_FILE" ]; then
    echo "Installing custom VSIX extensions for the first time..."
    code --install-extension .devcontainer/oml-luxor-2.13.0.vsix
    code --install-extension .devcontainer/oml-vision-0.3.0.vsix
    
    # 実行後にフラグファイルを作成する
    touch "$FLAG_FILE"
    echo "Installation complete."
else
    echo "VSIX extensions already installed (flag file exists). Skipping."
fi
