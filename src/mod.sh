#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







#
# Ação executada imediatamente ANTES de iniciar o registro do módulo.
#
# @param string $1
# Caminho completo até o diretório 'src' do módulo que está
# sendo registrado.
mse_mod_beforeExecuteRegister() {
  local doNothing=""
}



#
# Ação executada imediatamente APÓS o fim do carregamento do módulo.
#
# @param string $1
# Caminho completo até o diretório 'src' do módulo que está
# sendo registrado.
mse_mod_afterExecuteRegister() {
  local doNothing=""
}





#
# Ação executada imediatamente ANTES de carregar as configurações do locale.
#
# @param string $1
# Caminho completo até o diretório 'src' do módulo que está
# sendo registrado.
mse_mod_beforeLoadLocale() {
  local doNothing=""
}



#
# Ação executada imediatamente APÓS de carregar as configurações do locale.
#
# @param string $1
# Caminho completo até o diretório 'src' do módulo que está
# sendo registrado.
mse_mod_afterLoadLocale() {
  local doNothing=""
}





#
# Ação executada imediatamente ANTES de carregar as configurações de
# variáveis de ambiente.
#
# @param string $1
# Caminho completo até o diretório 'src' do módulo que está
# sendo registrado.
mse_mod_beforeLoadEnv() {
  local doNothing=""
}



#
# Ação executada imediatamente APÓS de carregar as configurações de
# variáveis de ambiente.
#
# @param string $1
# Caminho completo até o diretório 'src' do módulo que está
# sendo registrado.
mse_mod_afterLoadEnv() {
  local doNothing=""
}





#
# Ação executada imediatamente ANTES de carregar as variáveis do módulo.
#
# @param string $1
# Caminho completo até o diretório 'src' do módulo que está
# sendo registrado.
mse_mod_beforeLoadVariables() {
  local doNothing=""
}



#
# Ação executada imediatamente APÓS de carregar as variáveis do módulo.
#
# @param string $1
# Caminho completo até o diretório 'src' do módulo que está
# sendo registrado.
mse_mod_afterLoadVariables() {
  #
  # Registra as variáveis relativas às cores disponíveis para uso
  # Outras cores podem ser definidas. Use sempre o prefixo 'mse'
  # para evitar conflitos com outras libs.
  . "${1}/config/colors.sh"
}





#
# Ação executada imediatamente ANTES de carregar os aliases do módulo.
#
# @param string $1
# Caminho completo até o diretório 'src' do módulo que está
# sendo registrado.
mse_mod_beforeLoadAliases() {
  local doNothing=""
}



#
# Ação executada imediatamente APÓS de carregar os aliases do módulo.
#
# @param string $1
# Caminho completo até o diretório 'src' do módulo que está
# sendo registrado.
mse_mod_afterLoadAliases() {
  local doNothing=""
}





#
# Ação executada imediatamente ANTES de carregar os scripts do módulo.
#
# @param string $1
# Caminho completo até o diretório 'src' do módulo que está
# sendo registrado.
mse_mod_beforeLoadScripts() {
  local doNothing=""
}



#
# Ação executada imediatamente APÓS de carregar os scripts do módulo.
#
# @param string $1
# Caminho completo até o diretório 'src' do módulo que está
# sendo registrado.
mse_mod_afterLoadScripts() {
  local doNothing=""
}
