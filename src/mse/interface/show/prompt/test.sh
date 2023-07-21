#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]


test_mse_interface_show_prompt() {
  testResult="-"
  testExpected="-"

  mse_md_utest_assertEqual



  local mseTestShowPromptInShell="1"
  if [ "${mseTestShowPromptInShell}" == "1" ]; then
    echo "---"
    # Mostra um prompt booleano
    mse_interface_show_prompt "" "friendly" "Você é um usuário root?" "bool"

    # echo "---"
    # # Mostra um prompt de lista de valores
    # unset mseTestPromptAssocValues
    # declare -A mseTestPromptAssocValues
    # mseTestPromptAssocValues["value01"]="1::01::v1::val1"
    # mseTestPromptAssocValues["value02"]="2::02::v2::val2"
    # mseTestPromptAssocValues["value03"]="3::03::v3::val3"
    # mse_inter_showPrompt "" "ordinary" "Escolha um dos valores:" "list" "mseTestPromptAssocValues"


    # echo "---"
    # # Mostra um prompt de lista de valores grande cuja verificação será feita usando case insensitive
    # unset mseTestPromptAssocValues
    # declare -A mseTestPromptAssocValues
    # mseTestPromptAssocValues["ac"]="Acre"
    # mseTestPromptAssocValues["al"]="Alagoas"
    # mseTestPromptAssocValues["ap"]="Amapá"
    # mseTestPromptAssocValues["am"]="Amazonas"
    # mseTestPromptAssocValues["ba"]="Bahia"
    # mseTestPromptAssocValues["ce"]="Ceará"
    # mseTestPromptAssocValues["df"]="Distrito Federal"
    # mseTestPromptAssocValues["es"]="Espírito Santo"
    # mseTestPromptAssocValues["go"]="Goiás"
    # mseTestPromptAssocValues["ma"]="Maranhão"
    # mseTestPromptAssocValues["mt"]="Mato Grosso"
    # mseTestPromptAssocValues["ms"]="Mato Grosso do Sul"
    # mseTestPromptAssocValues["mg"]="Minas Gerais"
    # mseTestPromptAssocValues["pa"]="Pará"
    # mseTestPromptAssocValues["pb"]="Paraíba"
    # mseTestPromptAssocValues["pr"]="Paraná"
    # mseTestPromptAssocValues["pe"]="Pernambuco"
    # mseTestPromptAssocValues["pi"]="Piauí"
    # mseTestPromptAssocValues["rj"]="Rio de Janeiro"
    # mseTestPromptAssocValues["rn"]="Rio Grande do Norte"
    # mseTestPromptAssocValues["rs"]="Rio Grande do Sul"
    # mseTestPromptAssocValues["ro"]="Rondônia"
    # mseTestPromptAssocValues["rr"]="Roraima"
    # mseTestPromptAssocValues["sc"]="Santa Catarina"
    # mseTestPromptAssocValues["sp"]="São Paulo"
    # mseTestPromptAssocValues["se"]="Sergipe"
    # mseTestPromptAssocValues["to"]="Tocantins"

    # mse_inter_showPrompt "" "caution" "Indique o seu estado:" "list" "mseTestPromptAssocValues"
  fi


}