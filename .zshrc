# homebrew
eval "$(/opt/homebrew/bin/brew shellenv)"

# oh my zsh
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="af-magic"
source $ZSH/oh-my-zsh.sh
plugins=(git)

# zsh-syntax-highlighing
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# zsh-autosuggestions
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# git
export GIT_EDITOR=nvim

# fnm
eval "$(fnm env --use-on-cd)"

# ruby
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init - zsh)"

# anroid studio
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/platform-tools

# postgresql
PATH="/opt/homebrew/opt/postgresql@16/bin:$PATH"

# openjdk
PATH="/opt/homebrew/opt/openjdk@17/bin:$PATH"

# Created by `pipx` on 2024-07-15 04:29:50
export PATH="$PATH:~/.local/bin"

# solana
export PATH="/Users/sanghyeon/.local/share/solana/install/active_release/bin:$PATH"

#nvim
export PATH="$HOME/.local/share/bob/v0.10.1/nvim-macos-arm64/bin:$PATH"

export PATH="/opt/homebrew/opt/gnu-tar/libexec/gnubin:$PATH"
