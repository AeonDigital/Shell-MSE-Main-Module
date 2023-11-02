#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]


#
# Runs the unit tests for this module.



#
# Load unit test module
. "${MSE_GLOBAL_UTEST_MAIN_PATH}/src/module.sh"





#
# Register dependencies
MSE_MD_UTEST_PATH_TO_DEPENDENCIES+=("${MSE_MAIN_PATH}/src/module.sh")
MSE_MD_UTEST_PATH_TO_DEPENDENCIES+=("${MSE_MAIN_PATH}/src/attachments/labels/${MSE_GLOBAL_MODULES_USE_LOCALE}.sh")
utestRegisterDependenciesScripts() {
  local msePathTo_SRC_Directory="${MSE_MAIN_PATH}/src/"
  declare -a mseArgTo_Find_Dependencies=()
  mseArgTo_Find_Dependencies+=("*/vars.sh")
  mseArgTo_Find_Dependencies+=("*/attachments/functions/*.sh")
  mseArgTo_Find_Dependencies+=("*/attachments/labels/${MSE_GLOBAL_MODULES_USE_LOCALE}.sh")

  local mseArgTo_Find_Path
  local mseFullPathTo_SelectedDependenciesFiles
  local mseFullPathTo_DependenceFile
  for mseArgTo_Find_Path in "${mseArgTo_Find_Dependencies[@]}"; do
    readarray -d '' mseFullPathTo_SelectedDependenciesFiles < <(find "${msePathTo_SRC_Directory}" -type f -path "${mseArgTo_Find_Path}" -print0)

    if [ "${mseFullPathTo_SelectedDependenciesFiles}" != "" ] && [ "${#mseFullPathTo_SelectedDependenciesFiles[@]}" != "0" ]; then
      for mseFullPathTo_DependenceFile in "${mseFullPathTo_SelectedDependenciesFiles[@]}"; do
        MSE_MD_UTEST_PATH_TO_DEPENDENCIES+=("${mseFullPathTo_DependenceFile}")
      done
    fi
  done
}


#
# Register functions scripts
utestRegisterFunctionScripts() {
  local msePathTo_SRC_Directory="${MSE_MAIN_PATH}/src/"
  local msePathTo_MSE_Directory="${msePathTo_SRC_Directory}mse/"
  local mseFullPathTo_MSE_SelectedFunctionScriptFiles
  local mseFullPathTo_MSE_FunctionScriptFile
  local mseFullPathTo_MSE_FunctionScriptDirectory

  local msePartialPath
  local mseFunctionName

  readarray -d '' mseFullPathTo_MSE_SelectedFunctionScriptFiles < <(find "${msePathTo_MSE_Directory}" -type f -name "src.sh" -print0)
  if [ "${mseFullPathTo_MSE_SelectedFunctionScriptFiles}" != "" ] && [ "${#mseFullPathTo_MSE_SelectedFunctionScriptFiles[@]}" != "0" ]; then
    for mseFullPathTo_MSE_FunctionScriptFile in "${mseFullPathTo_MSE_SelectedFunctionScriptFiles[@]}"; do
      mseFullPathTo_MSE_FunctionScriptDirectory=$(echo "${mseFullPathTo_MSE_FunctionScriptFile%/*}")

      msePartialPath="${mseFullPathTo_MSE_FunctionScriptDirectory/${msePathTo_SRC_Directory}/}"
      mseFunctionName="${msePartialPath//\//_}"

      if [[ "${mseFunctionName}" == *__main ]]; then
        mseFunctionName="${mseFunctionName/__main/}"
      fi

      MSE_MD_UTEST_FUNCTIONS_TO_SRC[${mseFunctionName}]="${mseFullPathTo_MSE_FunctionScriptFile}"
    done
  fi
}


#
# Register tests scripts
utestRegisterTestsScripts() {
  local msePathTo_SRC_Directory="${MSE_MAIN_PATH}/src/"
  local msePathTo_MSE_Directory="${msePathTo_SRC_Directory}mse/"
  local mseFullPathTo_MSE_SelectedFunctionScriptFiles
  local mseFullPathTo_MSE_FunctionScriptFile
  local mseFullPathTo_MSE_FunctionScriptDirectory

  local msePartialPath
  local mseFunctionName

  readarray -d '' mseFullPathTo_MSE_SelectedFunctionScriptFiles < <(find "${msePathTo_MSE_Directory}" -type f -name "test.sh" -print0)
  if [ "${mseFullPathTo_MSE_SelectedFunctionScriptFiles}" != "" ] && [ "${#mseFullPathTo_MSE_SelectedFunctionScriptFiles[@]}" != "0" ]; then
    for mseFullPathTo_MSE_FunctionScriptFile in "${mseFullPathTo_MSE_SelectedFunctionScriptFiles[@]}"; do
      mseFullPathTo_MSE_FunctionScriptDirectory=$(echo "${mseFullPathTo_MSE_FunctionScriptFile%/*}")

      msePartialPath="${mseFullPathTo_MSE_FunctionScriptDirectory/${msePathTo_SRC_Directory}/}"
      mseFunctionName="${msePartialPath//\//_}"

      if [[ "${mseFunctionName}" == *__main ]]; then
        mseFunctionName="${mseFunctionName/__main/}"
      fi

      MSE_MD_UTEST_FUNCTIONS_TO_TEST[${mseFunctionName}]="${mseFullPathTo_MSE_FunctionScriptFile}"
    done
  fi
}



utestRegisterDependenciesScripts
utestRegisterFunctionScripts
utestRegisterTestsScripts

mse_md_utest_execute "${1}" "${2}"
