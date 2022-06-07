#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







#
# Main Module
lbl_mmod_invalidModuleName="O nome do módulo indicado é inválido. Use a função \"mse_mmod_showModules\" para ver uma lista de opções válidas. [ \"[[MODULE]]\" ]"


#
# Interface
lbl_inter_alert_header_info="Informação"
lbl_inter_alert_header_attention="Atenção"
lbl_inter_alert_header_warning="Alerta"
lbl_inter_alert_header_error="Erro"
lbl_inter_alert_header_fail="Falha"
lbl_inter_alert_header_success="Sucesso"

lbl_inter_wait_user_any_key="Precione qualquer tecla para prosseguir"

lbl_inter_prompt_invalidValue="O valor \"[[VALUE]]\" é inválido."

#
# Coleção de opções aceitas para um 'prompt' do tipo 'bool'.
unset lbl_inter_prompt_boolLabels
lbl_inter_prompt_boolLabels=(
  "sim" "s" "não" "n"
)

#
# Coleção de valores correspondentes às opções de 'labels' de um 'prompt'
# do tipo 'bool'.
unset lbl_inter_prompt_boolValues
lbl_inter_prompt_boolValues=(
  1 1 0 0
)



#
# Fontes e Backgrounds
lbl_font_showTextColors_TableHeaders="Cor:Raw:Variavel:Aparencia"
lbl_font_showTextColors_UseCodeExample="Use o número da cor desejada no lugar do 'X': "



#
# Falhas na passagem de argumentos, parametros ou variáveis
lbl_err_lostParameters="Foram perdidos [[LOST]] parametros."
lbl_err_variableAlreadExists="Variável \"[[VAR]]\" já existe"
lbl_err_variableDoNotExists="Variável \"[[VAR]]\" não existe"
lbl_err_variableDoNotExistsInSection="Variável \"[[VAR]]\" não existe na seção \"[[SECTION]]\""

lbl_err_paramA_HasInvalidValue="Parametro \"[[PARAM_A]]\" foi definido com um valor inválido"
lbl_err_paramA_HasInvalidOption="Parametro \"[[PARAM_A]]\" foi definido com uma opção inválida"
lbl_err_paramA_IsOutOfRange="Parametro \"[[PARAM_A]]\" está fora dos limites"
lbl_err_paramA_IsRequired="Parametro \"[[PARAM_A]]\" é obrigatório"
lbl_err_paramA_IsNot_A="Parametro \"[[PARAM_A]]\" não é um [[A]]"
lbl_err_paramA_IsNotAn_A="Parametro \"[[PARAM_A]]\" não é um [[A]]"
lbl_err_paramA_IsGreaterThanMaxLength="Parametro \"[[PARAM_A]]\" é maior do que o tamanho máximo permitido ( [[MAXLENGTH]] )"
lbl_err_paramA_IsNotValid_A_RepresentationOf_B="Parametro \"[[PARAM_A]]\" não é um representante [[A]] de um [[B]]"
lbl_err_paramA_MustBeGreaterOrEqualsThan_A="Parametro \"[[PARAM_A]]\" deve ser maior ou igual a [[A]]"
lbl_err_paramA_MustBeLessOrEqualsThan_A="Parametro \"[[PARAM_A]]\" deve ser menor ou igual a [[A]]"
lbl_err_paramA_MustBeNameOfExistentFunction="Parametro \"[[PARAM_A]]\" deve ser o nome de uma função existente"

lbl_err_cannotCreateNewFileIn="Não foi possível criar um novo arquivo em [[LOCAL]]"
lbl_err_paramA_PointsToNonExistentFile="Parametro \"[[PARAM_A]]\" aponta para um arquivo inexistente"

lbl_err_cannotCreateNewDirectoryIn="Não foi possível criar um novo diretório em [[LOCAL]]"
lbl_err_paramA_PointsToNonExistentDirectory="Parametro \"[[PARAM_A]]\" aponta para um diretório inexistente"

lbl_err_paramA_MustBeAnArray="Parametro \"[[PARAM_A]]\" deve ser um array"
lbl_err_paramA_MustBeAnAssocArray="Parametro \"[[PARAM_A]]\" deve ser um array associativo"
lbl_err_paramA_IsAnEmptyArray="Parametro \"[[PARAM_A]]\" é um array vazio"
lbl_err_paramA_BothArraysMustHaveSameNumberOfElements="Parametros \"[[PARAM_A]]\" e \"[[PARAM_B]]\" devem ter o mesmo número de elementos"
lbl_err_paramA_MustBeAnArrayWithAtLast_Min="Parametro \"[[PARAM_A]]\" deve ser um array com ao menos [[MIN]] elementos"
lbl_err_paramA_MustBeAnArrayWithAtLast_Max="Parametro \"[[PARAM_A]]\" deve ser um array com no máximo [[MAX]] elementos"
lbl_err_paramA_LostTheRequiredKey_Key="Parametro \"[[PARAM_A]]\" não possui a chave \"[[KEY]]\" exigida"

lbl_err_paramA_RequiredFor_A_Operation="Parametro \"[[PARAM_A]]\" é exigido para a operação do tipo \"[[A]]\""

lbl_err_checkForValidOptionsUsingFunction="Verifique por opções válidas usando a função \"[[FUNCTION]]\""
lbl_err_chooseOneOfThisOptions="Escolha uma destas opções: "



#
# [ vp_ipd = validateParans invalid parameter definition ]
lbl_exec_vp_ipd_mainMessage="Definição de parametro inválida; [ [[MSG]] ]"

lbl_exec_vp_ipd_fieldA_CannotBeEmpty="O Campo [[FIELDNAME_A]] não pode ser vazio"
lbl_exec_vp_ipd_fieldA_HasAnInvalidValue="O Campo [[FIELDNAME_A]] possui um valor inválido"
lbl_exec_vp_ipd_fieldA_HasAnInvalidOption="O Campo [[FIELDNAME_A]] possui uma opção inválida "
lbl_exec_vp_ipd_fieldA_PointsToNonExistentFunction="O Campo [[FIELDNAME_A]] aponta para uma função inexistente"
lbl_exec_vp_ipd_fieldA_MustBeAnInteger="O Campo [[FIELDNAME_A]] deve ser um inteiro"
lbl_exec_vp_ipd_fieldA_MustBeGreaterThanZero="O Campo [[FIELDNAME_A]] deve ser maior que 0"
lbl_exec_vp_ipd_fieldA_IsGreaterThan_FieldB="O Campo [[FIELDNAME_A]] é maior que o campo [[FIELDNAME_B]]"
lbl_exec_vp_ipd_forTypeA_FieldA_MustBeGreaterOrEqualsToZero="Para o tipo \"[[TYPE_A]]\", o campo [[FIELDNAME_A]] deve ser maior ou igual a 0"
lbl_exec_vp_ipd_forTypeA_FieldA_MustBeGreaterOrEqualsToOne="Para o tipo \"[[TYPE_A]]\", o campo [[FIELDNAME_A]] deve ser maior ou igual a 1"
lbl_exec_vp_ipd_fieldA_LostThe_A_Collection="O Campo [[FIELDNAME_A]] não possui a coleção do tipo [[A]]"
lbl_exec_vp_ipd_fieldA_HasAnEmpty_A_Collection="O Campo [[FIELDNAME_A]] possui uma coleção vazia do tipo [[A]]"
lbl_exec_vp_ipd_fieldA_HasAnIncorrectCorrelationBetween_A_and_B="O Campo [[FIELDNAME_A]] possui uma correlação incorreta entre [[A]] e [[B]]"


#
# [ fw_iv = file_write has an invalid value ]
lbl_fw_iv_mainMessage="Parametro \"[[PARAM_A]]\" possui um valor inválido [ [[MSG]] ]"

lbl_fw_iv_expectedFunctionNameOrInteger="É experado o nome de uma função ou um/dois inteiros; \"[[FUNCTION]]\": \"[[RESULT]]\"  :: [[ERR]]"
lbl_fw_iv_firstLineMustBeLessThanTheLast="A primeira linha precisa ser um número menor do que a última: \"[[RESULT]]\""
lbl_fw_iv_outsideTheFileLimits="Definição fora dos limites do arquivo; 1 - [[LASTLINE]]"
lbl_fw_iv_errorOnSave="Erro ao salvar. Você tem permissão para alterar o arquivo alvo?"


#
# [ cf = conf ]
lbl_cf_cannotIdentifyTargetLine="Não foi possível identificar a linha alvo para executar esta operação."


#
# [ mmod ]
lbl_generic_confirmActionToProceed="Confirme esta ação para prosseguir"
lbl_generic_actionAbortedByTheUser="Ação interrompida pelo usuário."
lbl_generic_scriptInterruptedError=("Operação interrompida.")

lbl_showMetaSummary_moreDetails="Para mais detalhes use a função \"mse_mmod_showMetaData\"."

lbl_man_enterAFunction="Entre o nome de uma função."
lbl_man_functionDoesNotExists="A função \"[[FUNCTION]]\" não existe."
lbl_man_searchForAValidFunction="Para pesquisar por uma função válida use \"mse_mmod_showMetaData\"."
lbl_man_couldNotFindHelpForFunction="Não foi possível encontrar uma ajuda para a função \"[[FUNCTION]]\""
lbl_man_fileOfFunctionNotFound="O arquivo da função não foi encontrado em [[PATH]]"
lbl_man_noUsageDescriptionFoundForFunction="Nenhuma descrição de uso foi encontrada para a função"

lbl_searchFunction_enterAFunction="Entre o nome da função."

lbl_cmd_commandNotFound="O comando \"[[CMD]]\" não foi encontrado."

lbl_generateStandalone_moduleNotFound="Módulo não encontrado."
lbl_update_updateStart="Atualizando todos os módulos \"myShellEnv\"."
lbl_update_updateSuccess="Todos os módulos foram atualizados"
lbl_update_updateFail="Uma falha inesperada ocorreu e não foi possível atualizar todos os módulos [ [[ERRCODE]] ]"

lbl_uninstall_uninstallStart="Iniciando desinstalação do \"myShellEnv\""

lbl_uninstall_uninstallPromptMessage=()
lbl_uninstall_uninstallPromptMessage+=("Esta ação não pode ser desfeita.")
lbl_uninstall_uninstallPromptMessage+=("Todos os dados e configurações de todos os módulos atualmente instalados")
lbl_uninstall_uninstallPromptMessage+=("serão perdidos permanentemente.")
lbl_uninstall_uninstallPromptMessage+=("")
lbl_uninstall_uninstallPromptMessage+=("Você tem certeza que deseja prosseguir?")

lbl_uninstall_uninstallErrorRemoveDir="Não foi possível remover o diretório \"myShellEnv\"."

lbl_uninstall_uninstallSuccess="Uninstallation completed."

lbl_submoduleInstall_addNew="Adicionando novo módulo."
lbl_submoduleInstall_addSuccess="O novo módulo foi adicionado com sucesso"
lbl_submoduleInstall_addFail="Houve uma falha inesperada ao tentar adicionar o novo módulo"
lbl_submoduleInstall_confirmAction="Você tem certeza que deseja adicionar o submódulo [[SUBMODULE]] à sua instância do \"myShellEnv\"?"
lbl_submoduleInstall_alreadExists="Este submódulo já está adicionado em seu \"myShellEnv\"."
