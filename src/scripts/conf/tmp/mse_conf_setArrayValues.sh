#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







#
# @desc
# Permite editar um arquivo de configuração que armazene informações
# em formato de array.
# Apenas consegue alterar valores de chaves que existam inicialmente no array
# alvo.
#
# Antes de evocar esta função, use a variável global ${MSE_GLOBAL_MODULE_ARRAY_CONFIG} para
# conter todos os valores que você deseja que sejam salvos.
#
# @param string $1
# Nome do array que será alterado.
#
# @param string $2
# Arquivo onde a alteração será feita.
#
# @example
#   mse_conf_setArrayValues 'TARGET_ARRAY_NAME' '~/config.sh'
mse_conf_setArrayValues() {
  if [ $# != 2 ]; then
    mse_mmod_errorAlert "${FUNCNAME[0]}" "${lbl_generic_lostArguments}"
  else
    if [ ! -f $2 ]; then
      mse_mmod_errorAlert "${FUNCNAME[0]}" "${lbl_genericError_especifiedFileNotExists}"
    else
      local oIFS
      local mseArr
      local mseSearch
      local mseNewLine
      local mseTmpFile
      local mseRawLine


      #
      # Inicia um novo arquivo temporário apenas para salvar
      # a configuração que está sendo setada.
      mseTmpFile="${HOME}/.mseTmpConfig"
      printf '' > "$mseTmpFile"


      #
      # Para cada linha do arquivo indicado
      # **o arquivo é lido de forma 'readonly' em especial para
      # não perder caracteres especiais que seriam 'evaluados' de outra forma**
      oIFS=$IFS
      mseArr=$1
      IFS=
      while read -r mseRawLine; do
        #
        # escapa os caracteres '\n' para que não sejam 'evaluados' ao salvar
        mseNewLine=$(printf "$mseRawLine" | sed 's/\\n/\\\\n/g')

        #
        # Identifica se a linha atual possui alguma configuração para a
        # variável que deve ser alterada
        mseSearch="${mseArr}["

        if [[ "$mseRawLine" == *"$mseSearch"* ]]; then

          #
          # Para cada chave a ser redefinida, identifica se a linha atual
          # possui alguma delas.
          for k in "${!MSE_GLOBAL_MODULE_ARRAY_CONFIG[@]}"; do
            mseSearch="${mseArr}[${k}]"

            if [[ "$mseRawLine" == *"$mseSearch"* ]]; then
              mseNewLine=${mseSearch}'='${MSE_GLOBAL_MODULE_ARRAY_CONFIG[$k]}
            fi
          done
        fi

        printf "$mseNewLine\n" >> "$mseTmpFile"
      done < $2
      IFS=$oIFS

      #
      # Efetivamente substitui o arquivo de configuração anterior
      mv "$mseTmpFile" "$2"

    fi
  fi
}
