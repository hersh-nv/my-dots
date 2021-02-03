# delta.zsh-theme

# settings
typeset +H return_code="%(?..%{$fg[red]%}%? ↵ %{$reset_color%})"
typeset +H my_gray="$FG[237]"
typeset +H my_orange="$FG[214]"

# newline before every prompt but the first
precmd() {
	precmd() {
		echo
	}
}

# timestamp
now() {
	DATE=`date +"%H%M%S"`
	echo -e '$FG[008]%${DATE}'
}
old_time() {
	echo -n "$FG[002]"
	date +"%H:%M:%S"
}
empty_time() {
	echo "$FG[008]--:--:--"
}
preexec() {
	DATE=`date +"%H:%M:%S"`
	echo -n "$FG[008]"
  echo -e "\033[1F${DATE} "
	echo -n "$FG[007]"
	echo -n -e "\033[4D\033[K"
}

# prompt symbol
delta() {
	echo "$FG[003]%(!.#.λ)"
}

# current directory
current_directory() {
	echo "$FG[008]%~"
}

# primary prompt
PS1='$(old_time) ${return_code}$(current_directory)$(git_prompt_info)$(hg_prompt_info) %{$reset_color%}'
PS2='%{$fg[red]%}\ %{$reset_color%}'
#RPS1='${return_code}'

# right prompt
#(( $+functions[virtualenv_prompt_info] )) && RPS1+='$(virtualenv_prompt_info)'
#RPS1+=' $my_gray%n@%m%{$reset_color%}%'

# git settings
ZSH_THEME_GIT_PROMPT_PREFIX="$FG[245]($FG[003]"
ZSH_THEME_GIT_PROMPT_CLEAN=""
ZSH_THEME_GIT_PROMPT_DIRTY="$FG[001]*%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="$FG[245])%{$reset_color%}"

# hg settings
ZSH_THEME_HG_PROMPT_PREFIX="$FG[075]($FG[078]"
ZSH_THEME_HG_PROMPT_CLEAN=""
ZSH_THEME_HG_PROMPT_DIRTY="$my_orange*%{$reset_color%}"
ZSH_THEME_HG_PROMPT_SUFFIX="$FG[075])%{$reset_color%}"

# virtualenv settings
ZSH_THEME_VIRTUALENV_PREFIX=" $FG[075]["
ZSH_THEME_VIRTUALENV_SUFFIX="]%{$reset_color%}"
