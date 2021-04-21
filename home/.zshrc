if [[ -d "$HOME/.homesick/repos/homeshick/completions" ]]; then
	fpath=("$HOME/.homesick/repos/homeshick/completions" $fpath)
	"$HOME/.homesick/repos/homeshick/bin/homeshick" --quiet refresh 7
fi

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

#!/usr/bin/zsh

bindkey '^q' push-line-or-edit

setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_FIND_NO_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_NO_FUNCTIONS
setopt HIST_SAVE_NO_DUPS
setopt PUSHD_TO_HOME

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
HIST_STAMPS="yyyy-mm-dd"

# These needs to come before `compinit` which happens in $ZSH/oh-my-zsh.sh
if command -v brew &>/dev/null; then
	fpath=("$(brew --prefix)/share/zsh/site-functions" $fpath)
fi

if [[ -r "$HOME/.pam_environment" ]] && [[ -z $PAM_ENVIRONMENT_WAS_READ ]]; then
	export $(<"$HOME/.pam_environment")
fi

if [[ -r "$HOME/.profile" ]]; then
	source "$HOME/.profile"
fi

if [[ -r "$HOME/.z.bash" ]]; then
	source "$HOME/.z.bash"
fi

# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh

if [[ -d "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k" ]]; then
	ZSH_THEME="powerlevel10k/powerlevel10k"
	# run: p10k configure
elif command -v starship &>/dev/null; then
	ZSH_THEME=""
	eval $(starship init zsh)
else
	echo Found neither powerlevel10k nor starship
	echo git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
	echo https://starship.rs/
	ZSH_THEME="bureau"
fi

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
	docker
	git
	poetry
	ripgrep
	sudo
	tmux
)

if [[ -r "$ZSH/oh-my-zsh.sh" ]]; then
	source "$ZSH/oh-my-zsh.sh"
else
	echo You might want to install https://github.com/robbyrussell/oh-my-zsh like
	echo '    sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"'
fi

if command -v pyenv &>/dev/null; then
	eval "$(pyenv init -)"
fi

if [[ -r "$HOME/src/github/enhancd/init.sh" ]]; then
	source "$HOME/src/github/enhancd/init.sh"
fi

if command -v bat &>/dev/null; then
	export MANPAGER="sh -c 'col -bx | bat -l man -p'"
fi

source "$HOME/.bash_aliases"

alias -g NUL="/dev/null"
alias -g DN=">/dev/null"
alias -g EN="2>/dev/null"
alias -g AN="&>/dev/null"
alias -g G="|rg"
alias -g IG="G -i"
alias -g L="|less"
alias -g GG="2>&1 |rg"
alias -g IGG="2>&1 -i"
alias -g LL="2>&1 |less"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
