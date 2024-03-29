export ZSH="/home/pedro/.oh-my-zsh"

#ZSH_THEME="robbyrussell"

plugins=(
   git
   colored-man-pages
   fzf
#   vi-mode
   sudo
   docker
   docker-compose
   fd
   gh
   #zsh-autosuggestions
   npm
   yarn
)

source $ZSH/oh-my-zsh.sh

ex ()
{
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       unrar x $1   ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1   ;;
      *.tgz)       tar xzf $1   ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1      ;;
      *.deb)       ar x $1      ;;
      *.tar.xz)    tar xf $1    ;;
      *.tar.zst)   unzstd $1    ;;
      *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

export EDITOR='nvim'

# Aliases
alias zshconfig="$EDITOR ~/.zshrc"
alias ohmyzsh="$EDITOR ~/.oh-my-zsh"

export CHROME_EXECUTABLE=/usr/bin/chromium
#export CHROME_EXECUTABLE=/usr/bin/brave-browser

alias live-dl='/home/pedro/programacao/live-dl/live-dl'
export CLASSPATH=".:/usr/local/lib/antlr-4.9.1-complete.jar:$CLASSPATH"
eval "$(zoxide init zsh)"
alias mat='cd /home/pedro/programacao/faculdade/ && cd $(ls -d */ | fzf)'
alias config='cd /home/pedro/.dotfiles/ && $EDITOR $(fd -H -E .git -E .gitignore -t f -t l | fzf)'
alias open='xdg-open'
alias v='nvim'

function cheat() {
  curl -m 7 "http://cheat.sh/$1";
}

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:$HOME/
export PATH=$PATH:$HOME/.local/bin
export PATH=$PATH:$HOME/go/bin
export PATH=$PATH:/root/.cargo/bin
export PATH=$PATH:$HOME/.cargo/bin
export PATH=$PATH:$HOME/fvm/default/bin
export ANDROID_SDK_ROOT=$HOME/Android/Sdk
export ANDROID_HOME=$HOME/Android/Sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools
#export PATH="$(yarn global bin):$PATH"
export PATH="/home/pedro/dotfiles/scripts:$PATH"
export PATH=$PATH:$HOME/.local/share/bob/nvim-bin

export FZF_DEFAULT_COMMAND="fd --hidden --follow --exclude '.git' --exclude 'node_modules'"

# CTRL-T's command
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
# ALT-C's command
export FZF_ALT_C_COMMAND="$FZF_DEFAULT_COMMAND --type d"

export FZF_DEFAULT_OPTS="
--layout=reverse
--info=inline
--height=80%
--multi
--preview-window=:hidden
--preview '([[ -f {} ]] && (bat --style=numbers --color=always {} || cat {})) || ([[ -d {} ]] && (tree -C {} | less)) || echo {} 2> /dev/null | head -200'
--color='hl:148,hl+:154,pointer:032,marker:010,bg+:237,gutter:008'
--bind '?:toggle-preview'
--bind 'ctrl-a:select-all'
--bind 'ctrl-y:execute-silent(echo {+} | pbcopy)'
--bind 'ctrl-e:execute(echo {+} | xargs -o nvim)'
--bind 'ctrl-v:execute(code {+})'
"

autoload -Uz compinit
compinit
fpath=(~/.zsh.d/ $fpath)

export PNPM_HOME="/home/pedro/.local/share/pnpm"
export PATH="$PNPM_HOME:$PATH"

export PATH="/home/pedro/.emacs.d/bin:$PATH"

export GOPATH="/home/pedro/go"

# Inverte as teclas Alt e Super/Windows. Possível solução para conseguir usar o teclado Keychron no
# ubuntu sem precisar mapear as outras teclas (fn + F1, F2...)
# Obs: atalhos comumente usados podem parar de funcionar, devido a necessídade de utilizar o teclado no modo MacOs (Alt + q para inserir a /)
#setxkbmap -option altwin:swap_alt_win # setxkbmap -option para reverter

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

alias wip="git add .;git commit -m 'wip' > /dev/null"
alias wips="git add .;git commit -m 'wip' > /dev/null;git push"
alias gll="git log --oneline"

# Add JBang to environment
alias j!=jbang
export PATH="$HOME/.jbang/bin:$PATH"

source "$HOME/.cargo/env"
export PATH=$PATH:$HOME/.cargo/bin

alias luamake=/home/pedro/.config/sumneko/3rd/luamake/luamake

export PATH="~/.composer/vendor/bin:$PATH"

export PATH="$PATH":"$HOME/.pub-cache/bin"

export PATH=$PATH:~/Android/Sdk/cmdline-tools/latest/bin

if hash exa 2>/dev/null; then
    alias ls='exa'
    alias l='exa -l --all --group-directories-first --git'
    alias ll='exa -l --all --all --group-directories-first --git'
    alias lt='exa -T --git-ignore --level=2 --group-directories-first'
    alias llt='exa -lT --git-ignore --level=2 --group-directories-first'
    alias lT='exa -T --git-ignore --level=4 --group-directories-first'
else
    alias l='ls -lah'
    alias ll='ls -alF'
    alias la='ls -A'
fi

alias dep='vendor/bin/dep'
alias a='php artisan'

eval "$(starship init zsh)"

alias nvim-lazy="NVIM_APPNAME=LazyVim nvim"
#alias nvim-kick="NVIM_APPNAME=kickstart nvim"
alias nvim-chad="NVIM_APPNAME=NvChad nvim"
alias nvim-astro="NVIM_APPNAME=AstroNvim nvim"

function nvims() {
  items=("default" "kickstart" "LazyVim" "NvChad" "AstroNvim")
  config=$(printf "%s\n" "${items[@]}" | fzf --prompt=" Neovim Config  " --height=~50% --layout=reverse --border --exit-0)
  if [[ -z $config ]]; then
    echo "Nothing selected"
    return 0
  elif [[ $config == "default" ]]; then
    config=""
  fi
  NVIM_APPNAME=$config nvim $@
}

#bindkey -s ^a "nvims\n"

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
export GOPATH=$HOME/go


fzf-git-branch() {
    git rev-parse HEAD > /dev/null 2>&1 || return

    git branch --color=always --all --sort=-committerdate |
        grep -v HEAD |
        fzf --height 50% --ansi --no-multi --preview-window right:65% \
            --preview 'git log -n 50 --color=always --date=short --pretty="format:%C(auto)%cd %h%d %s" $(sed "s/.* //" <<< {})' |
        sed "s/.* //"
}

fzf-git-checkout() {
    git rev-parse HEAD > /dev/null 2>&1 || return

    local branch

    branch=$(fzf-git-branch)
    if [[ "$branch" = "" ]]; then
        echo "No branch selected."
        return
    fi

    # If branch name starts with 'remotes/' then it is a remote branch. By
    # using --track and a remote branch name, it is the same as:
    # git checkout -b branchName --track origin/branchName
    if [[ "$branch" = 'remotes/'* ]]; then
        git checkout --track $branch
    else
        git checkout $branch;
    fi
}

alias gb='fzf-git-branch'
alias gco='fzf-git-checkout'

# Better way to manage dotfiles
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
