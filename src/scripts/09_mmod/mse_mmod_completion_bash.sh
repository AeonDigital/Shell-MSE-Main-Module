#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]
# https://opensource.com/article/18/3/creating-bash-completion-script
# https://www.gnu.org/software/bash/manual/html_node/Programmable-Completion-Builtins.html#Programmable-Completion-Builtins
# https://iridakos.com/programming/2018/03/01/bash-programmable-completion-tutorial




#
# @desc
# Permite uma análise recursiva do prompt atualmente digitado pelo usuário.
# em relação a todas as opções disponíveis no "myShellEnv".
#
# @param string $1
# Partícula/s de comandos que devem ser pesquisadas.
mse_mmod_completion_bash() {
  local mseMode="C"
  declare -a mseArrParans=()
  local mseSearchCmd=""

  COMPREPLY=()
  unset mseSelectedCmds
  declare -A mseSelectedCmds


  #
  # Resgata o conteúdo da linha atual e efetua um "split"
  # em cada argumento passado ignorando totalmente quaiquer
  # espaços em branco.
  if [ "${mseMode}" == "F" ]; then
    mse_str_split " " "${COMP_WORDS[*]}" "1"
  elif [ "${mseMode}" == "C" ]; then
    mse_str_split " " "${COMP_LINE}" "1"
  fi
  mseArrParans=("${MSE_GLOBAL_MODULE_SPLIT_RESULT[@]}")


  #
  # resgata parametros pelos quais o autocomplete deve
  # prosseguir a consulta
  if [ "${#mseArrParans[@]}" -ge 2 ]; then
    mseSearchCmd="${mseArrParans[@]:1}"
    mseSearchCmd="${mseSearchCmd^^}"
    mseSearchCmd="${mseSearchCmd// /_}"
  fi



  local mseCmd=""
  local mseCompareCmd=""


  local mseNextCmd=""
  local mseMatchCmd="0"

  for mseCmd in "${!MSE_GLOBAL_CMD[@]}"; do
    if [ "${mseSearchCmd}" == "" ]; then
      mseNextCmd=$(mse_str_trim "${mseCmd%% *}")
      mseSelectedCmds["${mseNextCmd}"]=""
    else
      mseCompareCmd=$(mse_str_trim "${mseCmd// /_}")

      if [ "${mseCompareCmd}" == "${mseSearchCmd}" ]; then
        mseMatchCmd="1"
        mseSelectedCmds["--"]=""
        break
      elif [[ "${mseCompareCmd}" =~ ^${mseSearchCmd} ]]; then
        mseNextCmd="${mseSearchCmd%_*}"
        mseNextCmd="${mseCompareCmd//${mseNextCmd}/}"
        if [ "${mseNextCmd:0:1}" == "_" ]; then
          mseNextCmd="${mseNextCmd:1}"
        fi
        mseSelectedCmds["${mseNextCmd%_*}"]=""
      fi
    fi
  done



  #
  # Conforme o tipo de output requerido...
  if [ "${mseMode}" == "F" ]; then
    COMPREPLY+=("${!mseSelectedCmds[@]}")

  elif [ "${mseMode}" == "C" ]; then
    printf "%s\n" "${!mseSelectedCmds[@]}"

  fi
}



if [ "${SHELL##*/}" == "bash" ]; then
  complete -C "mse_mmod_completion_bash" "mse"
fi
