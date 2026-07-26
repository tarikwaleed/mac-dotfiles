# ~/.config/fish/config.fish - adapted from tarikwaleed/dotfiles (Ubuntu),
# trimmed to what applies on macOS (no apt/dconf/systemctl/gnome-terminal).

# --- environment ---
set -gx EDITOR vim
set -gx DOCKER_BUILDKIT 1
set -gx COMPOSE_DOCKER_CLI_BUILD 1
# Related to Google Ads API
set -gx OAUTHLIB_RELAX_TOKEN_SCOPE 1

# --- path ---
fish_add_path ~/.local/bin
fish_add_path ~/.cargo/bin
fish_add_path ~/.config/composer/vendor/bin
fish_add_path ~/.pub-cache/bin

fish_vi_key_bindings

if command -q pyenv
    pyenv init - | source
end
if command -q rbenv
    rbenv init - | source
end

# --- exa/eza (falls back to plain ls if not installed) ---
if command -q eza
    alias la 'eza --long --icons --git --all'
else
    alias la 'ls -lAh'
end

# --- git ---
alias gcln 'git clone'
alias gst 'git status'
alias ga 'git add'
alias gaa 'git add --all'
alias gp 'git push -u'
alias gcm 'git commit -m'
alias glg 'git log --oneline'
alias glga 'git log --oneline --all'
alias gdf 'git diff'
alias gco 'git checkout'
alias gnb 'git checkout -b'
alias gbls 'git branch'
alias gbla 'git branch -a'
alias gblr 'git branch -r'
alias gsb 'git switch'
alias gra 'git remote add'
alias grla 'git remote -v'
alias gf 'git fetch'
alias gpull 'git pull'
alias gbrm 'git branch -d'
alias gsl 'git stash list'
alias gsu 'git stash -u'
alias gsd 'git stash drop'
alias gsa 'git stash apply'
alias gm 'git merge'
alias gu 'git fetch origin'
alias gda 'git checkout -- .'
alias gr 'git rebase'
alias gri 'git rebase -i'
alias gt 'git branch --track'

# --- general ---
alias o 'open .'
alias cpwd 'pwd | pbcopy'
alias cpsshkey 'cat ~/.ssh/id_ed25519.pub | pbcopy'
alias copy 'pbcopy'
alias charm 'open -a "PyCharm" .'
alias fishconfig '$EDITOR ~/.config/fish/config.fish'
alias tmuxconfig '$EDITOR ~/.tmux.conf'
alias ideavimrc '$EDITOR ~/.ideavimrc'
alias sf 'source ~/.config/fish/config.fish'
alias update 'brew update && brew upgrade'
alias b 'cd ..'
alias bb 'cd ../..'
alias bbb 'cd ../../..'
alias bbbb 'cd ../../../..'

# --- tmux / tmuxinator ---
alias tkl 'tmux kill-session -t'
alias tls 'tmux list-sessions'
alias start 'tmuxinator start'
alias new 'tmuxinator new'
alias stop 'tmuxinator stop'
alias edit 'tmuxinator edit'
alias list 'tmuxinator list'

# --- node ---
alias nr 'npm run'
alias nrd 'npm run dev'
alias nrb 'npm run build'
alias nrs 'npm run start'
alias ni 'npm install'
alias nig 'npm install -g'

# --- docker (no sudo needed on macOS/Docker Desktop) ---
alias dils 'docker image ls'
alias dcls 'docker container ls'
alias dila 'docker image ls -a'
alias dcla 'docker container ls -a'
alias dpl 'docker pull'
alias dpsh 'docker push'
alias dc 'docker container'
alias di 'docker inspect'
alias dvla 'docker volume ls'
alias dvi 'docker volume inspect'
alias dci 'docker container inspect'
alias dvc 'docker volume create'
alias db 'docker build'
alias dv 'docker volume'
alias drn 'docker run -it --rm'
alias dcb 'docker compose build'
alias dcup 'docker compose up'
alias dcd 'docker compose down'

# --- python / django ---
alias djurls 'python manage.py show_urls'
alias py 'python3'
alias ipy 'ipython3'
alias jn 'jupyter notebook'
alias wo 'workon'
alias pf 'pip freeze | sort'
alias pfr 'pip freeze > requirements.txt'
alias pi 'pip install'
alias pir 'pip install -r requirements.txt'
alias pui 'pip uninstall'
alias dj 'python -Wa manage.py'
alias drs 'python -Wa manage.py runserver'
alias dsh 'python -Wa manage.py shell'
alias dm 'python -Wa manage.py migrate'
alias dmm 'python -Wa manage.py makemigrations'
alias dt 'python -Wa manage.py test'

# --- machine-local secrets/overrides - not tracked in git, kept outside the stow repo ---
if test -f ~/.fish_local.fish
    source ~/.fish_local.fish
end
