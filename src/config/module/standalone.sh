#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







#
# Ação executada imediatamente ANTES de iniciar o processamento dos arquivos
# padrões do módulo.
#
# @param string $1
# Caminho completo até o diretório 'src' do módulo que está sendo processado.
#
# @param string $2
# Nome do array que será preenchido com as informações que devem ser
# retornadas.
mse_standalone_execOnStart() {
  declare -n mseTmpArrName="$2"
  mseTmpArrName=()
}



#
# Ação executada imediatamente APÓS finalizar o processamento dos arquivos
# padrões do módulo.
#
# @param string $1
# Caminho completo até o diretório 'src' do módulo que está sendo processado.
#
# @param string $2
# Nome do array que será preenchido com as informações que devem ser
# retornadas.
mse_registerModule_execOnEnd() {
  declare -n mseTmpArrName="$2"
  mseTmpArrName=()
}





#
# Ação executada imediatamente ANTES de processar as configurações do locale.
#
# @param string $1
# Caminho completo até o diretório 'src' do módulo que está sendo processado.
#
# @param string $2
# Nome do array que será preenchido com as informações que devem ser
# retornadas.
mse_standalone_execBeforeLoadLocale() {
  declare -n mseTmpArrName="$2"
  mseTmpArrName=()
}



#
# Ação executada imediatamente APÓS processar as configurações do locale.
#
# @param string $1
# Caminho completo até o diretório 'src' do módulo que está sendo processado.
#
# @param string $2
# Nome do array que será preenchido com as informações que devem ser
# retornadas.
mse_standalone_execAfterLoadLocale() {
  declare -n mseTmpArrName="$2"
  mseTmpArrName=()
}





#
# Ação executada imediatamente ANTES de processar as configurações de
# variáveis de ambiente.
#
# @param string $1
# Caminho completo até o diretório 'src' do módulo que está sendo processado.
#
# @param string $2
# Nome do array que será preenchido com as informações que devem ser
# retornadas.
mse_standalone_execBeforeLoadEnv() {
  declare -n mseTmpArrName="$2"
  mseTmpArrName=()
}



#
# Ação executada imediatamente APÓS processar as configurações de
# variáveis de ambiente.
#
# @param string $1
# Caminho completo até o diretório 'src' do módulo que está sendo processado.
#
# @param string $2
# Nome do array que será preenchido com as informações que devem ser
# retornadas.
mse_standalone_execAfterLoadEnv() {
  declare -n mseTmpArrName="$2"
  mseTmpArrName=()
}





#
# Ação executada imediatamente ANTES de processar as variáveis do módulo.
#
# @param string $1
# Caminho completo até o diretório 'src' do módulo que está sendo processado.
#
# @param string $2
# Nome do array que será preenchido com as informações que devem ser
# retornadas.
mse_standalone_execBeforeLoadVariables() {
  declare -n mseTmpArrName="$2"
  mseTmpArrName=()
}



#
# Ação executada imediatamente APÓS processar as variáveis do módulo.
#
# @param string $1
# Caminho completo até o diretório 'src' do módulo que está sendo processado.
#
# @param string $2
# Nome do array que será preenchido com as informações que devem ser
# retornadas.
mse_standalone_execAfterLoadVariables() {
  declare -n mseTmpArrName="$2"
  mseTmpArrName=("${1}/config/colors.sh")
}





#
# Ação executada imediatamente ANTES de processar os aliases do módulo.
#
# @param string $1
# Caminho completo até o diretório 'src' do módulo que está sendo processado.
#
# @param string $2
# Nome do array que será preenchido com as informações que devem ser
# retornadas.
mse_standalone_execBeforeLoadAliases() {
  declare -n mseTmpArrName="$2"
  mseTmpArrName=()
}



#
# Ação executada imediatamente APÓS processar os aliases do módulo.
#
# @param string $1
# Caminho completo até o diretório 'src' do módulo que está sendo processado.
#
# @param string $2
# Nome do array que será preenchido com as informações que devem ser
# retornadas.
mse_standalone_execAfterLoadAliases() {
  declare -n mseTmpArrName="$2"
  mseTmpArrName=()
}





#
# Ação executada imediatamente ANTES de processar os scripts do módulo.
#
# @param string $1
# Caminho completo até o diretório 'src' do módulo que está sendo processado.
#
# @param string $2
# Nome do array que será preenchido com as informações que devem ser
# retornadas.
mse_standalone_execBeforeLoadScripts() {
  declare -n mseTmpArrName="$2"
  mseTmpArrName=()
}



#
# Ação executada imediatamente APÓS processar os scripts do módulo.
#
# @param string $1
# Caminho completo até o diretório 'src' do módulo que está sendo processado.
#
# @param string $2
# Nome do array que será preenchido com as informações que devem ser
# retornadas.
mse_standalone_execAfterLoadScripts() {
  declare -n mseTmpArrName="$2"
  mseTmpArrName=()
}
