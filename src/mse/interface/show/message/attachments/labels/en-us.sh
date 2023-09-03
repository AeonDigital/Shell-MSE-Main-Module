#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]


lbl_interface_show_message_header_info="Information"
lbl_interface_show_message_header_attention="Attention"
lbl_interface_show_message_header_warning="Warning"
lbl_interface_show_message_header_error="Error"
lbl_interface_show_message_header_fail="Fail"
lbl_interface_show_message_header_success="Success"

lbl_interface_wait_user_any_key="Press any key to proceed"

lbl_interface_show_prompt_invalid_value="Invalid value \"[[VALUE]]\"."


unset lbl_interface_show_prompt_bool_values
declare -gA lbl_interface_show_prompt_bool_values
lbl_interface_show_prompt_bool_values["1"]="yes y"
lbl_interface_show_prompt_bool_values["0"]="no n"