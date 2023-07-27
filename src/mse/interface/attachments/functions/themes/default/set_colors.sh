#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]


#
# Arrow in the global associative array "MSE_MESSAGE_THEME_COLORS" all
# color definitions used by this theme.
#
#
# The keys that identify each color to be used are defined from a composition
# of the following items:
#
# - 01: Theme identifier prefix
#
# - 02: Identifier of the role for which the definition is intended
#       message   : mse_interface_show_message
#       prompt    : mse_interface_show_prompt
#       progress  : mse_interface_show_progressBar
#       spinner   : mse_inter_startSpinner
#       man       : mse_mmod_help_man
#       metadata  : mse_mmod_mng_showMetaData
#
# - 03: Subtype/tone of message/information
#       Optional use.
#       Used when the information generated by the target function can be
#       defined as of a certain type, usually indicating the "tone" of the message.
#       Ex: As funções "mse_interface_show_message" e "mse_interface_show_prompt".
#
# - 04: Component
#       Name of the component for which the color is intended.
#
# - 05: Variation
#       Every color can offer one or more alternative versions, each of which
#       is identified by the suffix "alt".
mse_interface_theme_default_set_colors() {
  if [ -z "${MSE_MESSAGE_THEME_COLORS[mse_interface_theme_default]+x}" ]; then
    local msePrefix="itd"

    declare -A mseToneArr

    mseToneArr["n"]=""
    mseToneArr["n_alt"]=""

    mseToneArr["i"]=$(mse_font_create_style "4" "BOLD" "NONE" "LBLACK" "0")
    mseToneArr["i_alt"]=$(mse_font_create_style "4" "BOLD,DARK" "NONE" "LBLACK" "0")
    mseToneArr["a"]=$(mse_font_create_style "4" "BOLD" "NONE" "LBLUE" "0")
    mseToneArr["a_alt"]=$(mse_font_create_style "4" "BOLD,DARK" "NONE" "LBLUE" "0")
    mseToneArr["w"]=$(mse_font_create_style "4" "BOLD" "NONE" "LYELLOW" "0")
    mseToneArr["w_alt"]=$(mse_font_create_style "4" "BOLD,DARK" "NONE" "LYELLOW" "0")
    mseToneArr["e"]=$(mse_font_create_style "4" "BOLD" "NONE" "LRED" "0")
    mseToneArr["e_alt"]=$(mse_font_create_style "4" "BOLD,DARK" "NONE" "LRED" "0")
    mseToneArr["f"]=$(mse_font_create_style "4" "BOLD" "NONE" "RED" "0")
    mseToneArr["f_alt"]=$(mse_font_create_style "4" "BOLD,DARK" "NONE" "RED" "0")
    mseToneArr["s"]=$(mse_font_create_style "4" "BOLD" "NONE" "GREEN" "0")
    mseToneArr["s_alt"]=$(mse_font_create_style "4" "BOLD,DARK" "NONE" "GREEN" "0")

    mseToneArr["body"]=$(mse_font_create_style "4" "BOLD" "NONE" "LBLACK" "0")
    mseToneArr["body_alt"]=$(mse_font_create_style "4" "BOLD" "NONE" "WHITE" "0")

    mseToneArr["o"]=$(mse_font_create_style "4" "BOLD" "NONE" "LBLUE" "0")
    mseToneArr["o_alt"]=$(mse_font_create_style "4" "BOLD,DARK" "NONE" "LBLUE" "0")
    mseToneArr["fr"]=$(mse_font_create_style "4" "BOLD" "NONE" "LGREEN" "0")
    mseToneArr["fr_alt"]=$(mse_font_create_style "4" "BOLD,DARK" "NONE" "LGREEN" "0")
    mseToneArr["ca"]=$(mse_font_create_style "4" "BOLD" "NONE" "LYELLOW" "0")
    mseToneArr["ca_alt"]=$(mse_font_create_style "4" "BOLD,DARK" "NONE" "LYELLOW" "0")
    mseToneArr["im"]=$(mse_font_create_style "4" "BOLD" "NONE" "LRED" "0")
    mseToneArr["im_alt"]=$(mse_font_create_style "4" "BOLD,DARK" "NONE" "LRED" "0")





    MSE_MESSAGE_THEME_COLORS[${msePrefix}_progressbar_bar]=$(mse_font_create_style "4" "BOLD,DARK" "NONE" "LBLUE" "0")
    MSE_MESSAGE_THEME_COLORS[${msePrefix}_progressbar_bar_alt]=$(mse_font_create_style "4" "BOLD" "NONE" "LYELLOW" "0")
    MSE_MESSAGE_THEME_COLORS[${msePrefix}_progressbar_info]=$(mse_font_create_style "4" "BOLD" "NONE" "DLCYAN" "0")
    MSE_MESSAGE_THEME_COLORS[${msePrefix}_progressbar_info_alt]=$(mse_font_create_style "4" "BOLD" "NONE" "DWHITE" "0")





    MSE_MESSAGE_THEME_COLORS[${msePrefix}_man_at]=$(mse_font_create_style "4" "BOLD,DARK" "NONE" "BLUE" "0")
    MSE_MESSAGE_THEME_COLORS[${msePrefix}_man_tagName]=$(mse_font_create_style "4" "BOLD,DARK" "NONE" "BLUE" "0")
    MSE_MESSAGE_THEME_COLORS[${msePrefix}_man_tagCommom]=$(mse_font_create_style "4" "BOLD,DARK" "NONE" "LCYAN" "0")
    MSE_MESSAGE_THEME_COLORS[${msePrefix}_man_param]=$(mse_font_create_style "8" "BOLD" "NONE" "250" "0")





    MSE_MESSAGE_THEME_COLORS[${msePrefix}_man_module]=$(mse_font_create_style "4" "BOLD" "NONE" "BLUE" "0")
    MSE_MESSAGE_THEME_COLORS[${msePrefix}_man_subModule]=$(mse_font_create_style "4" "BOLD" "NONE" "BLUE" "0")
    MSE_MESSAGE_THEME_COLORS[${msePrefix}_man_functions]=$(mse_font_create_style "4" "" "NONE" "LBLACK" "0")

    MSE_MESSAGE_THEME_COLORS[${msePrefix}_man_separator]=$(mse_font_create_style "4" "" "NONE" "WHITE" "0")
    MSE_MESSAGE_THEME_COLORS[${msePrefix}_man_separatorBar]=$(mse_font_create_style "4" "DARK" "NONE" "WHITE" "0")
    MSE_MESSAGE_THEME_COLORS[${msePrefix}_man_selectedElements]=$(mse_font_create_style "4" "" "NONE" "LBLACK" "0")
    MSE_MESSAGE_THEME_COLORS[${msePrefix}_man_totalElements]=$(mse_font_create_style "4" "" "NONE" "LBLACK" "0")




    #
    # Use the associative array below as follows:
    # - In each key, identify the role that is being configured.
    # - In the corresponding value, indicate the components that can be colorized.
    #   For cases where no component should be colorized, use the "main" value:
    declare -A mseArrFunctionComponents
    #
    # Para a função "message_show", apenas o título é colorizado em multitons
    mseArrFunctionComponents["message"]="title_string"



    #
    # Use the associative array below as follows:
    # - In each key, identify the role that is being configured.
    # - In the corresponding value, indicate the "tones" that are used
    #   For cases where no "tone" should be used, use only the value "n"
    declare -A mseArrFunctionTones
    mseArrFunctionTones["message"]="n i a w e f s or fr ca im"



    local mseFunctionId=""
    declare -a mseTmpComponentsArr=()
    declare -a mseTmpToneArr=()
    local mseTmpComponent=""
    local mseTmpTone=""
    local mseTmpColorId=""


    for mseFunctionId in "${!mseArrFunctionComponents[@]}"; do
      mseTmpComponentsArr=(${mseArrFunctionComponents[$mseFunctionId]})
      mseTmpToneArr=(${mseArrFunctionTones[$mseFunctionId]})

      for mseTmpComponent in "${mseTmpComponentsArr[@]}"; do
        for mseTmpTone in "${mseTmpToneArr[@]}"; do
          mseTmpColorId="${msePrefix}_${mseFunctionId}_${mseTmpComponent}_${mseTmpTone}"

          MSE_MESSAGE_THEME_COLORS["${mseTmpColorId}"]="${mseToneArr[${mseTmpTone}]}"
          MSE_MESSAGE_THEME_COLORS["${mseTmpColorId}_alt"]="${mseToneArr[${mseTmpTone}_alt]}"
        done
      done
    done


    MSE_MESSAGE_THEME_COLORS["${msePrefix}_message_body"]="${mseToneArr[body]}"
    MSE_MESSAGE_THEME_COLORS["${msePrefix}_message_body_alt"]="${mseToneArr[body_alt]}"



    MSE_MESSAGE_THEME_COLORS["mse_interface_theme_default"]="${msePrefix}"
  fi
}