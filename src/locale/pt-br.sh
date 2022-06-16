#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







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
lbl_generic_cannotFoundConfigFile="Arquivo de configuração não foi encontrado."
lbl_generic_cannotSaveinFile="Não foi possível salvar."
lbl_generic_fileNotFound="O arquivo \"[[FILE]]\" não foi encontrado."
lbl_generic_checkConfigFile="Verifique se o arquivo de configuração existe."
lbl_generic_checkPermissions="Verifique suas permissões para efetuar esta operação."
lbl_generic_save="Salvo."

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
lbl_update_updateSuccess="Todos os módulos e submódulos foram atualizados"
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
lbl_submoduleInstall_unableToEditConfigFile="Não foi possível editar o arquivo de configuração  \"[[FILE]]\"."
lbl_submoduleInstall_unableToEditConfigFile_msg=()
lbl_submoduleInstall_unableToEditConfigFile_msg+=("O módulo foi instalado com sucesso mas não será")
lbl_submoduleInstall_unableToEditConfigFile_msg+=("carregado até que sua entrada na variável global \"MSE_AVAILABLE_MODULES\" seja definida.")

lbl_submoduleUninstall_submoduleDoesNotExists="O submódulo indicado não está instalado."
lbl_submoduleUninstall_cannotRemove="Um erro ocorreu e não possível desinstalar o submódulo."
lbl_submoduleUninstall_unableToEditConfigFile="Não foi possível editar o arquivo de configuração \"[[FILE]]\"."
