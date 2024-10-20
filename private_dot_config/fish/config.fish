set fish_greeting # Disable greeting
eval (/opt/homebrew/bin/brew shellenv)

starship init fish | source

export ASDF_DIR="$(brew --prefix asdf)/libexec/"
source "$(brew --prefix asdf)/libexec/asdf.fish"

alias nnvim="nix run --extra-experimental-features nix-command --extra-experimental-features flakes github:forazens/neovim-flake"
alias cat="bat"
alias ls="lsd"
alias lg="lazygit"

# Catppuccin theme for FZF
set -Ux FZF_DEFAULT_OPTS "\
--color=bg+:#363a4f,bg:#24273a,spinner:#f4dbd6,hl:#ed8796 \
--color=fg:#cad3f5,header:#ed8796,info:#c6a0f6,pointer:#f4dbd6 \
--color=marker:#f4dbd6,fg+:#cad3f5,prompt:#c6a0f6,hl+:#ed8796"

zoxide init fish | source
atuin init fish | source
source "$HOME/.cargo/env.fish"

# The next line updates PATH for the Google Cloud SDK.
# if [ -f '/Users/daniel/Downloads/google-cloud-sdk/path.fish.inc' ]; . '/Users/daniel/Downloads/google-cloud-sdk/path.fish.inc'; end
