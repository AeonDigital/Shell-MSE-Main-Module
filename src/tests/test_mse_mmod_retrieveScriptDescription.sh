#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







#
# Teste
test_mse_mmod_retrieveScriptDescription() {
  local mseTmpThisDir=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

  mse_mmod_retrieveScriptDescription "${mseTmpThisDir}/samples/mse_mmod_errorAlert.sh"
  local mseTmpTestExpected=(
    "Mostra uma mensagem de alerta para o usuário indicando um erro"
    "ocorrido em algum script."
  )

  #
  # Verifica se ambos arrays possuem o mesmo número de itens
  testResult=${#MSE_TMP_MODULE_SCRIPT_DESCRIPTION[@]}
  testExpected=${#mseTmpTestExpected[@]}

  mse_utest_assertEqual



  if [ "${testResult}" == "${testExpected}" ]; then
    #
    # Verifica se os valores retornados são compatíveis com o esperado
    local mseTotalExpectedLines=${#mseTmpTestExpected[@]}
    local mseExpectedI

    for (( mseExpectedI=0; mseExpectedI<${mseTotalExpectedLines}; mseExpectedI++ ));
    do
      testResult=${MSE_TMP_MODULE_SCRIPT_DESCRIPTION[$mseExpectedI]}
      testExpected=${mseTmpTestExpected[$mseExpectedI]}

      mse_utest_assertEqual
    done
  fi
}
