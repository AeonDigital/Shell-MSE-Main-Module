#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







#
# @desc
# Escreve uma ou mais linhas de dados no arquivo alvo na posição indicada.
#
# @param string $1
# Caminho até o arquivo que será lida.
#
# @param string $2
# Nome do array contendo as novas linhas de dados a serem adicionadas.
#
# @param string $3
# Tipo de operação que será efetuada.
# - p|prepend : Adiciona as novas linhas no início do arquivo.
# - a|append  : Adiciona as novas linhas no final do arquivo.
# - r|replace : Adiciona as novas linhas em substituição a uma linha existente.
#
# @param int|string $4
# Opcional para 'prepend' e 'append'; Obrigatório para 'replace'.
# Indica o número da linha a ser usada como posição inicial para a a escrita
# do novo conteúdo.
# Se há conteúdo nesta mesma linha, o mesmo será 'empurrado' para baixo exceto
# no caso de estar usando a operação 'replace'.
#
# Se este parametro não for definido e o tipo for:
# - prepend : equivalente a definir o valor '1'.
# - append  : equivalente a definir o número da última linha do arquivo.
# - replace : falhará a execução.
#
# SE
# o valor passado for uma string, esta deverá ser o nome de uma função a ser
# executada para identificar o número da linha em que a escrita deve ser feita.
#
# Em qualquer dos casos, se não receber um valor inteiro válido (entre 1 e o
# número da última linha do arquivo conforme ele está atualmente salvo) a
# ação não será feita e uma falha ocorrerá.
#
# @return
# Printa '1' se conseguir alterar o arquivo alvo.
# Printa '0' se ocorrer qualquer forma de falha durante o processo.
mse_mmod_writeFile()
{
  local mseReturn
  local mseFileContent


  #
  # Apenas se há definição de um arquivo/string
  mseReturn=0
  mseFileContent=""
  if [ -f "$1" ]; then
    mseReturn=1
    mseFileContent=$(< "$1")
  fi


  #
  #





  printf "${mseReturn}"
}
