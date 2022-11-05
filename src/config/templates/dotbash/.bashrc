# If not running interactively, don't do anything
[[ $- != *i* ]] && return
# Configure XDG Base Directories
. "${HOME}/.xdg/ENV.sh"



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
alias ls='ls --color=auto --group-directories-first --human-readable'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'



#
# Load 'lesspipe'
# Make 'less' more friendly for non-text input files
if [ -x /usr/bin/lesspipe ]; then
  eval "$(SHELL=/bin/sh lesspipe)"
fi



#
# Prompt
PS1="\[\e[0;94;49m\]\$ \[\e[0;90;49m\]\u\[\e[0;94;49m\]@\[\e[0;90;49m\]\h\[\e[0;94;49m\] in \[\e[0;37;37m\]\[\e[0;90;49m\]\w \n\076\[\e[0;37;37m\]\040"


#
# LS_COLORS
#
# Use esta variável para configurar as cores usadas nos objetos que aparecem
# ao listar arquivos e diretórios com o comando ls.
# Use os mesmos códigos de cores indicados acima (apenas o sistema de 4 bits).
#
# Monte cada valor usando a seguinte sintaxe:
# Key=Atributo;Fundo;Fonte
unset mseLSConfig
declare -gA mseLSConfig

# Key                           Object                    Description
mseLSConfig["no"]="0"           # NORMAL, NORM            Padrão global

mseLSConfig["di"]="1;20;49;94"  # DIR                     Diretório
mseLSConfig["ow"]="1;20;49;34"  # OTHER_WRITABLE          Diretórios tendo permissão de escrita para 'outros' (o+w)
mseLSConfig["st"]="1;2;49;95"   # STICKY                  Diretórios com o bit 'sticky' (+t) definido e tendo escrita esclusiva para o 'dono' (+t, u+w)
mseLSConfig["tw"]="1;20;49;35"  # STICKY_OTHER_WRITABLE   Diretórios com o bit 'sticky' (+t) definido e tendo escrita definida para o 'dono' e/ou para 'outros' (+t, o+w &| g+w)

mseLSConfig["fi"]="0"           # FILE                    Arquivo
mseLSConfig["ex"]="1;2;49;37"   # EXEC                    Arquivo executável (+x); Normal
mseLSConfig["su"]="1;2;49;37"   # SETUID                  Arquivo executável contendo o bit (u+s); Necessita da permissão do 'dono' do arquivo para ser executado.
mseLSConfig["sg"]="1;2;49;37"   # SETGID                  Arquivo executável contendo o bit (g+s); Necessita da permissão do 'grupo' do arquivo para ser executado.

mseLSConfig["ln"]="1;20;49;36"  # SYMLINK, LINK, LNK      Symbolic link. If you set this to 'target' instead of a numerical value, the colour is as for the file pointed to.
mseLSConfig["or"]="1;20;49;36"  # ORPHAN                  Symbolic link pointing to a non-existent file
mseLSConfig["mi"]="1;20;49;36"  # MISSING                 Non-existent file pointed to by a symbolic link (visible when you type ls -l)

mseLSConfig["pi"]="0"           # FIFO, PIPE              Naclearmed pipe
mseLSConfig["do"]="0"           # DOOR                    Door
mseLSConfig["so"]="0"           # SOCK                    Socket
mseLSConfig["bd"]="0"           # BLOCK, BLK              Block device
mseLSConfig["cd"]="0"           # CHAR, CHR               Character device

mseLSConfig["*.conf"]="1;20;49;36"
mseLSConfig["*.config"]="1;20;49;36"
#
# Os itens abaixo devem ser usados com cuidado - ou não usados
#
# mseLSConfig["lc"]="0"   # LEFTCODE, LEFT          Opening terminal code
# mseLSConfig["rc"]="0"   # RIGHTCODE, RIGHT        Closing terminal code
# mseLSConfig["ec"]="0"   # ENDCODE, END            Non-filename text
#
#
# Você também pode criar configurações específicas para arquivos com
# determinadas extensões. Use o modelo abaixo como guia.
# mseLSConfig["*.ext"]="0"  #                         Every file using this extension e.g. *.jpg
#



#
# Processa as configurações definidas para as cores de
# objetos de listagem.
mseLSCod=""
mseLSCodVal=""
mseLSFinal=""

for mseLSCod in "${!mseLSConfig[@]}"; do
  mseLSCodVal="${mseLSConfig[${mseLSCod}]}"
  if [ "${mseLSFinal}" != "" ]; then
    mseLSFinal+=":"
  fi
  mseLSFinal+="${mseLSCod}=${mseLSCodVal}"
done
LS_COLORS="${mseLSFinal}"
export LS_COLORS

unset mseLSCod
unset mseLSCodVal
unset mseLSFinal



#
# Carrega scripts pessoais
tmpPathToMyScripts=""
if [ "${tmpPathToMyScripts}" != "" ]; then
  tmpScriptFilePaths=$(find "${tmpPathToMyScripts}" -name "*.sh" | sort -n)
  if [ "${tmpScriptFilePaths}" != "" ]; then
    while read filePath; do
      . "$filePath" || true
    done <<< ${tmpScriptFilePaths}
    unset filePath
  fi
  unset tmpPathToMyScripts
  unset tmpScriptFilePaths
fi



# [[INI-MYSHELLENV]]
mseHOME=$([ ! -z "${XDG_MAIN_HOME}" ] && echo "${XDG_MAIN_HOME}" || echo "${HOME}")
if [ -f "${mseHOME}/apps/myShellEnv/src/mse.sh" ]; then
  . "${mseHOME}/apps/myShellEnv/src/mse.sh" || true
fi
# [[END-MYSHELLENV]]
