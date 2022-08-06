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

lbl_inter_prompt_invalidValue="Invalid value \"[[VALUE]]\"."

#
# Coleção de opções aceitas para um 'prompt' do tipo 'bool'.
unset lbl_inter_showPrompt_BoolValues
declare -gA lbl_inter_showPrompt_BoolValues
lbl_inter_showPrompt_BoolValues["1"]="yes::y"
lbl_inter_showPrompt_BoolValues["0"]="no::n"
