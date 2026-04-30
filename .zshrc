# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Update automatically without asking
 zstyle ':omz:update' mode auto

# -- THEME SELECTION  --
# Turn of theme to build own custom one
ZSH_THEME="" # Previous: agnoster

# Disable username and hostname from terminal title bar
DISABLE_AUTO_TITLE="true"

# -- PLUGINS --
# Collection of aliases and tab completions
plugins=(git brew common-aliases)

source $ZSH/oh-my-zsh.sh


# -- USER CONFIGURATION --
# Set Vim as default editor
export EDITOR='vim'

# Hides the "user@hostname" info to keep prompt short
prompt_context() {}
export DEFAULT_USER="$USER"

# Prioritize Homebrew executables
if [[ $(uname -m) == "arm64" ]]; then
  export PATH="/opt/homebrew/bin:$PATH"
else
  export PATH="/usr/local/bin:$PATH"
fi

# NVM Configuration
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


# --- PERSONAL CUSTOMIZATIONS ---
# Store aliases in zsh_aliases
[ -f ~/.zsh_aliases ] && source ~/.zsh_aliases

# Load my custom prompt configuration
[ -f ~/.zsh_prompt ] && source ~/.zsh_prompt

# Source local, machine-specific configurations if file exists
if [[ -f ~/.zshrc.local ]]; then
  source ~/.zshrc.local
fi
