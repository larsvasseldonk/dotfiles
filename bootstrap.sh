#!/usr/bin/env bash

# 1. Get the directory of this script
export DOTFILES_DIR=$(pwd)

# 2. Update the repo
echo "📥 Pulling latest changes..."
git pull origin main;

# 3. Run the brew script
if [ -f "./brew.sh" ]; then
    echo "🍺 Running Homebrew setup..."
    source ./brew.sh
fi

# 4. The Sync Function
function doIt() {
    echo "⚙️  Syncing files to home directory..."

    mkdir -p ~/.config/ghostty

    # RSYNC for general files
    rsync --exclude ".git/" \
        --exclude ".DS_Store" \
        --exclude "bootstrap.sh" \
        --exclude "brew.sh" \
        --exclude "Brewfile" \
        --exclude "README.md" \
        -avh --no-perms . ~;

    # FORCE SYMLINKS for the important stuff
    # This ensures your  edits in the repo are instant
    ln -sf "$DOTFILES_DIR/zshrc" ~/.zshrc
    ln -sf "$DOTFILES_DIR/ghostty/config" ~/.config/ghostty/config

    echo "✅ Setup complete! Welcome back, Lars."
    source ~/.zshrc
}

# Confirmation
read -p "This will sync your config. Proceed? (y/n) " -n 1;
echo "";
if [[ $REPLY =~ ^[Yy]$ ]]; then
    doIt;
fi;
