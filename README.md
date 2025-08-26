# My Development Environment Setup

This repository contains the configuration files (`dotfiles`) for my personal development setup on both macOS and Ubuntu Linux

# New Machine Setup

### 1. Pre-requisites

#### macOS
Install Homebrew and Git:
```bash
/bin/bash -c "$(curl -fsSL [https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh](https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh))"
brew install git
```

#### Ubuntu
Install essential build tools, curl, and Git:
```bash
sudo apt update
sudo apt install build-essential curl file git -y
```

### 2. Clone the Repository
```bash
git clone [https://github.com/papa-Rose/dotfiles.git](https://github.com/papa-Rose/dotfiles.git) ~/dotfiles
```

### 3. Create Symbolic Links
```bash
ln -s ~/dotfiles/.vimrc ~/.vimrc
ln -s ~/dotfiles/.zshrc ~/.zshrc
ln -s ~/dotfiles/.zsh_aliases ~/.zsh_aliases
```

### 4. Install Tools & Plugins

#### Install nvm & Node.js
```bash
curl -o- [https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh](https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh) | bash
source ~/.zshrc
nvm install --lts
```

#### Install vim-plug
```bash
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    [https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim](https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim)
```

#### Final Steps
1. Open Vim: `vim`
2. Install Vim plugins: `:PlugInstall`
3. Install CoC Language Servers: `:CocInstall coc-solargraph coc-tsserver coc-html coc-css coc-json`
4. Restart shell
