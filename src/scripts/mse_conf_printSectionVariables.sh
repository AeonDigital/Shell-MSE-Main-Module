#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







#
# @desc
# Identifica uma seção de um arquivo de configuração, tipicamente definido pela
# notação [section-name] e imprime na tela todas as suas variáveis.
#
# Linhas comentadas não serão mostradas.
#
# @param string $1
# Nome da seção alvo.
#
# @param string $2
# Caminho até o arquivo que deve ser verificado.
mse_conf_printSectionVariables()
{
  local mseInSection
  local mseSectionBegin
  local mseRawLine

  #
  # O 'while read' lê cada linha da string passada já efetuando um 'trim'
  # na mesma, portanto, não é preciso se preocupar com eliminar espaços vazios
  # antes ou depois do valor real de cada linha.
  #
  # A solução ' || [ -n "${mseRawLine}" ]' garante que a última linha será também
  # incluída no loop. Sem isto, a última linha é considerada 'EOF' e o loop não
  # itera sobre ela.
  mseInSection="0"
  while read mseRawLine || [ -n "${mseRawLine}" ]
  do
    mseSectionBegin="0";

    if [ "${mseRawLine}" != "" ] && [ "${mseRawLine:0:1}" != "#" ] && [ "${mseRawLine:0:1}" != ";" ]; then
      if [ "$1" == "" ]; then
        mseInSection="1";
        mseSectionBegin="0";
        if [ "${mseRawLine:0:1}" == "[" ]; then
          mseSectionBegin="1";
        fi;
      else
        if [ "${mseInSection}" == "1" ] && [ "${mseRawLine:0:1}" == "[" ]; then
          mseInSection="0";
        fi;
        if [ "${mseInSection}" == "0" ] && [ "${mseRawLine}" == "[$1]" ]; then
          mseInSection="1";
          mseSectionBegin="1";
        fi;
      fi;

      if [ "${mseInSection}" == "1" ] && [ "${mseSectionBegin}" == "0" ]; then
        printf "${mseRawLine}\n";
      fi;
    fi;
  done < "$2"
}
