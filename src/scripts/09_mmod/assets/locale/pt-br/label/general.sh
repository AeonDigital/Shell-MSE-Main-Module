#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







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
