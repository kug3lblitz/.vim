#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Detect OS
if [[ "$OSTYPE" == "darwin"* ]]; then
    # macOS
    IS_MAC=true
    # Enable color support for ls and grep
    alias ls='ls -G'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
else
    # Linux
    IS_MAC=false
    # Enable color support for ls and grep
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# Git branch parsing function
parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'
}

# Git status indicators
git_status() {
    local status=""
    local branch=$(parse_git_branch)

    if [ -n "$branch" ]; then
        # Check for uncommitted changes
        if ! git diff --quiet 2>/dev/null || ! git diff --cached --quiet 2>/dev/null; then
            status="${status}*"
        fi

        # Check for untracked files
        if [ -n "$(git ls-files --others --exclude-standard 2>/dev/null)" ]; then
            status="${status}?"
        fi

        # Check if ahead/behind upstream
        local upstream=$(git rev-parse --abbrev-ref --symbolic-full-name @{u} 2>/dev/null)
        if [ -n "$upstream" ]; then
            local ahead=$(git rev-list @{u}..HEAD --count 2>/dev/null)
            local behind=$(git rev-list HEAD..@{u} --count 2>/dev/null)

            ahead=${ahead:-0}
            behind=${behind:-0}

            if [ "$ahead" -gt 0 ]; then
                status="${status}↑${ahead}"
            fi
            if [ "$behind" -gt 0 ]; then
                status="${status}↓${behind}"
            fi
        fi

        echo -n " ${status}"
    fi
}

# Custom prompt similar to bureau theme
# Colors
RESET='\[\033[0m\]'
BOLD='\[\033[1m\]'
RED='\[\033[0;31m\]'
GREEN='\[\033[0;32m\]'
YELLOW='\[\033[0;33m\]'
BLUE='\[\033[0;34m\]'
PURPLE='\[\033[0;35m\]'
CYAN='\[\033[0;36m\]'
WHITE='\[\033[0;37m\]'

# Build the prompt
set_prompt() {
    local git_branch=$(parse_git_branch)
    local git_info=""

    if [ -n "$git_branch" ]; then
        local git_stat=$(git_status)
        git_info="${CYAN}‹${YELLOW}${git_branch}${RED}${git_stat}${CYAN}›${RESET} "
    fi

    # Main prompt: time user@host directory git_info
    # PS1="${GREEN}┌─[${RESET}${CYAN}\u${RESET}${GREEN}@${RESET}${CYAN}\h${RESET}${GREEN}]─[${RESET}${BLUE}\w${RESET}${GREEN}]${RESET} ${git_info}\n${GREEN}└─▶${RESET} "
    PS1="${GREEN}┌─[${RESET}${YELLOW}\t${RESET}${GREEN}]─[${RESET}${RED}\w${RESET}${GREEN}]${RESET} ${git_info}\n${GREEN}└─▶${RESET} "
}

# Update prompt before each command
PROMPT_COMMAND='set_prompt'

# Git aliases similar to oh-my-zsh git plugin
alias g='git'
alias ga='git add'
alias gaa='git add --all'
alias gap='git apply'
alias gapa='git add --patch'
alias gau='git add --update'
alias gb='git branch'
alias gba='git branch -a'
alias gbd='git branch -d'
alias gbD='git branch -D'
alias gbl='git blame -b -w'
alias gbnm='git branch --no-merged'
alias gbr='git branch --remote'
alias gbs='git bisect'
alias gbsb='git bisect bad'
alias gbsg='git bisect good'
alias gbsr='git bisect reset'
alias gbss='git bisect start'
alias gc='git commit -v'
alias gc!='git commit -v --amend'
alias gca='git commit -v -a'
alias gca!='git commit -v -a --amend'
alias gcam='git commit -a -m'
alias gcan!='git commit -v -a --no-edit --amend'
alias gcb='git checkout -b'
alias gcd='git checkout develop'
alias gcf='git config --list'
alias gcl='git clone --recursive'
alias gclean='git clean -fd'
alias gcm='git checkout master'
alias gcmsg='git commit -m'
alias gco='git checkout'
alias gcount='git shortlog -sn'
alias gcp='git cherry-pick'
alias gcpa='git cherry-pick --abort'
alias gcpc='git cherry-pick --continue'
alias gcs='git commit -S'
alias gd='git diff'
alias gdca='git diff --cached'
alias gds='git diff --staged'
alias gdt='git diff-tree --no-commit-id --name-only -r'
alias gdw='git diff --word-diff'
alias gf='git fetch'
alias gfa='git fetch --all --prune'
alias gfo='git fetch origin'
alias gg='git gui citool'
alias gga='git gui citool --amend'
alias ggpull='git pull origin $(git symbolic-ref --short HEAD)'
alias ggpush='git push origin $(git symbolic-ref --short HEAD)'
alias ggsup='git branch --set-upstream-to=origin/$(git symbolic-ref --short HEAD)'
alias ghh='git help'
alias gignore='git update-index --assume-unchanged'
alias gignored='git ls-files -v | grep "^[[:lower:]]"'
alias gl='git pull'
alias glg='git log --stat'
alias glgg='git log --graph'
alias glgga='git log --graph --decorate --all'
alias glgm='git log --graph --max-count=10'
alias glgp='git log --stat -p'
alias glo='git log --oneline --decorate'
alias glog='git log --oneline --decorate --graph'
alias gloga='git log --oneline --decorate --graph --all'
alias glol='git log --graph --pretty=format:"%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset" --abbrev-commit'
alias glola='git log --graph --pretty=format:"%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset" --abbrev-commit --all'
alias glp='_git_log_prettily'
alias gm='git merge'
alias gma='git merge --abort'
alias gmom='git merge origin/master'
alias gmt='git mergetool --no-prompt'
alias gmtvim='git mergetool --no-prompt --tool=vimdiff'
alias gmum='git merge upstream/master'
alias gp='git push'
alias gpd='git push --dry-run'
alias gpf='git push --force-with-lease'
alias gpf!='git push --force'
alias gpoat='git push origin --all && git push origin --tags'
alias gpu='git push upstream'
alias gpv='git push -v'
alias gr='git remote'
alias gra='git remote add'
alias grb='git rebase'
alias grba='git rebase --abort'
alias grbc='git rebase --continue'
alias grbi='git rebase -i'
alias grbm='git rebase master'
alias grbs='git rebase --skip'
alias grep='grep --color=auto --exclude-dir={.bzr,CVS,.git,.hg,.svn}'
alias grh='git reset'
alias grhh='git reset --hard'
alias grmv='git remote rename'
alias grrm='git remote remove'
alias grset='git remote set-url'
alias grt='cd $(git rev-parse --show-toplevel || echo ".")'
alias gru='git reset --'
alias grup='git remote update'
alias grv='git remote -v'
alias gsd='git svn dcommit'
alias gsh='git show'
alias gsi='git submodule init'
alias gsps='git show --pretty=short --show-signature'
alias gsr='git svn rebase'
alias gss='git status -s'
alias gst='git status'
alias gsta='git stash save'
alias gstaa='git stash apply'
alias gstc='git stash clear'
alias gstd='git stash drop'
alias gstl='git stash list'
alias gstp='git stash pop'
alias gsts='git stash show --text'
alias gsu='git submodule update'
alias gts='git tag -s'
alias gtv='git tag | sort -V'
alias gunignore='git update-index --no-assume-unchanged'
alias gunwip='git log -n 1 | grep -q -c "\-\-wip\-\-" && git reset HEAD~1'
alias gup='git pull --rebase'
alias gupv='git pull --rebase -v'
alias gwch='git whatchanged -p --abbrev-commit --pretty=medium'
alias gwip='git add -A; git rm $(git ls-files --deleted) 2> /dev/null; git commit --no-verify -m "--wip-- [skip ci]"'

# Custom aliases from .zshrc
alias vi="nvim"
alias tmux="tmux -2 -u"
# Only add tendies alias on Arch Linux
if [ -f /etc/arch-release ]; then
    alias tendies="sudo reflector --country 'United States' --age 12 --protocol https --sort rate --save /etc/pacman.d/mirrorlist"
fi

# thefuck integration
if command -v thefuck &> /dev/null; then
    eval $(thefuck --alias fuck 2>/dev/null) || true
fi

# Enable vim mode
set -o vi

# Bind keys for better vi mode experience
bind '"\C-p": previous-history'
bind '"\C-n": next-history'
bind '"\C-r": reverse-search-history'

# History settings
HISTCONTROL=ignoreboth
HISTSIZE=10000
HISTFILESIZE=20000
shopt -s histappend

# Check window size after each command
shopt -s checkwinsize

# Enable programmable completion features
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  elif [ -f /usr/local/etc/profile.d/bash_completion.sh ]; then
    # macOS with Homebrew
    . /usr/local/etc/profile.d/bash_completion.sh
  elif [ -f /opt/homebrew/etc/profile.d/bash_completion.sh ]; then
    # macOS with Homebrew on Apple Silicon
    . /opt/homebrew/etc/profile.d/bash_completion.sh
  fi
fi

# Colored man pages
export LESS_TERMCAP_mb=$'\e[1;32m'
export LESS_TERMCAP_md=$'\e[1;32m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_so=$'\e[01;33m'
export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_us=$'\e[1;4;31m'

# Set default editor
if command -v nvim &> /dev/null; then
    export EDITOR='nvim'
    export VISUAL='nvim'
elif command -v vim &> /dev/null; then
    export EDITOR='vim'
    export VISUAL='vim'
else
    export EDITOR='vi'
    export VISUAL='vi'
fi

# Add color to GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'
