#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







#
# @desc
# Atualiza a barra de progresso conforme configurações inicialmente por um
# comando "mse_inter_showProgressBar". Na ausência de configurações prévias,
# às iniciará conforme o tema padrão.
#
# @param int $1
# Percentual atual de andamento do progresso.
# Use apenas valores entre 0 e 100.
# Valores inválidos serão revertidos para "0".
#
# @param string $2
# Opcional.
# Informação que deve ser usada para preencher a área informativa.
#
# @return
# printa/atualiza a barra de progresso conforme as indicações passadas.
mse_inter_setProgressBar() {
  #
  # Se não há configuração para a barra de progresso
  # seta a padrão
  if [[ ! "$(declare -p ${MSE_GLOBAL_SHOW_PROGRESSBAR_CONFIG} 2> /dev/null)" =~ "declare -A" ]] || [ "${MSE_GLOBAL_SHOW_PROGRESSBAR_CONFIG[ProgressBarFormat]}" == "" ]; then
    mse_inter_showProgressBar "" "" "" "" ""   "" "" "" "" ""   "" "" "" "" ""
  else
    if [ $# -ge 1 ]; then
      local mseCheck
      local mseBarLength
      local mseBarProgress
      local mseStrAtualBarLength


      #
      # Resgata o progresso atual da barra
      mseCheck=$(mse_check_isInteger "$1")

      mseBarProgress=0
      if [ "${mseCheck}" == "1" ]; then
        if [ "${1}" -le "0" ]; then
          mseBarProgress=0
        elif [ "${1}" -ge "100" ]; then
          mseBarProgress=100
        else
          mseBarProgress="${1}"
        fi
      fi


      #
      # Resgata o tamanho total da barra de progresso a ser printada
      mseBarLength="${MSE_GLOBAL_SHOW_PROGRESSBAR_CONFIG[ProgressBarTotalCharLength]}"


      #
      # Calcula o tamanho total que a barra deve ter para representar o
      # progresso atualmente definido...
      mseStrAtualBarLength=0
      ((mseStrAtualBarLength = (mseBarLength * mseBarProgress) / 100))
      MSE_GLOBAL_SHOW_PROGRESSBAR_CONFIG["ProgressBarAtualBarLength"]="${mseStrAtualBarLength}"



      #
      # Se deve preencher a parte informativa com o percentual atual do progresso...
      if [ "${MSE_GLOBAL_SHOW_PROGRESSBAR_CONFIG[ProgressBarInfoUsePercent]}" == "1" ]; then
        local mseStrBarInfo=""

        if [ "${mseBarProgress}" -lt "10" ]; then
          mseStrBarInfo+="  "
        elif [ "${mseBarProgress}" -lt "100" ]; then
          mseStrBarInfo+=" "
        fi
        mseStrBarInfo+="${mseBarProgress}%"
        MSE_GLOBAL_SHOW_PROGRESSBAR_CONFIG["ProgressBarInfoData"]="${mseStrBarInfo}"
      else
        if [ $# -ge 2 ]; then
          MSE_GLOBAL_SHOW_PROGRESSBAR_CONFIG["ProgressBarInfoData"]="${2}"
        fi
      fi





      printf "${MSE_GLOBAL_SHOW_PROGRESSBAR_CONFIG[ProgressBarIndent]}"

      #
      # Gera a mensagem conforme configuração
      if [ "${MSE_GLOBAL_SHOW_PROGRESSBAR_CONFIG[ProgressBarInfoPosition]}" == "r" ]; then
        mse_inter_showProgressBar_createBar
        mse_inter_showProgressBar_createData
      elif [ "${MSE_GLOBAL_SHOW_PROGRESSBAR_CONFIG[ProgressBarInfoPosition]}" == "l" ]; then
        mse_inter_showProgressBar_createData
        mse_inter_showProgressBar_createBar
      fi

      if [ "${mseBarProgress}" == 100 ]; then
        printf "\n"
      else
        printf "\r"
      fi
    fi
  fi
}





#
# Preenche o array associativo 'MSE_GLOBAL_VALIDATE_PARAMETERS_RULES'
# com as regras de validação dos parametros aceitáveis.
mse_inter_setProgressBar_vldtr() {
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["count"]=3
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_0"]="ProgressBarTotalCharLength :: r :: int :: 50 :: 20 :: 100"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_1"]="ProgressBarAtualPercentProgress :: r :: int :: 0 :: 0 :: 100"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_2"]="ThemeName :: o :: string"
}
