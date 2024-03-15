starship init fish | source


# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH

set --export PATH $PATH "$HOME/.pub-cache/bin"
set --export PATH $PATH "$HOME/.cargo/bin"
set --export PATH $PATH "$HOME/.local/share/bob/nvim-bin"
set --export PATH $PATH "$HOME/.nvm/versions/node/v20.10.0/bin/node"

set --export EDITOR "nvim"
