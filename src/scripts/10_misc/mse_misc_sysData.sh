#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]




#
# @desc
# Mostra informações do sistema.
mse_misc_sysData() {

  #
  # Coleta informações do sistema
  local mseDISTRO=`cat /etc/os-release | grep -oP -m1 '(?<=NAME=")[^"]*'`
  local mseKERNEL=`uname -r`
  local mseARCH=`uname -m`
  local mseCPU=`awk -F '[ :][ :]+' '/^model name/ { print $2; exit; }' /proc/cpuinfo`

  local mseMEMORY1=`free -t -m | grep "Mem" | awk '{print $6" MB";}'`
  local mseMEMORY2=`free -t -m | grep "Mem" | awk '{print $2" MB";}'`
  local mseMEMPERCENT=`free | awk '/Mem/{printf("%.2f% (Used) "), $3/$2*100}'`

  local mseDETECTDISK=`mount -v | fgrep 'on / ' | sed -n 's_^\(/dev/[^ ]*\) .*$_\1_p'`
  local mseDISC=`df -h | grep $mseDETECTDISK | awk '{print $5 }'`

  local mseUP=`uptime -p`
  local mseHOSTNAME=`uname -n`

  local mseNOW=$(date +"%Y-%m-%d %T")



  # Não cor
  local mseNColor="\e[0m"
  # Cor de texto
  local mseTColor="\e[1;49;34m"
  # Cor do logo
  local mseLColor="\e[1;49;90m"


  local mseResult=""
  mseResult+="  ${mseTColor}${mseDISTRO}${mseNColor} :: ${mseKERNEL} :: ${mseARCH} \n"
  mseResult+="${mseLColor}                           ${mseNColor}\n"
  mseResult+="${mseLColor}           #####           ${mseNColor}\n"
  mseResult+="${mseLColor}          #######          ${mseNColor}     CPU: ${mseTColor}${mseCPU}${mseNColor} \n"
  mseResult+="${mseLColor}           #####           ${mseNColor}  Memory: ${mseTColor}${mseMEMORY1} / ${mseMEMORY2} - ${mseMEMPERCENT}${mseNColor} \n"
  mseResult+="${mseLColor}                           ${mseNColor}Use Disk: ${mseTColor}${mseDISC} (used)${mseNColor} \n"
  mseResult+="${mseLColor}   #####   #####           ${mseNColor}  Uptime: ${mseTColor}${mseUP}${mseNColor} \n"
  mseResult+="${mseLColor}  ####### #######          ${mseNColor}\n"
  mseResult+="${mseLColor}   #####   #####           ${mseNColor}\n"
  mseResult+="${mseLColor}                           ${mseNColor}\n"
  mseResult+="${mseLColor}   #####           #####   ${mseNColor}    User: ${mseTColor}${USER}${mseNColor} \n"
  mseResult+="${mseLColor}  #######         #######  ${mseNColor}    Host: ${mseTColor}${mseHOSTNAME}${mseNColor} \n"
  mseResult+="${mseLColor}   #####           #####   ${mseNColor}    Date: ${mseTColor}${mseNOW}${mseNColor} \n"

  clear
  echo -e "${mseResult}"
}
