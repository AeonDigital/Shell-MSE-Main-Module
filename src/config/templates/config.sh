#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]


#
# Identifica se deve efetuar a inicialização do myShellEnv
# [[INI-MSE_GLOBAL_ACTIVE]]
MSE_GLOBAL_ACTIVE="1"
# [[END-MSE_GLOBAL_ACTIVE]]





#
# Identifica o locale que deve ser usado para as mensagens do sistema.
# [[INI-MSE_GLOBAL_MODULE_LOCALE]]
MSE_GLOBAL_MODULE_LOCALE="en-us"
# [[END-MSE_GLOBAL_MODULE_LOCALE]]




#
# Função do 'theme' usada para renderizar as mensagens de interface
# [[INI-MSE_GLOBAL_THEME_NAME]]
MSE_GLOBAL_THEME_NAME="mse_inter_theme_default"
# [[END-MSE_GLOBAL_THEME_NAME]]





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
