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
lbl_exec_vp_ipd_fieldA_IsGreaterThan_FieldB="[[FIELDNAME_A]] field is greater than [[FIELDNAME_B]]"
lbl_exec_vp_ipd_forTypeA_FieldA_MustBeGreaterOrEqualsToZero="For \"[[TYPE_A]]\" type, [[FIELDNAME_A]] field must be greater or equals to 0"
lbl_exec_vp_ipd_forTypeA_FieldA_MustBeGreaterOrEqualsToOne="For \"[[TYPE_A]]\" type, [[FIELDNAME_A]] field must be greater or equals to 1"
lbl_exec_vp_ipd_fieldA_LostThe_A_Collection="[[FIELDNAME_A]] field lost the [[A]] collection"
lbl_exec_vp_ipd_fieldA_HasAnEmpty_A_Collection="[[FIELDNAME_A]] field has an empty [[A]] collection"
lbl_exec_vp_ipd_fieldA_HasAnIncorrectCorrelationBetween_A_and_B="[[FIELDNAME_A]] field has an incorrect correlation between [[A]] and [[B]]"

#
# [ vp = validateParans ]
lbl_exec_vp_lfcbe="xxxx"
lbl_exec_vp_lfcbe="xxxx"
lbl_exec_vp_lfcbe="xxxx"
lbl_exec_vp_lfcbe="xxxx"
lbl_exec_vp_lfcbe="xxxx"
lbl_exec_vp_lfcbe="xxxx"
