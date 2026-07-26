export PATH="$HOME/.local/bin:$PATH"

# Machine-local secrets/overrides - not tracked in git, kept outside the stow repo.
[ -f "$HOME/.zshrc.local" ] && source "$HOME/.zshrc.local"
