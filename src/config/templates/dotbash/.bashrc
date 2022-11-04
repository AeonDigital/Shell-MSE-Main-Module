# If not running interactively, don't do anything
[[ $- != *i* ]] && return
# Configure XDG Base Directories
[ -z "${XDG_MAIN_HOME}" ] && . "${HOME}/.xdg/ENV.sh"


#
# Prompt
PS1="\[\e[0;94;49m\]\$ \[\e[0;90;49m\]\u\[\e[0;94;49m\]@\[\e[0;90;49m\]\h\[\e[0;94;49m\] in \[\e[0;37;37m\]\[\e[0;90;49m\]\w \n\076\[\e[0;37;37m\]\040"



#
# Bash Configuration

# Check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# Append to the history file, don't overwrite it
shopt -s histappend

#
# History Configuration
# - ignoredups
#   not store a command which is the same as the most recent command used
# - ignorespace
#   not store a command witch starts with a space character
# - ignoreboth
#   same as both options above (equals to use: 'ignorespace:ignoredups')
HISTCONTROL=ignoreboth
# Maximum number of lines of history that we can store in memory by session.
HISTSIZE=256
# Maximum number of lines that can be white in the history file on disk.
HISTFILESIZE=2048


#
# Aliases
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'



#
# Load 'lesspipe'
# Make 'less' more friendly for non-text input files
if [ -x /usr/bin/lesspipe ]; then
  eval "$(SHELL=/bin/sh lesspipe)"
fi



# [[INI-MYSHELLENV]]
mseHOME=$([ ! -z "${XDG_MAIN_HOME}" ] && echo "${XDG_MAIN_HOME}" || echo "${HOME}")
if [ -f "${mseHOME}/apps/myShellEnv/src/mse.sh" ]; then
  . "${mseHOME}/apps/myShellEnv/src/mse.sh" || true
fi
# [[END-MYSHELLENV]]
