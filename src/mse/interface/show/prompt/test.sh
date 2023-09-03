#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]


test_mse_interface_show_prompt() {
  testResult="-"
  testExpected="-"

  mse_md_utest_assertEqual



  local mseTestShowPromptInShell="1"
  if [ "${mseTestShowPromptInShell}" == "1" ]; then
    echo "---"

    mse_interface_show_prompt "" "fr" "Você é um usuário root?" "b"
    echo "you choose: ${MSE_PROMPT_RESULT}"


    echo "---"
    unset mseTestPromptAssocValues
    declare -A mseTestPromptAssocValues
    mseTestPromptAssocValues["value01"]="1 01 v1 val1 'valor 1'"
    mseTestPromptAssocValues["value02"]="2 02 v2 val2 'valor 2'"
    mseTestPromptAssocValues["value03"]="3 03 v3 val3 'valor 3'"
    mse_interface_show_prompt "" "or" "Escolha um dos valores:" "l" "mseTestPromptAssocValues" "0"
    echo "you choose: ${MSE_PROMPT_RESULT}"


    echo "---"
    unset mseTestPromptAssocValues
    declare -A mseTestPromptAssocValues
    mseTestPromptAssocValues["ac"]="1 Acre"
    mseTestPromptAssocValues["al"]="2 Alagoas"
    mseTestPromptAssocValues["ap"]="3 Amapá"
    mseTestPromptAssocValues["am"]="4 Amazonas"
    mseTestPromptAssocValues["ba"]="5 Bahia"
    mseTestPromptAssocValues["ce"]="6 Ceará"
    mseTestPromptAssocValues["df"]="7 'Distrito Federal'"
    mseTestPromptAssocValues["es"]="8 'Espírito Santo'"
    mseTestPromptAssocValues["go"]="9 Goiás"
    mseTestPromptAssocValues["ma"]="10 Maranhão"
    mseTestPromptAssocValues["mt"]="11 'Mato Grosso'"
    mseTestPromptAssocValues["ms"]="12 'Mato Grosso do Sul'"
    mseTestPromptAssocValues["mg"]="13 'Minas Gerais'"
    mseTestPromptAssocValues["pa"]="14 Pará"
    mseTestPromptAssocValues["pb"]="15 Paraíba"
    mseTestPromptAssocValues["pr"]="16 Paraná"
    mseTestPromptAssocValues["pe"]="17 Pernambuco"
    mseTestPromptAssocValues["pi"]="18 Piauí"
    mseTestPromptAssocValues["rj"]="19 'Rio de Janeiro'"
    mseTestPromptAssocValues["rn"]="20 'Rio Grande do Norte'"
    mseTestPromptAssocValues["rs"]="21 'Rio Grande do Sul'"
    mseTestPromptAssocValues["ro"]="22 Rondônia"
    mseTestPromptAssocValues["rr"]="23 Roraima"
    mseTestPromptAssocValues["sc"]="24 'Santa Catarina'"
    mseTestPromptAssocValues["sp"]="25 'São Paulo'"
    mseTestPromptAssocValues["se"]="26 Sergipe"
    mseTestPromptAssocValues["to"]="27 Tocantins"

    mse_interface_show_prompt "" "ca" "Indique o seu estado:" "l" "mseTestPromptAssocValues" "0" "1"
    echo "you choose: ${MSE_PROMPT_RESULT}"
  fi
}