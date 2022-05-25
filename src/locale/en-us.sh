#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







#
# Interface
lbl_inter_alert_header_info="Information"
lbl_inter_alert_header_attention="Attention"
lbl_inter_alert_header_warning="Warning"
lbl_inter_alert_header_error="Error"
lbl_inter_alert_header_fail="Fail"
lbl_inter_alert_header_success="Success"

lbl_inter_wait_user_any_key="Press any key to proceed"

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
#
# [ vp_ipd = validateParans :: invalid parameter definition ]
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
# [ vp = validateParans ]
lbl_exec_vp_paramA_HasInvalidValue="Parameter \"[[PARAM_A]]\" has an invalid value"
lbl_exec_vp_paramA_IsRequired="Parameter \"[[PARAM_A]]\" is required"
lbl_exec_vp_paramA_IsNot_A="Parameter \"[[PARAM_A]]\" is not a [[A]]"
lbl_exec_vp_paramA_IsNotAn_A="Parameter \"[[PARAM_A]]\" is not an [[A]]"
lbl_exec_vp_paramA_IsGreaterThanMaxLength="Parameter \"[[PARAM_A]]\" is greater than the defined max length ( [[MAXLENGTH]] )"
lbl_exec_vp_paramA_IsNotValid_A_RepresentationOf_B="Parameter \"[[PARAM_A]]\" is not a valid [[A]] representation of [[B]]"
lbl_exec_vp_paramA_MustBeGreaterOrEqualsThan_A="Parameter \"[[PARAM_A]]\" must be greater or equals than [[A]]"
lbl_exec_vp_paramA_MustBeLessOrEqualsThan_A="Parameter \"[[PARAM_A]]\" must be less or equals than [[A]]"
lbl_exec_vp_paramA_MustBeNameOfExistentFunction="Parameter \"[[PARAM_A]]\" must be a name of a existent function"

lbl_exec_vp_cannotCreateNewFileIn="Cannot create a new file in [[LOCAL]]"
lbl_exec_vp_paramA_PointsToNonExistentFile="Parameter \"[[PARAM_A]]\" points to a non existent file"

lbl_exec_vp_cannotCreateNewDirectoryIn="Cannot create a new directory in [[LOCAL]]"
lbl_exec_vp_paramA_PointsToNonExistentDirectory="Parameter \"[[PARAM_A]]\" points to a non existent directory"

lbl_exec_vp_paramA_MustBeAnArrayWithAtLast_Min="Parameter \"[[PARAM_A]]\" must be an array with at least [[MIN]] elements"
lbl_exec_vp_paramA_MustBeAnArrayWithAtLast_Max="Parameter \"[[PARAM_A]]\" must be an array with at most [[MAX]] elements"
lbl_exec_vp_paramA_LostTheRequiredKey_Key="Parameter \"[[PARAM_A]]\" lost the required key \"[[KEY]]\""
