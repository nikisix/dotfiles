#!/bin/bash

# Install script for gcalcli, himalaya, and himalaya-vim
# This script sets up a complete email and calendar CLI setup

set -e

echo "📧 Starting installation of gcalcli, himalaya, and himalaya-vim..."

# Detect OS
OS=$(uname -s)
if [[ "$OS" == "Darwin" ]]; then
    PACKAGE_MANAGER="brew"
    echo "🍎 Detected macOS"
elif [[ "$OS" == "Linux" ]]; then
    if command -v apt &> /dev/null; then
        PACKAGE_MANAGER="apt"
        echo "🐧 Detected Linux (apt)"
    elif command -v pacman &> /dev/null; then
        PACKAGE_MANAGER="pacman"
        echo "🐧 Detected Linux (pacman)"
    elif command -v yum &> /dev/null; then
        PACKAGE_MANAGER="yum"
        echo "🐧 Detected Linux (yum)"
    else
        echo "❌ Unsupported Linux distribution"
        exit 1
    fi
else
    echo "❌ Unsupported OS: $OS"
    exit 1
fi

# Install Python if not available (needed for gcalcli)
if ! command -v python3 &> /dev/null; then
    echo "📦 Installing Python 3..."
    if [[ "$PACKAGE_MANAGER" == "brew" ]]; then
        brew install python3
    elif [[ "$PACKAGE_MANAGER" == "apt" ]]; then
        sudo apt update && sudo apt install -y python3 python3-pip
    elif [[ "$PACKAGE_MANAGER" == "pacman" ]]; then
        sudo pacman -S python python-pip
    elif [[ "$PACKAGE_MANAGER" == "yum" ]]; then
        sudo yum install -y python3 python3-pip
    fi
fi

# Install gcalcli
echo ""
echo "📅 Installing gcalcli..."
pip3 install --user --upgrade gcalcli

# Install himalaya
echo ""
echo "📨 Installing himalaya..."
if [[ "$PACKAGE_MANAGER" == "brew" ]]; then
    brew install himalaya
elif [[ "$PACKAGE_MANAGER" == "apt" ]]; then
    # Build from source for latest version on Ubuntu/Debian
    if ! command -v cargo &> /dev/null; then
        echo "🦀 Installing Rust (required for himalaya)..."
        curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
        source "$HOME/.cargo/env"
    fi
    cargo install himalaya
elif [[ "$PACKAGE_MANAGER" == "pacman" ]]; then
    sudo pacman -S himalaya
elif [[ "$PACKAGE_MANAGER" == "yum" ]]; then
    # Build from source for CentOS/RHEL
    if ! command -v cargo &> /dev/null; then
        echo "🦀 Installing Rust (required for himalaya)..."
        curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
        source "$HOME/.cargo/env"
    fi
    cargo install himalaya
fi

# Install himalaya-vim
echo ""
echo "🎨 Installing himalaya-vim plugin..."

# Detect vim/neovim config directory
if [[ -d "$HOME/.config/nvim" ]]; then
    NVIM_CONFIG="$HOME/.config/nvim"
    echo "   Found Neovim config at $NVIM_CONFIG"
elif [[ -d "$HOME/.vim" ]]; then
    NVIM_CONFIG="$HOME/.vim"
    echo "   Found Vim config at $NVIM_CONFIG"
else
    NVIM_CONFIG="$HOME/.vim"
    mkdir -p "$NVIM_CONFIG"
    echo "   Created Vim config directory at $NVIM_CONFIG"
fi

# Check for plugin manager (vim-plug, packer, lazy, etc.)
PLUGIN_DIR=""
if [[ -f "$NVIM_CONFIG/autoload/plug.vim" ]]; then
    PLUGIN_DIR="$NVIM_CONFIG/plugged"
    echo "   Detected vim-plug"
    PLUGIN_MANAGER="vim-plug"
elif [[ -d "$NVIM_CONFIG/pack" ]]; then
    PLUGIN_DIR="$NVIM_CONFIG/pack/plugins/start"
    mkdir -p "$PLUGIN_DIR"
    echo "   Detected native pack system"
    PLUGIN_MANAGER="native"
elif [[ -d "$HOME/.local/share/nvim/site/pack" ]]; then
    PLUGIN_DIR="$HOME/.local/share/nvim/site/pack/plugins/start"
    mkdir -p "$PLUGIN_DIR"
    echo "   Detected Neovim native pack"
    PLUGIN_MANAGER="native"
else
    echo "⚠️  No plugin manager detected. Installing for vim-plug..."
    PLUGIN_DIR="$NVIM_CONFIG/plugged"
    PLUGIN_MANAGER="vim-plug"
fi

# Clone himalaya-vim
if [[ ! -d "$PLUGIN_DIR/himalaya-vim" ]]; then
    echo "   Cloning himalaya-vim to $PLUGIN_DIR/himalaya-vim..."
    git clone https://github.com/pimalaya/himalaya-vim.git "$PLUGIN_DIR/himalaya-vim"
else
    echo "   himalaya-vim already installed at $PLUGIN_DIR/himalaya-vim"
fi

# Print configuration instructions
echo ""
echo "✅ Installation complete!"
echo ""
echo "📝 Next steps:"
echo ""
echo "1️⃣  Configure gcalcli:"
echo "   - Run: gcalcli init"
echo "   - This will open a browser to authenticate with Google"
echo "   - Calendar data will be cached in ~/.gcalcli/"
echo ""
echo "2️⃣  Configure himalaya:"
echo "   - Create ~/.config/himalaya/config.toml"
echo "   - Add your email account(s) - see: https://himalaya.readthedocs.io/"
echo "   - Example:"
echo "     [[accounts]]"
echo "     name = \"My Email\""
echo "     email = \"your.email@gmail.com\""
echo "     backend = \"imap\""
echo "     imap-host = \"imap.gmail.com\""
echo "     imap-port = 993"
echo "     imap-encryption = \"tls\""
echo "     imap-login = \"your.email@gmail.com\""
echo "     smtp-host = \"smtp.gmail.com\""
echo "     smtp-port = 465"
echo "     smtp-encryption = \"tls\""
echo "     smtp-login = \"your.email@gmail.com\""
echo ""
echo "3️⃣  Add himalaya-vim to your editor config:"
if [[ "$PLUGIN_MANAGER" == "vim-plug" ]]; then
    echo "   Add to your init.vim or .vimrc:"
    echo "   Plug 'pimalaya/himalaya-vim'"
    echo "   Then run :PlugInstall"
fi
echo ""
echo "4️⃣  Use the tools:"
echo "   - Terminal email: himalaya"
echo "   - Terminal calendar: gcalcli"
echo "   - Vim/Neovim email: :Himalaya (if installed)"
echo ""
echo "5️⃣  Recommended tmux layout:"
echo "   Create a ~/.tmux/mail-calendar.sh or similar to run:"
echo "   tmux new-session -d -s mail"
echo "   tmux send-keys -t mail 'himalaya' Enter"
echo "   tmux split-window -h -t mail"
echo "   tmux send-keys -t mail 'gcalcli agenda' Enter"
echo ""
