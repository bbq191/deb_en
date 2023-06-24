#!/bin/s
eval "$(/opt/homebrew/bin/brew shellenv)"

export HISTFILE="$ZDOTDIR/.zhistory"
HISTSIZE=1000000
SAVEHIST=1000000

export EDITOR="nvim"
export TERMINAL="kitty"
export BROWSER="safari"
export MANPAGER='nvim +Man!'
export MANWIDTH=999

export CARGO_HOME="$XDG_DATA_HOME/cargo"
export RUSTUP_HOME="$XDG_DATA_HOME/rustup"

export PATH="$CARGO_HOME/bin":$PATH
# export PATH="$HOME/.local/bin":$PATH
# eval "$(thefuck --alias)"
# eval "$(fnm env)"
eval "$(zoxide init zsh)"