typeset -U path cdpath fpath manpath

for profile in ${(z)NIX_PROFILES}; do
  fpath+=($profile/share/zsh/site-functions $profile/share/zsh/$ZSH_VERSION/functions $profile/share/zsh/vendor-completions)
done

HELPDIR="/nix/store/y6b258mhrmgn95cl2qzky2fblh9aswrj-zsh-5.9/share/zsh/$ZSH_VERSION/help"





# Oh-My-Zsh/Prezto calls compinit during initialization,
# calling it twice causes slight start up slowdown
# as all $fpath entries will be traversed again.
autoload -U compinit && compinit
source /nix/store/p4kk55fjxrfyah3r9c2l3aswagvqxpjg-zsh-autosuggestions-0.7.0/share/zsh-autosuggestions/zsh-autosuggestions.zsh
ZSH_AUTOSUGGEST_STRATEGY=(history)







# History options should be set in .zshrc and after oh-my-zsh sourcing.
# See https://github.com/nix-community/home-manager/issues/177.
HISTSIZE="1000"
SAVEHIST="1000"

HISTFILE="$HOME/.cache/zsh_history"
mkdir -p "$(dirname "$HISTFILE")"

setopt HIST_FCNTL_LOCK
unsetopt APPEND_HISTORY
setopt HIST_IGNORE_DUPS
unsetopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
unsetopt HIST_EXPIRE_DUPS_FIRST
setopt SHARE_HISTORY
unsetopt EXTENDED_HISTORY


eval "$(/nix/store/823qi3acdfxnvn0ylygjg6jabx7b4q31-direnv-2.34.0/bin/direnv hook zsh)"

PROMPT="%F{blue}%m %~%b "$'\n'"%(?.%F{green}%Bλ%b |.%F{red}?) %f"

#export PASSWORD_STORE_DIR="$XDG_DATA_HOME/password-store";
#export ZK_NOTEBOOK_DIR="~/stuff/notes";
export DIRENV_LOG_FORMAT="";
bindkey '^ ' autosuggest-accept


# Aliases
alias -- c=clear
alias -- cpa='cp -riv'
alias -- mkdira='mkdir -vp'
alias -- mva='mv -iv'
alias -- nd='nix develop -c $SHELL'
alias -- rma='rm -rifv'

# Named Directory Hashes
hash -d dots="$HOME/.dots"
hash -d notes="$HOME/notes"
hash -d prog="$HOME/prog"

source /nix/store/snk5f9agv9dwvda8k03pmsw9aqzfziff-zsh-syntax-highlighting-0.8.0/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
ZSH_HIGHLIGHT_HIGHLIGHTERS+=()



