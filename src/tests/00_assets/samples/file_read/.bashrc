# ~/.bashrc: executed by bash(1) for non-login shells.
# If not running interactively, don't do anything
[[ $- != *i* ]] && return



#
# Verifica tamanho da linha e coluna a cada novo comando
# no prompt
shopt -s checkwinsize
#
# Adiciona os comandos da seção atual ao histórico ao invés
# de substituir o conteúdo.
shopt -s histappend


#
# Máximo de linhas de comando armazenadas na memória de uma seção.
HISTSIZE=128
#
# Máximo de linhas de comando armazenadas no arquivo 'history'
HISTFILESIZE=512



#
# Define um cursor com o estilo padrão do myEnvShell
PS1="\[\e[0;94;49m\]\$ \[\e[0;90;49m\]\u\[\e[0;94;49m\]@\[\e[0;90;49m\]\h\[\e[0;94;49m\] in \[\e[0;37;37m\]\[\e[0;90;49m\]\w \n\076\[\e[0;37;37m\]\040"

# [[INI-MYSHELLENV]]
mseHOME=$([ ! -z "${XDG_MAIN_HOME}" ] && echo "${XDG_MAIN_HOME}" || echo "${HOME}")
if [ -f "${mseHOME}/apps/myShellEnv/src/mse.sh" ]; then
  . "${mseHOME}/apps/myShellEnv/src/mse.sh" || true
fi
# [[END-MYSHELLENV]]
