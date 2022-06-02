#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







#
# Main Module
lbl_mmod_invalidModuleName="The module name indicated is invalid. Use the \"mse_mmod_showModules\" function to get a list of valid options. [ \"[[MODULE]]\" ]"


#
# Interface
lbl_inter_alert_header_info="Information"
lbl_inter_alert_header_attention="Attention"
lbl_inter_alert_header_warning="Warning"
lbl_inter_alert_header_error="Error"
lbl_inter_alert_header_fail="Fail"
lbl_inter_alert_header_success="Success"

lbl_inter_wait_user_any_key="Press any key to proceed"

lbl_inter_prompt_invalidValue="Invalid value \"[[VALUE]]\"."

#
# Coleção de opções aceitas para um 'prompt' do tipo 'bool'.
unset lbl_inter_prompt_boolLabels
lbl_inter_prompt_boolLabels=(
  "yes" "y" "no" "n"
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
lbl_font_showTextColors_TableHeaders="Color:Raw:Variable:Appearance"
lbl_font_showTextColors_UseCodeExample="Use the number of the selected color in the place of 'X': "



#
# Falhas na passagem de argumentos, parametros ou variáveis
lbl_err_lostParameters="Lost [[LOST]] parameters."
lbl_err_variableAlreadExists="Variable \"[[VAR]]\" already exists"
lbl_err_variableDoNotExists="Variable \"[[VAR]]\" do not exists"
lbl_err_variableDoNotExistsInSection="Variable \"[[VAR]]\" do not exists in \"[[SECTION]]\" section"

lbl_err_paramA_HasInvalidValue="Parameter \"[[PARAM_A]]\" has an invalid value"
lbl_err_paramA_HasInvalidOption="Parameter \"[[PARAM_A]]\" has an invalid option"
lbl_err_paramA_IsRequired="Parameter \"[[PARAM_A]]\" is required"
lbl_err_paramA_IsNot_A="Parameter \"[[PARAM_A]]\" is not a [[A]]"
lbl_err_paramA_IsNotAn_A="Parameter \"[[PARAM_A]]\" is not an [[A]]"
lbl_err_paramA_IsGreaterThanMaxLength="Parameter \"[[PARAM_A]]\" is greater than the defined max length ( [[MAXLENGTH]] )"
lbl_err_paramA_IsNotValid_A_RepresentationOf_B="Parameter \"[[PARAM_A]]\" is not a valid [[A]] representation of [[B]]"
lbl_err_paramA_MustBeGreaterOrEqualsThan_A="Parameter \"[[PARAM_A]]\" must be greater or equals than [[A]]"
lbl_err_paramA_MustBeLessOrEqualsThan_A="Parameter \"[[PARAM_A]]\" must be less or equals than [[A]]"
lbl_err_paramA_MustBeNameOfExistentFunction="Parameter \"[[PARAM_A]]\" must be a name of a existent function"

lbl_err_cannotCreateNewFileIn="Cannot create a new file in [[LOCAL]]"
lbl_err_paramA_PointsToNonExistentFile="Parameter \"[[PARAM_A]]\" points to a non existent file"

lbl_err_cannotCreateNewDirectoryIn="Cannot create a new directory in [[LOCAL]]"
lbl_err_paramA_PointsToNonExistentDirectory="Parameter \"[[PARAM_A]]\" points to a non existent directory"

lbl_err_paramA_MustBeAnArray="Parameter \"[[PARAM_A]]\" must be an array"
lbl_err_paramA_MustBeAnAssocArray="Parameter \"[[PARAM_A]]\" must be an associative array"
lbl_err_paramA_IsAnEmptyArray="Parameter \"[[PARAM_A]]\" is an empty array"
lbl_err_paramA_BothArraysMustHaveSameNumberOfElements="Parameters \"[[PARAM_A]]\" and \"[[PARAM_B]]\" must have the same number of elements"
lbl_err_paramA_MustBeAnArrayWithAtLast_Min="Parameter \"[[PARAM_A]]\" must be an array with at least [[MIN]] elements"
lbl_err_paramA_MustBeAnArrayWithAtLast_Max="Parameter \"[[PARAM_A]]\" must be an array with at most [[MAX]] elements"
lbl_err_paramA_LostTheRequiredKey_Key="Parameter \"[[PARAM_A]]\" lost the required key \"[[KEY]]\""

lbl_err_paramA_RequiredFor_A_Operation="Parameter \"[[PARAM_A]]\" is required for \"[[A]]\" operation"



#
# [ vp_ipd = validateParans invalid parameter definition ]
lbl_exec_vp_ipd_mainMessage="Invalid parameter definition; [ [[MSG]] ]"

lbl_exec_vp_ipd_fieldA_CannotBeEmpty="[[FIELDNAME_A]] field cannot be empty"
lbl_exec_vp_ipd_fieldA_HasAnInvalidValue="[[FIELDNAME_A]] field has an invalid value"
lbl_exec_vp_ipd_fieldA_HasAnInvalidOption="[[FIELDNAME_A]] field has an invalid option"
lbl_exec_vp_ipd_fieldA_PointsToNonExistentFunction="[[FIELDNAME_A]] field points to non existent function"
lbl_exec_vp_ipd_fieldA_MustBeAnInteger="[[FIELDNAME_A]] field must be an integer"
lbl_exec_vp_ipd_fieldA_MustBeGreaterThanZero="[[FIELDNAME_A]] field must be greater than 0"
lbl_exec_vp_ipd_fieldA_IsGreaterThan_FieldB="[[FIELDNAME_A]] field is greater than [[FIELDNAME_B]] field"
lbl_exec_vp_ipd_forTypeA_FieldA_MustBeGreaterOrEqualsToZero="For \"[[TYPE_A]]\" type, [[FIELDNAME_A]] field must be greater or equals to 0"
lbl_exec_vp_ipd_forTypeA_FieldA_MustBeGreaterOrEqualsToOne="For \"[[TYPE_A]]\" type, [[FIELDNAME_A]] field must be greater or equals to 1"
lbl_exec_vp_ipd_fieldA_LostThe_A_Collection="[[FIELDNAME_A]] field lost the [[A]] collection"
lbl_exec_vp_ipd_fieldA_HasAnEmpty_A_Collection="[[FIELDNAME_A]] field has an empty [[A]] collection"
lbl_exec_vp_ipd_fieldA_HasAnIncorrectCorrelationBetween_A_and_B="[[FIELDNAME_A]] field has an incorrect correlation between [[A]] and [[B]]"


#
# [ fw_iv = file_write has an invalid value ]
lbl_fw_iv_mainMessage="Parameter \"[[PARAM_A]]\" has an invalid value [ [[MSG]] ]"

lbl_fw_iv_expectedFunctionNameOrInteger="Expected a function name or one/two integers; \"[[FUNCTION]]\": \"[[RESULT]]\"  :: [[ERR]]"
lbl_fw_iv_firstLineMustBeLessThanTheLast="First line must be less than the last: \"[[RESULT]]\""
lbl_fw_iv_outsideTheFileLimits="Outside the file limits; 1 - [[LASTLINE]]"
lbl_fw_iv_errorOnSave="Error on save. Do you have permissions to change the target file?"


#
# [ cf = conf ]
lbl_cf_cannotIdentifyTargetLine="Cannot identify the target line to perform this operation."


#
# [ mmod ]
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
lbl_update_updateSuccess="All modules has been updated"
lbl_update_updateFail="An unexpected failure occurred and the modules could not be updated [ [[ERRCODE]] ]"

lbl_uninstall_uninstallStart="Starting uninstall of \"myShellEnv\""
lbl_uninstall_uninstallPromptTitle="Confirm this action to proceed"

lbl_uninstall_uninstallPromptMessage=()
lbl_uninstall_uninstallPromptMessage+=("This action cannot be undone.")
lbl_uninstall_uninstallPromptMessage+=("All data and settings of all currently installed modules")
lbl_uninstall_uninstallPromptMessage+=("will be permanently lost.")
lbl_uninstall_uninstallPromptMessage+=("")
lbl_uninstall_uninstallPromptMessage+=("Are you sure you want to proceed?")

lbl_uninstall_uninstallAborted="Action interrupted by the user."

lbl_uninstall_uninstallError=("Operation aborted.")
lbl_uninstall_uninstallErrorRemoveDir="Cannot remove the \"myShellEnv\" directory."

lbl_uninstall_uninstallSuccess="Uninstallation completed."
