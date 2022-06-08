#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]


#
# Registra cada módulo que está disponível dentro do ambiente atual.
#
# Cada novo módulo adicionado ficará armazenado no diretório "~/.config/myShellEnv"
# como um módulo Git.
#
# Cada entrada terá como chave o nome do seu próprio diretório principal e,
# associado a ele estará um valor booleano indicando se o mesmo deve ou não ser
# carregado.
# [[INI-MSE_AVAILABLE_MODULES]]
declare -gA MSE_AVAILABLE_MODULES
# [[END-MSE_AVAILABLE_MODULES]]
