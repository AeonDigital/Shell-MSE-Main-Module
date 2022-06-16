#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







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
