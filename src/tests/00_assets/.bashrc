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
if [ -f ~/.config/myShellEnv/src/init.sh ]; then
  . ~/.config/myShellEnv/src/init.sh || true
fi
# [[END-MYSHELLENV]]


# [[INI-MSE_UTEST]]
declare -A MSE_UTEST
# [[END-MSE_UTEST]]
