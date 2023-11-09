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




# [[INI-MYSHELLENV]]
mseHOME=$([ ! -z "${XDG_MAIN_HOME}" ] && echo "${XDG_MAIN_HOME}" || echo "${HOME}")
if [ -f "${mseHOME}/apps/myShellEnv/src/mse.sh" ]; then
  . "${mseHOME}/apps/myShellEnv/src/mse.sh" || true
fi
# [[END-MYSHELLENV]]


# [[INI-MSE_UTEST]]
declare -gA MSE_UTEST
MSE_UTEST["first"]="one"
MSE_UTEST["fourth"]="four"
MSE_UTEST["second"]="two"
MSE_UTEST["third"]="tree"
# [[END-MSE_UTEST]]
