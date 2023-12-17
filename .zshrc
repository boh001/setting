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
eval "$(rbenv init - zsh)"

# anroid studio
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/platform-tools

# openjdk
export PATH="/opt/homebrew/opt/openjdk@11/bin:$PATH"
export CPPFLAGS="-I/opt/homebrew/opt/openjdk@11/include"
