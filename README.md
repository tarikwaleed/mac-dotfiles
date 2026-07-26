# mac-dotfiles

My macOS dotfiles, managed with [GNU Stow](https://www.gnu.org/software/stow/).
Sibling to my Ubuntu setup in [dotfiles](https://github.com/tarikwaleed/dotfiles) — same
one-folder-per-app convention, trimmed to what's relevant on macOS.

## Layout

Each top-level folder is a Stow "package" whose contents mirror `$HOME`:

```
mac-dotfiles/
├── ideavim/.ideavimrc   # IdeaVim config for PyCharm
├── zsh/.zshrc
├── git/.gitconfig
└── tmux/.tmux.conf
```

## Usage

```bash
brew install stow
git clone https://github.com/tarikwaleed/mac-dotfiles.git ~/mac-dotfiles
cd ~/mac-dotfiles
stow ideavim zsh git tmux
```

This symlinks each file into `$HOME` (e.g. `~/.zshrc -> mac-dotfiles/zsh/.zshrc`).

To add a new package, create `<name>/<path-relative-to-home>` and run `stow <name>`.
To remove one, run `stow -D <name>`.
