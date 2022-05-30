#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]


# INI :: en-us.sh
lbl_mmod_invalidModuleName="The module name indicated is invalid. Use the \"mse_mmod_showModules\" function to get a list of valid options. [ \"[[MODULE]]\" ]"
lbl_inter_alert_header_info="Information"
lbl_inter_alert_header_attention="Attention"
lbl_inter_alert_header_warning="Warning"
lbl_inter_alert_header_error="Error"
lbl_inter_alert_header_fail="Fail"
lbl_inter_alert_header_success="Success"
lbl_inter_wait_user_any_key="Press any key to proceed"
unset lbl_inter_prompt_boolLabels
lbl_inter_prompt_boolLabels=(
  "yes" "y" "no" "n"
)
unset lbl_inter_prompt_boolValues
lbl_inter_prompt_boolValues=(
  1 1 0 0
)
lbl_font_showTextColors_TableHeaders="Color:Raw:Variable:Appearance"
lbl_font_showTextColors_UseCodeExample="Use the number of the selected color in the place of 'X': "
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
lbl_err_paramA_IsAnEmptyArray="Parameter \"[[PARAM_A]]\" is an empty array"
lbl_err_paramA_BothArraysMustHaveSameNumberOfElements="Parameters \"[[PARAM_A]]\" and \"[[PARAM_B]]\" must have the same number of elements"
lbl_err_paramA_MustBeAnArrayWithAtLast_Min="Parameter \"[[PARAM_A]]\" must be an array with at least [[MIN]] elements"
lbl_err_paramA_MustBeAnArrayWithAtLast_Max="Parameter \"[[PARAM_A]]\" must be an array with at most [[MAX]] elements"
lbl_err_paramA_LostTheRequiredKey_Key="Parameter \"[[PARAM_A]]\" lost the required key \"[[KEY]]\""
lbl_err_paramA_RequiredFor_A_Operation="Parameter \"[[PARAM_A]]\" is required for \"[[A]]\" operation"
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
lbl_fw_iv_mainMessage="Parameter \"[[PARAM_A]]\" has an invalid value [ [[MSG]] ]"
lbl_fw_iv_expectedFunctionNameOrInteger="Expected a function name or one/two integers; \"[[FUNCTION]]\": \"[[RESULT]]\"  :: [[ERR]]"
lbl_fw_iv_firstLineMustBeLessThanTheLast="First line must be less than the last: \"[[RESULT]]\""
lbl_fw_iv_outsideTheFileLimits="Outside the file limits; 1 - [[LASTLINE]]"
lbl_fw_iv_errorOnSave="Error on save. Do you have permissions to change the target file?"
lbl_cf_cannotIdentifyTargetLine="Cannot identify the target line to perform this operation."
lbl_showMetaSummary_moreDetails="For more details use the \"mse_mmod_showMetaData\" function."
lbl_man_enterAFunction="Enter the name of a function."
lbl_man_functionDoesNotExists="Function \"[[FUNCTION]]\" does not exists."
lbl_man_searchForAValidFunction="To search for a valid function use \"mse_mmod_showMetaData\"."
lbl_man_couldNotFindHelpForFunction="Could not find help information for \"[[FUNCTION]]\" function"
lbl_man_fileOfFunctionNotFound="File of function not found in [[PATH]]"
lbl_man_noUsageDescriptionFoundForFunction="No usage description found for target function"
lbl_searchFunction_enterAFunction="Enter the name of a function."
lbl_cmd_commandNotFound="Command \"[[CMD]]\" not found."
# END :: en-us.sh


# INI :: env.sh

# END :: env.sh


# INI :: variables.sh
MSE_TMP_SUBMODULES="check::str::str_convert::exec::file::conf::font::inter::misc"
declare -gA MSE_GLOBAL_CMD
MSE_GLOBAL_CMD["help"]="mse_mmod_help"
MSE_GLOBAL_CMD["man"]="mse_mmod_man"
MSE_GLOBAL_CMD["search"]="mse_mmod_searchFunction"
MSE_GLOBAL_CMD["show colors"]="mse_font_showColors"
MSE_GLOBAL_CMD["alert"]="mse_inter_alertUser"
MSE_GLOBAL_CMD["sysdata"]="mse_misc_sysData"
declare -gA MSE_GLOBAL_MODULES_METADATA
declare -ga MSE_GLOBAL_MODULES_METADATA_INDEXED
declare -gA MSE_GLOBAL_MODULES_PATH
declare -g MSE_GLOBAL_LASTERR=""
declare -g MSE_GLOBAL_RETURN=""
MSE_GLOBAL_THEME_NAME="mse_inter_theme_default"
MSE_GLOBAL_THEME_LOADED=""
MSE_GLOBAL_PROMPT_RESULT=""
trap mse_inter_stopSpinner EXIT
MSE_GLOBAL_SPINNER_PID=""
MSE_GLOBAL_SPINNER_DEFAULT=(" / " " - " " \\ " " | ")
MSE_GLOBAL_SPINNER_COMESANDGOES=(" •      " "  •     " "   •    " "    •   " "     •  " "      • " "     •  " "    •   " "   •    " "  •     ")
unset MSE_GLOBAL_VALIDATE_PARAMETERS_DATA
declare -ga MSE_GLOBAL_VALIDATE_PARAMETERS_DATA
unset MSE_GLOBAL_VALIDATE_PARAMETERS_RULES
declare -gA MSE_GLOBAL_VALIDATE_PARAMETERS_RULES
declare -ga MSE_GLOBAL_MODULE_SPLIT_RESULT
unset MSE_GLOBAL_MODULE_READ_BLOCK
declare -A MSE_GLOBAL_MODULE_READ_BLOCK
MSE_GLOBAL_MODULE_READ_BLOCK["start"]=""
MSE_GLOBAL_MODULE_READ_BLOCK["start_args"]=""
MSE_GLOBAL_MODULE_READ_BLOCK["start_args_sep"]=""
unset MSE_GLOBAL_MODULE_READ_BLOCK_START_ARGS_ARRAY
declare -ga MSE_GLOBAL_MODULE_READ_BLOCK_START_ARGS_ARRAY
MSE_GLOBAL_MODULE_READ_BLOCK["end"]=""
MSE_GLOBAL_MODULE_READ_BLOCK["end_args"]=""
MSE_GLOBAL_MODULE_READ_BLOCK["end_args_sep"]=""
unset MSE_GLOBAL_MODULE_READ_BLOCK_END_ARGS_ARRAY
declare -ga MSE_GLOBAL_MODULE_READ_BLOCK_END_ARGS_ARRAY
MSE_GLOBAL_MODULE_READ_BLOCK["print_start_line"]=""
unset MSE_GLOBAL_MODULE_READ_LINE
declare -A MSE_GLOBAL_MODULE_READ_LINE
MSE_GLOBAL_MODULE_READ_LINE["check"]=""
MSE_GLOBAL_MODULE_READ_LINE["check_args"]=""
MSE_GLOBAL_MODULE_READ_LINE["check_args_sep"]=""
unset MSE_GLOBAL_MODULE_READ_LINE_ARGS_ARRAY
declare -ga MSE_GLOBAL_MODULE_READ_LINE_ARGS_ARRAY
MSE_GLOBAL_MODULE_READ_LINE["check_has_linenumber"]=""
MSE_GLOBAL_MODULE_READ_LINE["check_invert"]=""
MSE_GLOBAL_MODULE_READ_LINE["transform"]=""
MSE_GLOBAL_MODULE_READ_LINE["transform_args"]=""
MSE_GLOBAL_MODULE_READ_LINE["transform_args_sep"]=""
unset MSE_GLOBAL_MODULE_READ_TRANSFORM_ARGS_ARRAY
declare -ga MSE_GLOBAL_MODULE_READ_TRANSFORM_ARGS_ARRAY
MSE_GLOBAL_MODULE_READ_LINE["transform_has_linenumber"]=""
if [ -f "${MSE_TMP_THIS_DIRECTORY}/config/colors.sh" ]; then
  . "${MSE_TMP_THIS_DIRECTORY}/config/colors.sh"
fi
# END :: variables.sh


# INI :: aliases.sh
alias mse="mse_mmod_cmd"
# END :: aliases.sh


# INI :: colors.sh
mseNONE='\e[0m'
mseBLACK='\e[20;47;30m'
mseDGREY='\e[20;49;90m'
mseLGREY='\e[20;49;37m'
mseWHITE='\e[20;49;97m'
mseRED='\e[20;49;31m'
mseLRED='\e[20;49;91m'
mseGREEN='\e[20;49;32m'
mseLGREEN='\e[20;49;92m'
mseYELLOW='\e[20;49;33m'
mseLYELLOW='\e[20;49;93m'
mseBLUE='\e[20;49;34m'
mseLBLUE='\e[20;49;94m'
msePURPLE='\e[20;49;35m'
mseLPURPLE='\e[20;49;95m'
mseCYAN='\e[20;49;36m'
mseLCYAN='\e[20;49;96m'
MSE_MD_ICOLOR_AVAILABLE_COLOR_NAMES=(
  'NONE'
  'BLACK' 'DGREY' 'LGREY' 'WHITE' 'RED' 'LRED'
  'GREEN' 'LGREEN' 'YELLOW' 'LYELLOW' 'BLUE' 'LBLUE'
  'PURPLE' 'LPURPLE' 'CYAN' 'LCYAN'
)
MSE_MD_ICOLOR_AVAILABLE_COLOR_LABELS=(
  'Normal'
  'Black' 'Dark grey' 'Light grey' 'White' 'Red' 'Light red'
  'Green' 'Light green' 'Yellow' 'Light yellow' 'Blue' 'Light blue'
  'Purple' 'Light purple' 'Cyan' 'Light cyan'
)
MSE_MD_ICOLOR_AVAILABLE_COLOR_CODES=(
  '39'
  '30' '90' '37' '97' '31' '91'
  '32' '92' '33' '93' '34' '94'
  '35' '95' '36' '96'
)
MSE_MD_ICOLOR_AVAILABLE_BGCOLOR_CODES=(
  '49'
  '40' '100' '47' '107' '41' '101'
  '42' '102' '43' '103' '44' '104'
  '45' '105' '46' '106'
)
MSE_MD_ICOLOR_AVAILABLE_FONT_ATTRIBUTE_NAMES=(
  'NONE'
  'BOLD' 'DIM' 'UNDERLINE' 'BLINK' 'INVERT' 'HIDDEN'
  'RBOLD' 'RDIM' 'RUNDERLINE' 'RBLINK' 'RINVERT' 'RHIDDEN'
)
MSE_MD_ICOLOR_AVAILABLE_FONT_ATTRIBUTE_CODES=(
  '20'
  '1' '2' '4' '5' '7' '8'
  '21' '22' '24' '25' '27' '28'
)
# END :: colors.sh


# INI :: mse_check_hasKeyInAssocArray.sh
mse_check_hasKeyInAssocArray() {
  local mseReturn
  declare -n assocName="$2"
  if [ ! -z "${assocName[$1]+x}" ]; then mseReturn=1; else mseReturn=0; fi
  printf "%s" "${mseReturn}"
}
mse_check_hasKeyInAssocArray_vldtr() {
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["count"]=2
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_0"]="KeyName :: r :: string"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_1"]="AssocArrayName :: r :: assocName"
}
# END :: mse_check_hasKeyInAssocArray.sh


# INI :: mse_check_hasValueInArray.sh
mse_check_hasValueInArray() {
  local mseSearchValue="$1"
  declare -n arrayName="$2"
  local mseArrayLength="${#arrayName[@]}"
  local mseCaseInsensitive
  local mseReturnIndex
  mseCaseInsensitive=0
  if [ $# -ge 3 ] && [ "$3" == "1" ]; then
    mseCaseInsensitive=1
  fi
  mseReturnIndex=0
  if [ $# -ge 4 ] && [ "$4" == "1" ]; then
    mseReturnIndex=1
  fi
  local i
  local mseResultIndex=""
  local mseResultBool=0
  if [ "${mseCaseInsensitive}" == "0" ]; then
    for ((i=0; i<mseArrayLength; i++)); do
      if [ "${arrayName[$i]}" == "${mseSearchValue}" ]; then
        mseResultIndex="$i"
        mseResultBool="1"
        break
      fi
    done
  elif [ "${mseCaseInsensitive}" == "1" ]; then
    for ((i=0; i<mseArrayLength; i++)); do
      if [ "${arrayName[$i]^^}" == "${mseSearchValue^^}" ]; then
        mseResultIndex="$i"
        mseResultBool="1"
        break
      fi
    done
  fi
  if [ "${mseReturnIndex}" == "1" ]; then
    printf "%s" "${mseResultIndex}"
  else
    printf "%s" "${mseResultBool}"
  fi
}
mse_check_hasValueInArray_vldtr() {
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["count"]=4
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_0"]="Value :: r :: string"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_1"]="ArrayName :: r :: arrayName"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_2"]="CaseInsensitive :: o :: bool"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_3"]="ReturnIndex :: o :: bool"
}
# END :: mse_check_hasValueInArray.sh


# INI :: mse_check_isChar.sh
mse_check_isChar() {
  local mseReturn
  local oLC_CTYPE
  oLC_CTYPE="$LC_CTYPE"
  LC_CTYPE=""
  if [ "${#1}" == 1 ]; then mseReturn=1; else mseReturn=0; fi
  LC_CTYPE="${oLC_CTYPE}"
  printf "%s" "$mseReturn"
}
mse_check_isChar_vldtr() {
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["count"]=1
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_0"]="Value :: r :: char"
}
# END :: mse_check_isChar.sh


# INI :: mse_check_isCharDecimal.sh
mse_check_isCharDecimal() {
  local mseReturn
  local mseI
  local mseREG
  local mseArrParam
  mseREG='^[0-9]+$'
  mseArrParam=(${1// / })
  mseReturn=1
  for (( mseI=0; mseI<${#mseArrParam[@]}; mseI++ )); do
    if [ $mseReturn == 1 ]; then
      if ! [[ "${mseArrParam[$mseI]}" =~ $mseREG ]]; then
        mseReturn=0
        break
      fi
    fi
  done
  printf "%s" "${mseReturn}"
}
mse_check_isCharDecimal_vldtr() {
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["count"]=1
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_0"]="Value :: r :: charDecimal"
}
# END :: mse_check_isCharDecimal.sh


# INI :: mse_check_isCharHex.sh
mse_check_isCharHex() {
  local mseReturn
  local mseI
  local mseREG
  local mseArrParam
  mseREG='^[0-9A-Fa-f]{1,2}$'
  mseArrParam=(${1// / })
  mseReturn=1
  for (( mseI=0; mseI<${#mseArrParam[@]}; mseI++ )); do
    if [ $mseReturn == 1 ]; then
      if ! [[ "${mseArrParam[$mseI]}" =~ $mseREG ]]; then
        mseReturn=0
        break
      fi
    fi
  done
  printf "%s" "${mseReturn}"
}
mse_check_isCharHex_vldtr() {
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["count"]=1
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_0"]="Value :: r :: charHex"
}
# END :: mse_check_isCharHex.sh


# INI :: mse_check_isCharOctal.sh
mse_check_isCharOctal() {
  local mseReturn
  local mseI
  local mseREG
  local mseArrParam
  mseREG='^[0-7]{3}$'
  mseArrParam=(${1// / })
  mseReturn=1
  for (( mseI=0; mseI<${#mseArrParam[@]}; mseI++ )); do
    if [ $mseReturn == 1 ]; then
      if ! [[ "${mseArrParam[$mseI]}" =~ $mseREG ]]; then
        mseReturn=0
        break
      fi
    fi
  done
  printf "%s" "${mseReturn}"
}
mse_check_isCharOctal_vldtr() {
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["count"]=1
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_0"]="Value :: r :: charOctal"
}
# END :: mse_check_isCharOctal.sh


# INI :: mse_check_isCommandExists.sh
mse_check_isCommandExists() {
  local mseReturn
  $1 &> /dev/null
  if [ $? == 0 ]; then mseReturn=1; else mseReturn=0; fi
  printf "%s" "${mseReturn}"
}
mse_check_isCommandExists_vldtr() {
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["count"]=1
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_0"]="Command :: r :: string"
}
# END :: mse_check_isCommandExists.sh


# INI :: mse_check_isFunctionExists.sh
mse_check_isFunctionExists() {
  local mseReturn
  if [ "$(type -t $1)" == "function" ]; then mseReturn=1; else mseReturn=0; fi
  printf "%s" "${mseReturn}"
}
mse_check_isFunctionExists_vldtr() {
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["count"]=1
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_0"]="Value :: r :: string"
}
# END :: mse_check_isFunctionExists.sh


# INI :: mse_check_isInteger.sh
mse_check_isInteger() {
  local mseReturn
  local regEx
  regEx='^[-]?[0-9]+$'
  if [[ "$1" =~ $regEx ]]; then mseReturn=1; else mseReturn=0; fi
  printf "%s" "${mseReturn}"
}
mse_check_isInteger_vldtr() {
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["count"]=1
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_0"]="Value :: r :: string"
}
# END :: mse_check_isInteger.sh


# INI :: mse_str_join.sh
mse_str_join() {
  local mseGlue
  local mseGlueLen
  mseGlue="$1"
  mseGlueLen="${#mseGlue}"
  declare -n mseArrayName="$2"
  mseReturn=$(printf '%s'$1 "${mseArrayName[@]}")
  if [ $mseGlueLen -gt 0 ]; then
    mseReturn="${mseReturn:: -$mseGlueLen}"
  fi
  printf "%s" "${mseReturn}"
}
mse_str_join_vldtr() {
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["count"]=2
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_0"]="Glue :: r :: string"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_1"]="ArrayName :: r :: arrayName"
}
# END :: mse_str_join.sh


# INI :: mse_str_replace.sh
mse_str_replace() {
  local mseReturn
  local mseOld
  local mseNew
  local mseString
  mseOld="$1"
  mseNew="$2"
  mseString="$3"
  mseReturn="${mseString//${mseOld}/${mseNew}}"
  printf "%s" "${mseReturn}"
}
mse_str_replace_vldtr() {
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["count"]=3
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_0"]="Old :: r :: string"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_1"]="New :: r :: string"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_2"]="String :: r :: string"
}
# END :: mse_str_replace.sh


# INI :: mse_str_replacePlaceHolder.sh
mse_str_replacePlaceHolder() {
  if [ $# -ge 3 ]; then
    local mseOriginalString
    local msePH
    local mseValue
    if [ $# == 3 ]; then
      mseOriginalString="$1"
      msePH="\[\[${2}\]\]"
      mseValue="$3"
      printf "%s" "${mseOriginalString//${msePH}/${mseValue}}"
    else
      local i
      local v
      local mseTotalParans
      local mseTmpParametersArray
      local mseReturn="$1"
      mseTmpParametersArray=("$@")
      mseTmpParametersArray=("${mseTmpParametersArray[@]:1}")
      mseTotalParans="${#mseTmpParametersArray[@]}"
      for ((i=0; i<mseTotalParans; i=i+2)); do
        ((v=i+1))
        if [ "${v}" -lt "${mseTotalParans}" ]; then
          msePH="${mseTmpParametersArray[$i]}"
          mseValue="${mseTmpParametersArray[$v]}"
          mseReturn=$(mse_str_replacePlaceHolder "${mseReturn}" "${msePH}" "${mseValue}")
        fi
      done
      printf "${mseReturn}"
    fi
  fi
}
mse_str_replacePlaceHolder_vldtr() {
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["count"]=3
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_0"]="OriginalString :: r :: string"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_1"]="PlaceHolderName :: r :: string"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_2"]="NewValue :: r :: string"
}
# END :: mse_str_replacePlaceHolder.sh


# INI :: mse_str_split.sh
mse_str_split() {
  local mseDelimiter
  local mseString
  local mseSubStr
  unset MSE_GLOBAL_MODULE_SPLIT_RESULT
  declare -ga MSE_GLOBAL_MODULE_SPLIT_RESULT
  mseDelimiter="$1"
  mseString="$2"
  mseSubStr=""
  while [ "${mseString}" != "" ]; do
    if [[ "$mseString" != *"$mseDelimiter"* ]]; then
      MSE_GLOBAL_MODULE_SPLIT_RESULT+=("$mseString")
      break
    else
      mseSubStr="${mseString%%${mseDelimiter}*}"
      MSE_GLOBAL_MODULE_SPLIT_RESULT+=("$mseSubStr")
      mseString="${mseString#*${mseDelimiter}}"
    fi
  done
}
mse_str_split_vldtr() {
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["count"]=2
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_0"]="Delimiter :: r :: string"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_1"]="String :: r :: string"
}
# END :: mse_str_split.sh


# INI :: mse_str_toLowerCase.sh
mse_str_toLowerCase() {
  printf "%s" "${1,,}"
}
mse_str_toLowerCase_vldtr() {
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["count"]=1
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_0"]="String :: r :: string"
}
# END :: mse_str_toLowerCase.sh


# INI :: mse_str_toUpperCase.sh
mse_str_toUpperCase() {
  printf "%s" "${1^^}"
}
mse_str_toUpperCase_vldtr() {
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["count"]=1
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_0"]="String :: r :: string"
}
# END :: mse_str_toUpperCase.sh


# INI :: mse_str_trim.sh
mse_str_trim() {
  local str
  str="$1"
  str="${str#"${str%%[![:space:]]*}"}" # trim L
  str="${str%"${str##*[![:space:]]}"}" # trim R
  printf "%s" "${str}"
}
mse_str_trim_vldtr() {
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["count"]=1
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_0"]="String :: r :: string"
}
# END :: mse_str_trim.sh


# INI :: mse_str_trimD.sh
mse_str_trimD() {
  local mseArrTmp
  local mseArrLen
  local mseArrLen
  mseReturn="$2"
  mse_str_split "$1" "$2"
  mseArrTmp=("${MSE_GLOBAL_MODULE_SPLIT_RESULT[@]}")
  mseArrLen="${#mseArrTmp[@]}"
  if [ $mseArrLen -gt 0 ]; then
    local i
    local ii
    local li
    local elem
    local mseArrElemOne
    local mseArrElemLas
    local mseTrimType
    i=0
    ((li=mseArrLen-1))
    mseArrElemOne="${mseArrTmp[$ii]}"
    mseArrElemLas="${mseArrTmp[$li]}"
    mseTrimType='both'
    if [ $# -ge 3 ]; then
      if [ "${3,,}" == "r" ] || [ "${3,,}" == "right" ]; then
        mseTrimType='right'
      elif [ "${3,,}" == "l" ] || [ "${3,,}" == "left" ]; then
        mseTrimType='left'
      fi
    fi
    if [ "${mseTrimType}" == "both" ] || [ "${mseTrimType}" == "left" ]; then
      mseArrTmp[$ii]="${mseArrElemOne%"${mseArrElemOne##*[![:space:]]}"}" # trim R
    fi
    if [ "${mseTrimType}" == "both" ] || [ "${mseTrimType}" == "right" ]; then
      mseArrTmp[$li]="${mseArrElemLas#"${mseArrElemLas%%[![:space:]]*}"}" # trim L
    fi
    if [ $mseArrLen -gt 2 ]; then
      for (( i=1; i<li; i++ )); do
        elem="${mseArrTmp[$i]}"
        if [ "${mseTrimType}" == "both" ] || [ "${mseTrimType}" == "left" ]; then
          elem="${elem%"${elem##*[![:space:]]}"}" # trim R
        fi
        if [ "${mseTrimType}" == "both" ] || [ "${mseTrimType}" == "right" ]; then
          elem="${elem#"${elem%%[![:space:]]*}"}" # trim L
        fi
        mseArrTmp[$i]="${elem}"
      done
    fi
  fi
  mseReturn=$(mse_str_join "$1" "mseArrTmp")
  printf "%s" "${mseReturn}"
}
mse_str_trimD_vldtr() {
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["count"]=3
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_0"]="Delimiter :: r :: string"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_1"]="String :: r :: string"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_2"]="Type :: o :: list :: both"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_2_labels"]="right, left, both"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_2_values"]="r, l, b"
}
# END :: mse_str_trimD.sh


# INI :: mse_str_trimDL.sh
mse_str_trimDL() {
  mse_str_trimD "$1" "$2" "l"
}
mse_str_trimDL_vldtr() {
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["count"]=2
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_0"]="Delimiter :: r :: string"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_1"]="String :: r :: string"
}
# END :: mse_str_trimDL.sh


# INI :: mse_str_trimDR.sh
mse_str_trimDR() {
  mse_str_trimD "$1" "$2" "r"
}
mse_str_trimDR_vldtr() {
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["count"]=2
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_0"]="Delimiter :: r :: string"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_1"]="String :: r :: string"
}
# END :: mse_str_trimDR.sh


# INI :: mse_str_trimL.sh
mse_str_trimL() {
  local mseReturn
  mseReturn="$1"
  mseReturn="${mseReturn#"${mseReturn%%[![:space:]]*}"}" # trim L
  printf "%s" "${mseReturn}"
}
mse_str_trimL_vldtr() {
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["count"]=1
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_0"]="String :: r :: string"
}
# END :: mse_str_trimL.sh


# INI :: mse_str_trimR.sh
mse_str_trimR() {
  local mseReturn
  mseReturn="$1"
  mseReturn="${mseReturn%"${mseReturn##*[![:space:]]}"}" # trim R
  printf "%s" "${mseReturn}"
}
mse_str_trimR_vldtr() {
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["count"]=1
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_0"]="String :: r :: string"
}
# END :: mse_str_trimR.sh


# INI :: mse_str_convert_charToDecimal.sh
mse_str_convert_charToDecimal() {
  local mseReturn
  local mseChar
  local mseCharI
  mseReturn=""
  for (( mseCharI=0; mseCharI<${#1}; mseCharI++ )); do
    mseChar="${1:${mseCharI}:1}"
    if [ "$mseCharI" != "0" ]; then
      mseReturn+=" "
    fi
    mseReturn+=$(printf "%i" "'$mseChar")
  done
  printf "${mseReturn}"
}
mse_str_convert_charToDecimal_vldtr() {
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["count"]=1
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_0"]="Char :: r :: char"
}
# END :: mse_str_convert_charToDecimal.sh


# INI :: mse_str_convert_charToHex.sh
mse_str_convert_charToHex() {
  local mseReturn
  local mseChar
  local mseCharI
  mseReturn=""
  for (( mseCharI=0; mseCharI<${#1}; mseCharI++ )); do
    mseChar="${1:${mseCharI}:1}"
    if [ "$mseCharI" != "0" ]; then
      mseReturn+=" "
    fi
    mseReturn+=$(printf "%X" "'$mseChar")
  done
  printf "${mseReturn}"
}
mse_str_convert_charToHex_vldtr() {
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["count"]=1
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_0"]="Char :: r :: char"
}
# END :: mse_str_convert_charToHex.sh


# INI :: mse_str_convert_charToOctal.sh
mse_str_convert_charToOctal() {
  local mseReturn
  local mseChar
  local mseCharI
  mseReturn=""
  for (( mseCharI=0; mseCharI<${#1}; mseCharI++ )); do
    mseChar="${1:${mseCharI}:1}"
    if [ "$mseCharI" != "0" ]; then
      mseReturn+=" "
    fi
    mseReturn+=$(printf "%03o" "'$mseChar")
  done
  printf "${mseReturn}"
}
mse_str_convert_charToOctal_vldtr() {
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["count"]=1
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_0"]="Char :: r :: char"
}
# END :: mse_str_convert_charToOctal.sh


# INI :: mse_str_convert_decimalToChar.sh
mse_str_convert_decimalToChar() {
  local mseReturn
  local mseTmp
  local mseByte
  local mseArrParam
  mseReturn=""
  mseArrParam=(${1// / })
  for mseByte in "${mseArrParam[@]}"; do
    mseTmp=$(printf "%o" "${mseByte}")
    mseReturn+="\\${mseTmp}"
  done
  printf "${mseReturn}"
}
mse_str_convert_decimalToChar_vldtr() {
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["count"]=1
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_0"]="Decimal :: r :: charDecimal"
}
# END :: mse_str_convert_decimalToChar.sh


# INI :: mse_str_convert_decimalToHex.sh
mse_str_convert_decimalToHex() {
  local mseReturn
  local mseTmp
  local mseByte
  local mseArrParam
  mseReturn=""
  mseArrParam=(${1// / })
  for mseByte in "${mseArrParam[@]}"; do
    if [ "${mseReturn}" != "" ]; then
      mseReturn+=' '
    fi
    mseTmp=$(printf "%X" "${mseByte}")
    mseReturn+="${mseTmp}"
  done
  printf "${mseReturn}"
}
mse_str_convert_decimalToHex_vldtr() {
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["count"]=1
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_0"]="Decimal :: r :: charDecimal"
}
# END :: mse_str_convert_decimalToHex.sh


# INI :: mse_str_convert_decimalToOctal.sh
mse_str_convert_decimalToOctal() {
  local mseReturn
  local mseTmp
  local mseByte
  local mseArrParam
  mseReturn=""
  mseArrParam=(${1// / })
  for mseByte in "${mseArrParam[@]}"; do
    if [ "${mseReturn}" != "" ]; then
      mseReturn+=' '
    fi
    mseTmp=$(printf "%o" "${mseByte}")
    mseReturn+="${mseTmp}"
  done
  printf "${mseReturn}"
}
mse_str_convert_decimalToOctal_vldtr() {
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["count"]=1
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_0"]="Decimal :: r :: charDecimal"
}
# END :: mse_str_convert_decimalToOctal.sh


# INI :: mse_str_convert_hexToChar.sh
mse_str_convert_hexToChar() {
  local mseReturn
  local mseTmp
  local mseByte
  local mseArrParam
  mseReturn=""
  mseArrParam=(${1// / })
  for mseByte in "${mseArrParam[@]}"; do
    mseTmp=$(printf $((16#${mseByte})))
    mseTmp=$(printf "%o" ${mseTmp})
    mseReturn+="\\${mseTmp}"
  done
  printf "${mseReturn}"
}
mse_str_convert_hexToChar_vldtr() {
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["count"]=1
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_0"]="Hex :: r :: charHex"
}
# END :: mse_str_convert_hexToChar.sh


# INI :: mse_str_convert_hexToDecimal.sh
mse_str_convert_hexToDecimal() {
  local mseReturn
  local mseTmp
  local mseByte
  local mseArrParam
  mseReturn=""
  mseArrParam=(${1// / })
  for mseByte in "${mseArrParam[@]}"; do
    if [ "${mseReturn}" != "" ]; then
      mseReturn+=' '
    fi
    mseTmp=$(printf $((16#${mseByte})))
    mseReturn+="${mseTmp}"
  done
  printf "${mseReturn}"
}
mse_str_convert_hexToDecimal_vldtr() {
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["count"]=1
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_0"]="Hex :: r :: charHex"
}
# END :: mse_str_convert_hexToDecimal.sh


# INI :: mse_str_convert_hexToOctal.sh
mse_str_convert_hexToOctal() {
  local mseReturn
  local mseTmp
  local mseByte
  local mseArrParam
  mseReturn=""
  mseArrParam=(${1// / })
  for mseByte in "${mseArrParam[@]}"; do
    if [ "${mseReturn}" != "" ]; then
      mseReturn+=' '
    fi
    mseTmp=$(printf $((16#${mseByte})))
    mseTmp=$(printf "%o" ${mseTmp})
    mseReturn+="${mseTmp}"
  done
  printf "${mseReturn}"
}
mse_str_convert_hexToOctal_vldtr() {
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["count"]=1
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_0"]="Hex :: r :: charHex"
}
# END :: mse_str_convert_hexToOctal.sh


# INI :: mse_str_convert_octalToChar.sh
mse_str_convert_octalToChar() {
  local mseReturn
  local mseTmp
  local mseByte
  local mseArrParam
  mseReturn=""
  mseArrParam=(${1// / })
  for mseByte in "${mseArrParam[@]}"; do
    mseReturn+="\\${mseByte[$i]}"
  done
  printf "${mseReturn}"
}
mse_str_convert_octalToChar_vldtr() {
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["count"]=1
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_0"]="Octal :: r :: charOctal"
}
# END :: mse_str_convert_octalToChar.sh


# INI :: mse_str_convert_octalToDecimal.sh
mse_str_convert_octalToDecimal() {
  local mseReturn
  local mseTmp
  local mseByte
  local mseArrParam
  mseReturn=""
  mseArrParam=(${1// / })
  for mseByte in "${mseArrParam[@]}"; do
    if [ "$mseReturn" != "" ]; then
      mseReturn+=" "
    fi
    mseTmp=$(printf $((8#${mseByte})))
    mseReturn+="${mseTmp}"
  done
  printf "${mseReturn}"
}
mse_str_convert_octalToDecimal_vldtr() {
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["count"]=1
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_0"]="Octal :: r :: charOctal"
}
# END :: mse_str_convert_octalToDecimal.sh


# INI :: mse_str_convert_octalToHex.sh
mse_str_convert_octalToHex() {
  local mseReturn
  local mseTmp
  local mseByte
  local mseArrParam
  mseReturn=""
  mseArrParam=(${1// / })
  for mseByte in "${mseArrParam[@]}"; do
    if [ "$mseReturn" != "" ]; then
      mseReturn+=" "
    fi
    mseTmp=$(printf $((8#${mseByte})))
    mseTmp=$(printf "%X" ${mseTmp})
    mseReturn+="${mseTmp}"
  done
  printf "${mseReturn}"
}
mse_str_convert_octalToHex_vldtr() {
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["count"]=1
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_0"]="Octal :: r :: charOctal"
}
# END :: mse_str_convert_octalToHex.sh


# INI :: mse_exec_clearVars.sh
mse_exec_clearVars() {
  declare -g MSE_GLOBAL_LASTERR=""
  declare -g MSE_GLOBAL_RETURN=""
  unset MSE_GLOBAL_VALIDATE_PARAMETERS_DATA
  declare -ga MSE_GLOBAL_VALIDATE_PARAMETERS_DATA
  unset MSE_GLOBAL_VALIDATE_PARAMETERS_RULES
  declare -gA MSE_GLOBAL_VALIDATE_PARAMETERS_RULES
  unset MSE_GLOBAL_MODULE_SPLIT_RESULT
  declare -ga MSE_GLOBAL_MODULE_SPLIT_RESULT
}
# END :: mse_exec_clearVars.sh


# INI :: mse_exec_ifValidate.sh
mse_exec_ifValidate() {
  local mseReturn
  local mseFunctionName
  local mseTmpParametersArray
  mse_exec_validate "$@" &> /dev/null
  if [ $? == 0 ]; then
    mseFunctionName="$1"
    mseTmpParametersArray=("$@")
    mseTmpParametersArray=("${mseTmpParametersArray[@]:1}")
    mseReturn=$("$mseFunctionName" "${mseTmpParametersArray[@]}")
    if [ $? == 0 ]; then
      MSE_GLOBAL_RETURN="${mseReturn}"
      return 0
    else
      MSE_GLOBAL_LASTERR="${mseReturn}"
      return 1
    fi
  else
    return 1
  fi
}
# END :: mse_exec_ifValidate.sh


# INI :: mse_exec_validate.sh
mse_exec_validate() {
  mse_exec_clearVars
  local mseReturn
  local mseFunctionName
  local mseFunctionValidateRules
  mseFunctionName="$1"
  mseFunctionValidateRules="${mseFunctionName}_vldtr"
  if [ "$(type -t $mseFunctionValidateRules)" != "function" ]; then
    mseReturn=1;
  else
    MSE_GLOBAL_VALIDATE_PARAMETERS_DATA=("$@")
    MSE_GLOBAL_VALIDATE_PARAMETERS_DATA=("${MSE_GLOBAL_VALIDATE_PARAMETERS_DATA[@]:1}")
    $mseFunctionValidateRules
    mseReturn=$(mse_exec_validateParams "MSE_GLOBAL_VALIDATE_PARAMETERS_RULES" "MSE_GLOBAL_VALIDATE_PARAMETERS_DATA")
    if [ "${mseReturn}" != 1 ]; then
      MSE_GLOBAL_LASTERR="${mseReturn}"
      mseReturn=0
    else
      mseReturn=1
    fi
  fi
  printf "%s" "${mseReturn}"
  if [ "${mseReturn}" == 1 ]; then
    return 0
  else
    return 1
  fi
}
# END :: mse_exec_validate.sh


# INI :: mse_exec_validateParams.sh
mse_exec_validateParams() {
  local mseReturn
  mseReturn=1
  if [ $# -le 2 ] || [ "$3" != "1" ]; then
    declare -a mseCheckData=("$@")
    declare -A mseCheckParams
    mseCheckParams["count"]="3"
    mseCheckParams["param_0"]="ValidateRules :: r :: assocName :: :: count"
    mseCheckParams["param_1"]="ValidateData :: r :: arrayName"
    mseReturn=$(mse_exec_validateParams "mseCheckParams" "mseCheckData" "1")
  fi
  if [ "$mseReturn" == 1 ]; then
    local mseCurrentParam
    local mseCurrentParamIsSet
    declare -n mseRawParamRules
    local mseRawParamRulesName
    local mseRawParamRulesLength
    local mseRawCurrentParamRule
    local mseRawCurrentParamRuleKey
    local mseRawCurrentParamRuleValues
    declare -n mseRawParamData
    local mseRawParamDataLength
    local mseRawCurrentParamDataValue
    local mseParamL
    local mseParamI
    local mseParamCk
    local mseParamLabel
    local mseParamRequired
    local mseParamType
    local mseParamDefault
    local mseParamMaxLength
    local mseParamMin
    local mseParamMax
    local mseParamCreate
    local mseParamAssocKeys
    local mseParamListLabels
    local mseParamListValues
    local mseParamFunctionName
    local mseTmpMsg
    mseCurrentParam=0
    mseRawParamRules="$1"
    mseRawParamRulesName="$1"
    mseRawParamRulesLength="${mseRawParamRules[count]}"
    mseRawCurrentParamRule=""
    mseRawParamData="$2"
    mseRawParamDataLength="${#mseRawParamData[@]}"
    for ((mseCurrentParam=0; mseCurrentParam<mseRawParamRulesLength; mseCurrentParam++)); do
      if [ "${mseReturn}" == 1 ]; then
        mseCurrentParamIsSet=0
        mseRawCurrentParamDataValue=""
        mseRawCurrentParamRuleKey="param_${mseCurrentParam}"
        if [ ! -z "${mseRawParamRules[$mseRawCurrentParamRuleKey]+x}" ] && [ "${mseRawParamRules[$mseRawCurrentParamRuleKey]}" != "" ]; then
          mseRawCurrentParamRule="${mseRawParamRules[$mseRawCurrentParamRuleKey]}"
          mse_str_split "::" "${mseRawCurrentParamRule}"
          mseRawCurrentParamRuleValues=("${MSE_GLOBAL_MODULE_SPLIT_RESULT[@]}")
          if [ "${#mseRawCurrentParamRuleValues[@]}" -lt 3 ]; then
            mseReturn=$(mse_str_replacePlaceHolder "${lbl_exec_vp_ipd_mainMessage}" "MSG" "${mseRawCurrentParamRule}")
          else
            mseParamL="${#mseRawCurrentParamRuleValues[@]}"
            for ((mseParamI=0; mseParamI<mseParamL; mseParamI++)); do
              mseRawCurrentParamRuleValues[$mseParamI]=$(mse_str_trim "${mseRawCurrentParamRuleValues[$mseParamI]}")
            done
            mseParamLabel="${mseRawCurrentParamRuleValues[0]}"
            mseParamRequired="${mseRawCurrentParamRuleValues[1]}"
            mseParamType="${mseRawCurrentParamRuleValues[2]}"
            if [ "$mseParamLabel" == "" ]; then
              mseTmpMsg=$(mse_str_replacePlaceHolder "${lbl_exec_vp_ipd_fieldA_CannotBeEmpty}" "FIELDNAME_A" "Label")
              mseReturn=$(mse_str_replacePlaceHolder "${lbl_exec_vp_ipd_mainMessage}" "MSG" "${mseTmpMsg}")
            fi
            if [ "${mseReturn}" == 1 ]; then
              if [ "$mseParamRequired" == "" ]; then
                mseTmpMsg=$(mse_str_replacePlaceHolder "${lbl_exec_vp_ipd_fieldA_CannotBeEmpty}" "FIELDNAME_A" "Required")
                mseReturn=$(mse_str_replacePlaceHolder "${lbl_exec_vp_ipd_mainMessage}" "MSG" "${mseTmpMsg}")
              else
                case "$mseParamRequired" in
                  optional | opt | o | 0)
                    mseParamRequired=0
                  ;;
                  required | req | r | 1)
                    mseParamRequired=1
                  ;;
                  *)
                    mseTmpMsg=$(mse_str_replacePlaceHolder "${lbl_exec_vp_ipd_fieldA_HasAnInvalidValue}" "FIELDNAME_A" "Required")
                    mseReturn=$(mse_str_replacePlaceHolder "${lbl_exec_vp_ipd_mainMessage}" "MSG" "${mseTmpMsg}")
                  ;;
                esac
              fi
            fi
            if [ "${mseReturn}" == 1 ]; then
              if [ "$mseParamType" == "" ]; then
                mseTmpMsg=$(mse_str_replacePlaceHolder "${lbl_exec_vp_ipd_fieldA_CannotBeEmpty}" "FIELDNAME_A" "Type")
                mseReturn=$(mse_str_replacePlaceHolder "${lbl_exec_vp_ipd_mainMessage}" "MSG" "${mseTmpMsg}")
              else
                mseParamDefault=""
                mseParamFunctionName=""
                if [ "${#mseRawCurrentParamRuleValues[@]}" -ge 4 ]; then
                  case "$mseParamType" in
                    bool | string | char | charDecimal | charHex | charOctal | int | fileName | dirName | functionName | arrayName | assocName | list)
                      mseParamDefault="${mseRawCurrentParamRuleValues[3]}"
                    ;;
                    validateFN)
                      mseParamFunctionName="${mseRawCurrentParamRuleValues[3]}"
                      mseParamCk=$(mse_check_isFunctionExists "$mseParamFunctionName")
                      if [ $mseParamCk == 0 ]; then
                        mseTmpMsg=$(mse_str_replacePlaceHolder "${lbl_exec_vp_ipd_fieldA_PointsToNonExistentFunction}" "FIELDNAME_A" "ValidateFunction")
                        mseReturn=$(mse_str_replacePlaceHolder "${lbl_exec_vp_ipd_mainMessage}" "MSG" "${mseTmpMsg}")
                      fi
                    ;;
                    *)
                      mseTmpMsg=$(mse_str_replacePlaceHolder "${lbl_exec_vp_ipd_fieldA_HasAnInvalidValue}" "FIELDNAME_A" "Type")
                      mseReturn=$(mse_str_replacePlaceHolder "${lbl_exec_vp_ipd_mainMessage}" "MSG" "${mseTmpMsg}")
                    ;;
                  esac
                fi
              fi
            fi
            if [ "${mseReturn}" == 1 ]; then
              mseParamMaxLength=""
              mseParamMin=""
              mseParamMax=""
              mseParamCreate=""
              mseParamAssocKeys=""
              mseParamListLabels=""
              mseParamListValues=""
              case "$mseParamType" in
                string)
                  if [ $mseParamL -ge 5 ]; then
                    mseParamMaxLength="${mseRawCurrentParamRuleValues[4]}"
                    mseParamCk=$(mse_check_isInteger "$mseParamMaxLength")
                    if [ $mseParamCk == 0 ]; then
                      mseTmpMsg=$(mse_str_replacePlaceHolder "${lbl_exec_vp_ipd_fieldA_MustBeAnInteger}" "FIELDNAME_A" "MaxLength")
                      mseReturn=$(mse_str_replacePlaceHolder "${lbl_exec_vp_ipd_mainMessage}" "MSG" "${mseTmpMsg}")
                    else
                      if [ $mseParamMaxLength -lt 1 ]; then
                        mseTmpMsg=$(mse_str_replacePlaceHolder "${lbl_exec_vp_ipd_fieldA_MustBeGreaterThanZero}" "FIELDNAME_A" "MaxLength")
                        mseReturn=$(mse_str_replacePlaceHolder "${lbl_exec_vp_ipd_mainMessage}" "MSG" "${mseTmpMsg}")
                      fi
                    fi
                  fi
                ;;
                int | arrayName)
                  if [ $mseParamL -ge 5 ]; then
                    mseParamMin="${mseRawCurrentParamRuleValues[4]}"
                    mseParamCk=$(mse_check_isInteger "$mseParamMin")
                    if [ $mseParamCk == 0 ]; then
                      mseTmpMsg=$(mse_str_replacePlaceHolder "${lbl_exec_vp_ipd_fieldA_MustBeAnInteger}" "FIELDNAME_A" "Min")
                      mseReturn=$(mse_str_replacePlaceHolder "${lbl_exec_vp_ipd_mainMessage}" "MSG" "${mseTmpMsg}")
                    fi
                  fi
                  if [ "${mseReturn}" == 1 ] && [ $mseParamL -ge 6 ]; then
                    mseParamMax="${mseRawCurrentParamRuleValues[5]}"
                    mseParamCk=$(mse_check_isInteger "$mseParamMax")
                    if [ $mseParamCk == 0 ]; then
                      mseTmpMsg=$(mse_str_replacePlaceHolder "${lbl_exec_vp_ipd_fieldA_MustBeAnInteger}" "FIELDNAME_A" "Max")
                      mseReturn=$(mse_str_replacePlaceHolder "${lbl_exec_vp_ipd_mainMessage}" "MSG" "${mseTmpMsg}")
                    fi
                  fi
                  if [ "$mseReturn" == 1 ]; then
                    if [ "$mseParamMin" != "" ] && [ "$mseParamMax" != "" ] && [ "$mseParamMin" -gt "$mseParamMax" ]; then
                      mseTmpMsg=$(mse_str_replacePlaceHolder "${lbl_exec_vp_ipd_fieldA_IsGreaterThan_FieldB}" "FIELDNAME_A" "Min" "FIELDNAME_B" "Max")
                      mseReturn=$(mse_str_replacePlaceHolder "${lbl_exec_vp_ipd_mainMessage}" "MSG" "${mseTmpMsg}")
                    fi
                  fi
                  if [ "$mseReturn" == 1 ] && [ "$mseParamType" == "arrayName" ]; then
                    if [ "$mseParamMin" != "" ] && [ "$mseParamMin" -lt 0 ]; then
                      mseTmpMsg=$(mse_str_replacePlaceHolder "${lbl_exec_vp_ipd_forTypeA_FieldA_MustBeGreaterOrEqualsToZero}" "TYPE_A" "arrayName" "FIELDNAME_A" "Min")
                      mseReturn=$(mse_str_replacePlaceHolder "${lbl_exec_vp_ipd_mainMessage}" "MSG" "${mseTmpMsg}")
                    elif [ "$mseParamMax" != "" ] && [ "$mseParamMax" -lt 1 ]; then
                      mseTmpMsg=$(mse_str_replacePlaceHolder "${lbl_exec_vp_ipd_forTypeA_FieldA_MustBeGreaterOrEqualsToOne}" "TYPE_A" "arrayName" "FIELDNAME_A" "Max")
                      mseReturn=$(mse_str_replacePlaceHolder "${lbl_exec_vp_ipd_mainMessage}" "MSG" "${mseTmpMsg}")
                    fi
                  fi
                ;;
                fileName | dirName)
                  mseParamCreate="0"
                  if [ $mseParamL -ge 5 ]; then
                    case "${mseRawCurrentParamRuleValues[4]}" in
                      create | yes | y | 1)
                        mseParamCreate=1
                      ;;
                      nocreate | no | n | 0)
                        mseParamCreate=0
                      ;;
                      *)
                        mseTmpMsg=$(mse_str_replacePlaceHolder "${lbl_exec_vp_ipd_fieldA_HasAnInvalidOption}" "FIELDNAME_A" "${mseParamType}")
                        mseReturn=$(mse_str_replacePlaceHolder "${lbl_exec_vp_ipd_mainMessage}" "MSG" "${mseTmpMsg}")
                      ;;
                    esac
                  fi
                ;;
                assocName)
                  mseParamAssocKeys=()
                  if [ $mseParamL -ge 5 ] && [ "${mseRawCurrentParamRuleValues[4]}" != "" ]; then
                    local mseI
                    local mseL
                    mse_str_split "," "${mseRawCurrentParamRuleValues[4]}"
                    mseParamAssocKeys=("${MSE_GLOBAL_MODULE_SPLIT_RESULT[@]}")
                    mseL="${#mseParamAssocKeys[@]}"
                    for ((mseI=0; mseI<mseL; mseI++)); do
                      mseParamAssocKeys[$mseI]=$(mse_str_trim "${mseParamAssocKeys[$mseI]}")
                    done
                  fi
                ;;
                list)
                  local mseParamTmpList
                  mseParamCk=$(mse_check_hasKeyInAssocArray "${mseRawCurrentParamRuleKey}_labels" "${mseRawParamRulesName}")
                  if [ $mseParamCk == 0 ]; then
                    mseTmpMsg=$(mse_str_replacePlaceHolder "${lbl_exec_vp_ipd_fieldA_LostThe_A_Collection}" "FIELDNAME_A" "List" "A" "label")
                    mseReturn=$(mse_str_replacePlaceHolder "${lbl_exec_vp_ipd_mainMessage}" "MSG" "${mseTmpMsg}")
                  else
                    mseParamTmpList="${mseRawParamRules[${mseRawCurrentParamRuleKey}_labels]}"
                    if [ "$mseParamTmpList" == "" ]; then
                      mseTmpMsg=$(mse_str_replacePlaceHolder "${lbl_exec_vp_ipd_fieldA_HasAnEmpty_A_Collection}" "FIELDNAME_A" "List" "A" "label")
                      mseReturn=$(mse_str_replacePlaceHolder "${lbl_exec_vp_ipd_mainMessage}" "MSG" "${mseTmpMsg}")
                    else
                      mse_str_split "," "${mseParamTmpList}"
                      mseParamListLabels=("${MSE_GLOBAL_MODULE_SPLIT_RESULT[@]}")
                      mseL="${#mseParamListLabels[@]}"
                      for ((mseI=0; mseI<mseL; mseI++)); do
                        mseParamListLabels[$mseI]=$(mse_str_trim "${mseParamListLabels[$mseI]}")
                      done
                    fi
                  fi
                  if [ "${mseReturn}" == 1 ]; then
                    mseParamCk=$(mse_check_hasKeyInAssocArray "${mseRawCurrentParamRuleKey}_values" "${mseRawParamRulesName}")
                    if [ $mseParamCk == 0 ]; then
                      mseTmpMsg=$(mse_str_replacePlaceHolder "${lbl_exec_vp_ipd_fieldA_LostThe_A_Collection}" "FIELDNAME_A" "List" "A" "value")
                      mseReturn=$(mse_str_replacePlaceHolder "${lbl_exec_vp_ipd_mainMessage}" "MSG" "${mseTmpMsg}")
                    else
                      mseParamTmpList="${mseRawParamRules[${mseRawCurrentParamRuleKey}_values]}"
                      if [ "$mseParamTmpList" == "" ]; then
                        mseTmpMsg=$(mse_str_replacePlaceHolder "${lbl_exec_vp_ipd_fieldA_HasAnEmpty_A_Collection}" "FIELDNAME_A" "List" "A" "value")
                        mseReturn=$(mse_str_replacePlaceHolder "${lbl_exec_vp_ipd_mainMessage}" "MSG" "${mseTmpMsg}")
                      else
                        mse_str_split "," "${mseParamTmpList}"
                        mseParamListValues=("${MSE_GLOBAL_MODULE_SPLIT_RESULT[@]}")
                        mseL="${#mseParamListValues[@]}"
                        for ((mseI=0; mseI<mseL; mseI++)); do
                          mseParamListValues[$mseI]=$(mse_str_trim "${mseParamListValues[$mseI]}")
                        done
                      fi
                    fi
                  fi
                  if [ "${mseReturn}" == 1 ] && [ ${#mseParamListLabels[@]} != ${#mseParamListValues[@]} ]; then
                    mseTmpMsg=$(mse_str_replacePlaceHolder "${lbl_exec_vp_ipd_fieldA_HasAnIncorrectCorrelationBetween_A_and_B}" "FIELDNAME_A" "List" "A" "labels" "B" "values")
                    mseReturn=$(mse_str_replacePlaceHolder "${lbl_exec_vp_ipd_mainMessage}" "MSG" "${mseTmpMsg}")
                  fi
                ;;
              esac
            fi
            if [ "${mseReturn}" == 1 ]; then
              if [ "$mseCurrentParam" -lt "$mseRawParamDataLength" ]; then
                mseCurrentParamIsSet=1
                mseRawCurrentParamDataValue="${mseRawParamData[$mseCurrentParam]}"
              fi
              if [ $mseCurrentParamIsSet == 0 ] && [ "${mseParamDefault}" != "" ]; then
                mseCurrentParamIsSet=1
                mseRawCurrentParamDataValue="${mseParamDefault}"
              fi
              if [ $mseParamRequired == 1 ] && [ $mseCurrentParamIsSet == 0 ]; then
                ((mseCurrentParam=mseCurrentParam+1))
                mseReturn=$(mse_str_replacePlaceHolder "${lbl_err_paramA_IsRequired}" "PARAM_A" "${mseParamLabel}")
              else
                if [ "${mseRawCurrentParamDataValue}" != "" ]; then
                  case "${mseParamType}" in
                    bool)
                      if [ "${mseRawCurrentParamDataValue}" != 1 ] && [ "${mseRawCurrentParamDataValue}" != 0 ]; then
                        mseReturn=$(mse_str_replacePlaceHolder "${lbl_err_paramA_IsNot_A}" "PARAM_A" "${mseParamLabel}" "A" "bool")
                      fi
                    ;;
                    string)
                      local oLC_CTYPE="${LC_CTYPE}"
                      LC_CTYPE=""
                      if [ "$mseParamMaxLength" != "" ] && [ "${#mseRawCurrentParamDataValue}" -gt $mseParamMaxLength ]; then
                        mseReturn=$(mse_str_replacePlaceHolder "${lbl_err_paramA_IsGreaterThanMaxLength}" "PARAM_A" "${mseParamLabel}" "MAXLENGTH" "${mseParamMaxLength}")
                      fi
                      LC_CTYPE="${oLC_CTYPE}"
                    ;;
                    char)
                      mseParamCk=$(mse_check_isChar "${mseRawCurrentParamDataValue}")
                      if [ $mseParamCk == 0 ]; then
                        mseReturn=$(mse_str_replacePlaceHolder "${lbl_err_paramA_IsNot_A}" "PARAM_A" "${mseParamLabel}" "A" "char")
                      fi
                    ;;
                    charDecimal)
                      mseParamCk=$(mse_check_isCharDecimal "${mseRawCurrentParamDataValue}")
                      if [ $mseParamCk == 0 ]; then
                        mseReturn=$(mse_str_replacePlaceHolder "${lbl_err_paramA_IsNotValid_A_RepresentationOf_B}" "PARAM_A" "${mseParamLabel}" "A" "decimal" "B" "char")
                      fi
                    ;;
                    charHex)
                      mseParamCk=$(mse_check_isCharHex "${mseRawCurrentParamDataValue}")
                      if [ $mseParamCk == 0 ]; then
                        mseReturn=$(mse_str_replacePlaceHolder "${lbl_err_paramA_IsNotValid_A_RepresentationOf_B}" "PARAM_A" "${mseParamLabel}" "A" "hexadecimal" "B" "char")
                      fi
                    ;;
                    charOctal)
                      mseParamCk=$(mse_check_isCharOctal "${mseRawCurrentParamDataValue}")
                      if [ $mseParamCk == 0 ]; then
                        mseReturn=$(mse_str_replacePlaceHolder "${lbl_err_paramA_IsNotValid_A_RepresentationOf_B}" "PARAM_A" "${mseParamLabel}" "A" "octal" "B" "char")
                      fi
                    ;;
                    int)
                      mseParamCk=$(mse_check_isInteger "${mseRawCurrentParamDataValue}")
                      if [ "$mseParamCk" == 0 ]; then
                        mseReturn=$(mse_str_replacePlaceHolder "${lbl_err_paramA_IsNotAn_A}" "PARAM_A" "${mseParamLabel}" "A" "integer")
                      else
                        if [ "$mseParamMin" != "" ] && [ "${mseRawCurrentParamDataValue}" -lt "$mseParamMin" ]; then
                          mseReturn=$(mse_str_replacePlaceHolder "${lbl_err_paramA_MustBeGreaterOrEqualsThan_A}" "PARAM_A" "${mseParamLabel}" "A" "${mseParamMin}")
                        elif [ "$mseParamMax" != "" ] && [ "${mseRawCurrentParamDataValue}" -gt "$mseParamMax" ]; then
                          mseReturn=$(mse_str_replacePlaceHolder "${lbl_err_paramA_MustBeLessOrEqualsThan_A}" "PARAM_A" "${mseParamLabel}" "A" "${mseParamMax}")
                        fi
                      fi
                    ;;
                    fileName)
                      if [ "${mseParamCreate}" == 1 ] && [ ! -f "${mseRawCurrentParamDataValue}" ]; then
                        > "${mseRawCurrentParamDataValue}"
                        if [ "$?" != 0 ]; then
                          mseReturn=$(mse_str_replacePlaceHolder "${lbl_err_cannotCreateNewFileIn}" "LOCAL" "${mseRawCurrentParamDataValue}")
                        fi
                      fi
                      if [ ! -f "${mseRawCurrentParamDataValue}" ]; then
                        mseReturn=$(mse_str_replacePlaceHolder "${lbl_err_paramA_PointsToNonExistentFile}" "PARAM_A" "${mseParamLabel}")
                      fi
                    ;;
                    dirName)
                      if [ "${mseParamCreate}" == 1 ] && [ ! -d "${mseRawCurrentParamDataValue}" ]; then
                        mkdir -p "${mseRawCurrentParamDataValue}"
                        if [ $? != 0 ]; then
                          mseReturn=$(mse_str_replacePlaceHolder "${lbl_err_cannotCreateNewDirectoryIn}" "LOCAL" "${mseRawCurrentParamDataValue}")
                        fi
                      fi
                      if [ ! -d "${mseRawCurrentParamDataValue}" ]; then
                        mseReturn=$(mse_str_replacePlaceHolder "${lbl_err_paramA_PointsToNonExistentDirectory}" "PARAM_A" "${mseParamLabel}")
                      fi
                    ;;
                    functionName)
                      mseParamCk=$(mse_check_isFunctionExists "${mseRawCurrentParamDataValue}")
                      if [ $mseParamCk == 0 ]; then
                        mseReturn=$(mse_str_replacePlaceHolder "${lbl_err_paramA_MustBeNameOfExistentFunction}" "PARAM_A" "${mseParamLabel}")
                      fi
                    ;;
                    arrayName)
                      if [[ ! "$(declare -p ${mseRawCurrentParamDataValue} 2> /dev/null)" =~ "declare -a" ]]; then
                        mseReturn=$(mse_str_replacePlaceHolder "${lbl_err_paramA_IsNotAn_A}" "PARAM_A" "${mseParamLabel}" "A" "array name")
                      else
                        declare -n mseTmpArrayName="${mseRawCurrentParamDataValue}"
                        if [ "$mseParamMin" != "" ] && [ "${#mseTmpArrayName[@]}" -lt "$mseParamMin" ]; then
                          mseReturn=$(mse_str_replacePlaceHolder "${lbl_err_paramA_MustBeAnArrayWithAtLast_Min}" "PARAM_A" "${mseParamLabel}" "MIN" ${mseParamMin})
                        elif [ "$mseParamMax" != "" ] && [ "${#mseTmpArrayName[@]}" -gt "$mseParamMax" ]; then
                          mseReturn=$(mse_str_replacePlaceHolder "${lbl_err_paramA_MustBeAnArrayWithAtLast_Max}" "PARAM_A" "${mseParamLabel}" "MAX" ${mseParamMax})
                        fi
                      fi
                    ;;
                    assocName)
                      if [[ ! "$(declare -p ${mseRawCurrentParamDataValue} 2> /dev/null)" =~ "declare -A" ]]; then
                        mseReturn=$(mse_str_replacePlaceHolder "${lbl_err_paramA_IsNotAn_A}" "PARAM_A" "${mseParamLabel}" "A" "associative array name")
                      else
                        declare -n mseTmpAssocArrayName="${mseRawCurrentParamDataValue}"
                        local mseTmpAssocKey
                        for mseTmpAssocKey in "${mseParamAssocKeys[@]}"; do
                          if [ "$mseReturn" == 1 ] && [ -z "${mseTmpAssocArrayName[$mseTmpAssocKey]+x}" ]; then
                            mseReturn=$(mse_str_replacePlaceHolder "${lbl_err_paramA_LostTheRequiredKey_Key}" "PARAM_A" "${mseParamLabel}" "KEY" ${mseTmpAssocKey})
                          fi
                        done
                      fi
                    ;;
                    list)
                      local mseTmpMatch
                      local mseTmpListI
                      local mseTmpListL
                      mseTmpMatch=0
                      mseTmpListL="${#mseParamListLabels[@]}"
                      for ((mseTmpListI=0; mseTmpListI<mseTmpListL; mseTmpListI++)); do
                        if [ "${mseRawCurrentParamDataValue}" == "${mseParamListLabels[$mseTmpListI]}" ] || [ "${mseRawCurrentParamDataValue}" == "${mseParamListValues[$mseTmpListI]}" ]; then
                          mseRawCurrentParamDataValue="${mseParamListValues[$mseTmpListI]}"
                          mseTmpMatch=1
                          break;
                        fi
                      done
                      if [ "$mseTmpMatch" == 0 ]; then
                        mseReturn=$(mse_str_replacePlaceHolder "${lbl_err_paramA_HasInvalidValue}" "PARAM_A" "${mseParamLabel}")
                      fi
                    ;;
                  esac
                fi
              fi
            fi
          fi
        fi
      fi
    done
  fi
  printf "%s" "${mseReturn}"
}
# END :: mse_exec_validateParams.sh


# INI :: checkLine.sh
mse_file_read_checkLine_isComment() {
  local mseR
  local mseLine
  mseR=0
  if [ $# -ge 3 ] && [ "$2" != "" ]; then
    mseLine=$(mse_str_trim "${2}")
    if [ "$3" == "1" ]; then
      mseLine="${mseLine#*#}"
    fi
    for mseComSig in "${MSE_GLOBAL_MODULE_READ_LINE_ARGS_ARRAY[@]}"; do
      if [ "${mseLine:0:1}" == "$mseComSig" ]; then
        mseR=1
        break
      fi
    done
  fi
  printf "${mseR}"
}
mse_file_read_checkLine_isVariable() {
  local mseR
  local mseLine
  local mseReg
  local mseCommentChars
  mseR=0
  if [ $# -ge 4 ] && [ "$2" != "" ]; then
    mseLine=$(mse_str_trim "${2}")
    if [ $3 == 1 ]; then
      mseLine="${mseLine#*#}"
    fi
    mseCommentChars=$(printf '%s' "${MSE_GLOBAL_MODULE_READ_LINE_ARGS_ARRAY[@]}")
    mseReg='^(['"${mseCommentChars}"']?)([a-zA-Z]+).*='
    if [[ "$mseLine" =~ $mseReg ]]; then
      mseR=1
    fi
  fi
  printf "${mseR}"
}
mse_file_read_checkLine_hasVariable() {
  local mseR
  local mseLine
  local mseComSig
  mseR=0
  if [ $# -ge 4 ] && [ "$2" != "" ]; then
    mseLine=$(mse_str_trim "$2")
    mseLine=$(mse_str_trimD "=" "$mseLine")
    if [ $3 == 1 ]; then
      mseLine="${mseLine#*#}"
    fi
    for mseComSig in "${MSE_GLOBAL_MODULE_READ_LINE_ARGS_ARRAY[@]}"; do
      if [ "${mseLine:0:1}" == "${mseComSig}" ]; then
        mseLine="${mseLine#${mseComSig}}"
      fi
    done
    if [ "${mseLine%%=*}" == "$4" ]; then
      mseR=1
    fi
  fi
  printf "${mseR}"
}
# END :: checkLine.sh


# INI :: checkSection.sh
mse_file_read_checkSection_start() {
  local mseR
  mseR=0
  if [ $# == 3 ]; then
    local mseSection
    for mseSection in "${MSE_GLOBAL_MODULE_READ_BLOCK_START_ARGS_ARRAY[@]}"; do
      mseSection="[${mseSection}]"
      if [ "$mseSection" == "$2" ]; then
        mseR=1
        break
      fi
    done
  fi
  printf "${mseR}"
}
mse_file_read_checkSection_end() {
  local mseR
  mseR=0
  if [ "${2:0:1}" == "[" ]; then
    mseR=1
  fi
  printf "${mseR}"
}
# END :: checkSection.sh


# INI :: resetConfig.sh
mse_file_read_resetConfig() {
  unset MSE_GLOBAL_MODULE_READ_BLOCK
  declare -gA MSE_GLOBAL_MODULE_READ_BLOCK
  MSE_GLOBAL_MODULE_READ_BLOCK["start"]=""
  MSE_GLOBAL_MODULE_READ_BLOCK["start_args"]=""
  MSE_GLOBAL_MODULE_READ_BLOCK["start_args_sep"]=""
  MSE_GLOBAL_MODULE_READ_BLOCK["end"]=""
  MSE_GLOBAL_MODULE_READ_BLOCK["end_args"]=""
  MSE_GLOBAL_MODULE_READ_BLOCK["end_args_sep"]=""
  MSE_GLOBAL_MODULE_READ_BLOCK["print_start_line"]=""
  unset MSE_GLOBAL_MODULE_READ_BLOCK_START_ARGS_ARRAY
  declare -ga MSE_GLOBAL_MODULE_READ_BLOCK_START_ARGS_ARRAY=()
  unset MSE_GLOBAL_MODULE_READ_BLOCK_END_ARGS_ARRAY
  declare -ga MSE_GLOBAL_MODULE_READ_BLOCK_END_ARGS_ARRAY=()
  unset MSE_GLOBAL_MODULE_READ_LINE
  declare -gA MSE_GLOBAL_MODULE_READ_LINE
  MSE_GLOBAL_MODULE_READ_LINE["check"]=""
  MSE_GLOBAL_MODULE_READ_LINE["check_args"]=""
  MSE_GLOBAL_MODULE_READ_LINE["check_args_sep"]=""
  MSE_GLOBAL_MODULE_READ_LINE["check_has_linenumber"]=""
  MSE_GLOBAL_MODULE_READ_LINE["check_invert"]=""
  unset MSE_GLOBAL_MODULE_READ_LINE_ARGS_ARRAY
  declare -ga MSE_GLOBAL_MODULE_READ_LINE_ARGS_ARRAY=()
  MSE_GLOBAL_MODULE_READ_LINE["transform"]=""
  MSE_GLOBAL_MODULE_READ_LINE["transform_args"]=""
  MSE_GLOBAL_MODULE_READ_LINE["transform_args_sep"]=""
  MSE_GLOBAL_MODULE_READ_LINE["transform_has_linenumber"]=""
  unset MSE_GLOBAL_MODULE_READ_TRANSFORM_ARGS_ARRAY
  declare -ga MSE_GLOBAL_MODULE_READ_TRANSFORM_ARGS_ARRAY=()
}
# END :: resetConfig.sh


# INI :: transformLine.sh
mse_file_read_transformLine_normalizeKeyValue() {
  local mseLine
  if [ $# -ge 2 ] && [ "$2" != "" ]; then
    mseLine=$(mse_str_trimD "=" "$2")
  fi
  printf "${mseLine}"
}
# END :: transformLine.sh


# INI :: mse_file_countLines.sh
mse_file_countLines() {
  local mseReturn
  local mseLineRaw
  local mseFileContent
  local oIFS
  mseReturn=0
  mseFileContent="$1"
  if [ -f "$mseFileContent" ]; then
    mseFileContent=$(< "$mseFileContent")
  fi
  if [ "${mseFileContent}" != "" ]; then
    oIFS=$IFS
    IFS=$'\n'
    while read mseLineRaw || [ -n "${mseLineRaw}" ]; do
      ((mseReturn=mseReturn+1))
    done <<< "$mseFileContent"
    IFS=$oIFS
  fi
  printf "%s" "${mseReturn}"
}
mse_file_countLines_vldtr() {
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["count"]=1
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_0"]="PathToFile :: r :: fileName"
}
# END :: mse_file_countLines.sh


# INI :: mse_file_read.sh
mse_file_read()
{
  local mseReturn
  local mseLineRaw
  local mseFileContent
  local oIFS
  mseReturn=0
  mseFileContent="$1"
  if [ -f "$mseFileContent" ]; then
    mseFileContent=$(< "$mseFileContent")
  fi
  if [ "${mseFileContent}" != "" ]; then
    local mseLineShowEmpty
    local mseLineShowNumber
    local mseValidSection
    local mseSectionStartFunctionName
    local mseSectionStartFunctionArgs
    local mseSectionEndFunctionName
    local mseSectionEndFunctionArgs
    local mseSectionShowFirstLine
    local mseValidLine
    local mseLineCheckFunctionName
    local mseLineCheckFunctionArgs
    local mseLineCheckFunctionInvert
    local mseLineCheckFunctionNumberLine
    local mseTransformLineFunctionName
    local mseTransformLineFunctionArgs
    local mseTransformLineFunctionNumberLine
    local oIFS
    local mseLineRaw
    local mseLineCount
    mseLineShowEmpty=0
    if [ $# -ge 2 ] && [ $2 == 1 ]; then
      mseLineShowEmpty=1
    fi
    mseLineShowNumber=0
    if [ $# -ge 3 ] && [ $3 == 1 ]; then
      mseLineShowNumber=1
    fi
    mseValidSection=1
    mseSectionStartFunctionName=""
    mseSectionStartFunctionArgs=""
    mseSectionEndFunctionName=""
    mseSectionEndFunctionArgs=""
    mseSectionShowFirstLine=0
    if [ "${MSE_GLOBAL_MODULE_READ_BLOCK[start]}" != "" ]; then
      mseValidSection=0
      mseSectionStartFunctionName="${MSE_GLOBAL_MODULE_READ_BLOCK[start]}"
      mseSectionStartFunctionArgs="${MSE_GLOBAL_MODULE_READ_BLOCK[start_args]}"
      if [ "${MSE_GLOBAL_MODULE_READ_BLOCK[start_args_sep]}" != "" ]; then
        unset MSE_GLOBAL_MODULE_READ_BLOCK_START_ARGS_ARRAY
        declare -ga MSE_GLOBAL_MODULE_READ_BLOCK_START_ARGS_ARRAY=()
        mse_str_split "${MSE_GLOBAL_MODULE_READ_BLOCK[start_args_sep]}" "$mseSectionStartFunctionArgs"
        MSE_GLOBAL_MODULE_READ_BLOCK_START_ARGS_ARRAY=("${MSE_GLOBAL_MODULE_SPLIT_RESULT[@]}")
      fi
      mseSectionEndFunctionName="${MSE_GLOBAL_MODULE_READ_BLOCK[end]}"
      mseSectionEndFunctionArgs="${MSE_GLOBAL_MODULE_READ_BLOCK[end_args]}"
      if [ "${MSE_GLOBAL_MODULE_READ_BLOCK[end_args_sep]}" != "" ]; then
        unset MSE_GLOBAL_MODULE_READ_BLOCK_END_ARGS_ARRAY
        declare -ga MSE_GLOBAL_MODULE_READ_BLOCK_END_ARGS_ARRAY=()
        mse_str_split "${MSE_GLOBAL_MODULE_READ_BLOCK[end_args_sep]}" "$mseSectionEndFunctionArgs"
        MSE_GLOBAL_MODULE_READ_BLOCK_END_ARGS_ARRAY=("${MSE_GLOBAL_MODULE_SPLIT_RESULT[@]}")
      fi
      if [ "${MSE_GLOBAL_MODULE_READ_BLOCK[print_start_line]}" == "1" ]; then
        mseSectionShowFirstLine=1
      fi
    fi
    mseLineCheckFunctionName=""
    mseLineCheckFunctionArgs=""
    mseLineCheckFunctionInvert=0
    mseLineCheckFunctionNumberLine=0
    if [ "${MSE_GLOBAL_MODULE_READ_LINE[check]}" != "" ]; then
      mseLineCheckFunctionName="${MSE_GLOBAL_MODULE_READ_LINE[check]}"
      mseLineCheckFunctionArgs="${MSE_GLOBAL_MODULE_READ_LINE[check_args]}"
      if [ "${MSE_GLOBAL_MODULE_READ_LINE[check_args_sep]}" != "" ]; then
        unset MSE_GLOBAL_MODULE_READ_LINE_ARGS_ARRAY
        declare -ga MSE_GLOBAL_MODULE_READ_LINE_ARGS_ARRAY=()
        mse_str_split "${MSE_GLOBAL_MODULE_READ_LINE[check_args_sep]}" "$mseLineCheckFunctionArgs"
        MSE_GLOBAL_MODULE_READ_LINE_ARGS_ARRAY=("${MSE_GLOBAL_MODULE_SPLIT_RESULT[@]}")
      fi
      if [ "${MSE_GLOBAL_MODULE_READ_LINE[check_invert]}" == "1" ]; then
        mseLineCheckFunctionInvert=1
      fi
      if [ "${MSE_GLOBAL_MODULE_READ_LINE[check_has_linenumber]}" == "1" ]; then
        mseLineCheckFunctionNumberLine=1
      fi
    fi
    mseTransformLineFunctionName=""
    mseTransformLineFunctionArgs=""
    mseTransformLineFunctionNumberLine=0
    if [ "${MSE_GLOBAL_MODULE_READ_LINE[transform]}" != "" ]; then
      mseTransformLineFunctionName="${MSE_GLOBAL_MODULE_READ_LINE[transform]}"
      mseTransformLineFunctionArgs="${MSE_GLOBAL_MODULE_READ_LINE[transform_args]}"
      if [ "${MSE_GLOBAL_MODULE_READ_LINE[transform_args_sep]}" != "" ]; then
        unset MSE_GLOBAL_MODULE_READ_TRANSFORM_ARGS_ARRAY
        declare -ga MSE_GLOBAL_MODULE_READ_TRANSFORM_ARGS_ARRAY=()
        mse_str_split "${MSE_GLOBAL_MODULE_READ_LINE[transform_args_sep]}" "$mseTransformLineFunctionArgs"
        MSE_GLOBAL_MODULE_READ_TRANSFORM_ARGS_ARRAY=("${MSE_GLOBAL_MODULE_SPLIT_RESULT[@]}")
      fi
      if [ "${MSE_GLOBAL_MODULE_READ_LINE[transform_has_linenumber]}" == "1" ]; then
        mseTransformLineFunctionNumberLine=1
      fi
    fi
    oIFS=$IFS
    IFS=$'\n'
    while read mseLineRaw || [ -n "${mseLineRaw}" ]; do
      ((mseLineCount=mseLineCount+1))
      mseValidLine=1
      if [ "${mseLineRaw}" != "" ] || [ $mseLineShowEmpty == 1 ]; then
        if [ $mseValidSection == 0 ]; then
          if [ "${mseSectionStartFunctionName}" != "" ]; then
            mseValidSection=$($mseSectionStartFunctionName "$mseLineCount" "${mseLineRaw}" "$mseSectionStartFunctionArgs")
            if [ $mseValidSection == 1 ] && [ $mseSectionShowFirstLine == 0 ]; then
              mseValidLine=0
            fi
          fi
        else
          if [ "${mseSectionEndFunctionName}" != "" ]; then
            mseValidSection=$($mseSectionEndFunctionName "$mseLineCount" "${mseLineRaw}" "$mseSectionEndFunctionArgs")
            if [ $mseValidSection == 1 ]; then mseValidSection=0; else mseValidSection=1; fi
          fi
        fi
        if [ $mseValidSection == 1 ] && [ $mseValidLine == 1 ]; then
          if [ "$mseLineCheckFunctionName" != "" ]; then
            mseValidLine=$($mseLineCheckFunctionName "$mseLineCount" "${mseLineRaw}" "$mseLineCheckFunctionNumberLine" "$mseLineCheckFunctionArgs")
            if [ $mseLineCheckFunctionInvert == "1" ]; then
              if [ $mseValidLine == 1 ]; then mseValidLine=0; else mseValidLine=1; fi
            fi
          fi
          if [ $mseValidLine == 1 ]; then
            if [ "$mseTransformLineFunctionName" != "" ]; then
              mseLineRaw=$($mseTransformLineFunctionName "$mseLineCount" "${mseLineRaw}" "$mseTransformLineFunctionNumberLine" "$mseTransformLineFunctionArgs")
            fi
            if [ $mseLineShowNumber == 1 ]; then
              printf "${mseLineCount}#"
            fi
            printf "${mseLineRaw}\n"
          fi
        fi
      fi
    done <<< "$mseFileContent"
    IFS=$oIFS
  fi
  return 0
}
mse_file_read_vldtr() {
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["count"]=3
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_0"]="PathToFile :: r :: string"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_1"]="ShowEmptyLines :: o :: bool :: 0"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_2"]="ShowLineNumber :: o :: bool :: 0"
}
# END :: mse_file_read.sh


# INI :: mse_file_write.sh
mse_file_write()
{
  local mseReturn
  local mseFilePath
  local mseFileContent
  local mseFileLastLine
  declare -n mseContentArrayName
  local mseAction
  local mseTargetFirstLine
  local mseTargetLastLine
  local oIFS
  local mseCountLine
  local mseNewFileContent
  mseReturn=1
  mseFilePath="$1"
  mseFileContent=$(< "$mseFilePath")
  mseFileLastLine=$(mse_file_countLines "$mseFilePath")
  mseContentArrayName="$2"
  mseAction="a"
  if [ $# -ge 3 ]; then
    case "$3" in
      prepend | p)
        mseAction="p"
        mseTargetFirstLine=1
        mseTargetLastLine=0
      ;;
      append | a)
        mseAction="a"
        mseTargetFirstLine=$mseFileLastLine
        mseTargetLastLine=0
      ;;
      replace | r)
        mseAction="r"
        if [ $# -lt 4 ]; then
          mseReturn=$(mse_str_replacePlaceHolder "${lbl_err_paramA_RequiredFor_A_Operation}" "PARAM_A" "TargetLine" "A" "replace")
        fi
      ;;
      delete | d)
        mseAction="d"
        if [ $# -lt 4 ]; then
          mseReturn=$(mse_str_replacePlaceHolder "${lbl_err_paramA_RequiredFor_A_Operation}" "PARAM_A" "TargetLine" "A" "delete")
        fi
      ;;
    esac
  fi
  if [ "$mseReturn" == 1 ] && [ $# -ge 4 ]; then
    if [[ "$4" =~ ^[0-9]+$ ]]; then
      mseTargetFirstLine=$4
      mseTargetLastLine=0
    else
      local mseFnName
      local mseFnResult
      local mseFnResultParts
      local mseTmpMsg
      mseFnResult="$4"
      if [ "$(type -t $4)" == "function" ]; then
        mseFnName="fn $4"
        mseFnResult=$($4)
      else
        mseFnName="Received"
      fi
      mse_str_split " " "$mseFnResult"
      mseFnResultParts="${#MSE_GLOBAL_MODULE_SPLIT_RESULT[@]}"
      if [ "$mseFnResultParts" == 0 ] || [ "$mseFnResultParts" -gt 2 ]; then
        mseTmpMsg=$(mse_str_replacePlaceHolder "${lbl_fw_iv_expectedFunctionNameOrInteger}" "FUNCTION" "${mseFnName}" "RESULT" "${mseFnResult}" "ERR" "1")
        mseReturn=$(mse_str_replacePlaceHolder "${lbl_fw_iv_mainMessage}" "PARAM_A" "TargetLine" "MSG" "${mseTmpMsg}")
      else
        mseTargetFirstLine="${MSE_GLOBAL_MODULE_SPLIT_RESULT[0]}"
        mseTargetLastLine=0
        if ! [[ "${mseTargetFirstLine}" =~ ^[0-9]+$ ]]; then
          mseTmpMsg=$(mse_str_replacePlaceHolder "${lbl_fw_iv_expectedFunctionNameOrInteger}" "FUNCTION" "${mseFnName}" "RESULT" "${mseFnResult}" "ERR" "2")
          mseReturn=$(mse_str_replacePlaceHolder "${lbl_fw_iv_mainMessage}" "PARAM_A" "TargetLine" "MSG" "${mseTmpMsg}")
        else
          if [ "$mseFnResultParts" == 2 ] && [ "${MSE_GLOBAL_MODULE_SPLIT_RESULT[1]}" != "$mseTargetFirstLine" ]; then
            mseTargetLastLine="${MSE_GLOBAL_MODULE_SPLIT_RESULT[1]}"
            if ! [[ "${mseTargetLastLine}" =~ ^[0-9]+$ ]]; then
              mseTmpMsg=$(mse_str_replacePlaceHolder "${lbl_fw_iv_expectedFunctionNameOrInteger}" "FUNCTION" "${mseFnName}" "RESULT" "${mseFnResult}" "ERR" "3")
              mseReturn=$(mse_str_replacePlaceHolder "${lbl_fw_iv_mainMessage}" "PARAM_A" "TargetLine" "MSG" "${mseTmpMsg}")
            else
              if [ $mseTargetFirstLine -gt $mseTargetLastLine ]; then
                mseTmpMsg=$(mse_str_replacePlaceHolder "${lbl_fw_iv_firstLineMustBeLessThanTheLast}" "RESULT" "${mseFnResult}")
                mseReturn=$(mse_str_replacePlaceHolder "${lbl_fw_iv_mainMessage}" "PARAM_A" "TargetLine" "MSG" "${mseTmpMsg}")
              fi
            fi
          fi
        fi
      fi
    fi
    if [ "$mseReturn" == 1 ]; then
      if [ "$mseTargetFirstLine" -lt 1 ] || [ "$mseTargetFirstLine" -gt "$mseFileLastLine" ] || [ "$mseTargetLastLine" -gt "$mseFileLastLine" ]; then
        mseTmpMsg=$(mse_str_replacePlaceHolder "${lbl_fw_iv_outsideTheFileLimits}" "LASTLINE" "${mseFileLastLine}")
        mseReturn=$(mse_str_replacePlaceHolder "${lbl_fw_iv_mainMessage}" "PARAM_A" "TargetLine" "MSG" "${mseTmpMsg}")
      fi
    fi
  fi
  if [ "$mseReturn" == 1 ]; then
    oIFS=$IFS
    IFS=$'\n'
    mseCountLine=0
    mseNewFileContent=""
    while read mseLineRaw || [ -n "${mseLineRaw}" ]; do
      ((mseCountLine=mseCountLine+1))
      if [ $mseCountLine == $mseTargetFirstLine ]; then
        if [ $mseAction == "a" ]; then
          mseNewFileContent+="${mseLineRaw}\n"
        fi
        if [ $mseAction != "d" ]; then
          local mseNL
          for mseNL in "${mseContentArrayName[@]}"; do
            mseNewFileContent+="${mseNL}\n"
          done
        fi
        if [ $mseAction == "p" ]; then
          mseNewFileContent+="${mseLineRaw}\n"
        fi
      else
        if [ $mseTargetLastLine == 0 ] || [ $mseCountLine -lt $mseTargetFirstLine ] || [ $mseCountLine -gt $mseTargetLastLine ]; then
          mseNewFileContent+="${mseLineRaw}\n"
        fi
      fi
    done <<< "$mseFileContent"
    IFS=$oIFS
    printf "${mseNewFileContent}" > "${mseFilePath}"
    if [ $? != 0 ]; then
      mseReturn="${lbl_fw_iv_errorOnSave}"
    fi
  fi
  printf "${mseReturn}"
}
mse_file_write_vldtr() {
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["count"]=3
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_0"]="PathToFile :: r :: fileName"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_1"]="ContentArrayName :: r :: arrayName"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_2"]="OperationType :: o :: list :: append"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_2_labels"]="prepend, append, replace"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_2_values"]="p, a, r"
}
# END :: mse_file_write.sh


# INI :: mse_conf_setVariable.sh
mse_conf_setVariable()
{
  local mseReturn
  local mseOperation
  local mseCommentChar
  local msePosition
  local mseRawVarLine
  local mseTargetFirstLine
  local mseTargetLastLine
  local mseTargetLineNumber
  local mseIsComment
  mseReturn=1
  if [ $# -lt 6 ]; then
    local mseArgs="$#"
    local mseLost
    ((mseLost=6-mseArgs))
    mseReturn=$(mse_str_replacePlaceHolder "${lbl_err_lostParameters}" "LOST" "${mseLost}")
  else
    if [ $# -ge 1 ] && [ "$1" == "" ]; then
      mseReturn=$(mse_str_replacePlaceHolder "${lbl_err_paramA_IsRequired}" "PARAM_A" "PathToFile")
    elif [ $# -ge 3 ] && [ "$3" == "" ]; then
      mseReturn=$(mse_str_replacePlaceHolder "${lbl_err_paramA_IsRequired}" "PARAM_A" "VariableName")
    elif [ $# -ge 5 ] && [ "$5" == "" ]; then
      mseReturn=$(mse_str_replacePlaceHolder "${lbl_err_paramA_IsRequired}" "PARAM_A" "Operation")
    elif [ $# -ge 6 ] && [ "$6" == "" ]; then
      mseReturn=$(mse_str_replacePlaceHolder "${lbl_err_paramA_IsRequired}" "PARAM_A" "CommentChar")
    fi
    if [ "$mseReturn" == 1 ] && [ ! -f "$1" ]; then
      mseReturn=$(mse_str_replacePlaceHolder "${lbl_err_paramA_PointsToNonExistentFile}" "PARAM_A" "PathToFile")
    fi
  fi
  if [ "$mseReturn" == 1 ]; then
    case "$5" in
      add | a)
        mseOperation="a"
      ;;
      delete | d)
        mseOperation="d"
      ;;
      change | ch)
        mseOperation="ch"
      ;;
      comment | c)
        mseOperation="c"
      ;;
      uncomment | u)
        mseOperation="u"
      ;;
      *)
        mseReturn=$(mse_str_replacePlaceHolder "${lbl_err_paramA_HasInvalidOption}" "PARAM_A" "Operation")
      ;;
    esac
  fi
  if [ "$mseReturn" == 1 ]; then
    mseCommentChar="$6"
  fi
  if [ "$mseReturn" == 1 ]; then
    if [ "$mseOperation" == "a" ]; then
      msePosition="a"
      if [ $# -ge 7 ] && [ "$7" != "" ]; then
        case "$7" in
          prepend | p)
            msePosition="p"
          ;;
          append | a)
            msePosition="a"
          ;;
          *)
            mseReturn=$(mse_str_replacePlaceHolder "${lbl_err_paramA_HasInvalidOption}" "PARAM_A" "Position")
          ;;
        esac
      fi
    fi
  fi
  if [ "$mseReturn" == 1 ]; then
    mseRawVarLine=$(mse_conf_showVariableLine "$1" "$2" "$3" "1")
    if [ "$mseOperation" == "a" ]; then
      if [ "$mseRawVarLine" != "" ]; then
        mseReturn=$(mse_str_replacePlaceHolder "${lbl_err_variableAlreadExists}" "VAR" "$3")
      fi
    else
      if [ "$mseRawVarLine" == "" ]; then
        if [ "$2" == "" ]; then
          mseReturn=$(mse_str_replacePlaceHolder "${lbl_err_variableDoNotExists}" "VAR" "$3")
        else
          mseReturn=$(mse_str_replacePlaceHolder "${lbl_err_variableDoNotExistsInSection}" "VAR" "$3" "SECTION" "$2")
        fi
      else
        mseTargetLineNumber="${mseRawVarLine%${mseCommentChar}*}"
        mseTargetLineNumber="${mseTargetLineNumber%*${mseCommentChar}}"
        mseRawVarLine="${mseRawVarLine#${mseTargetLineNumber}#}"
        mseIsComment=0
        if [ "${mseRawVarLine:0:1}" == "$mseCommentChar" ]; then
          mseIsComment=1
        fi
      fi
    fi
  fi
  if [ "$mseReturn" == 1 ]; then
    local mseTargetLines
    mseTargetLines=$(mse_conf_showBoundaryLinesNumbers "$1" "$2" "$mseCommentChar")
    mse_str_split " " "$mseTargetLines"
    if [ "${#MSE_GLOBAL_MODULE_SPLIT_RESULT[@]}" != 2 ]; then
      mseReturn="${lbl_cf_cannotIdentifyTargetLine}"
    else
      mseTargetFirstLine="${MSE_GLOBAL_MODULE_SPLIT_RESULT[0]}"
      mseTargetLastLine="${MSE_GLOBAL_MODULE_SPLIT_RESULT[1]}"
    fi
  fi
  if [ "$mseReturn" == 1 ]; then
    local mseNewLine
    mseNewLine=()
    if [ "$mseOperation" == "a" ]; then
      if [ "$msePosition" == "p" ]; then
        mseTargetLineNumber="${mseTargetFirstLine}"
      elif [ "$msePosition" == "a" ]; then
        mseTargetLineNumber="${mseTargetLastLine}"
      fi
      mseNewLine=("${3}=${4}")
      mseReturn=$(mse_file_write "$1" "mseNewLine" "a" "${mseTargetLineNumber}")
    elif [ "$mseOperation" == "d" ]; then
      mseReturn=$(mse_file_write "$1" "mseNewLine" "d" "${mseTargetLineNumber}")
    elif [ "$mseOperation" == "ch" ]; then
      local mseVarAssign="${mseRawVarLine%%=*}"
      local mseVarValue="${mseRawVarLine#${mseVarAssign}=}"
      local mseVarSep=${mseVarValue%%[^ ]*}
      mseNewLine=("${mseVarAssign}=${mseVarSep}${4}")
      mseReturn=$(mse_file_write "$1" "mseNewLine" "r" "${mseTargetLineNumber}")
    elif [ "$mseOperation" == "c" ]; then
      if [ "$mseIsComment" == 0 ]; then
        mseNewLine=("${mseCommentChar}${mseRawVarLine}")
        mseReturn=$(mse_file_write "$1" "mseNewLine" "r" "${mseTargetLineNumber}")
      fi
    elif [ "$mseOperation" == "u" ]; then
      if [ "$mseIsComment" == 1 ]; then
        mseNewLine=("${mseRawVarLine:1}")
        mseReturn=$(mse_file_write "$1" "mseNewLine" "r" "${mseTargetLineNumber}")
      fi
    fi
  fi
  printf "%s" "${mseReturn}"
}
mse_conf_mainSetVariable_vldtr() {
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["count"]=7
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_0"]="PathToFile :: r :: fileName"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_1"]="SectionName :: r :: string"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_2"]="VariableName :: r :: string"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_3"]="VariableValue :: r :: string"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_4"]="Operation :: r :: list"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_4_labels"]="add, delete, change, comment, uncomment"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_4_values"]="a, d, ch, c, u"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_5"]="CommentChar :: r :: char"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_6"]="Position :: o :: list"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_6_labels"]="prepend, append"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_6_values"]="p, a"
}
# END :: mse_conf_setVariable.sh


# INI :: mse_conf_showBoundaryLinesNumbers.sh
mse_conf_showBoundaryLinesNumbers()
{
  local mseCharC
  local mseFirstLine
  local mseFirstLineNumber
  local mseLastLine
  local mseLastLineNumber
  if [ $# == 1 ] || [ "$2" == "" ]; then
    mseFirstLineNumber="1"
    mseLastLineNumber=$(mse_file_countLines "$1")
  elif [ $# -ge 3 ]; then
    mse_file_read_resetConfig
    MSE_GLOBAL_MODULE_READ_BLOCK["start"]="mse_file_read_checkSection_start"
    MSE_GLOBAL_MODULE_READ_BLOCK["start_args"]="$2"
    MSE_GLOBAL_MODULE_READ_BLOCK["start_args_sep"]=","
    MSE_GLOBAL_MODULE_READ_BLOCK["end"]="mse_file_read_checkSection_end"
    MSE_GLOBAL_MODULE_READ_BLOCK["print_start_line"]="1"
    local mseRawLines=$(mse_file_read "$1" 0 "1")
    if [ "$mseRawLines" != "" ]; then
      mseCharC="$3"
      mseFirstLine="${mseRawLines%%[[:cntrl:]]*}"
      mseFirstLineNumber="${mseFirstLine%${mseCharC}*}"
      mseFirstLineNumber="${mseFirstLineNumber%*${mseCharC}}"
      mseLastLine="${mseRawLines##*[[:cntrl:]]}"
      mseLastLineNumber="${mseLastLine%${mseCharC}*}"
      mseLastLineNumber="${mseLastLineNumber%*${mseCharC}}"
    fi
  fi
  printf "%s" "${mseFirstLineNumber} ${mseLastLineNumber}"
}
mse_conf_showBoundaryLinesNumbers_vldtr() {
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["count"]=3
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_0"]="PathToFile :: r :: fileName"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_1"]="SectionName :: r :: string"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_2"]="CommentChar :: r :: char"
}
# END :: mse_conf_showBoundaryLinesNumbers.sh


# INI :: mse_conf_showVariableLine.sh
mse_conf_showVariableLine()
{
  local mseReturn
  local mseRawSection
  local mseShowLineNumber
  mseShowLineNumber=0
  if [ $# -ge 4 ] && [ $4 == 1 ]; then
    mseShowLineNumber=1
  fi
  mseRawSection=$(mse_conf_showVariables "$1" "$2" "$mseShowLineNumber")
  mseReturn=""
  if [ "$mseRawSection" != "" ]; then
    mse_file_read_resetConfig
    MSE_GLOBAL_MODULE_READ_LINE["check"]="mse_file_read_checkLine_hasVariable"
    MSE_GLOBAL_MODULE_READ_LINE["check_args"]="$3"
    MSE_GLOBAL_MODULE_READ_LINE["check_has_linenumber"]="$mseShowLineNumber"
    unset MSE_GLOBAL_MODULE_READ_LINE_ARGS_ARRAY
    declare -ga MSE_GLOBAL_MODULE_READ_LINE_ARGS_ARRAY=("#" ";")
    mseReturn=$(mse_file_read "$mseRawSection")
  fi
  printf "${mseReturn%%[[:cntrl:]]*}"
}
mse_conf_showVariableLine_vldtr() {
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["count"]=4
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_0"]="PathToFile :: r :: fileName"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_1"]="SectionName :: r :: string"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_2"]="VariableName :: r :: string"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_3"]="ShowLineNumber :: o :: bool :: 0"
}
# END :: mse_conf_showVariableLine.sh


# INI :: mse_conf_showVariableValue.sh
mse_conf_showVariableValue()
{
  local mseReturn
  mseReturn=$(mse_conf_showVariableLine "$1" "$2" "$3" 0)
  if [ "${mseReturn}" != "" ]; then
    mseReturn=$(mse_str_trimD "=" "${mseReturn}")
    printf "${mseReturn#${3}=}"
  fi
}
mse_conf_showVariableValue_vldtr() {
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["count"]=3
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_0"]="PathToFile :: r :: fileName"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_1"]="SectionName :: r :: string"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_2"]="VariableName :: r :: string"
}
# END :: mse_conf_showVariableValue.sh


# INI :: mse_conf_showVariables.sh
mse_conf_showVariables()
{
  local mseReturn
  local mseShowLineNumber
  mse_file_read_resetConfig
  if [ $# -ge 2 ] && [ "$2" != "" ]; then
    MSE_GLOBAL_MODULE_READ_BLOCK["start"]="mse_file_read_checkSection_start"
    MSE_GLOBAL_MODULE_READ_BLOCK["start_args"]="$2"
    MSE_GLOBAL_MODULE_READ_BLOCK["start_args_sep"]=","
    MSE_GLOBAL_MODULE_READ_BLOCK["end"]="mse_file_read_checkSection_end"
  fi
  mseShowLineNumber=0
  if [ $# -ge 3 ] && [ $3 == 1 ]; then
    mseShowLineNumber=1
  fi
  MSE_GLOBAL_MODULE_READ_LINE["check"]="mse_file_read_checkLine_isVariable"
  MSE_GLOBAL_MODULE_READ_LINE["check_args"]="# ;"
  MSE_GLOBAL_MODULE_READ_LINE["check_args_sep"]=" "
  MSE_GLOBAL_MODULE_READ_LINE["check_has_linenumber"]="$mseShowLineNumber"
  MSE_GLOBAL_MODULE_READ_LINE["check_invert"]=""
  mse_file_read "$1" 0 "$mseShowLineNumber"
}
mse_conf_showVariables_vldtr() {
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["count"]=3
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_0"]="PathToFile :: r :: fileName"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_1"]="SectionName :: o :: string"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_2"]="ShowLineNumber :: o :: bool :: 0"
}
# END :: mse_conf_showVariables.sh


# INI :: mse_font_createStyle.sh
mse_font_createStyle() {
  local mseUseAdvancedColorSystem
  local mseFontAttributes
  local mseBGColor
  local mseFGColor
  local mseReturnLikeCode
  local i
  local mseLength
  local mseUParam
  local mseIsCode
  local mseIsCheck
  if [ "$#" -ge 4 ]; then
    mseUseAdvancedColorSystem="0"
    mseBGColor="49"
    mseFGColor="39"
    if [ "$1" == "1" ]; then
      mseUseAdvancedColorSystem="1"
      mseBGColor="0"
      mseFGColor="255"
    fi
    mseReturnLikeCode="0"
    if [ "$#" -ge 5 ] && [ "$5" == "1" ]; then
      mseReturnLikeCode="1"
    fi
    mseFontAttributes="20"
    if [ "$2" != "" ]; then
      declare mseValidAttr=()
      mse_str_split "," "$2"
      for mseUParam in "${MSE_GLOBAL_MODULE_SPLIT_RESULT[@]}"; do
        mseUParam=$(mse_str_trim "${mseUParam}")
        mseIsCode=$(mse_check_isInteger "${mseUParam}")
        if [ "${mseIsCode}" == "1" ]; then
          mseIsCheck=$(mse_check_hasValueInArray "${mseUParam}" "MSE_MD_ICOLOR_AVAILABLE_FONT_ATTRIBUTE_CODES")
          if [ "${mseIsCheck}" == "1" ]; then
              mseValidAttr+=("${mseUParam}")
          fi
        else
          mseLength=${#MSE_MD_ICOLOR_AVAILABLE_FONT_ATTRIBUTE_NAMES[@]}
          for (( i=0; i<mseLength; i++)); do
            if [ "${mseUParam^^}" == "${MSE_MD_ICOLOR_AVAILABLE_FONT_ATTRIBUTE_NAMES[$i]}" ]; then
              mseValidAttr+=("${MSE_MD_ICOLOR_AVAILABLE_FONT_ATTRIBUTE_CODES[$i]}")
            fi
          done
        fi
      done
      if [ "${#mseValidAttr[@]}" -ge "1" ]; then
        mseFontAttributes=$(mse_str_join ";" "mseValidAttr")
      fi
    fi
    if [ "$3" != "" ]; then
      mseIsCode=$(mse_check_isInteger "${3}")
      if [ "${mseUseAdvancedColorSystem}" == "0" ]; then
        if [ "${mseIsCode}" == "1" ]; then
          mseIsCheck=$(mse_check_hasValueInArray "${3}" "MSE_MD_ICOLOR_AVAILABLE_BGCOLOR_CODES")
          if [ "${mseIsCheck}" == "1" ]; then
              mseBGColor="${3}"
          fi
        else
          mseLength=${#MSE_MD_ICOLOR_AVAILABLE_COLOR_NAMES[@]}
          for (( i=0; i<mseLength; i++)); do
            if [ "${3^^}" == "${MSE_MD_ICOLOR_AVAILABLE_COLOR_NAMES[$i]}" ]; then
              mseBGColor="${MSE_MD_ICOLOR_AVAILABLE_BGCOLOR_CODES[$i]}"
            fi
          done
        fi
      else
        if [ "${mseIsCode}" == "1" ]; then
          if [ "${3}" -ge 0 ] && [ "${3}" -le 255 ]; then
            mseBGColor="48;5;${3}"
          fi
        fi
      fi
    fi
    if [ "$4" != "" ]; then
      mseIsCode=$(mse_check_isInteger "${4}")
      if [ "${mseUseAdvancedColorSystem}" == "0" ]; then
        if [ "${mseIsCode}" == "1" ]; then
          mseIsCheck=$(mse_check_hasValueInArray "${4}" "MSE_MD_ICOLOR_AVAILABLE_COLOR_CODES")
          if [ "${mseIsCheck}" == "1" ]; then
              mseFGColor="${4}"
          fi
        else
          mseLength=${#MSE_MD_ICOLOR_AVAILABLE_COLOR_NAMES[@]}
          for (( i=0; i<mseLength; i++)); do
            if [ "${4^^}" == "${MSE_MD_ICOLOR_AVAILABLE_COLOR_NAMES[$i]}" ]; then
              mseFGColor="${MSE_MD_ICOLOR_AVAILABLE_COLOR_CODES[$i]}"
            fi
          done
        fi
      else
        if [ "${mseIsCode}" == "1" ]; then
          if [ "${4}" -ge 0 ] && [ "${4}" -le 255 ]; then
            mseFGColor="38;5;${4}"
          fi
        fi
      fi
    fi
    if [ "${mseReturnLikeCode}" == "1" ]; then
      printf "\e[%s;%s;%sm" "${mseFontAttributes}" "${mseBGColor}" "${mseFGColor}"
    else
      printf "e[%s;%s;%sm" "${mseFontAttributes}" "${mseBGColor}" "${mseFGColor}"
    fi
  fi
}
mse_font_createStyle_vldtr() {
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["count"]=5
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_0"]="UseAdvancedColorSystem :: r :: bool :: 1"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_1"]="FontAttributes :: r :: list"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_1_labels"]="BOLD, DIM, UNDERLINE, BLINK, INVERT, HIDDEN, NONE, RBOLD, RDIM, RUNDERLINE, RBLINK, RINVERT, RHIDDEN"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_1_values"]="1, 2, 4, 5, 7, 8, 20, 21, 22, 24, 25, 27, 28"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_2"]="BGColor :: r :: int :: 0 :: 0 :: 255"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_3"]="FGColor :: r :: int :: 0 :: 0 :: 255"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_4"]="ReturnLikeCode :: o :: bool :: 0"
}
# END :: mse_font_createStyle.sh


# INI :: mse_font_showAttributes.sh
mse_font_showAttributes() {
  local i
  local mseFormat="list"
  local mseLength=${#MSE_MD_ICOLOR_AVAILABLE_FONT_ATTRIBUTE_NAMES[@]}
  local mseLine
  local mseRawTable
  local mseLineItens=6
  if [ $# -ge 1 ]; then
    mseFormat="$1"
  fi
  if [ $# == 2 ]; then
    local isInt=$(mse_check_isInteger $2)
    if [ $isInt == 1 ]; then
      mseLineItens=$2
    fi
  fi
  for (( i=0; i<mseLength; i++)); do
    mseAttrName=${MSE_MD_ICOLOR_AVAILABLE_FONT_ATTRIBUTE_NAMES[$i]}
    if [ "${mseAttrName}" != "NONE" ]; then
      mseLine="${mseAttrName}"
      if [ "${mseFormat}" == "list" ]; then
        mseLine+="\n"
      elif [ "${mseFormat}" == "table" ]; then
        if (( i % mseLineItens != 0 )); then
          mseLine+=" : "
        else
          mseLine+="\n"
        fi
      fi
      mseRawTable+="${mseLine}"
    fi
  done
  printf "NONE\n"
  mseRawTable=$(printf "${mseRawTable}")
  column -e -t -s ":" <<< "${mseRawTable}"
}
mse_font_showAttributes_vldtr() {
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["count"]=2
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_0"]="Format :: o :: list :: list"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_0_labels"]="list, table"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_0_values"]="list, table"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_1"]="ItensPerLine :: o :: int :: 6"
}
# END :: mse_font_showAttributes.sh


# INI :: mse_font_showColors.sh
mse_font_showColors() {
  local mseTableType
  local mseColorSet
  local mseItensPerLine
  local mseItensPerLineIsSet
  local mseCheck
  mseTableType="fg"
  if [ "$#" -ge 1 ]; then
    if [ "$1" == "fg" ] || [ "$1" == "bg" ]; then
      mseTableType="$1"
    fi
  fi
  mseColorSet="16"
  if [ "$#" -ge 2 ]; then
    mseCheck="$(mse_check_isInteger $2)"
    if [ "${mseCheck}" == "0" ] || [ "$2" -le "16" ]; then
      mseTableType="fg"
    else
      mseColorSet="$2"
    fi
  fi
  mseItensPerLine="12"
  mseItensPerLineIsSet="4"
  if [ "$#" -ge 3 ]; then
    mseCheck="$(mse_check_isInteger $3)"
    if [ "${mseCheck}" == "1" ]; then
      if [ "$3" -le 4 ]; then
        mseItensPerLine="4"
      else
        mseItensPerLine="$3"
        mseItensPerLineIsSet="0"
      fi
    fi
  fi
  if [ "$mseColorSet" == "16" ]; then
    local i
    local mseLength=${#MSE_MD_ICOLOR_AVAILABLE_COLOR_NAMES[@]}
    local mseColorName
    local mseColorRaw
    local mseColorVar
    local mseColorCod
    local mseLine
    local mseRawTable
    mseRawTable="${lbl_font_showTextColors_TableHeaders}\n"
    for (( i=0; i<mseLength; i++)); do
      mseColorName=${MSE_MD_ICOLOR_AVAILABLE_COLOR_LABELS[$i]}
      mseColorRaw=${MSE_MD_ICOLOR_AVAILABLE_COLOR_NAMES[$i]}
      mseColorVar="mse${mseColorRaw}"
      mseColorCod="\\${!mseColorVar}"
      mseLine="${mseColorName}:${mseColorRaw}:${mseColorCod}:${!mseColorVar}myShellEnv${mseNONE} \n"
      mseRawTable+="${mseLine}"
    done
    printf "\n"
    mseRawTable=$(printf "${mseRawTable}")
    mseRawTable=$(sed 's/^\s*//g' <<< "${mseRawTable}" | sed 's/\s*$//g' | sed 's/\s*:/:/g' | sed 's/:\s*/:/g')
    column -e -t -s ":" <<< "${mseRawTable}"
    printf "\n"
  elif [ "$mseColorSet" -gt "16" ]; then
    ((mseColorSet=mseColorSet-1))
    if [ "$mseColorSet" -ge "256" ]; then
      mseColorSet="255"
    fi
    local mseColorCodeMaxLength=($(eval echo {0..$mseColorSet}))
    local mseColorIndex
    local mseColorNumber
    local mseColorMod=0
    local mseStrColorNumber
    local mseNewLine
    printf "\n"
    for mseColorIndex in "${mseColorCodeMaxLength[@]}"; do
      mseNewLine=0
      if [ "$mseColorIndex" -lt 10 ]; then
        mseStrColorNumber="  ${mseColorIndex}"
      elif [ "$mseColorIndex" -lt 100 ]; then
        mseStrColorNumber=" ${mseColorIndex}"
      else
        mseStrColorNumber="${mseColorIndex}"
      fi
      if [ "$mseTableType" == "fg" ]; then
        printf "\e[38;5;%sm  %s  ${mseNONE}" ${mseColorIndex} "${mseStrColorNumber}"
      elif [ "$mseTableType" == "bg" ]; then
        printf "\e[48;5;%sm  %s  ${mseNONE}" ${mseColorIndex} "${mseStrColorNumber}"
      fi
      ((mseColorNumber=mseColorIndex+1))
      ((mseColorMod=mseColorNumber % mseItensPerLine))
      if [ "${mseColorMod}" == "${mseItensPerLineIsSet}" ]; then
        printf "\n"
        mseNewLine=1
      fi
    done
    if [ "${mseNewLine}" == 0 ]; then
      printf "\n"
    fi
    printf "\n${lbl_font_showTextColors_UseCodeExample}"
    if [ "$mseTableType" == "fg" ]; then
      printf "%s" "\\e[38;5;Xm"
    elif [ "$mseTableType" == "bg" ]; then
      printf "%s" "\\e[48;5;Xm"
    fi
    printf "\n\n"
  fi
}
mse_font_showColors_vldtr() {
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["count"]=2
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_0"]="TableType :: o :: list"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_0_labels"]="fg, bg"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_0_values"]="fg, bg"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_1"]="ColorSet :: o :: int :: 16 :: 16 :: 256"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_1"]="ItensPerLine :: o :: int :: 8"
}
# END :: mse_font_showColors.sh


# INI :: mse_inter_theme_default.sh
mse_inter_theme_default_createMessage() {
  local mseMessageTitle
  local mseMessageBody
  mse_inter_theme_default_setColorDefinition
  case "${MSE_GLOBAL_SHOW_MESSAGE_CONFIG[MessageFormat]}" in
    FREEFORMAT)
      MSE_GLOBAL_SHOW_MESSAGE_CONFIG["MessageFormat"]="FREEFORMAT"
    ;;
    DEFAULTFORMAT)
      MSE_GLOBAL_SHOW_MESSAGE_CONFIG["MessageTopSeparator"]="\n"
      MSE_GLOBAL_SHOW_MESSAGE_CONFIG["MessageTopSeparatorColor"]="0"
      MSE_GLOBAL_SHOW_MESSAGE_CONFIG["TitleDisplay"]="1"
      MSE_GLOBAL_SHOW_MESSAGE_CONFIG["TitleTopSeparator"]=""
      MSE_GLOBAL_SHOW_MESSAGE_CONFIG["TitleTopSeparatorColor"]="0"
      MSE_GLOBAL_SHOW_MESSAGE_CONFIG["TitleIndent"]="  "
      MSE_GLOBAL_SHOW_MESSAGE_CONFIG["TitleBullet"]=":: "
      MSE_GLOBAL_SHOW_MESSAGE_CONFIG["TitleBulletColor"]="0"
      MSE_GLOBAL_SHOW_MESSAGE_CONFIG["TitleTextColor"]="1"
      MSE_GLOBAL_SHOW_MESSAGE_CONFIG["TitleBottomSeparator"]=""
      MSE_GLOBAL_SHOW_MESSAGE_CONFIG["TitleBottomSeparatorColor"]="0"
      MSE_GLOBAL_SHOW_MESSAGE_CONFIG["BodyMessageDisplay"]="1"
      MSE_GLOBAL_SHOW_MESSAGE_CONFIG["BodyMessageTopSeparator"]="\n"
      MSE_GLOBAL_SHOW_MESSAGE_CONFIG["BodyMessageTopSeparatorColor"]="0"
      MSE_GLOBAL_SHOW_MESSAGE_CONFIG["BodyMessageFirstLineIndent"]="     "
      MSE_GLOBAL_SHOW_MESSAGE_CONFIG["BodyMessageFirstLineBullet"]=""
      MSE_GLOBAL_SHOW_MESSAGE_CONFIG["BodyMessageFirstLineBulletColor"]="0"
      MSE_GLOBAL_SHOW_MESSAGE_CONFIG["BodyMessageAnotherLinesIndent"]="     "
      MSE_GLOBAL_SHOW_MESSAGE_CONFIG["BodyMessageAnotherLinesBullet"]=""
      MSE_GLOBAL_SHOW_MESSAGE_CONFIG["BodyMessageAnotherLinesBulletColor"]="0"
      MSE_GLOBAL_SHOW_MESSAGE_CONFIG["BodyMessageArrayNameColor"]="1"
      MSE_GLOBAL_SHOW_MESSAGE_CONFIG["BodyMessageBottomSeparator"]="\n"
      MSE_GLOBAL_SHOW_MESSAGE_CONFIG["BodyMessageBottomSeparatorColor"]="0"
      MSE_GLOBAL_SHOW_MESSAGE_CONFIG["MessageBottomSeparator"]=""
      MSE_GLOBAL_SHOW_MESSAGE_CONFIG["MessageBottomSeparatorColor"]="0"
    ;;
    SHOWSTATUS)
      MSE_GLOBAL_SHOW_MESSAGE_CONFIG["MessageTopSeparator"]=""
      MSE_GLOBAL_SHOW_MESSAGE_CONFIG["MessageTopSeparatorColor"]="0"
      MSE_GLOBAL_SHOW_MESSAGE_CONFIG["TitleDisplay"]="1"
      MSE_GLOBAL_SHOW_MESSAGE_CONFIG["TitleType"]="3"
      MSE_GLOBAL_SHOW_MESSAGE_CONFIG["TitleTopSeparator"]=""
      MSE_GLOBAL_SHOW_MESSAGE_CONFIG["TitleTopSeparatorColor"]="0"
      MSE_GLOBAL_SHOW_MESSAGE_CONFIG["TitleIndent"]="  "
      MSE_GLOBAL_SHOW_MESSAGE_CONFIG["TitleBullet"]=""
      MSE_GLOBAL_SHOW_MESSAGE_CONFIG["TitleBulletColor"]="0"
      MSE_GLOBAL_SHOW_MESSAGE_CONFIG["TitleTextColor"]="1"
      MSE_GLOBAL_SHOW_MESSAGE_CONFIG["TitleBottomSeparator"]=""
      MSE_GLOBAL_SHOW_MESSAGE_CONFIG["TitleBottomSeparatorColor"]="0"
      MSE_GLOBAL_SHOW_MESSAGE_CONFIG["BodyMessageDisplay"]="0"
      MSE_GLOBAL_SHOW_MESSAGE_CONFIG["MessageBottomSeparator"]=""
      MSE_GLOBAL_SHOW_MESSAGE_CONFIG["MessageBottomSeparatorColor"]="0"
    ;;
    TITLE)
      MSE_GLOBAL_SHOW_MESSAGE_CONFIG["MessageTopSeparator"]=""
      MSE_GLOBAL_SHOW_MESSAGE_CONFIG["MessageTopSeparatorColor"]="0"
      MSE_GLOBAL_SHOW_MESSAGE_CONFIG["TitleDisplay"]="1"
      MSE_GLOBAL_SHOW_MESSAGE_CONFIG["TitleTopSeparator"]="\n"
      MSE_GLOBAL_SHOW_MESSAGE_CONFIG["TitleTopSeparatorColor"]="0"
      MSE_GLOBAL_SHOW_MESSAGE_CONFIG["TitleIndent"]="  "
      MSE_GLOBAL_SHOW_MESSAGE_CONFIG["TitleBullet"]=":: "
      MSE_GLOBAL_SHOW_MESSAGE_CONFIG["TitleBulletColor"]="0"
      MSE_GLOBAL_SHOW_MESSAGE_CONFIG["TitleTextColor"]="1"
      MSE_GLOBAL_SHOW_MESSAGE_CONFIG["TitleBottomSeparator"]="\n"
      MSE_GLOBAL_SHOW_MESSAGE_CONFIG["TitleBottomSeparatorColor"]="0"
      MSE_GLOBAL_SHOW_MESSAGE_CONFIG["BodyMessageDisplay"]="0"
      MSE_GLOBAL_SHOW_MESSAGE_CONFIG["MessageBottomSeparator"]="\n"
      MSE_GLOBAL_SHOW_MESSAGE_CONFIG["MessageBottomSeparatorColor"]="0"
    ;;
  esac
  mse_inter_showMessage_createSeparator "${MSE_GLOBAL_SHOW_MESSAGE_CONFIG[MessageType]}" "${MSE_GLOBAL_SHOW_MESSAGE_CONFIG[MessageTopSeparator]}" "${MSE_GLOBAL_SHOW_MESSAGE_CONFIG[MessageTopSeparatorColor]}" "MSE_GSMCTC_B01_TOP_SEPARATOR"
  mse_inter_showMessage_createTitle
  mse_inter_showMessage_createBody
  mse_inter_showMessage_createSeparator "${MSE_GLOBAL_SHOW_MESSAGE_CONFIG[MessageType]}" "${MSE_GLOBAL_SHOW_MESSAGE_CONFIG[MessageBottomSeparator]}" "${MSE_GLOBAL_SHOW_MESSAGE_CONFIG[MessageBottomSeparatorColor]}" "MSE_GSMCTC_B04_BOTTOM_SEPARATOR"
}
mse_inter_theme_default_createProgressBar() {
  mse_inter_theme_default_setColorDefinition
  case "${MSE_GLOBAL_SHOW_PROGRESSBAR_CONFIG[ProgressBarFormat]}" in
    FREEFORMAT)
      MSE_GLOBAL_SHOW_PROGRESSBAR_CONFIG["ProgressBarFormat"]="FREEFORMAT"
    ;;
    DEFAULTFORMAT)
      MSE_GLOBAL_SHOW_PROGRESSBAR_CONFIG["ProgressBarIndent"]="  "
      MSE_GLOBAL_SHOW_PROGRESSBAR_CONFIG["ProgressBarColor"]="1"
      MSE_GLOBAL_SHOW_PROGRESSBAR_CONFIG["ProgressBarBlockStart"]="[ "
      MSE_GLOBAL_SHOW_PROGRESSBAR_CONFIG["ProgressBarBlockEnd"]=" ] "
      MSE_GLOBAL_SHOW_PROGRESSBAR_CONFIG["ProgressBarBlockChar"]="#"
      MSE_GLOBAL_SHOW_PROGRESSBAR_CONFIG["ProgressBarAtualBarLength"]="0"
      MSE_GLOBAL_SHOW_PROGRESSBAR_CONFIG["ProgressBarInfoDisplay"]="1"
      MSE_GLOBAL_SHOW_PROGRESSBAR_CONFIG["ProgressBarInfoColor"]="1"
      MSE_GLOBAL_SHOW_PROGRESSBAR_CONFIG["ProgressBarInfoPosition"]="r"
      MSE_GLOBAL_SHOW_PROGRESSBAR_CONFIG["ProgressBarInfoBlockStart"]="("
      MSE_GLOBAL_SHOW_PROGRESSBAR_CONFIG["ProgressBarInfoBlockEnd"]=")"
      MSE_GLOBAL_SHOW_PROGRESSBAR_CONFIG["ProgressBarInfoData"]="  0%"
    ;;
    ONLYBAR)
      MSE_GLOBAL_SHOW_PROGRESSBAR_CONFIG["ProgressBarIndent"]="  "
      MSE_GLOBAL_SHOW_PROGRESSBAR_CONFIG["ProgressBarColor"]="1"
      MSE_GLOBAL_SHOW_PROGRESSBAR_CONFIG["ProgressBarBlockStart"]="[ "
      MSE_GLOBAL_SHOW_PROGRESSBAR_CONFIG["ProgressBarBlockEnd"]=" ] "
      MSE_GLOBAL_SHOW_PROGRESSBAR_CONFIG["ProgressBarBlockChar"]="#"
      MSE_GLOBAL_SHOW_PROGRESSBAR_CONFIG["ProgressBarAtualBarLength"]="0"
      MSE_GLOBAL_SHOW_PROGRESSBAR_CONFIG["ProgressBarInfoDisplay"]="0"
    ;;
  esac
  mse_inter_setProgressBar "${MSE_GLOBAL_SHOW_PROGRESSBAR_CONFIG[ProgressBarAtualPercentProgress]}"
}
mse_inter_theme_default_setColorDefinition() {
  if [ -z ${MSE_GLOBAL_THEME_LOADED+x} ] || [ "${MSE_GLOBAL_THEME_LOADED}" == "" ] || [ "${MSE_GLOBAL_THEME_LOADED}" != "mse_inter_theme_default" ]; then
    unset MSE_GSMCTC_B01_TOP_SEPARATOR
    declare -gA MSE_GSMCTC_B01_TOP_SEPARATOR
    unset MSE_GSMCTC_B02_TOP_SEPARATOR
    unset MSE_GSMCTC_B02_BULLET
    unset MSE_GSMCTC_B02_TEXT
    unset MSE_GSMCTC_B02_BOTTOM_SEPARATOR
    declare -gA MSE_GSMCTC_B02_TOP_SEPARATOR
    declare -gA MSE_GSMCTC_B02_BULLET
    declare -gA MSE_GSMCTC_B02_TEXT
    declare -gA MSE_GSMCTC_B02_BOTTOM_SEPARATOR
    unset MSE_GSMCTC_B03_TOP_SEPARATOR
    unset MSE_GSMCTC_B03_FIRST_LINE_BULLET
    unset MSE_GSMCTC_B03_ANOTHER_LINES_BULLET
    unset MSE_GSMCTC_B03_FIRST_LINE_TEXT
    unset MSE_GSMCTC_B03_ANOTHER_LINES_TEXT
    unset MSE_GSMCTC_B03_BOTTOM_SEPARATOR
    declare -gA MSE_GSMCTC_B03_TOP_SEPARATOR
    declare -gA MSE_GSMCTC_B03_FIRST_LINE_BULLET
    declare -gA MSE_GSMCTC_B03_ANOTHER_LINES_BULLET
    declare -gA MSE_GSMCTC_B03_FIRST_LINE_TEXT
    declare -gA MSE_GSMCTC_B03_ANOTHER_LINES_TEXT
    declare -gA MSE_GSMCTC_B03_BOTTOM_SEPARATOR
    unset MSE_GSMCTC_B04_BOTTOM_SEPARATOR
    declare -gA MSE_GSMCTC_B04_BOTTOM_SEPARATOR
    unset MSE_GSPBCTC_B01_CHAR
    unset MSE_GSPBCTC_B01_DELIMITERS
    declare -gA MSE_GSPBCTC_B01_CHAR
    declare -gA MSE_GSPBCTC_B01_DELIMITERS
    unset MSE_GSPBCTC_B02_DATA
    unset MSE_GSPBCTC_B02_DELIMITERS
    declare -gA MSE_GSPBCTC_B02_DATA
    declare -gA MSE_GSPBCTC_B02_DELIMITERS
    declare -A mseThemeColors
    mseThemeColors["info"]=$(mse_font_createStyle "0" "BOLD" "NONE" "DGREY" "1")
    mseThemeColors["info_a1"]=$(mse_font_createStyle "0" "BOLD,DIM" "NONE" "DGREY" "1")
    mseThemeColors["attention"]=$(mse_font_createStyle "0" "BOLD" "NONE" "LBLUE" "1")
    mseThemeColors["attention_a1"]=$(mse_font_createStyle "0" "BOLD,DIM" "NONE" "LBLUE" "1")
    mseThemeColors["warning"]=$(mse_font_createStyle "0" "BOLD" "NONE" "LYELLOW" "1")
    mseThemeColors["warning_a1"]=$(mse_font_createStyle "0" "BOLD,DIM" "NONE" "LYELLOW" "1")
    mseThemeColors["error"]=$(mse_font_createStyle "0" "BOLD" "NONE" "RED" "1")
    mseThemeColors["error_a1"]=$(mse_font_createStyle "0" "BOLD,DIM" "NONE" "RED" "1")
    mseThemeColors["fail"]=$(mse_font_createStyle "0" "BOLD" "NONE" "LRED" "1")
    mseThemeColors["fail_a1"]=$(mse_font_createStyle "0" "BOLD,DIM" "NONE" "LRED" "1")
    mseThemeColors["success"]=$(mse_font_createStyle "0" "BOLD" "NONE" "GREEN" "1")
    mseThemeColors["success_a1"]=$(mse_font_createStyle "0" "BOLD,DIM" "NONE" "GREEN" "1")
    mseThemeColors["friendly"]=$(mse_font_createStyle "0" "BOLD" "NONE" "LGREEN" "1")
    mseThemeColors["friendly_a1"]=$(mse_font_createStyle "0" "BOLD,DIM" "NONE" "LGREEN" "1")
    mseThemeColors["ordinary"]=$(mse_font_createStyle "0" "BOLD" "NONE" "LBLUE" "1")
    mseThemeColors["ordinary_a1"]=$(mse_font_createStyle "0" "BOLD,DIM" "NONE" "LBLUE" "1")
    mseThemeColors["caution"]=$(mse_font_createStyle "0" "BOLD" "NONE" "LYELLOW" "1")
    mseThemeColors["caution_a1"]=$(mse_font_createStyle "0" "BOLD,DIM" "NONE" "LYELLOW" "1")
    mseThemeColors["important"]=$(mse_font_createStyle "0" "BOLD" "NONE" "LRED" "1")
    mseThemeColors["important_a1"]=$(mse_font_createStyle "0" "BOLD,DIM" "NONE" "LRED" "1")
    mseThemeColors["body"]=$(mse_font_createStyle "0" "BOLD" "NONE" "DGREY" "1")
    mseThemeColors["b01_char"]=$(mse_font_createStyle "0" "BOLD" "NONE" "LBLUE" "1")
    mseThemeColors["b01_delimiter"]=$(mse_font_createStyle "0" "DIM" "NONE" "WHITE" "1")
    mseThemeColors["b01_data"]=$(mse_font_createStyle "0" "" "NONE" "WHITE" "1")
    mseThemeColors["b02_delimiter"]=$(mse_font_createStyle "0" "BOLD" "NONE" "DGREY" "1")
    local mseMessageType
    for mseMessageType in "${!mseThemeColors[@]}"; do
      MSE_GSMCTC_B01_TOP_SEPARATOR[$mseMessageType]=${mseThemeColors[$mseMessageType]}
      MSE_GSMCTC_B02_TOP_SEPARATOR[$mseMessageType]=${mseThemeColors[$mseMessageType]}
      MSE_GSMCTC_B02_BULLET[$mseMessageType]=${mseThemeColors[$mseMessageType]}
      MSE_GSMCTC_B02_TEXT[$mseMessageType]=${mseThemeColors[$mseMessageType]}
      MSE_GSMCTC_B02_BOTTOM_SEPARATOR[$mseMessageType]=${mseThemeColors[$mseMessageType]}
      MSE_GSMCTC_B03_TOP_SEPARATOR[$mseMessageType]=${mseThemeColors[$mseMessageType]}
      MSE_GSMCTC_B03_FIRST_LINE_BULLET[$mseMessageType]=${mseThemeColors[$mseMessageType]}
      MSE_GSMCTC_B03_ANOTHER_LINES_BULLET[$mseMessageType]=${mseThemeColors[$mseMessageType]}
      MSE_GSMCTC_B03_FIRST_LINE_TEXT[$mseMessageType]=${mseThemeColors[$mseMessageType]}
      MSE_GSMCTC_B03_ANOTHER_LINES_TEXT[$mseMessageType]=${mseThemeColors[$mseMessageType]}
      MSE_GSMCTC_B03_BOTTOM_SEPARATOR[$mseMessageType]=${mseThemeColors[$mseMessageType]}
      MSE_GSMCTC_B04_BOTTOM_SEPARATOR[$mseMessageType]=${mseThemeColors[$mseMessageType]}
      MSE_GSPBCTC_B01_CHAR[$mseMessageType]=${mseThemeColors[$mseMessageType]}
      MSE_GSPBCTC_B01_DELIMITERS[$mseMessageType]=${mseThemeColors[$mseMessageType]}
      MSE_GSPBCTC_B02_DATA[$mseMessageType]=${mseThemeColors[$mseMessageType]}
      MSE_GSPBCTC_B02_DELIMITERS[$mseMessageType]=${mseThemeColors[$mseMessageType]}
    done
    declare -g MSE_GLOBAL_THEME_LOADED="mse_inter_theme_default"
  fi
}
# END :: mse_inter_theme_default.sh


# INI :: mse_inter_alertUser.sh
mse_inter_alertUser() {
  if [ $# -ge 3 ]; then
    declare -A mseArgs
    mseArgs["MessageType"]="${1}"
    mseArgs["MessageFormat"]="DEFAULTFORMAT"
    mseArgs["TitleType"]="1"
    mseArgs["TitleCode"]="${2}"
    mseArgs["TitleText"]="${3}"
    mseArgs["BodyMessageArrayName"]="${4}"
    if [ "${2}" != "" ] && [ "${3}" != "" ]; then
      mseArgs["TitleType"]="3"
      mseArgs["TitleText"]="${2}::${3}"
    fi
    if [ "${4}" == "" ]; then
      mseArgs["MessageFormat"]="TITLE"
    fi
    local mseTheme="${MSE_GLOBAL_THEME_NAME}"
    if [ "${5}" != "" ]; then
      mseTheme="${5}"
    fi
    mse_inter_showMessage "${mseArgs[MessageType]}" "${mseArgs[MessageFormat]}" "" "" "" "${mseArgs[TitleType]}" "" "" "" "" "" "${mseArgs[TitleText]}" "" "" "" "" "" "" "" "" "" "" "" "" "${mseArgs[BodyMessageArrayName]}" "" "" "" "" "" "${mseTheme}"
  fi
}
mse_inter_alertUser_vldtr() {
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["count"]=5
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_0"]="MessageType :: r :: list"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_0_labels"]="none, info, attention, warning, error, fail, success"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_0_values"]="n, i, a, w, e, f, s"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_1"]="TitleCode :: r :: string"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_2"]="TitleText :: r :: string"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_3"]="BodyMessageArrayName :: r :: arrayName"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_4"]="Theme :: o :: string"
}
# END :: mse_inter_alertUser.sh


# INI :: mse_inter_clearLine.sh
mse_inter_clearLine() {
  local mseCmd="2"
  local mseCR=""
  if [ $# -ge 1 ]; then
    if [ "$1" == "l" ]; then
      mseCmd="1"
    elif [ "$1" == "r" ]; then
      mseCmd="0"
    fi
  fi
  if [ $# -ge 2 ]; then
    if [ "$2" == "1" ]; then
      mseCR="\r"
    fi
  fi
  printf "\e[${mseCmd}K${mseCR}"
}
# END :: mse_inter_clearLine.sh


# INI :: mse_inter_errorAlert.sh
mse_inter_errorAlert() {
  if [ "$#" -ge 2 ]; then
    declare -A mseArgs
    mseArgs["MessageType"]="e"
    mseArgs["MessageFormat"]="DEFAULTFORMAT"
    mseArgs["TitleType"]="3"
    mseArgs["TitleCode"]="${1}"
    mseArgs["TitleText"]="${2}"
    mseArgs["BodyMessageArrayName"]="${3}"
    if [ "${1}" == "" ]; then
      mseArgs["TitleCode"]="script"
    fi
    if [ "${2}" == "" ]; then
      mseArgs["TitleText"]="${lbl_inter_alert_header_error}"
    fi
    mse_inter_alertUser "${mseArgs[MessageType]}" "${mseArgs[TitleCode]}" "${mseArgs[TitleText]}" "${mseArgs[BodyMessageArrayName]}" "${4}"
  fi
}
mse_inter_errorAlert_vldtr() {
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["count"]=4
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_0"]="TitleCode :: r :: string"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_1"]="TitleText :: r :: string"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_2"]="BodyMessageArrayName :: r :: arrayName"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_3"]="Theme :: o :: string"
}
# END :: mse_inter_errorAlert.sh


# INI :: mse_inter_promptUser.sh
mse_inter_promptUser() {
  MSE_GLOBAL_LASTERR=""
  MSE_GLOBAL_PROMPT_RESULT=""
  if [ $# -lt 5 ]; then
    local mseArgs="$#"
    local mseLost
    ((mseLost=5-mseArgs))
    MSE_GLOBAL_LASTERR=$(mse_str_replacePlaceHolder "${lbl_err_lostParameters}" "LOST" "${mseLost}")
    return 1
  else
    declare -A mseArgs
    mseArgs["MessageType"]="${1}"
    mseArgs["MessageFormat"]="DEFAULTFORMAT"
    mseArgs["TitleType"]="3"
    mseArgs["TitleCode"]="${2}"
    mseArgs["TitleText"]="${3}"
    mseArgs["BodyMessageArrayName"]="${4}"
    declare -a mseTmpLines
    declare -n mseBodyMessageArrayName
    if [ "${1}" == "" ]; then
      mseArgs["MessageType"]="or"
    fi
    if [ "${2}" == "" ]; then
      mseArgs["TitleCode"]="?"
    fi
    if [ "${3}" == "" ]; then
      mseArgs["TitleText"]="?"
    fi
    if [ "${4}" == "" ]; then
      mseArgs["MessageFormat"]="TITLE"
    else
      if [[ ! "$(declare -p ${4} 2> /dev/null)" =~ "declare -a" ]]; then
        MSE_GLOBAL_LASTERR=$(mse_str_replacePlaceHolder "${lbl_err_paramA_MustBeAnArray}" "PARAM_A" "BodyMessageArrayName")
        return 1
      else
        mseBodyMessageArrayName="${4}"
      fi
    fi
    local msePromptValueType="bool"
    declare -n msePromptLabelArrayName
    declare -n msePromptValueArrayName
    case "${5}" in
      bool | list | value)
        msePromptValueType="${5}"
        if [ "${5}" == "bool" ]; then
          msePromptLabelArrayName="lbl_inter_prompt_boolLabels"
          msePromptValueArrayName="lbl_inter_prompt_boolValues"
        elif [ "${5}" == "list" ]; then
          mseArgs["MessageFormat"]="DEFAULTFORMAT"
          if [ "${4}" == "" ]; then
            mseArgs["BodyMessageArrayName"]="mseTmpLines"
            mseBodyMessageArrayName="mseTmpLines"
          fi
        fi
      ;;
    esac
    if [ "${msePromptValueType}" == "list" ]; then
      if [ "${6}" == "" ] || [[ ! "$(declare -p ${6} 2> /dev/null)" =~ "declare -a" ]]; then
        MSE_GLOBAL_LASTERR=$(mse_str_replacePlaceHolder "${lbl_err_paramA_MustBeAnArray}" "PARAM_A" "PromptLabelArrayName")
        return 1
      elif [ "${7}" == "" ] || [[ ! "$(declare -p ${7} 2> /dev/null)" =~ "declare -a" ]]; then
        MSE_GLOBAL_LASTERR=$(mse_str_replacePlaceHolder "${lbl_err_paramA_MustBeAnArray}" "PARAM_A" "PromptValueArrayName")
        return 1
      else
        msePromptLabelArrayName="${6}"
        msePromptValueArrayName="${7}"
        if [ "${#msePromptLabelArrayName[@]}" == 0 ]; then
          MSE_GLOBAL_LASTERR=$(mse_str_replacePlaceHolder "${lbl_err_paramA_IsAnEmptyArray}" "PARAM_A" "PromptLabelArrayName")
          return 1
        elif [ "${#msePromptValueArrayName[@]}" == 0 ]; then
          MSE_GLOBAL_LASTERR=$(mse_str_replacePlaceHolder "${lbl_err_paramA_IsAnEmptyArray}" "PARAM_A" "PromptValueArrayName")
          return 1
        elif [ "${#msePromptLabelArrayName[@]}" != "${#msePromptValueArrayName[@]}" ]; then
          MSE_GLOBAL_LASTERR=$(mse_str_replacePlaceHolder "${lbl_err_paramA_BothArraysMustHaveSameNumberOfElements}" "PARAM_A" "PromptLabelArrayName" "PARAM_B" "PromptValueArrayName")
          return 1
        fi
      fi
    fi
    local mseIndex
    local mseLabel
    local mseValue
    local mseStrValidOptions
    if [ "${msePromptValueType}" == "bool" ] || [ "${msePromptValueType}" == "list" ]; then
      for mseIndex in "${!msePromptLabelArrayName[@]}"; do
        mseLabel="${msePromptLabelArrayName[$mseIndex]}"
        if [ "$mseValue" != "${msePromptValueArrayName[$mseIndex]}" ]; then
          mseValue="${msePromptValueArrayName[$mseIndex]}"
          if [ "$mseStrValidOptions" != "" ]; then
            mseStrValidOptions="${mseStrValidOptions} | "
          fi
        else
          if [ "$mseStrValidOptions" != "" ]; then
            mseStrValidOptions="${mseStrValidOptions}/"
          fi
        fi
        mseStrValidOptions="${mseStrValidOptions}${mseLabel}"
      done
      mseBodyMessageArrayName+=("[ ${mseStrValidOptions} ] : ")
    fi
    local mseTheme="${MSE_GLOBAL_THEME_NAME}"
    if [ "${8}" != "" ]; then
      mseTheme="${8}"
    fi
    local msePromptUserMessage
    local msePromptUserValue
    msePromptUserMessage=$(mse_inter_showMessage "${mseArgs[MessageType]}" "${mseArgs[MessageFormat]}" "" "" "" "${mseArgs[TitleType]}" "" "" "" "" "" "${mseArgs[TitleCode]}::${mseArgs[TitleText]}" "" "" "" "" "" "" "" "" "" "" "" "" "${mseArgs[BodyMessageArrayName]}" "" "" "" "" "" "${mseTheme}" || echo "${MSE_GLOBAL_PROMPT_RESULT}")
    while [ "${MSE_GLOBAL_PROMPT_RESULT}" == "" ]; do
      if [ "${msePromptUserValue}" != "" ]; then
        mse_inter_errorAlert "X" "Invalid value \"${msePromptUserValue}\"."
      fi
      read -r -p "${msePromptUserMessage}" msePromptUserValue
      if [ "${msePromptValueType}" == "bool" ] || [ "${msePromptValueType}" == "list" ]; then
        for mseIndex in "${!msePromptLabelArrayName[@]}"; do
          mseLabel="${msePromptLabelArrayName[$mseIndex]}"
          mseValue="${msePromptValueArrayName[$mseIndex]}"
          if [ "${msePromptUserValue^^}" == "${mseLabel^^}" ] || [ "${msePromptUserValue^^}" == "${mseValue^^}" ]; then
            MSE_GLOBAL_PROMPT_RESULT="${mseValue}"
          fi
        done
      else
        MSE_GLOBAL_PROMPT_RESULT="${msePromptUserValue}"
      fi
    done
    if [ "${msePromptValueType}" == "bool" ] || [ "${msePromptValueType}" == "list" ]; then
      unset 'mseBodyMessageArrayName[-1]'
    fi
    printf "\n"
  fi
}
mse_inter_promptUser_vldtr() {
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["count"]=8
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_0"]="MessageType :: r :: list"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_0_labels"]="friendly, ordinary, caution, important"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_0_values"]="fr, or, ca, im"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_1"]="TitleCode :: r :: string"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_2"]="TitleText :: r :: string"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_3"]="BodyMessageArrayName :: r :: arrayName"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_4"]="PromptValueType :: r :: list"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_4_labels"]="bool, list, value"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_4_values"]="bool, list, value"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_5"]="PromptLabelArrayName :: r :: arrayName"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_6"]="PromptValueArrayName :: r :: arrayName"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_7"]="Theme :: o :: functionName"
}
# END :: mse_inter_promptUser.sh


# INI :: mse_inter_setCursorPosition.sh
mse_inter_setCursorPosition() {
  if [ $# -ge 2 ]; then
    local mseStrPos
    local mseIntPos
    local mseResetToPosition
    local mseTerminalTotalLines="${LINES}"
    local mseTerminalTotalColumns="${COLUMNS}"
    case "$1" in
      top | bottom | left | right)
        mseStrPos="$1"
        local mseCheck=$(mse_check_isInteger "$2")
        if [ "${mseCheck}" == "1" ] && [ "$2" -ge "0" ]; then
          mseIntPos="$2"
        fi
        mseResetToPosition=""
        if [ $# -ge 3 ] && ([ "$3" == "l" ] || [ "$3" == "r" ]); then
          mseResetToPosition="$3"
        fi
      ;;
    esac
    if [ "${mseStrPos}" != "" ] && [ "${mseIntPos}" != "" ]; then
      if [ "${mseResetToPosition}" == "l" ]; then
        printf "\r"
      elif [ "${mseResetToPosition}" == "r" ]; then
        printf "\r\e[${mseTerminalTotalColumns}C"
      fi
      if [ "${mseIntPos}" -ge 1 ]; then
        case "${mseStrPos}" in
          top)
            printf "\e[${mseIntPos}A"
          ;;
          bottom)
            printf "\e[${mseIntPos}B"
          ;;
          left)
            printf "\e[${mseIntPos}C"
          ;;
          right)
            printf "\e[${mseIntPos}D"
          ;;
        esac
      fi
    fi
  fi
}
# END :: mse_inter_setCursorPosition.sh


# INI :: mse_inter_setProgressBar.sh
mse_inter_setProgressBar() {
  if [[ ! "$(declare -p ${MSE_GLOBAL_SHOW_PROGRESSBAR_CONFIG} 2> /dev/null)" =~ "declare -A" ]] || [ "${MSE_GLOBAL_SHOW_PROGRESSBAR_CONFIG[ProgressBarFormat]}" == "" ]; then
    mse_inter_showProgressBar "" "" "" "" ""   "" "" "" "" ""   "" "" "" "" ""
  else
    if [ $# -ge 1 ]; then
      local mseCheck
      local mseBarLength
      local mseBarProgress
      local mseStrAtualBarLength
      mseCheck=$(mse_check_isInteger "$1")
      mseBarProgress=0
      if [ "${mseCheck}" == "1" ]; then
        if [ "${1}" -le "0" ]; then
          mseBarProgress=0
        elif [ "${1}" -ge "100" ]; then
          mseBarProgress=100
        else
          mseBarProgress="${1}"
        fi
      fi
      mseBarLength="${MSE_GLOBAL_SHOW_PROGRESSBAR_CONFIG[ProgressBarTotalCharLength]}"
      mseStrAtualBarLength=0
      ((mseStrAtualBarLength = (mseBarLength * mseBarProgress) / 100))
      MSE_GLOBAL_SHOW_PROGRESSBAR_CONFIG["ProgressBarAtualBarLength"]="${mseStrAtualBarLength}"
      if [ "${MSE_GLOBAL_SHOW_PROGRESSBAR_CONFIG[ProgressBarInfoUsePercent]}" == "1" ]; then
        local mseStrBarInfo=""
        if [ "${mseBarProgress}" -lt "10" ]; then
          mseStrBarInfo+="  "
        elif [ "${mseBarProgress}" -lt "100" ]; then
          mseStrBarInfo+=" "
        fi
        mseStrBarInfo+="${mseBarProgress}%"
        MSE_GLOBAL_SHOW_PROGRESSBAR_CONFIG["ProgressBarInfoData"]="${mseStrBarInfo}"
      else
        if [ $# -ge 2 ]; then
          MSE_GLOBAL_SHOW_PROGRESSBAR_CONFIG["ProgressBarInfoData"]="${2}"
        fi
      fi
      printf "${MSE_GLOBAL_SHOW_PROGRESSBAR_CONFIG[ProgressBarIndent]}"
      if [ "${MSE_GLOBAL_SHOW_PROGRESSBAR_CONFIG[ProgressBarInfoPosition]}" == "r" ]; then
        mse_inter_showProgressBar_createBar
        mse_inter_showProgressBar_createData
      elif [ "${MSE_GLOBAL_SHOW_PROGRESSBAR_CONFIG[ProgressBarInfoPosition]}" == "l" ]; then
        mse_inter_showProgressBar_createData
        mse_inter_showProgressBar_createBar
      fi
      if [ "${mseBarProgress}" == 100 ]; then
        printf "\n"
      else
        printf "\r"
      fi
    fi
  fi
}
mse_inter_setProgressBar_vldtr() {
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["count"]=3
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_0"]="ProgressBarTotalCharLength :: r :: int :: 50 :: 20 :: 100"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_1"]="ProgressBarAtualPercentProgress :: r :: int :: 0 :: 0 :: 100"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_2"]="ThemeName :: o :: string"
}
# END :: mse_inter_setProgressBar.sh


# INI :: mse_inter_showMessage.sh
mse_inter_showMessage() {
  MSE_GLOBAL_LASTERR=""
  unset MSE_GLOBAL_SHOW_MESSAGE_CONFIG
  declare -gA MSE_GLOBAL_SHOW_MESSAGE_CONFIG
  if [ $# -lt 31 ]; then
    local mseArgs="$#"
    local mseLost
    ((mseLost=31-mseArgs))
    MSE_GLOBAL_LASTERR=$(mse_str_replacePlaceHolder "${lbl_err_lostParameters}" "LOST" "${mseLost}")
  else
    MSE_GLOBAL_SHOW_MESSAGE_CONFIG["MessageType"]="${1}"
    MSE_GLOBAL_SHOW_MESSAGE_CONFIG["MessageFormat"]="${2}"
    MSE_GLOBAL_SHOW_MESSAGE_CONFIG["MessageTopSeparator"]="${3}"
    MSE_GLOBAL_SHOW_MESSAGE_CONFIG["MessageTopSeparatorColor"]="${4}"
    MSE_GLOBAL_SHOW_MESSAGE_CONFIG["TitleDisplay"]="${5}"
    MSE_GLOBAL_SHOW_MESSAGE_CONFIG["TitleType"]="${6}"
    MSE_GLOBAL_SHOW_MESSAGE_CONFIG["TitleTopSeparator"]="${7}"
    MSE_GLOBAL_SHOW_MESSAGE_CONFIG["TitleTopSeparatorColor"]="${8}"
    MSE_GLOBAL_SHOW_MESSAGE_CONFIG["TitleIndent"]="${9}"
    MSE_GLOBAL_SHOW_MESSAGE_CONFIG["TitleBullet"]="${10}"
    MSE_GLOBAL_SHOW_MESSAGE_CONFIG["TitleBulletColor"]="${11}"
    MSE_GLOBAL_SHOW_MESSAGE_CONFIG["TitleText"]="${12}"
    MSE_GLOBAL_SHOW_MESSAGE_CONFIG["TitleTextColor"]="${13}"
    MSE_GLOBAL_SHOW_MESSAGE_CONFIG["TitleBottomSeparator"]="${14}"
    MSE_GLOBAL_SHOW_MESSAGE_CONFIG["TitleBottomSeparatorColor"]="${15}"
    MSE_GLOBAL_SHOW_MESSAGE_CONFIG["BodyMessageDisplay"]="${16}"
    MSE_GLOBAL_SHOW_MESSAGE_CONFIG["BodyMessageTopSeparator"]="${17}"
    MSE_GLOBAL_SHOW_MESSAGE_CONFIG["BodyMessageTopSeparatorColor"]="${18}"
    MSE_GLOBAL_SHOW_MESSAGE_CONFIG["BodyMessageFirstLineIndent"]="${19}"
    MSE_GLOBAL_SHOW_MESSAGE_CONFIG["BodyMessageFirstLineBullet"]="${20}"
    MSE_GLOBAL_SHOW_MESSAGE_CONFIG["BodyMessageFirstLineBulletColor"]="${21}"
    MSE_GLOBAL_SHOW_MESSAGE_CONFIG["BodyMessageAnotherLinesIndent"]="${22}"
    MSE_GLOBAL_SHOW_MESSAGE_CONFIG["BodyMessageAnotherLinesBullet"]="${23}"
    MSE_GLOBAL_SHOW_MESSAGE_CONFIG["BodyMessageAnotherLinesBulletColor"]="${24}"
    MSE_GLOBAL_SHOW_MESSAGE_CONFIG["BodyMessageArrayName"]="${25}"
    MSE_GLOBAL_SHOW_MESSAGE_CONFIG["BodyMessageArrayNameColor"]="${26}"
    MSE_GLOBAL_SHOW_MESSAGE_CONFIG["BodyMessageBottomSeparator"]="${27}"
    MSE_GLOBAL_SHOW_MESSAGE_CONFIG["BodyMessageBottomSeparatorColor"]="${28}"
    MSE_GLOBAL_SHOW_MESSAGE_CONFIG["MessageBottomSeparator"]="${29}"
    MSE_GLOBAL_SHOW_MESSAGE_CONFIG["MessageBottomSeparatorColor"]="${30}"
    if [ "${MSE_GLOBAL_SHOW_MESSAGE_CONFIG[MessageType]}" == "" ]; then
      MSE_GLOBAL_SHOW_MESSAGE_CONFIG["MessageType"]="n"
    fi
    local mseKey
    local mseValue
    for mseKey in "${!MSE_GLOBAL_SHOW_MESSAGE_CONFIG[@]}"; do
      mseValue="${MSE_GLOBAL_SHOW_MESSAGE_CONFIG[$mseKey]}"
      case "${mseKey}" in
        MessageType)
          local mseTmp="none"
          case "${mseValue}" in
            info | i)
              mseTmp="info"
            ;;
            attention | a)
              mseTmp="attention"
            ;;
            warning | w)
              mseTmp="warning"
            ;;
            error | e)
              mseTmp="error"
            ;;
            fail | f)
              mseTmp="fail"
            ;;
            success | s)
              mseTmp="success"
            ;;
            friendly | fr)
              mseTmp="friendly"
            ;;
            ordinary | or)
              mseTmp="ordinary"
            ;;
            caution | ca)
              mseTmp="caution"
            ;;
            important | im)
              mseTmp="important"
            ;;
          esac
          MSE_GLOBAL_SHOW_MESSAGE_CONFIG["MessageType"]="${mseTmp}"
        ;;
        MessageFormat)
          if [ "${mseValue}" == "" ]; then
            MSE_GLOBAL_SHOW_MESSAGE_CONFIG["MessageFormat"]="DEFAULTFORMAT"
          else
            MSE_GLOBAL_SHOW_MESSAGE_CONFIG["MessageFormat"]="${mseValue^^}"
          fi
        ;;
        TitleType)
          if [ "${mseValue}" != "1" ] && [ "${mseValue}" != "2" ] && [ "${mseValue}" != "3" ]; then
            mseValue="1"
          fi
          MSE_GLOBAL_SHOW_MESSAGE_CONFIG["TitleType"]="${mseValue}"
        ;;
        MessageTopSeparatorColor | TitleDisplay | TitleTopSeparatorColor | TitleBulletColor | TitleTextColor | TitleBottomSeparatorColor | BodyMessageDisplay | BodyMessageTopSeparatorColor | BodyMessageFirstLineBulletColor | BodyMessageAnotherLinesBulletColor | BodyMessageArrayNameColor | BodyMessageBottomSeparatorColor | MessageBottomSeparatorColor)
          if [ "$mseValue" == "" ] || ([ "$mseValue" != "0" ] && [ "$mseValue" != "1" ]); then
            mseValue="0"
          fi
          MSE_GLOBAL_SHOW_MESSAGE_CONFIG[$mseKey]="${mseValue}"
        ;;
      esac
    done
    local mseThemeName="${31}"
    local mseThemeFunction="${mseThemeName}_createMessage"
    if [ "$(type -t $mseThemeFunction)" != "function" ]; then
      mseThemeFunction="${MSE_GLOBAL_THEME_NAME}_createMessage"
    fi
    if [ "${MSE_GLOBAL_SHOW_MESSAGE_CONFIG[MessageFormat]}" != "" ]; then
      mseThemeFunction="${MSE_GLOBAL_SHOW_MESSAGE_CONFIG[MessageFormat]}"
      if [ "$(type -t $mseThemeFunction)" != "function" ]; then
        mseThemeFunction="${MSE_GLOBAL_THEME_NAME}_createMessage"
      fi
    fi
    $mseThemeFunction
  fi
}
mse_inter_showMessage_vldtr() {
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["count"]=31
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_0"]="MessageType :: r :: list"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_0_labels"]="none, info, attention, warning, error, fail, success, friendly, ordinary, caution, important"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_0_values"]="n, i, a, w, e, f, s, fr, or, ca, im"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_1"]="MessageFormat :: r :: string"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_2"]="MessageTopSeparator :: r :: string"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_3"]="MessageTopSeparatorColor :: r :: bool"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_4"]="TitleDisplay :: r :: bool"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_5"]="TitleType :: r :: list"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_5_labels"]="1, 2, 3"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_5_values"]="1, 2, 3"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_6"]="TitleTopSeparator :: r :: string"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_7"]="TitleTopSeparatorColor :: r :: bool"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_8"]="TitleIndent :: r :: string"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_9"]="TitleBullet :: r :: string"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_10"]="TitleBulletColor :: r :: bool"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_11"]="TitleText :: r :: string"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_12"]="TitleTextColor :: r :: bool"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_13"]="TitleBottomSeparator :: r :: string"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_14"]="TitleBottomSeparatorColor :: r :: bool"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_15"]="BodyMessageDisplay :: r :: bool"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_16"]="BodyMessageTopSeparator :: r :: string"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_17"]="BodyMessageTopSeparatorColor :: r :: bool"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_18"]="BodyMessageFirstLineIndent :: r :: string"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_19"]="BodyMessageFirstLineBullet :: r :: string"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_20"]="BodyMessageFirstLineBulletColor :: r :: bool"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_21"]="BodyMessageAnotherLinesIndent :: r :: string"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_22"]="BodyMessageAnotherLinesBullet :: r :: string"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_23"]="BodyMessageAnotherLinesBulletColor :: r :: bool"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_24"]="BodyMessageArrayName :: r :: arrayName"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_25"]="BodyMessageArrayNameColor :: r :: bool"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_26"]="BodyMessageBottomSeparator :: r :: string"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_27"]="BodyMessageBottomSeparatorColor :: r :: bool"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_28"]="MessageBottomSeparator :: r :: string"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_29"]="MessageBottomSeparatorColor :: r :: bool"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_30"]="ThemeName :: o :: string"
}
mse_inter_showMessage_createSeparator() {
  if [ "${2}" != "" ]; then
    local mseReturn
    local mseMessageType="${1}"
    declare -n mseAssocColors="${4}"
    if [ "${3}" == "1" ]; then
      mseReturn+="${mseAssocColors[${mseMessageType}]}"
    fi
    mseReturn+="${2}"
    if [ "${3}" == "1" ]; then
      mseReturn+="${mseNONE}"
    fi
    printf "${mseReturn}"
  fi
}
mse_inter_showMessage_createBullet() {
  mse_inter_showMessage_createSeparator "$1" "$2" "$3" "$4"
}
mse_inter_showMessage_createTitle() {
  if [ "${MSE_GLOBAL_SHOW_MESSAGE_CONFIG[TitleDisplay]}" == "1" ]; then
    local mseMessageType="${MSE_GLOBAL_SHOW_MESSAGE_CONFIG[MessageType]}"
    local mseTitleDisplay="${MSE_GLOBAL_SHOW_MESSAGE_CONFIG[TitleDisplay]}"
    local mseTitleType="${MSE_GLOBAL_SHOW_MESSAGE_CONFIG[TitleType]}"
    local mseTitleTopSeparator="${MSE_GLOBAL_SHOW_MESSAGE_CONFIG[TitleTopSeparator]}"
    local mseTitleTopSeparatorColor="${MSE_GLOBAL_SHOW_MESSAGE_CONFIG[TitleTopSeparatorColor]}"
    local mseTitleIndent="${MSE_GLOBAL_SHOW_MESSAGE_CONFIG[TitleIndent]}"
    local mseTitleBullet="${MSE_GLOBAL_SHOW_MESSAGE_CONFIG[TitleBullet]}"
    local mseTitleBulletColor="${MSE_GLOBAL_SHOW_MESSAGE_CONFIG[TitleBulletColor]}"
    local mseTitleText="${MSE_GLOBAL_SHOW_MESSAGE_CONFIG[TitleText]}"
    local mseTitleTextColor="${MSE_GLOBAL_SHOW_MESSAGE_CONFIG[TitleTextColor]}"
    local mseTitleBottomSeparator="${MSE_GLOBAL_SHOW_MESSAGE_CONFIG[TitleBottomSeparator]}"
    local mseTitleBottomSeparatorColor="${MSE_GLOBAL_SHOW_MESSAGE_CONFIG[TitleBottomSeparatorColor]}"
    local mseTitleTypeText=""
    case "${mseMessageType}" in
      info | i)
        mseTitleTypeText="${lbl_inter_alert_header_info}"
      ;;
      attention | a)
        mseTitleTypeText="${lbl_inter_alert_header_attention}"
      ;;
      warning | w)
        mseTitleTypeText="${lbl_inter_alert_header_warning}"
      ;;
      error | e)
        mseTitleTypeText="${lbl_inter_alert_header_error}"
      ;;
      fail | f)
        mseTitleTypeText="${lbl_inter_alert_header_fail}"
      ;;
      success | s)
        mseTitleTypeText="${lbl_inter_alert_header_success}"
      ;;
      friendly | fr | ordinary | or | caution | ca | important | im)
        mseTitleTypeText=""
      ;;
    esac
    local mseStr_TopSeparator
    local mseStr_BottomSeparator
    local mseStr_Bullet
    local mseStr_Indent
    local mseStr_TitleText
    mseStr_TopSeparator=$(mse_inter_showMessage_createSeparator "${mseMessageType}" "${mseTitleTopSeparator}" "${mseTitleTopSeparatorColor}" "MSE_GSMCTC_B02_TOP_SEPARATOR"; printf " ")
    mseStr_BottomSeparator=$(mse_inter_showMessage_createSeparator "${mseMessageType}" "${mseTitleBottomSeparator}" "${mseTitleBottomSeparatorColor}" "MSE_GSMCTC_B02_BOTTOM_SEPARATOR"; printf " ")
    mseStr_Bullet=$(mse_inter_showMessage_createBullet "${mseMessageType}" "${mseTitleBullet}" "${mseTitleBulletColor}" "MSE_GSMCTC_B02_BULLET")
    mseStr_Indent="${mseTitleIndent}"
    local mseTitleMainColor=""
    local mseTitleColorAlt1=""
    local mseTitleTextParts
    if [ "${mseTitleTextColor}" == "1" ]; then
      mseTitleMainColor="${MSE_GSMCTC_B02_TEXT[${mseMessageType}]}"
      mseTitleColorAlt1="${MSE_GSMCTC_B02_TEXT[${mseMessageType}_a1]}"
    fi
    case "${mseTitleType}" in
      1)
        mseStr_TitleText+="${mseTitleMainColor}"
        if [ "${mseTitleText}" == "" ]; then
          mseStr_TitleText+="${mseTitleTypeText}"
        else
          mseStr_TitleText+="${mseTitleText}"
        fi
        mseStr_TitleText+="${mseNONE}"
      ;;
      2)
        mse_str_split "::" "${mseTitleText}"
        mseTitleTextParts="${#MSE_GLOBAL_MODULE_SPLIT_RESULT[@]}"
        mseStr_TitleText+="${mseTitleMainColor}"
        if [ "${mseTitleTextParts}" -le "1" ]; then
          mseStr_TitleText+="[   ] ${mseTitleText}"
        else
          mseStr_TitleText+="[ ${MSE_GLOBAL_MODULE_SPLIT_RESULT[0]} ] ${MSE_GLOBAL_MODULE_SPLIT_RESULT[@]:1}"
        fi
        mseStr_TitleText+="${mseNONE}"
      ;;
      3)
        mse_str_split "::" "${mseTitleText}"
        mseTitleTextParts="${#MSE_GLOBAL_MODULE_SPLIT_RESULT[@]}"
        if [ "${mseTitleTextParts}" -le "1" ]; then
          mseStr_TitleText+="[ ${mseTitleColorAlt1}script${mseNONE} ] ${mseTitleMainColor}${mseTitleText}${mseNONE}"
        else
          mseStr_TitleText+="[ ${mseTitleColorAlt1}${MSE_GLOBAL_MODULE_SPLIT_RESULT[0]}${mseNONE} ] ${mseTitleMainColor}${MSE_GLOBAL_MODULE_SPLIT_RESULT[@]:1}${mseNONE}"
        fi
      ;;
    esac
    printf "${mseStr_TopSeparator:0: -1}${mseStr_Indent}${mseStr_Bullet}${mseStr_TitleText}${mseStr_BottomSeparator:0: -1}"
  fi
}
mse_inter_showMessage_createBody() {
  if [ "${MSE_GLOBAL_SHOW_MESSAGE_CONFIG[BodyMessageDisplay]}" == "1" ]; then
    local mseMessageType="${MSE_GLOBAL_SHOW_MESSAGE_CONFIG[MessageType]}"
    local mseLineIndent
    local mseLineBullet
    local mseLineBulletColor
    local mseLineText
    local mseBodyMessageTopSeparator="${MSE_GLOBAL_SHOW_MESSAGE_CONFIG[BodyMessageTopSeparator]}"
    local mseBodyMessageTopSeparatorColor="${MSE_GLOBAL_SHOW_MESSAGE_CONFIG[BodyMessageTopSeparatorColor]}"
    local mseBodyMessageFirstLineIndent="${MSE_GLOBAL_SHOW_MESSAGE_CONFIG[BodyMessageFirstLineIndent]}"
    local mseBodyMessageFirstLineBullet="${MSE_GLOBAL_SHOW_MESSAGE_CONFIG[BodyMessageFirstLineBullet]}"
    local mseBodyMessageFirstLineBulletColor="${MSE_GLOBAL_SHOW_MESSAGE_CONFIG[BodyMessageFirstLineBulletColor]}"
    local mseBodyMessageAnotherLinesIndent="${MSE_GLOBAL_SHOW_MESSAGE_CONFIG[BodyMessageAnotherLinesIndent]}"
    local mseBodyMessageAnotherLinesBullet="${MSE_GLOBAL_SHOW_MESSAGE_CONFIG[BodyMessageAnotherLinesBullet]}"
    local mseBodyMessageAnotherLinesBulletColor="${MSE_GLOBAL_SHOW_MESSAGE_CONFIG[BodyMessageAnotherLinesBulletColor]}"
    declare -n mseBodyMessageArrayName="${MSE_GLOBAL_SHOW_MESSAGE_CONFIG[BodyMessageArrayName]}"
    local mseBodyMessageArrayNameColor="${MSE_GLOBAL_SHOW_MESSAGE_CONFIG[BodyMessageArrayNameColor]}"
    local mseBodyMessageBottomSeparator="${MSE_GLOBAL_SHOW_MESSAGE_CONFIG[BodyMessageBottomSeparator]}"
    local mseBodyMessageBottomSeparatorColor="${MSE_GLOBAL_SHOW_MESSAGE_CONFIG[BodyMessageBottomSeparatorColor]}"
    local mseStr_TopSeparator
    local mseStr_BottomSeparator
    local mseStr_BodyText
    mseStr_TopSeparator=$(mse_inter_showMessage_createSeparator "${mseMessageType}" "${mseBodyMessageTopSeparator}" "${mseBodyMessageTopSeparatorColor}" "MSE_GSMCTC_B03_TOP_SEPARATOR"; printf " ")
    mseStr_BottomSeparator=$(mse_inter_showMessage_createSeparator "${mseMessageType}" "${mseBodyMessageBottomSeparator}" "${mseBodyMessageBottomSeparatorColor}" "MSE_GSMCTC_B03_BOTTOM_SEPARATOR"; printf " ")
    local mseCountLines=0
    local mseFirstLine=1
    for mseLineText in "${mseBodyMessageArrayName[@]}"; do
      ((mseCountLines=mseCountLines+1))
      if [ "${mseCountLines}" == "1" ]; then
        mseLineIndent="${mseBodyMessageFirstLineIndent}"
        mseLineBullet="${mseBodyMessageFirstLineBullet}"
        mseLineBulletColor="${mseBodyMessageFirstLineBulletColor}"
      else
        mseStr_BodyText+="\n"
        mseLineIndent="${mseBodyMessageAnotherLinesIndent}"
        mseLineBullet="${mseBodyMessageAnotherLinesBullet}"
        mseLineBulletColor="${mseBodyMessageAnotherLinesBulletColor}"
        mseFirstLine=0
      fi
      mseStr_BodyText+=$(mse_inter_showMessage_createBody_line "${mseFirstLine}" "body" "${mseLineIndent}" "${mseLineBullet}" "${mseLineBulletColor}" "${mseLineText}" "${mseBodyMessageArrayNameColor}")
    done
    printf "${mseStr_TopSeparator:0: -1}${mseStr_BodyText}${mseStr_BottomSeparator:0: -1}"
  fi
}
mse_inter_showMessage_createBody_line() {
  if [ "$#" -ge "7" ]; then
    local mseReturn
    local mseMessageType="$2"
    mseReturn+="${3}"
    mseReturn+=$(mse_inter_showMessage_createBullet "${2}" "${4}" "${5}" "MSE_GSMCTC_B03_FIRST_LINE_BULLET")
    if [ "$7" == "1" ]; then
      if [ "$1" == "1" ]; then
        mseReturn+="${MSE_GSMCTC_B03_FIRST_LINE_TEXT[body]}"
      else
        mseReturn+="${MSE_GSMCTC_B03_ANOTHER_LINES_TEXT[body]}"
      fi
    fi
    mseReturn+="${6}"
    if [ "$7" == "1" ]; then
      mseReturn+="${mseNONE}"
    fi
    printf "${mseReturn}"
  fi
}
# END :: mse_inter_showMessage.sh


# INI :: mse_inter_showProgressBar.sh
mse_inter_showProgressBar() {
  MSE_GLOBAL_LASTERR=""
  unset MSE_GLOBAL_SHOW_PROGRESSBAR_CONFIG
  declare -gA MSE_GLOBAL_SHOW_PROGRESSBAR_CONFIG
  if [ $# -lt 16 ]; then
    local mseArgs="$#"
    local mseLost
    ((mseLost=16-mseArgs))
    MSE_GLOBAL_LASTERR=$(mse_str_replacePlaceHolder "${lbl_err_lostParameters}" "LOST" "${mseLost}")
  else
    MSE_GLOBAL_SHOW_PROGRESSBAR_CONFIG["ProgressBarIndent"]="${1}"
    MSE_GLOBAL_SHOW_PROGRESSBAR_CONFIG["ProgressBarFormat"]="${2}"
    MSE_GLOBAL_SHOW_PROGRESSBAR_CONFIG["ProgressBarColor"]="${3}"
    MSE_GLOBAL_SHOW_PROGRESSBAR_CONFIG["ProgressBarBlockStart"]="${4}"
    MSE_GLOBAL_SHOW_PROGRESSBAR_CONFIG["ProgressBarBlockEnd"]="${5}"
    MSE_GLOBAL_SHOW_PROGRESSBAR_CONFIG["ProgressBarBlockChar"]="${6}"
    MSE_GLOBAL_SHOW_PROGRESSBAR_CONFIG["ProgressBarTotalCharLength"]="${7}"
    MSE_GLOBAL_SHOW_PROGRESSBAR_CONFIG["ProgressBarAtualPercentProgress"]="${8}"
    MSE_GLOBAL_SHOW_PROGRESSBAR_CONFIG["ProgressBarInfoDisplay"]="${9}"
    MSE_GLOBAL_SHOW_PROGRESSBAR_CONFIG["ProgressBarInfoColor"]="${10}"
    MSE_GLOBAL_SHOW_PROGRESSBAR_CONFIG["ProgressBarInfoPosition"]="${11}"
    MSE_GLOBAL_SHOW_PROGRESSBAR_CONFIG["ProgressBarInfoBlockStart"]="${12}"
    MSE_GLOBAL_SHOW_PROGRESSBAR_CONFIG["ProgressBarInfoBlockEnd"]="${13}"
    MSE_GLOBAL_SHOW_PROGRESSBAR_CONFIG["ProgressBarInfoUsePercent"]="${14}"
    MSE_GLOBAL_SHOW_PROGRESSBAR_CONFIG["ProgressBarInfoData"]="${15}"
    local mseKey
    local mseValue
    local mseTmp
    local mseCheck
    for mseKey in "${!MSE_GLOBAL_SHOW_PROGRESSBAR_CONFIG[@]}"; do
      mseValue="${MSE_GLOBAL_SHOW_PROGRESSBAR_CONFIG[$mseKey]}"
      case "${mseKey}" in
        ProgressBarFormat)
          if [ "${mseValue}" == "" ]; then
            MSE_GLOBAL_SHOW_PROGRESSBAR_CONFIG["ProgressBarFormat"]="DEFAULTFORMAT"
          else
            MSE_GLOBAL_SHOW_PROGRESSBAR_CONFIG["ProgressBarFormat"]="${mseValue^^}"
          fi
        ;;
        ProgressBarBlockChar)
          mseTmp="#"
          if [ "${#mseValue}" == "1" ]; then
            mseTmp="$mseValue"
          fi
          MSE_GLOBAL_SHOW_PROGRESSBAR_CONFIG["ProgressBarBlockChar"]="${mseTmp}"
        ;;
        ProgressBarTotalCharLength)
          mseCheck=$(mse_check_isInteger "$mseValue")
          mseTmp=50
          if [ "${mseCheck}" == "1" ]; then
            if [ "${mseValue}" -lt "20" ]; then
              mseTmp=20
            elif [ "${mseValue}" -gt "100" ]; then
              mseTmp=100
            else
              mseTmp="${mseValue}"
            fi
          fi
          MSE_GLOBAL_SHOW_PROGRESSBAR_CONFIG["ProgressBarTotalCharLength"]="${mseTmp}"
        ;;
        ProgressBarAtualPercentProgress)
          mseCheck=$(mse_check_isInteger "$mseValue")
          mseTmp=0
          if [ "${mseCheck}" == "1" ]; then
            if [ "${mseValue}" -lt "0" ]; then
              mseTmp=0
            elif [ "${mseValue}" -gt "100" ]; then
              mseTmp=100
            else
              mseTmp="${mseValue}"
            fi
          fi
          MSE_GLOBAL_SHOW_PROGRESSBAR_CONFIG["ProgressBarAtualPercentProgress"]="${mseTmp}"
        ;;
        ProgressBarColor | ProgressBarInfoDisplay | ProgressBarInfoColor | ProgressBarInfoUsePercent)
          mseTmp=1
          if [ "${mseValue}" == "1" ] || [ "${mseValue}" == "0" ]; then
            mseTmp="${mseValue}"
          fi
          MSE_GLOBAL_SHOW_PROGRESSBAR_CONFIG[${mseKey}]="${mseTmp}"
        ;;
        ProgressBarInfoPosition)
          mseTmp=r
          if [ "${mseValue}" == "r" ] || [ "${mseValue}" == "l" ]; then
            mseTmp="${mseValue}"
          fi
          MSE_GLOBAL_SHOW_PROGRESSBAR_CONFIG["ProgressBarInfoPosition"]="${mseTmp}"
        ;;
      esac
    done
    local mseThemeName="${16}"
    local mseThemeFunction="${mseThemeName}_createProgressBar"
    if [ "$(type -t $mseThemeFunction)" != "function" ]; then
      mseThemeFunction="${MSE_GLOBAL_THEME_NAME}_createProgressBar"
    fi
    if [ "${MSE_GLOBAL_SHOW_PROGRESSBAR_CONFIG[MessageFormat]}" != "" ]; then
      mseThemeFunction="${MSE_GLOBAL_SHOW_PROGRESSBAR_CONFIG[MessageFormat]}"
      if [ "$(type -t $mseThemeFunction)" != "function" ]; then
        mseThemeFunction="${MSE_GLOBAL_THEME_NAME}_createProgressBar"
      fi
    fi
    $mseThemeFunction
  fi
}
mse_inter_showProgressBar_vldtr() {
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["count"]=15
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_0"]="ProgressBarIndent :: r :: string"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_1"]="MessageFormat :: r :: string"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_2"]="ProgressBarColor :: r :: bool"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_3"]="ProgressBarBlockStart :: r :: string"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_4"]="ProgressBarBlockEnd :: r :: string"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_5"]="ProgressBarBlockChar :: r :: char"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_6"]="ProgressBarTotalCharLength :: r :: int :: 50 :: 20 :: 100"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_7"]="ProgressBarAtualPercentProgress :: r :: int :: 0 :: 0 :: 100"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_8"]="ProgressBarInfoDisplay :: r :: bool"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_9"]="ProgressBarInfoColor :: r :: bool"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_10"]="ProgressBarInfoPosition :: r :: list"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_10_labels"]="l, r"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_10_values"]="l, r"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_11"]="ProgressBarInfoBlockStart :: r :: string"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_12"]="ProgressBarInfoBlockEnd :: r :: string"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_13"]="ProgressBarInfoUsePercent :: r :: bool"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_14"]="ProgressBarInfoData :: r :: string"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_15"]="ThemeName :: o :: string"
}
mse_inter_showProgressBar_createBar() {
  local mseStrBar=""
  local mseBarChar="${MSE_GLOBAL_SHOW_PROGRESSBAR_CONFIG[ProgressBarBlockChar]}"
  local mseBarLength="${MSE_GLOBAL_SHOW_PROGRESSBAR_CONFIG[ProgressBarTotalCharLength]}"
  local mseBarAtualCharLength="${MSE_GLOBAL_SHOW_PROGRESSBAR_CONFIG[ProgressBarAtualBarLength]}"
  local mseBarStart="${MSE_GLOBAL_SHOW_PROGRESSBAR_CONFIG[ProgressBarBlockStart]}"
  local mseBarEnd="${MSE_GLOBAL_SHOW_PROGRESSBAR_CONFIG[ProgressBarBlockEnd]}"
  local mseBarCharColor=""
  local mseBarCharDelimiterColor=""
  if [ "${MSE_GLOBAL_SHOW_PROGRESSBAR_CONFIG[ProgressBarColor]}" == "1" ]; then
    mseBarCharColor="${MSE_GSPBCTC_B01_CHAR[b01_char]}"
    mseBarCharDelimiterColor="${MSE_GSPBCTC_B01_DELIMITERS[b01_delimiter]}"
  fi
  printf "${mseBarCharDelimiterColor}"; printf "%s" "${mseBarStart}"; printf "${mseNONE}"
  printf "${mseBarCharColor}"
  for ((i=0; i<mseBarLength; i++)); do
    if [ "${i}" -le "${mseBarAtualCharLength}" ]; then
      mseStrBar+="${mseBarChar}"
    else
      mseStrBar+=" "
    fi
  done
  printf "%s" "${mseStrBar}"
  printf "${mseNONE}"
  printf "${mseBarCharDelimiterColor}"; printf "%s" "${mseBarEnd}"; printf "${mseNONE}"
}
mse_inter_showProgressBar_createData() {
  if [ "${MSE_GLOBAL_SHOW_PROGRESSBAR_CONFIG[ProgressBarInfoDisplay]}" == "1" ]; then
    local mseStrInfo=""
    local mseInfoData="${MSE_GLOBAL_SHOW_PROGRESSBAR_CONFIG[ProgressBarInfoData]}"
    local mseInfoStart="${MSE_GLOBAL_SHOW_PROGRESSBAR_CONFIG[ProgressBarInfoBlockStart]}"
    local mseInfoEnd="${MSE_GLOBAL_SHOW_PROGRESSBAR_CONFIG[ProgressBarInfoBlockEnd]}"
    local mseInfoColor=""
    local mseInfoDelimiterColor=""
    if [ "${MSE_GLOBAL_SHOW_PROGRESSBAR_CONFIG[ProgressBarInfoColor]}" == "1" ]; then
      mseInfoColor="${MSE_GSPBCTC_B02_DATA[b01_data]}"
      mseInfoDelimiterColor="${MSE_GSPBCTC_B02_DELIMITERS[b02_delimiter]}"
    fi
    printf "${mseInfoDelimiterColor}"; printf "%s" "${mseInfoStart}"; printf "${mseNONE}"
    printf "${mseInfoColor}"; printf "%s" "${mseInfoData}"; printf "${mseNONE}"
    printf "${mseInfoDelimiterColor}"; printf "%s" "${mseInfoEnd}"; printf "${mseNONE}"
  fi
}
# END :: mse_inter_showProgressBar.sh


# INI :: mse_inter_startSpinner.sh
mse_inter_startSpinner() {
  declare -n mseSpinnerSteps="MSE_GLOBAL_SPINNER_DEFAULT"
  if [ $# -ge 1 ]; then
    if [[ "$(declare -p ${1} 2> /dev/null)" =~ "declare -a" ]]; then
      declare -n mseSpinnerSteps="${1}"
    fi
  fi
  set +m
  {
    local mseStep=""
    local mseFirst=1
    while : ; do
      if [ "${mseFirst}" == "1" ]; then
        mseFirst=0
        sleep 0.5
      fi
      for mseStep in "${mseSpinnerSteps[@]}"; do
        printf "\r${mseStep}"
        sleep 0.2
      done
    done &
  } 2> /dev/null
  MSE_GLOBAL_SPINNER_PID=$!
}
# END :: mse_inter_startSpinner.sh


# INI :: mse_inter_stopSpinner.sh
mse_inter_stopSpinner() {
  {
    kill -9 "${MSE_GLOBAL_SPINNER_PID}" && wait;
  } 2> /dev/null
  set -m
  MSE_GLOBAL_SPINNER_PID=""
  mse_inter_clearLine "" "1"
}
# END :: mse_inter_stopSpinner.sh


# INI :: mse_inter_waitUser.sh
mse_inter_waitUser() {
  declare -A mseArgs
  mseArgs["MessageType"]="${1}"
  mseArgs["MessageFormat"]="SHOWSTATUS"
  mseArgs["TitleType"]="3"
  mseArgs["TitleCode"]="${2}"
  mseArgs["TitleText"]="${3}"
  mseArgs["BodyMessageArrayName"]=""
  if [ "${1}" == "" ]; then
    mseArgs["MessageType"]="i"
  fi
  if [ "${2}" == "" ]; then
    mseArgs["TitleCode"]="!"
  fi
  if [ "${3}" == "" ]; then
    mseArgs["TitleText"]="${lbl_inter_wait_user_any_key}"
  fi
  local mseTheme="${MSE_GLOBAL_THEME_NAME}"
  if [ "${3}" != "" ]; then
    mseTheme="${3}"
  fi
  local mseWaitingMessage
  mseWaitingMessage=$(mse_inter_showMessage "${mseArgs[MessageType]}" "${mseArgs[MessageFormat]}" "" "" "" "${mseArgs[TitleType]}" "" "" "" "" "" "${mseArgs[TitleCode]}::${mseArgs[TitleText]}" "" "" "" "" "" "" "" "" "" "" "" "" "${mseArgs[BodyMessageArrayName]}" "" "" "" "" "" "${mseTheme}")
  read -n 1 -s -r -p "${mseWaitingMessage}  "
  printf "\n"
}
mse_inter_waitUser_vldtr() {
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["count"]=4
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_0"]="MessageType :: r :: list"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_0_labels"]="none, info, attention, warning, error, fail, success"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_0_values"]="n, i, a, w, e, f, s"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_1"]="TitleCode :: r :: string"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_2"]="TitleText :: r :: string"
  MSE_GLOBAL_VALIDATE_PARAMETERS_RULES["param_3"]="Theme :: o :: string"
}
# END :: mse_inter_waitUser.sh


# INI :: mse_mmod_cmd.sh
mse_mmod_cmd() {
  if [ "$#" -ge 1 ] && [ "$1" != "" ]; then
    local i
    local mseOffSet=1
    local mseLength="$#"
    local mseFunctionName="${MSE_GLOBAL_CMD[$1]}"
    if [ "${mseFunctionName}" == "" ] && [ "${mseLength}" -ge 2 ]; then
      local mseCmd="$1"
      for ((i=2; i<=mseLength; i++)); do
        mseCmd+=" ${!i}"
        mseFunctionName="${MSE_GLOBAL_CMD[$mseCmd]}"
        if [ "${mseFunctionName}" != "" ]; then
          mseOffSet="$i"
          break
        fi
      done
    fi
    if [ "${mseFunctionName}" == "" ]; then
      local mseMSG
      mseMSG=$(mse_str_replacePlaceHolder "${lbl_cmd_commandNotFound}" "CMD" "$1")
      mse_inter_alertUser "i" "" "${mseMSG}"
    else
      local mseParans=("$@")
      mseParans=("${mseParans[@]:${mseOffSet}}")
      "$mseFunctionName" "${mseParans[@]}"
    fi
  fi
}
# END :: mse_mmod_cmd.sh


# INI :: mse_mmod_generateStandalone.sh
mse_mmod_generateStandalone() {
  if [ -z "${MSE_GLOBAL_MODULES_PATH[$1]+x}" ]; then
    mse_inter_errorAlert "err" "Module name not found."
  else
    local rawLine
    local mseCheck
    local mseModulePath="${MSE_GLOBAL_MODULES_PATH[$1]}"
    declare -a mseTargetFiles=()
    mseTargetFiles+=("${mseModulePath}/locale/${MSE_GLOBAL_MODULE_LOCALE}.sh")
    mseTargetFiles+=("${mseModulePath}/config/env.sh")
    mseTargetFiles+=("${mseModulePath}/config/variables.sh")
    mseTargetFiles+=("${mseModulePath}/config/aliases.sh")
    mseConfigFiles=$(find "${mseModulePath}/config" -name "*.sh" | sort -n)
    if [ "$mseConfigFiles" != "" ]; then
      while read rawLine; do
        mseCheck=$(mse_check_hasValueInArray "${rawLine}" "mseTargetFiles")
        if [ "${mseCheck}" == "0" ]; then
          mseTargetFiles+=("${rawLine}")
        fi
      done <<< ${mseConfigFiles}
    fi
    mseModFiles=$(find "${mseModulePath}/scripts" -name "*.sh" | sort -n)
    if [ "$mseModFiles" != "" ]; then
      while read rawLine; do
        mseTargetFiles+=("${rawLine}")
      done <<< ${mseModFiles}
    fi
    mse_file_read_resetConfig
    MSE_GLOBAL_MODULE_READ_LINE["check"]="mse_file_read_checkLine_isComment"
    MSE_GLOBAL_MODULE_READ_LINE["check_args"]=""
    MSE_GLOBAL_MODULE_READ_LINE["check_has_linenumber"]=""
    MSE_GLOBAL_MODULE_READ_LINE["check_invert"]="1"
    unset MSE_GLOBAL_MODULE_READ_LINE_ARGS_ARRAY
    declare -ga MSE_GLOBAL_MODULE_READ_LINE_ARGS_ARRAY=("#" ";")
    local mseFileContent
    local mseFileStandalone="${mseModulePath}/standalone.sh"
    local mseFullFileName=$(basename -- "$rawLine")
    > "${mseFileStandalone}"
    printf "%s\n" "#!/usr/bin/env bash" >> "${mseFileStandalone}"
    printf "%s\n\n\n" "# myShellEnv v 1.0 [aeondigital.com.br]" >> "${mseFileStandalone}"
    for mseFile in "${mseTargetFiles[@]}"; do
      mseFullFileName=$(basename -- "$mseFile")
      mseFileContent=$(grep -vE '^(\s*$|\s*#)' "${mseFile}")
      echo -e "# INI :: ${mseFullFileName}" >> "${mseFileStandalone}"
      printf "%s\n" "${mseFileContent}" >> "${mseFileStandalone}"
      echo -e "# END :: ${mseFullFileName}\n\n" >> "${mseFileStandalone}"
    done
  fi
}
# END :: mse_mmod_generateStandalone.sh


# INI :: mse_mmod_help.sh
mse_mmod_help() {
  mse_mmod_man mse_mmod_help
}
# END :: mse_mmod_help.sh


# INI :: mse_mmod_man.sh
mse_mmod_man() {
  local mseMSG
  local mseMetaData
  local msePathToFile
  if [ "$1" == "" ]; then
    mse_inter_alertUser "i" "" "${lbl_man_enterAFunction}"
  elif [ "$(type -t $1)" != "function" ]; then
    mseMSG=$(mse_str_replacePlaceHolder "${lbl_man_functionDoesNotExists}" "FUNCTION" "$1")
    mse_inter_alertUser "i" "" "${mseMSG}"
    mse_inter_setCursorPosition top 2
    mse_inter_alertUser "i" "" "${lbl_man_searchForAValidFunction}"
  else
    mseMetaData=$(mse_mmod_showRawMetaData 0 0 1 "" "" "$1" "1")
    if [ "${mseMetaData}" == "" ]; then
      mseMSG=$(mse_str_replacePlaceHolder "${lbl_man_couldNotFindHelpForFunction}" "FUNCTION" "$1")
      mse_inter_errorAlert "err" "${mseMSG}"
    else
      mse_str_split "::" "${mseMetaData}"
      if [ ! -f "${MSE_GLOBAL_MODULE_SPLIT_RESULT[4]}" ]; then
        mseMSG=$(mse_str_replacePlaceHolder "${lbl_man_fileOfFunctionNotFound}" "PATH" "${MSE_GLOBAL_MODULE_SPLIT_RESULT[4]}")
        mse_inter_errorAlert "err" "${mseMSG}"
      else
        msePathToFile="${MSE_GLOBAL_MODULE_SPLIT_RESULT[4]}"
        local mseLocaleMan=$(mse_str_replace "/src/scripts/" "/src/locale/man/${MSE_GLOBAL_MODULE_LOCALE}/" "${msePathToFile}")
        if [ -f "${mseLocaleMan}" ]; then
          msePathToFile="${mseLocaleMan}"
        fi
      fi
    fi
  fi
  if [ "${msePathToFile}" != "" ]; then
    local mseRawLine
    local mseInDescription=0
    declare -a mseDescriptionLines=()
    local mseTmpLine
    local i
    local mseLength
    local mseLinePart
    local mseNewMarkup
    local mseColorAt=$(mse_font_createStyle "0" "BOLD,DIM" "NONE" "BLUE" "1")
    local mseColorTagName=$(mse_font_createStyle "0" "BOLD,DIM" "NONE" "BLUE" "1")
    local mseColorTagCommom=$(mse_font_createStyle "0" "BOLD,DIM" "NONE" "LCYAN" "1")
    local mseColorParam=$(mse_font_createStyle "1" "BOLD" "NONE" "250" "1")
    while read mseRawLine || [ -n "${mseRawLine}" ]; do
      if [ "$mseRawLine" == "# @desc" ]; then
        if [ "${mseInDescription}" == "1" ]; then
          mseInDescription=0
          break
        else
          mseInDescription=1
          mseDescriptionLines+=("")
        fi
      fi
      if [ $mseInDescription == 1 ]; then
        if [ "${mseRawLine:0:1}" != "#" ]; then
          mseInDescription=0
          break
        else
          mseRawLine=$(mse_str_trim "${mseRawLine}")
          if [ "${mseRawLine}" == "#" ]; then
            mseDescriptionLines+=("")
          else
            mseTmpLine="${mseRawLine#"# "}"
            if [ "${mseTmpLine:0:1}" == "@" ]; then
              mse_str_split " " "${mseTmpLine}"
              mseNewMarkup=""
              mseLength="${#MSE_GLOBAL_MODULE_SPLIT_RESULT[@]}"
              for ((i=0; i<mseLength; i++)); do
                mseLinePart="${MSE_GLOBAL_MODULE_SPLIT_RESULT[$i]}"
                if [ "${mseLinePart:0:1}" == "@" ]; then
                  mseNewMarkup+="${mseColorAt}@${mseNONE}"
                  mseNewMarkup+="${mseColorTagName}${mseLinePart:1}${mseNONE} "
                elif [ "${mseLinePart:0:1}" == '$' ]; then
                  mseNewMarkup+="${mseColorParam}${mseLinePart}${mseNONE} "
                else
                  mseNewMarkup+="${mseColorTagCommom}${mseLinePart}${mseNONE} "
                fi
              done
              mseTmpLine=$(printf "${mseNewMarkup}")
            fi
            mseDescriptionLines+=("${mseTmpLine}")
          fi
        fi
      fi
    done < "$msePathToFile"
    if [ "${#mseDescriptionLines[@]}" == "0" ]; then
      mse_inter_errorAlert "err" "${lbl_man_noUsageDescriptionFoundForFunction}"
    else
      mseDescriptionLines+=("")
      local mseCod="MAN"
      local mseTtl="$1"
      if [ "$1" == "mse_mmod_help" ]; then
        mseCod="MSE"
        mseTtl="My Shell Env"
      fi
      local mseReturn=$(mse_inter_alertUser "a" "${mseCod}" "${mseTtl}" "mseDescriptionLines")
      if [ "$#" -ge 2 ] && [ "$2" == "0" ]; then
        printf "${mseReturn}\n"
      else
        printf "${mseReturn}" | less -r
      fi
    fi
  fi
}
# END :: mse_mmod_man.sh


# INI :: mse_mmod_searchFunction.sh
mse_mmod_searchFunction() {
  if [ "$#" == "0" ] || [ "$1" == "" ]; then
    mse_inter_alertUser "i" "" "${lbl_searchFunction_enterAFunction}"
  else
    mse_mmod_showMetaData 1 1 "" "" "$1"
  fi
}
# END :: mse_mmod_searchFunction.sh


# INI :: mse_mmod_showMetaData.sh
mse_mmod_showMetaData() {
  local msePrettyFormat=0
  if [ "$1" == "0" ] || [ "$1" == "1" ]; then
    msePrettyFormat="$1"
  fi
  local mseShowFunctions=1
  if [ "$2" == "0" ] || [ "$2" == "1" ]; then
    mseShowFunctions="$2"
  fi
  local mseFilterModules="$3"
  local mseFilterSubModules="$4"
  local mseFilterFunctions="$5"
  local mseRawData
  local mseRawSubModuleData
  mseRawData=$(mse_mmod_showRawMetaData 1 1 1 "${mseFilterModules}" "${mseFilterSubModules}" "${mseFilterFunctions}")
  if [ "${mseRawData}" != "" ]; then
    local mseLineRaw
    local mseTmpLine
    local mseAddLine
    local mseModStart=0
    declare -a mseReturnData
    local oIFS=$IFS
    IFS=$'\n'
    local msePFIndentModule
    local msePFIndentSubModule
    local msePFIndentFunction
    local msePFColorModule
    local msePFColorSubModule
    local msePFColorFunctions
    local msePFColorSeparator
    local msePFColorSelectedElements
    local msePFColorTotalElements
    if [ "${msePrettyFormat}" == "1" ]; then
      msePFIndentModule="  "
      msePFIndentSubModule="     "
      msePFIndentFunction="       "
      msePFColorModule=$(mse_font_createStyle "0" "BOLD" "NONE" "BLUE" "1")
      msePFColorSubModule=$(mse_font_createStyle "0" "BOLD" "NONE" "BLUE" "1")
      msePFColorFunctions=$(mse_font_createStyle "0" "" "NONE" "DGREY" "1")
      msePFColorSeparator=$(mse_font_createStyle "0" "" "NONE" "WHITE" "1")
      msePFColorSeparatorBar=$(mse_font_createStyle "0" "DIM" "NONE" "WHITE" "1")
      msePFColorSelectedElements=$(mse_font_createStyle "0" "" "NONE" "DGREY" "1")
      msePFColorTotalElements=$(mse_font_createStyle "0" "" "NONE" "DGREY" "1")
      mseReturnData+=("")
    fi
    while read mseLineRaw || [ -n "${mseLineRaw}" ]; do
      mse_str_split "::" "${mseLineRaw}"
      mseTmpLine=""
      mseAddLine=1
      if [ "${msePrettyFormat}" == "0" ]; then
        mseTmpLine="${MSE_GLOBAL_MODULE_SPLIT_RESULT[0]}"
        case "${MSE_GLOBAL_MODULE_SPLIT_RESULT[0]}" in
          M)
            mseTmpLine+="  ${MSE_GLOBAL_MODULE_SPLIT_RESULT[1]} (${MSE_GLOBAL_MODULE_SPLIT_RESULT[3]}/${MSE_GLOBAL_MODULE_SPLIT_RESULT[2]})"
          ;;
          S)
            mseTmpLine+="    ${MSE_GLOBAL_MODULE_SPLIT_RESULT[2]} (${MSE_GLOBAL_MODULE_SPLIT_RESULT[4]}/${MSE_GLOBAL_MODULE_SPLIT_RESULT[3]})"
          ;;
          F)
            if [ "${MSE_GLOBAL_MODULE_SPLIT_RESULT[2]}" == "-" ]; then
              mseTmpLine+="    ${MSE_GLOBAL_MODULE_SPLIT_RESULT[3]}"
            else
              mseTmpLine+="      ${MSE_GLOBAL_MODULE_SPLIT_RESULT[3]}"
            fi
            if [ "${mseShowFunctions}" == "0" ]; then
              mseAddLine=0
            fi
          ;;
        esac
        if [ "${mseAddLine}" == 1 ]; then
          mseReturnData+=("${mseTmpLine}")
        fi
      else
        case "${MSE_GLOBAL_MODULE_SPLIT_RESULT[0]}" in
          M)
            mseModStart=1
            mseTmpLine+="${msePFIndentModule}"
            mseTmpLine+=":: ${msePFColorModule}${MSE_GLOBAL_MODULE_SPLIT_RESULT[1]}${mseNONE} "
            mseTmpLine+="${msePFColorSeparator}(${mseNONE}"
            mseTmpLine+="${msePFColorSelectedElements}${MSE_GLOBAL_MODULE_SPLIT_RESULT[3]}${mseNONE}"
            mseTmpLine+="${msePFColorSeparatorBar}/${mseNONE}"
            mseTmpLine+="${msePFColorTotalElements}${MSE_GLOBAL_MODULE_SPLIT_RESULT[2]}${mseNONE}"
            mseTmpLine+="${msePFColorSeparator})${mseNONE}"
            mseReturnData+=($(printf "${mseTmpLine}"))
            mseRawSubModuleData=$(mse_mmod_showRawMetaData 0 1 0 "${MSE_GLOBAL_MODULE_SPLIT_RESULT[1]}" "${mseFilterSubModules}" "${mseFilterFunctions}")
            if [ "${mseRawSubModuleData}" != "" ]; then
              declare -a mseTmpArrSubModuleLine=()
              declare -a mseTmpArrSubModuleLineNoColor=()
              local mseTmpStrSubModuleLine
              local mseSubModuleLineNoColor
              local mseSubModuleLine
              local mseSubModuleLineRaw
              local mseSubModuleNameMaxLength=0
              while read mseSubModuleLineRaw || [ -n "${mseSubModuleLineRaw}" ]; do
                mse_str_split "::" "${mseSubModuleLineRaw}"
                mseSubModuleLine=""
                mseSubModuleLine+="${msePFColorSubModule}${MSE_GLOBAL_MODULE_SPLIT_RESULT[2]}${mseNONE} "
                mseSubModuleLine+="${msePFColorSeparator}(${mseNONE}"
                mseSubModuleLine+="${msePFColorSelectedElements}${MSE_GLOBAL_MODULE_SPLIT_RESULT[4]}${mseNONE}"
                mseSubModuleLine+="${msePFColorSeparatorBar}/${mseNONE}"
                mseSubModuleLine+="${msePFColorTotalElements}${MSE_GLOBAL_MODULE_SPLIT_RESULT[3]}${mseNONE}"
                mseSubModuleLine+="${msePFColorSeparator})${mseNONE}"
                mseTmpArrSubModuleLine+=($(printf "${mseSubModuleLine}"))
                mseSubModuleLineNoColor="${MSE_GLOBAL_MODULE_SPLIT_RESULT[2]} (${MSE_GLOBAL_MODULE_SPLIT_RESULT[4]}/${MSE_GLOBAL_MODULE_SPLIT_RESULT[3]})"
                mseTmpArrSubModuleLineNoColor+=("${#mseSubModuleLineNoColor}")
                if [ "${#mseSubModuleLineNoColor}" -gt "${mseSubModuleNameMaxLength}" ]; then
                  mseSubModuleNameMaxLength="${#mseSubModuleLineNoColor}"
                fi
              done <<< "$mseRawSubModuleData"
              local i
              local d
              local c=0
              local mseTmpSubModuleName
              local mseTmpSubModuleCounter
              local mseTmpSubModuleNameLength
              local mseDiff
              mseTmpSubModuleCounter="${#mseTmpArrSubModuleLine[@]}"
              for ((i=0; i<mseTmpSubModuleCounter; i++)); do
                mseTmpSubModuleName="${mseTmpArrSubModuleLine[$i]}"
                mseTmpSubModuleNameLength="${mseTmpArrSubModuleLineNoColor[$i]}"
                ((mseDiff=mseSubModuleNameMaxLength-mseTmpSubModuleNameLength))
                for ((d=0; d<mseDiff; d++)); do
                  mseTmpSubModuleName+=" "
                done
                mseTmpStrSubModuleLine+="${mseTmpSubModuleName}  "
                ((c=c+1))
                if [ "${c}" == 5 ] || [ "${c}" == "${mseTmpSubModuleCounter}" ]; then
                  mseReturnData+=("${msePFIndentSubModule}${mseTmpStrSubModuleLine}")
                  mseTmpStrSubModuleLine=""
                fi
              done
            fi
          ;;
          S)
            if [ "${mseShowFunctions}" == "1" ]; then
              mseReturnData+=("")
              mseSubModuleLine="${msePFIndentSubModule}"
              mseSubModuleLine+="${msePFColorSubModule}${MSE_GLOBAL_MODULE_SPLIT_RESULT[2]}${mseNONE} "
              mseSubModuleLine+="${msePFColorSeparator}(${mseNONE}"
              mseSubModuleLine+="${msePFColorSelectedElements}${MSE_GLOBAL_MODULE_SPLIT_RESULT[4]}${mseNONE}"
              mseSubModuleLine+="${msePFColorSeparatorBar}/${mseNONE}"
              mseSubModuleLine+="${msePFColorTotalElements}${MSE_GLOBAL_MODULE_SPLIT_RESULT[3]}${mseNONE}"
              mseSubModuleLine+="${msePFColorSeparator})${mseNONE}"
              mseReturnData+=($(printf "${mseSubModuleLine}"))
            fi
          ;;
          F)
            if [ "${MSE_GLOBAL_MODULE_SPLIT_RESULT[2]}" == "-" ]; then
              if [ "${mseModStart}" == "1" ]; then
                mseReturnData+=("")
                mseModStart=0
              fi
              mseTmpLine+="${msePFIndentSubModule}${msePFColorFunctions}${MSE_GLOBAL_MODULE_SPLIT_RESULT[3]}${mseNONE}"
            else
              mseTmpLine+="${msePFIndentFunction}${msePFColorFunctions}${MSE_GLOBAL_MODULE_SPLIT_RESULT[3]}${mseNONE}"
            fi
            if [ "${mseShowFunctions}" == "0" ]; then
              mseAddLine=0
            fi
            if [ "${mseAddLine}" == 1 ]; then
              mseReturnData+=($(printf "${mseTmpLine}"))
            fi
          ;;
        esac
      fi
    done <<< "$mseRawData"
    IFS=$oIFS
    if [ "${msePrettyFormat}" == "1" ] && [ "${mseShowFunctions}" == "1" ]; then
      mseReturnData+=("")
    fi
    printf "%s\n" "${mseReturnData[@]}"
  fi
}
# END :: mse_mmod_showMetaData.sh


# INI :: mse_mmod_showMetaSummary.sh
mse_mmod_showMetaSummary() {
  local msePrettyFormat=1
  if [ "$1" == "0" ] || [ "$1" == "1" ]; then
    msePrettyFormat="$1"
  fi
  mse_mmod_showMetaData "${msePrettyFormat}" 0
  mse_inter_setCursorPosition top 1
  mse_inter_alertUser "i" "" "${lbl_showMetaSummary_moreDetails}"
}
# END :: mse_mmod_showMetaSummary.sh


# INI :: mse_mmod_showRawMetaData.sh
mse_mmod_showRawMetaData() {
  declare -a mseReturn
  declare -A mseReturnCount
  local mseTmpKey
  local mseTmpTotal
  local mseShowModuleNames=1
  if [ "$1" != "" ] && [ "$1" == "0" ]; then
    mseShowModuleNames=0
  fi
  local mseShowSubModuleNames=1
  if [ "$2" != "" ] && [ "$2" == "0" ]; then
    mseShowSubModuleNames=0
  fi
  local mseShowFunctionNames=1
  if [ "$3" != "" ] && [ "$3" == "0" ]; then
    mseShowFunctionNames=0
  fi
  local mseFilterModules=""
  if [ "$4" != "" ]; then
    mseFilterModules="$4"
  fi
  local mseFilterSubModules=""
  if [ "$5" != "" ]; then
    mseFilterSubModules="$5"
  fi
  local mseFilterFunctions=""
  if [ "$6" != "" ]; then
    mseFilterFunctions="$6"
  fi
  local mseFilterFunctionsExact=0
  if [ "$7" == "1" ]; then
    mseFilterFunctionsExact="1"
  fi
  local i
  local mseLength="${#MSE_GLOBAL_MODULES_METADATA_INDEXED[@]}"
  local mseMatch
  local mseValue
  local mseType
  local mseModuleName
  local mseSubModuleName
  declare -a mseSelected
  for ((i=0; i<mseLength; i++)); do
    mseMatch=0
    mseValue="${MSE_GLOBAL_MODULES_METADATA_INDEXED[$i]}"
    mseType="${mseValue:0:1}"
    case "${mseType}" in
      M)
        mseModuleName=""
        mseSubModuleName=""
        if [ "${mseFilterModules}" == "" ] || [[ "${mseValue^^}" =~ "${mseFilterModules^^}" ]]; then
          if [ "${mseShowModuleNames}" == "1" ]; then
            mseSelected+=("${mseValue}")
          fi
          mseModuleName="${mseValue#M::}"
          mseSubModuleName="-"
          mseReturnCount[${mseValue}]=0
        fi
      ;;
      S)
        mseSubModuleName=""
        if [ "${mseModuleName}" != "" ]; then
          if [ "${mseFilterSubModules}" == "" ] || [[ "${mseValue^^}" =~ "S::${mseModuleName^^}::${mseFilterSubModules^^}" ]]; then
            if [ "${mseShowSubModuleNames}" == "1" ]; then
              mseSelected+=("${mseValue}")
            fi
            mseSubModuleName="${mseValue##*::}"
            mseReturnCount[${mseValue}]=0
          fi
        fi
      ;;
      F)
        if [ "${mseModuleName}" != "" ] && [ "${mseSubModuleName}" != "" ] && [[ "${mseValue^^}" =~ "F::${mseModuleName^^}::${mseSubModuleName^^}::" ]]; then
          if [ "${mseFilterSubModules}" == "" ] || [[ "${mseValue^^}" =~ "F::${mseModuleName^^}::${mseFilterSubModules^^}" ]]; then
            if [ "${mseFilterFunctions}" == "" ] || ([ "${mseFilterFunctionsExact}" == "0" ] && [[ "${mseValue^^}" =~ "${mseFilterFunctions^^}" ]]) || ([ "${mseFilterFunctionsExact}" == "1" ] && [[ "${mseValue^^}" == "F::${mseModuleName^^}::${mseSubModuleName^^}::${mseFilterFunctions^^}" ]]); then
              if [ "${mseShowFunctionNames}" == "1" ]; then
                mseSelected+=("${mseValue}")
              fi
              mseTmpKey="M::${mseModuleName}"
              mseTmpTotal="${mseReturnCount[${mseTmpKey}]}"
              ((mseTmpTotal=mseTmpTotal+1))
              mseReturnCount[${mseTmpKey}]="${mseTmpTotal}"
              mseTmpKey="S::${mseModuleName}::${mseSubModuleName}"
              mseTmpTotal="${mseReturnCount[${mseTmpKey}]}"
              ((mseTmpTotal=mseTmpTotal+1))
              mseReturnCount[${mseTmpKey}]="${mseTmpTotal}"
            fi
          fi
        fi
      ;;
    esac
  done
  local mseKey
  local mseTmpData
  local mseTmpShow
  for mseKey in "${mseSelected[@]}"; do
    mseType="${mseKey:0:1}"
    mseTmpShow=1
    mseTmpData="${MSE_GLOBAL_MODULES_METADATA[${mseKey}]}"
    if [ "${mseType}" == "M" ] || [ "${mseType}" == "S" ]; then
      mseTmpData="${MSE_GLOBAL_MODULES_METADATA[$mseKey]}::${mseReturnCount[${mseKey}]}"
      if [ "${mseReturnCount[${mseKey}]}" == "0" ]; then
        mseTmpShow=0
      fi
    fi
    if [ "${mseTmpShow}" == 1 ]; then
      mseReturn+=("${mseKey}::${mseTmpData}")
    fi
  done
  printf "%s\n" "${mseReturn[@]}"
}
# END :: mse_mmod_showRawMetaData.sh


# INI :: mse_misc_setHeader.sh
mse_misc_setHeader() {
  local mseNColor="\e[0m"
  local mseTColor="\e[1;49;34m"
  local mseTColor2="\e[1;2;49;34m"
  local mseLColor="\e[1;49;90m"
  local mseResult=""
  mseResult+="${mseLColor}   #   ${mseNColor}\n"
  mseResult+="${mseLColor} # #   ${mseNColor} ${mseTColor}$1${mseNColor}\n"
  mseResult+="${mseLColor} #   # ${mseNColor} ${mseTColor2}$2${mseNColor}\n"
  mseResult+="--------------------------------------------------------------------------------"
  echo -e "${mseResult}"
}
# END :: mse_misc_setHeader.sh


# INI :: mse_misc_sysData.sh
mse_misc_sysData() {
  local mseDISTRO=`cat /etc/os-release | grep -oP -m1 '(?<=NAME=")[^"]*'`
  local mseKERNEL=`uname -r`
  local mseARCH=`uname -m`
  local mseCPU=`awk -F '[ :][ :]+' '/^model name/ { print $2; exit; }' /proc/cpuinfo`
  local mseMEMORY1=`free -t -m | grep "Mem" | awk '{print $6" MB";}'`
  local mseMEMORY2=`free -t -m | grep "Mem" | awk '{print $2" MB";}'`
  local mseMEMPERCENT=`free | awk '/Mem/{printf("%.2f% (Used) "), $3/$2*100}'`
  local mseDETECTDISK=`mount -v | fgrep 'on / ' | sed -n 's_^\(/dev/[^ ]*\) .*$_\1_p'`
  local mseDISC=`df -h | grep $mseDETECTDISK | awk '{print $5 }'`
  local mseUP=`uptime -p`
  local mseHOSTNAME=`uname -n`
  local mseNOW=$(date +"%Y-%m-%d %T")
  local mseNColor="\e[0m"
  local mseTColor="\e[1;49;34m"
  local mseLColor="\e[1;49;90m"
  local mseResult=""
  mseResult+="  ${mseTColor}${mseDISTRO}${mseNColor} :: ${mseKERNEL} :: ${mseARCH} \n"
  mseResult+="${mseLColor}                           ${mseNColor}\n"
  mseResult+="${mseLColor}           #####           ${mseNColor}\n"
  mseResult+="${mseLColor}          #######          ${mseNColor}     CPU: ${mseTColor}${mseCPU}${mseNColor} \n"
  mseResult+="${mseLColor}           #####           ${mseNColor}  Memory: ${mseTColor}${mseMEMORY1} / ${mseMEMORY2} - ${mseMEMPERCENT}${mseNColor} \n"
  mseResult+="${mseLColor}                           ${mseNColor}Use Disk: ${mseTColor}${mseDISC} (used)${mseNColor} \n"
  mseResult+="${mseLColor}   #####   #####           ${mseNColor}  Uptime: ${mseTColor}${mseUP}${mseNColor} \n"
  mseResult+="${mseLColor}  ####### #######          ${mseNColor}\n"
  mseResult+="${mseLColor}   #####   #####           ${mseNColor}\n"
  mseResult+="${mseLColor}                           ${mseNColor}\n"
  mseResult+="${mseLColor}   #####           #####   ${mseNColor}    User: ${mseTColor}${USER}${mseNColor} \n"
  mseResult+="${mseLColor}  #######         #######  ${mseNColor}    Host: ${mseTColor}${mseHOSTNAME}${mseNColor} \n"
  mseResult+="${mseLColor}   #####           #####   ${mseNColor}    Date: ${mseTColor}${mseNOW}${mseNColor} \n"
  clear
  echo -e "${mseResult}"
}
# END :: mse_misc_sysData.sh


# INI :: mse_mmod_registerModule.sh
mse_mmod_registerModule() {
  local mseModFiles
  local mseModuleName
  local mseModuleMetaDataKey
  local mseModuleTotalFunctionCount
  local mseSubModuleName
  local mseSubModuleMetaDataKey
  local mseSubModuleTotalFunctionCount
  MSE_TMP_PATH_TO_LOCALE="${2}/locale/${MSE_GLOBAL_MODULE_LOCALE}.sh"
  if [ ! -f "${MSE_TMP_PATH_TO_LOCALE}" ]; then
    MSE_TMP_PATH_TO_LOCALE="${2}/locale/en-us.sh"
  fi
  . "${MSE_TMP_PATH_TO_LOCALE}"
  if [ -f "${2}/config/env.sh" ]; then
    . "${2}/config/env.sh"
  fi
  if [ -f "${2}/config/variables.sh" ]; then
    . "${2}/config/variables.sh"
  fi
  if [ -f "${2}/config/aliases.sh" ]; then
    . "${2}/config/aliases.sh"
  fi
  mseModFiles=$(find "$2/scripts" -name "*.sh" | sort -n)
  if [ "$mseModFiles" != "" ]; then
    local i
    local c
    local mseTmpTotalSubModules
    local rawLine
    local mseFullFileName
    local mseFunctionName
    mseModuleName="$1"
    mseModuleMetaDataKey="M::${mseModuleName}"
    mseModuleTotalFunctionCount=0
    MSE_GLOBAL_MODULES_PATH[${mseModuleName}]="$2"
    MSE_GLOBAL_MODULES_METADATA["${mseModuleMetaDataKey}"]=0
    MSE_GLOBAL_MODULES_METADATA_INDEXED+=("${mseModuleMetaDataKey}")
    mse_mmod_splitAndOrderSubModules
    mseTmpTotalSubModules="${#MSE_TMP_LIST_SUBMODULES[@]}"
    for  ((i=0; i<mseTmpTotalSubModules; i++)); do
      mseSubModuleName="${MSE_TMP_LIST_SUBMODULES[$i]}"
      mseSubModuleMetaDataKey="S::${mseModuleName}::${mseSubModuleName}"
      MSE_GLOBAL_MODULES_METADATA["${mseSubModuleMetaDataKey}"]=0
    done
    while read rawLine; do
      mseFullFileName=$(basename -- "$rawLine")
      mseFunctionName="${mseFullFileName%.*}"
      unset "${mseFunctionName}"
      . "$rawLine" || true
      if [[ ! ${rawLine} =~ "/assets/" ]]; then
        mseSubModuleName="-"
        ((mseModuleTotalFunctionCount=mseModuleTotalFunctionCount+1))
        for  ((i=0; i<mseTmpTotalSubModules; i++)); do
          if [[ "${mseFunctionName}" =~ "${MSE_TMP_LIST_SUBMODULES[$i]}_" ]]; then
            mseSubModuleName="${MSE_TMP_LIST_SUBMODULES[$i]}"
            mseSubModuleMetaDataKey="S::${mseModuleName}::${mseSubModuleName}"
            c="${MSE_GLOBAL_MODULES_METADATA[${mseSubModuleMetaDataKey}]}"
            ((c=c+1))
            MSE_GLOBAL_MODULES_METADATA["${mseSubModuleMetaDataKey}"]="${c}"
            break
          fi
        done
        MSE_GLOBAL_MODULES_METADATA["F::${mseModuleName}::${mseSubModuleName}::${mseFunctionName}"]="${rawLine}"
      fi
    done <<< ${mseModFiles}
    MSE_GLOBAL_MODULES_METADATA["${mseModuleMetaDataKey}"]="${mseModuleTotalFunctionCount}"
  fi
}
mse_mmod_splitAndOrderSubModules() {
  unset MSE_TMP_LIST_SUBMODULES
  declare -ga MSE_TMP_LIST_SUBMODULES
  if [ "${MSE_TMP_SUBMODULES}" != "" ]; then
    local mseDelimiter
    local mseString
    local mseSubStr
    declare -a mseTmpSubModules
    mseDelimiter="::"
    mseString="${MSE_TMP_SUBMODULES}"
    mseSubStr=""
    while [ "${mseString}" != "" ]; do
      if [[ "$mseString" != *"$mseDelimiter"* ]]; then
        mseTmpSubModules+=("$mseString")
        break
      else
        mseSubStr="${mseString%%${mseDelimiter}*}"
        mseTmpSubModules+=("$mseSubStr")
        mseString="${mseString#*${mseDelimiter}}"
      fi
    done
    local mseIndexes
    mseIndexes=( $(
      for i in "${!mseTmpSubModules[@]}" ; do
        printf '%s %s %s\n' $i "${#mseTmpSubModules[i]}" "${mseTmpSubModules[i]}"
      done | sort -nrk2,2 -rk3 | cut -f1 -d' '
    ))
    for i in "${mseIndexes[@]}" ; do
      MSE_TMP_LIST_SUBMODULES+=("${mseTmpSubModules[i]}")
    done
    MSE_TMP_SUBMODULES=""
  fi
}
mse_mmod_reorderMetadataIndexes() {
  unset MSE_GLOBAL_MODULES_METADATA_INDEXED
  declare -ga MSE_GLOBAL_MODULES_METADATA_INDEXED
  IFS=$'\n'
  declare -a mseSortedMetaData=($(sort <<< "${!MSE_GLOBAL_MODULES_METADATA[*]}"))
  unset IFS
  mse_mmod_processTargetObjectIndex "M" "M::"
}
mse_mmod_processTargetObjectIndex() {
  local mseKey
  local mseOType="$1"
  local mseSearchKey="$2"
  local mseModuleName
  local mseSubModuleName
  for mseKey in "${mseSortedMetaData[@]}"; do
    if [[ "${mseKey}" =~ "${mseSearchKey}" ]]; then
      case "${mseOType}" in
        M)
          MSE_GLOBAL_MODULES_METADATA_INDEXED+=("${mseKey}")
          mseModuleName="${mseKey#M::}"
          mse_mmod_processTargetObjectIndex "F" "F::${mseModuleName}::-::"
          mse_mmod_processTargetObjectIndex "S" "S::${mseModuleName}"
        ;;
        S)
          MSE_GLOBAL_MODULES_METADATA_INDEXED+=("${mseKey}")
          mseSubModuleName="${mseKey#S::}"
          mse_mmod_processTargetObjectIndex "F" "F::${mseSubModuleName}::"
        ;;
        F)
          MSE_GLOBAL_MODULES_METADATA_INDEXED+=("${mseKey}")
        ;;
      esac
    fi
  done
}
# END :: mse_mmod_registerModule.sh


