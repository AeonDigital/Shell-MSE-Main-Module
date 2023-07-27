#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]


lbl_interface_show_message_header_info="Informação"
lbl_interface_show_message_header_attention="Atenção"
lbl_interface_show_message_header_warning="Alerta"
lbl_interface_show_message_header_error="Erro"
lbl_interface_show_message_header_fail="Falha"
lbl_interface_show_message_header_success="Sucesso"

lbl_interface_wait_user_any_key="Precione qualquer tecla para prosseguir"

lbl_interface_show_prompt_invalid_value="O valor \"[[VALUE]]\" é inválido."

unset lbl_interface_show_prompt_bool_values
declare -gA lbl_interface_show_prompt_bool_values
lbl_interface_show_prompt_bool_values["1"]="sim::s"
lbl_interface_show_prompt_bool_values["0"]="nao::n"
