#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]



mse_man() {
  local mseReturn="0"
  local mseMessage=""

  local mseTarget="${1}"
  local msePathToFileManual=""


  if [ -f "${mseTarget}" ]; then
    if [ "${mseTarget##*.}" != "md" ]; then
      mseMessage="The indicated file does not have the \".md\" extension."
    else
      msePathToFileManual="${mseTarget}"
    fi
  else
    if [ "${MSE_GLOBAL_FUNCTIONS_TO_MANUALS[$mseTarget]}" == "" ]; then
      mseMessage="The name of the function \"${mseTarget}\" does not match any manual."
    else
      msePathToFileManual="${MSE_GLOBAL_FUNCTIONS_TO_MANUALS[$mseTarget]}"
    fi
  fi


  if [ "${msePathToFileManual}" != "" ]; then
    unset mseAssocCompiledMan
    declare -A mseAssocCompiledMan
    unset mseArrCompileManOrder
    declare -a mseArrCompileManOrder=()


    local msePathToCompiledFileManual="${msePathToFileManual/\.md/\.cman}"
    if [ ! -f "${msePathToCompiledFileManual}" ]; then
      mse_man_write_compiled_data "${msePathToFileManual}" "mseAssocCompiledMan" "mseArrCompileManOrder" "${msePathToCompiledFileManual}"
    else
      mse_man_read_compiled_data "${msePathToCompiledFileManual}" "mseAssocCompiledMan" "mseArrCompileManOrder"
    fi

    # SEGUIR DAQUI...
    # ESTÁ CRIANDO MANUAIS COMPILADOS E LENDO-OS QUANDO OS MESMOS EXISTEM...
    # AGORA É HORA DE GERAR A FORMATAÇÃO DE EXIBIÇÃO PARA O USUÁRIO.
  fi



  if [ "${mseMessage}" != "" ]; then
    echo -e "${mseMessage}"
  fi

  return "${mseReturn}"
}

#
# Agora é necessário criar um header para ele com meta informações que possam
# agilizar o processo de extração de dados do manual.
#
# Uma das coisas que penso neste momento é a lista de parametros disponíveis.
# Talvez até mesmo uma versão simples do manual constando o nome da função e seu sumário?

# Também é necessário ver como/onde salvar estes dados compilados pois são estes
# que serão acessados pelo comando principal 'mse_man'... caso não seja encontrado o mesmo
# será criado.

# A função principal não foi finalizada pois ela seria totalmente reescrita usando
# as demais funções auxiliares.
