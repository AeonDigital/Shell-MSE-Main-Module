#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







#
# [ mmod ]
lbl_generic_confirmActionToProceed="Confirm this action to proceed"
lbl_generic_actionAbortedByTheUser="Action interrupted by the user."
lbl_generic_scriptInterruptedError=("Operation interrupted.")
lbl_generic_cannotFoundConfigFile="Cannot found configuration file."
lbl_generic_cannotSaveinFile="Cannot save."
lbl_generic_fileNotFound="File not found in \"[[FILE]]\"."
lbl_generic_checkConfigFile="Check if the configuration file exists."
lbl_generic_checkPermissions="Check your permissions to proceed this operation."
lbl_generic_save="Save."

lbl_showMetaSummary_moreDetails="For more details use the \"mse_mmod_showMetaData\" function."

lbl_man_enterAFunction="Enter the name of a function."
lbl_man_functionDoesNotExists="Function \"[[FUNCTION]]\" does not exists."
lbl_man_searchForAValidFunction="To search for a valid function use \"mse_mmod_showMetaData\"."
lbl_man_couldNotFindHelpForFunction="Could not find help information for \"[[FUNCTION]]\" function"
lbl_man_fileOfFunctionNotFound="File of function not found in [[PATH]]"
lbl_man_noUsageDescriptionFoundForFunction="No usage description found for target function"

lbl_searchFunction_enterAFunction="Enter the name of a function."

lbl_cmd_commandNotFound="Command \"[[CMD]]\" not found."

lbl_generateStandalone_moduleNotFound="Module name not found."
lbl_update_updateStart="Updating all \"myShellEnv\" modules."
lbl_update_updateSuccess="All modules and submodules has been updated"
lbl_update_updateFail="An unexpected failure occurred and the modules could not be updated [ [[ERRCODE]] ]"

lbl_uninstall_uninstallStart="Starting uninstall of \"myShellEnv\""

lbl_uninstall_uninstallPromptMessage=()
lbl_uninstall_uninstallPromptMessage+=("This action cannot be undone.")
lbl_uninstall_uninstallPromptMessage+=("All data and settings of all currently installed modules")
lbl_uninstall_uninstallPromptMessage+=("will be permanently lost.")
lbl_uninstall_uninstallPromptMessage+=("")
lbl_uninstall_uninstallPromptMessage+=("Are you sure you want to proceed?")

lbl_uninstall_uninstallErrorRemoveDir="Cannot remove the \"myShellEnv\" directory."

lbl_uninstall_uninstallSuccess="Uninstallation completed."

lbl_submoduleInstall_addNew="Adding new module."
lbl_submoduleInstall_addSuccess="The new module has been added successfully"
lbl_submoduleInstall_addFail="There was an unexpected failure trying to add the new module"
lbl_submoduleInstall_confirmAction="Are you sure you want to add the \"[[SUBMODULE]]\" submodule to your \"myShellEnv\" instance?"
lbl_submoduleInstall_alreadExists="This submodule is already added in your \"myShellEnv\"."
lbl_submoduleInstall_unableToEditConfigFile="Unable to edit configuration file \"[[FILE]]\"."
lbl_submoduleInstall_unableToEditConfigFile_msg=()
lbl_submoduleInstall_unableToEditConfigFile_msg+=("The module has been successfully installed but will not")
lbl_submoduleInstall_unableToEditConfigFile_msg+=("be loaded until its entry in the global variable \"MSE_AVAILABLE_MODULES\" is set.")

lbl_submoduleUninstall_submoduleDoesNotExists="The indicated submodule is not installed."
lbl_submoduleUninstall_cannotRemove="An error occurred and the submodule could not be uninstalled."
lbl_submoduleUninstall_unableToEditConfigFile="Unable to edit configuration file \"[[FILE]]\"."
