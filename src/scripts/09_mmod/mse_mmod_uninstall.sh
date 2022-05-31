#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







#
# @desc
# Remove totalmente o myShellEnv e todos os módulos atualmente instalados.
mse_mmod_uninstall() {
  local mseCode=0
  mse_inter_alertUser "i" "MSE" "${lbl_uninstall_uninstallStart}"

  mse_inter_promptUser "" "" "${lbl_uninstall_uninstallPromptTitle}" "lbl_uninstall_uninstallPromptMessage" "bool"

  if [ "${MSE_GLOBAL_PROMPT_RESULT}" == "0" ]; then
    mse_inter_alertUser "i" "MSE" "${lbl_uninstall_uninstallAborted}"
  else
    local mseAtualShell="${SHELL##*/}"
    local mseAtualShellRCPath="${HOME}/.${mseAtualShell,,}rc"

    #
    # Se o arquivo 'rc' do respectivo shell existir...
    if [ -f "${mseAtualShellRCPath}" ]; then
      local mseCharC
      local mseFirstLine
      local mseLastLine
      local mseInstallationPath="${HOME}/.config/myShellEnv"


      MSE_GLOBAL_MODULE_READ_BLOCK["start"]="mse_file_read_checkRCFile_MSESection_start"
      MSE_GLOBAL_MODULE_READ_BLOCK["start_args"]=""
      MSE_GLOBAL_MODULE_READ_BLOCK["start_args_sep"]=""
      MSE_GLOBAL_MODULE_READ_BLOCK["end"]="mse_file_read_checkRCFile_MSESection_end"
      MSE_GLOBAL_MODULE_READ_BLOCK["print_start_line"]="1"

      local mseRawLines=$(mse_file_read "$mseInstallationPath" 0 "1")
      if [ "$mseRawLines" != "" ]; then
        mseCharC="#"

        mseFirstLine="${mseRawLines%%[[:cntrl:]]*}"
        mseFirstLineNumber="${mseFirstLine%${mseCharC}*}"
        mseFirstLineNumber="${mseFirstLineNumber%*${mseCharC}}"

        mseLastLine="${mseRawLines##*[[:cntrl:]]}"
        mseLastLineNumber="${mseLastLine%${mseCharC}*}"
        mseLastLineNumber="${mseLastLineNumber%*${mseCharC}}"

        echo "${mseFirstLineNumber} ${mseLastLineNumber}"
        #declare -a mseArr
        #mse_file_write "${mseInstallationPath}" "mseArr" "delete" "${mseFirstLineNumber} ${mseLastLineNumber}"
      fi

    fi
  fi

  return $mseCode
}





#
# Identifica se a linha passada está definindo o início de uma seção de
# configuração.
#
# @param int $1
# Número da linha sendo verificada.
#
# @param string $2
# Conteúdo da linha sendo verificada.
#
# @return
# Printa '1' se o teste for positivo.
# Printa '0' se o teste for negativo.
mse_file_read_checkRCFile_MSESection_start() {
  local mseR=0

  if [ "$2" == "# [[INI-MYSHELLENV]]" ]; then
    mseR=1
  fi

  printf "${mseR}"
}





#
# Identifica se a linha passada está definindo o fim de uma seção de
# configuração.
#
# @param int $1
# Número da linha sendo verificada.
#
# @param string $2
# Conteúdo da linha sendo verificada.
#
# @return
# Printa '1' se o teste for positivo.
# Printa '0' se o teste for negativo.
mse_file_read_checkRCFile_MSESection_end() {
  local mseR=0

  if [ "$2" == "# [[END-MYSHELLENV]]" ]; then
    mseR=1
  fi

  printf "${mseR}"
}
