#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]


test_mse_interface_show_prompt() {
  testResult="-"
  testExpected="-"

  mse_md_utest_assertEqual



  local mseTestShowPromptInShell="0"
  if [ "${mseTestShowPromptInShell}" == "1" ]; then
    echo "---"
    mse_interface_show_prompt "" "fr" "You are root user?" "b"
    echo "you choose: ${MSE_PROMPT_RESULT}"


    echo "---"
    unset mseTestPromptAssocValues
    declare -A mseTestPromptAssocValues
    mseTestPromptAssocValues["value01"]="1 01 v1 val1 'valor 1'"
    mseTestPromptAssocValues["value02"]="2 02 v2 val2 'valor 2'"
    mseTestPromptAssocValues["value03"]="3 03 v3 val3 'valor 3'"
    mse_interface_show_prompt "" "or" "Pick one value:" "l" "mseTestPromptAssocValues" "0"
    echo "you choose: ${MSE_PROMPT_RESULT}"


    echo "---"
    unset mseTestPromptAssocValues
    declare -A mseTestPromptAssocValues
    mseTestPromptAssocValues["ac"]="1 Acre"
    mseTestPromptAssocValues["al"]="2 Alagoas"
    mseTestPromptAssocValues["am"]="3 Amazonas"
    mseTestPromptAssocValues["ap"]="4 Amapá"
    mseTestPromptAssocValues["ba"]="5 Bahia"
    mseTestPromptAssocValues["ce"]="6 Ceará"
    mseTestPromptAssocValues["df"]="7 'Distrito Federal'"
    mseTestPromptAssocValues["es"]="8 'Espírito Santo'"
    mseTestPromptAssocValues["go"]="9 Goiás"
    mseTestPromptAssocValues["ma"]="10 Maranhão"
    mseTestPromptAssocValues["mg"]="11 'Minas Gerais'"
    mseTestPromptAssocValues["ms"]="12 'Mato Grosso do Sul'"
    mseTestPromptAssocValues["mt"]="13 'Mato Grosso'"
    mseTestPromptAssocValues["pa"]="14 Pará"
    mseTestPromptAssocValues["pb"]="15 Paraíba"
    mseTestPromptAssocValues["pe"]="16 Pernambuco"
    mseTestPromptAssocValues["pi"]="17 Piauí"
    mseTestPromptAssocValues["pr"]="18 Paraná"
    mseTestPromptAssocValues["rj"]="19 'Rio de Janeiro'"
    mseTestPromptAssocValues["rn"]="20 'Rio Grande do Norte'"
    mseTestPromptAssocValues["ro"]="21 Rondônia"
    mseTestPromptAssocValues["rr"]="22 Roraima"
    mseTestPromptAssocValues["rs"]="23 'Rio Grande do Sul'"
    mseTestPromptAssocValues["sc"]="24 'Santa Catarina'"
    mseTestPromptAssocValues["se"]="25 Sergipe"
    mseTestPromptAssocValues["sp"]="26 'São Paulo'"
    mseTestPromptAssocValues["to"]="27 Tocantins"

    mse_interface_show_prompt "" "ca" "Select one brasilian UF:" "l" "mseTestPromptAssocValues" "0" "1"
    echo "you choose: ${MSE_PROMPT_RESULT}"



    echo "---"
    mse_interface_show_prompt "" "fr" "Type your name: "
    echo "you typed: ${MSE_PROMPT_RESULT}"
  fi
}