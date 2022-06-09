#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]
#
# Torne este arquivo executável usando :
# > chmod u+x install.sh
#
# Execute assim
# > ./install.sh






mseTtlColor="\e[1;2;49;34m"
mseTxtColor="\e[20;49;90m"
mseNColor="\e[0m"
clear
printf "  :: ${mseTtlColor}myShellEnv${mseNColor} \n"
printf "     ${mseTxtColor}Starting installation${mseNColor}\n\n"


set -eu
mseIsOK=1
mseCheck=0
mseAtualShell="${SHELL##*/}"
mseAtualShellRCPath=""
mseAtualShellRCInitCodeInserted=0
mseTMPInstallMessage=()

mseTMPTargetURL="https://raw.githubusercontent.com/AeonDigital/Shell-MSE-Main-Module/main/src/standalone.sh?$(date +%s)"
mseTMPMainModuleRepo="https://github.com/AeonDigital/Shell-MSE-Main-Module.git"
mseTMPTargetOutputFile="${HOME}/tmp_mse_standalone.sh"
mseTMPInstallationPath="${HOME}/.config/myShellEnv"
mseTMPCURLResultCode=""
mseTMPRemoveInstallationDir=0


#
# Efetua o download da versão 'standalone' do módulo principal
rm -rf "${mseTMPTargetOutputFile}"
mseTMPCURLResultCode=$(curl -s -w "%{http_code}" -o "${mseTMPTargetOutputFile}" "${mseTMPTargetURL}" || true)


#
# Se falhar no download...
if [ ! -f "${mseTMPTargetOutputFile}" ] || [ "${mseTMPCURLResultCode}" != "200" ]; then
  mseIsOK="n"

  mseTMPInstallMessage+=("Unable to download installation file:")
  mseTMPInstallMessage+=("from \"${mseTMPTargetURL}\"")
  mseTMPInstallMessage+=("to  \"${mseTMPTargetOutputFile}\"")

  printf "%s\n" "${mseTMPInstallMessage}"
else
  #
  # Carrega a versão standalone.
  . "${mseTMPTargetOutputFile}"


  mseCheck=$(mse_check_isCommandExists "git --version")
  if [ "${mseCheck}" == "0" ]; then
    mseIsOK=0

    mseTMPInstallMessage+=("Git not found.")
    mseTMPInstallMessage+=("Install it and try again.")
  else

    #
    # Se o diretório de instalação já existe...
    if [ -d "${mseTMPInstallationPath}" ]; then
      mseIsOK=0

      mseTMPInstallMessage+=("There is already a version of \"myShellEnv\" installed in")
      mseTMPInstallMessage+=("${mseTMPInstallationPath}")
      mseTMPInstallMessage+=("Uninstall the previous version to install a new one.")
      mseTMPInstallMessage+=("")
    else

      #
      # cria o diretório de instalação
      mkdir -p "${mseTMPInstallationPath}"
      if [ ! -d "${mseTMPInstallationPath}" ]; then
        mseIsOK=0

        mseTMPInstallMessage+=("Could not create installation directory:")
        mseTMPInstallMessage+=("\"${mseTMPInstallationPath}\"")
        mseTMPInstallMessage+=("Please check permissions and try again")
      else
        mseTMPRemoveInstallationDir=1
        mse_inter_alertUser "i" "MSE" "Cloning main module repository" "" ""

        git clone --depth=1 "${mseTMPMainModuleRepo}" "${mseTMPInstallationPath}"
        if [ $? != 0 ] || [ ! -d "${mseTMPInstallationPath}/src" ]; then
          mseIsOK=0
          mse_inter_alertUser "f" "MSE" "Could not clone repository" "mseTMPInstallMessage" ""
        else
          git -C "${mseTMPInstallationPath}" config --local user.email "mse@myenvshell.com.br"
          git -C "${mseTMPInstallationPath}" config --local user.name "myEnvShell"

          mse_inter_alertUser "s" "MSE" "Clone success" "" ""
        fi
      fi
    fi

  fi
fi





if [ "${mseIsOK}" == "0" ]; then
  mse_inter_errorAlert "MSE" "Installation Aborted" "mseTMPInstallMessage" ""

  #
  # Remove o diretório de instalação caso necessário
  if [ "${mseTMPRemoveInstallationDir}" == "1" ]; then
    rm -rf "${mseTMPInstallationPath}"
    if [ $? != 0 ]; then
      mseTMPInstallMessage=()
      mseTMPInstallMessage+=("Installation failed and could not remove cloned repository:")
      mseTMPInstallMessage+=("${mseTMPInstallationPath}")
      mseTMPInstallMessage+=("Before trying a new installation you need to manually remove it.")

      mse_inter_alertUser "e" "MSE" "Attention" "mseTMPInstallMessage"
    fi
  fi
else



  #
  # Adiciona uma chamada para o "myShellEnv" no arquivo "rc" do shell
  # atualmente sendo usado.
  mseAtualShellRCPath="${HOME}/.${mseAtualShell,,}rc"



  #
  # Se o arquivo 'rc' do respectivo shell existir...
  if [ -f "${mseAtualShellRCPath}" ]; then
    mseMyEnvShellInitiCode=""
    mseMyEnvShellInitiCode+="\n\n"
    mseMyEnvShellInitiCode+="# [[INI-MYSHELLENV]]\n"
    mseMyEnvShellInitiCode+="if [ -f ~/.config/myShellEnv/src/mse.sh ]; then\n"
    mseMyEnvShellInitiCode+="  . ~/.config/myShellEnv/src/mse.sh || true\n"
    mseMyEnvShellInitiCode+="fi\n"
    mseMyEnvShellInitiCode+="# [[END-MYSHELLENV]]\n"

    mseRCFileContent=$(< "${mseAtualShellRCPath}")
    if [ "${mseRCFileContent}" != "" ]; then
      mseInitiCodeMatch=0

      while read mseLineRaw || [ -n "${mseLineRaw}" ]; do
        if [[ "${mseLineRaw}" =~ "# [[INI-MYSHELLENV]]" ]]; then
          mseInitiCodeMatch=1
          break
        fi
      done <<< "$mseRCFileContent"

      if [ "${mseInitiCodeMatch}" == 0 ]; then
        printf "${mseMyEnvShellInitiCode}" >> "${mseAtualShellRCPath}"
        if [ $? == 0 ]; then
          mseAtualShellRCInitCodeInserted=1
        fi
      fi
    fi

    unset mseMyEnvShellInitiCode
    unset mseRCFileContent
    unset mseInitiCodeMatch
    unset mseLineRaw
  fi



  mseTMPInstallMessage=()
  if [ "${mseAtualShellRCInitCodeInserted}" == "1" ]; then
    mseTMPInstallMessage+=("the code below has been added in the .${mseAtualShell,,}rc file")
  else
    mseTMPInstallMessage+=("To enable your shell env change your .${mseAtualShell,,}rc file and append the")
    mseTMPInstallMessage+=("following code in the end of it:")
  fi

  mseTMPInstallMessage+=("")
  mseTMPInstallMessage+=("${mseNONE}# [[INI-MYSHELLENV]]")
  mseTMPInstallMessage+=("${mseTtlColor}if${mseNONE} [ -f ~/.config/myShellEnv/src/mse.sh ]; ${mseTtlColor}then${mseNONE}")
  mseTMPInstallMessage+=("  ${mseNONE}. ~/.config/myShellEnv/src/mse.sh || ${mseTtlColor}true${mseNONE}")
  mseTMPInstallMessage+=("${mseTtlColor}fi${mseNONE}")
  mseTMPInstallMessage+=("${mseNONE}# [[END-MYSHELLENV]]")


  if [ "${mseAtualShellRCInitCodeInserted}" == "1" ]; then
    mseTMPInstallMessage+=("")
    mseTMPInstallMessage+=("changes will take effect immediately")
  else
    mseTMPInstallMessage+=("")
    mseTMPInstallMessage+=("changes will be activated when opening a new shell")
  fi

  mse_inter_alertUser "a" "MSE" "Installation success!" "mseTMPInstallMessage" ""
  rm install.sh tmp_mse_standalone.sh
  cp "${mseTMPInstallationPath}/templates/config.sh" "${mseTMPInstallationPath}/config.sh"



  if [ "${mseAtualShellRCInitCodeInserted}" == "1" ]; then
    bash
  fi
fi



unset mseTtlColor
unset mseTxtColor
unset mseNColor

unset mseIsOK
unset mseCheck
unset mseAtualShell
unset mseAtualShellRCPath
unset mseAtualShellRCInitCodeInserted
unset mseTMPInstallMessage

unset mseTMPTargetURL
unset mseTMPMainModuleRepo
unset mseTMPTargetOutputFile
unset mseTMPInstallationPath
unset mseTMPCURLResultCode
unset mseTMPRemoveInstallationDir
