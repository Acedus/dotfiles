# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]
then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
	for rc in ~/.bashrc.d/*; do
		if [ -f "$rc" ]; then
			. "$rc"
		fi
	done
fi

unset rc
# make ls better
alias ls="ls --color=auto"
alias ll="ls -lhF --color=auto"
alias l="ls -lhF --color=auto"

# make cat better
alias cat="bat"

# set nvim aliases
alias v="nvim"
alias vi="nvim"
alias vim="nvim"

# zathura find
alias zathura="zathura --fork \$(~/.config/zathura/scripts/fzf-menu.sh)"

# export editor
export EDITOR="nvim"

# xkb layout

export XKB_DEFAULT_LAYOUT=il,us
export XKB_DEFAULT_OPTIONS=grp:alt_shit_toggle

# fzf aliases for faster searches
alias nva="du -a ~/PhD_work/ ~/Documents/ ~/misc_code/ ~/.config/ ~/.bashrc | awk '{print \$2}' | fzf --preview 'cat {}' --border --reverse --color='fg+:#11111b,bg+:#f5c2e7,hl+:#8839ef,fg:#f5e0dc,bg:#1e1e2e,hl:#fe640b,query:#eebebe,gutter:#181825,prompt:#1e66f5,pointer:#8839ef,preview-fg:#1e1e2e,preview-bg:#f5c2e7' | xargs -r nvim"
alias nvh="du -a | awk '{print \$2}' | fzf --preview 'w3m {}' --border --reverse --color='fg+:#11111b,bg+:#f5c2e7,hl+:#8839ef,fg:#f5e0dc,bg:#1e1e2e,hl:#fe640b,query:#eebebe,gutter:#181825,prompt:#1e66f5,pointer:#8839ef,preview-fg:#1e1e2e,preview-bg:#f5c2e7' | xargs -r nvim"
# make ripgrep better
alias rg="rg -i -p -. -L"
eval "$(starship init bash)"

# pywal
(cat -pp ~/.cache/wal/sequences &)
#source ~/.cache/wal/colors-tty.sh

# fedora rice flex
fastfetch

# gopath

export GOPATH=~/go

export PATH=$PATH:$GOPATH/bin/

alias ocas="oc --as=system:admin"
alias k="kubectl"
alias kp="kubectl config set-context --current --namespace"

# udiskie

udiskie &

# direnv

eval "$(direnv hook bash)"

# temp gcc run

#alacritty hack for blur in ~/.zshrc
if [[ $(ps --no-header -p $PPID -o comm) =~ '^alacritty$' ]]; then
        for wid in $(xdotool search --pid $PPID); do
            xprop -f _KDE_NET_WM_BLUR_BEHIND_REGION 32c -set _KDE_NET_WM_BLUR_BEHIND_REGION 0 -id $wid; done
fi
