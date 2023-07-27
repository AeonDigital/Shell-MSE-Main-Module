#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]


test_mse_interface_show_prompt() {
  testResult="-"
  testExpected="-"

  mse_md_utest_assertEqual



  local mseTestShowPromptInShell="0"
  if [ "${mseTestShowPromptInShell}" == "1" ]; then
    echo "---"

    mse_interface_show_prompt "" "fr" "Você é um usuário root?" "bool"
    echo "you choose: ${MSE_PROMPT_RESULT}"


    echo "---"
    unset mseTestPromptAssocValues
    declare -A mseTestPromptAssocValues
    mseTestPromptAssocValues["value01"]="1::01::v1::val1"
    mseTestPromptAssocValues["value02"]="2::02::v2::val2"
    mseTestPromptAssocValues["value03"]="3::03::v3::val3"
    mse_interface_show_prompt "" "or" "Escolha um dos valores:" "list" "mseTestPromptAssocValues"
    echo "you choose: ${MSE_PROMPT_RESULT}"


    echo "---"
    unset mseTestPromptAssocValues
    declare -A mseTestPromptAssocValues
    mseTestPromptAssocValues["ac"]="Acre"
    mseTestPromptAssocValues["al"]="Alagoas"
    mseTestPromptAssocValues["ap"]="Amapá"
    mseTestPromptAssocValues["am"]="Amazonas"
    mseTestPromptAssocValues["ba"]="Bahia"
    mseTestPromptAssocValues["ce"]="Ceará"
    mseTestPromptAssocValues["df"]="Distrito Federal"
    mseTestPromptAssocValues["es"]="Espírito Santo"
    mseTestPromptAssocValues["go"]="Goiás"
    mseTestPromptAssocValues["ma"]="Maranhão"
    mseTestPromptAssocValues["mt"]="Mato Grosso"
    mseTestPromptAssocValues["ms"]="Mato Grosso do Sul"
    mseTestPromptAssocValues["mg"]="Minas Gerais"
    mseTestPromptAssocValues["pa"]="Pará"
    mseTestPromptAssocValues["pb"]="Paraíba"
    mseTestPromptAssocValues["pr"]="Paraná"
    mseTestPromptAssocValues["pe"]="Pernambuco"
    mseTestPromptAssocValues["pi"]="Piauí"
    mseTestPromptAssocValues["rj"]="Rio de Janeiro"
    mseTestPromptAssocValues["rn"]="Rio Grande do Norte"
    mseTestPromptAssocValues["rs"]="Rio Grande do Sul"
    mseTestPromptAssocValues["ro"]="Rondônia"
    mseTestPromptAssocValues["rr"]="Roraima"
    mseTestPromptAssocValues["sc"]="Santa Catarina"
    mseTestPromptAssocValues["sp"]="São Paulo"
    mseTestPromptAssocValues["se"]="Sergipe"
    mseTestPromptAssocValues["to"]="Tocantins"

    mse_interface_show_prompt "" "ca" "Indique o seu estado:" "list" "mseTestPromptAssocValues" "0"
    echo "you choose: ${MSE_PROMPT_RESULT}"
  fi
}