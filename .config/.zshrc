

# Path to your oh-my-zsh installation
export ZSH="$HOME/.oh-my-zsh"

if [[ $(tty) =~ /dev/pts/[0-9]+ ]]; then
	# Enable Powerlevel10k instant prompt
	if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
	  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
	fi

	ZSH_THEME="powerlevel10k/powerlevel10k"
	[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
else
	ZSH_THEME="gentoo"
fi

HIST_STAMPS="dd.mm.yyyy"

plugins=(
	adb
	archlinux
	bun
	cp
	colorize
	common-aliases
	colored-man-pages
	docker
	dotenv
	emoji
	encode64
	git
	gitignore
	rsync
	npm
	nmap
	sudo
	vscode
	yarn
	web-search
	wd
	z
	zsh-navigation-tools
	zsh-interactive-cd
	zsh-autosuggestions
	zsh-syntax-highlighting
)

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=247"
ZSH_AUTOSUGGEST_STRATEGY=(completion history)
ZSH_COLORIZE_STYLE="colorful"

source $ZSH/oh-my-zsh.sh

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='code'
else
  export EDITOR='vim'
fi

alias pacman='sudo pacman'
alias cryptsetup='sudo cryptsetup'
alias mount='sudo mount'
alias umount='sudo umount'
alias xw='env -u WAYLAND_DISPLAY'

#function command_not_found_handler {
#    printf 'lmao skill issue, command not found: %s\n' "$1"
#    return 127
#}

[ "$TERM" = "xterm-kitty" ] && alias ssh="kitty +kitten ssh"

eval $(thefuck --alias)
source /usr/share/doc/find-the-command/ftc.zsh askfirst quiet
