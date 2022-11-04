#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







#
# Declaração de legendas comuns para servir de base à qualquer módulo
declare -ga MSE_GLOBAL_LABEL_MONTH=("" "January" "February" "March" "April" "May" "June" "July" "August" "September" "October" "November" "December")
declare -ga MSE_GLOBAL_LABEL_WEEKDAY=("" "Monday" "Tuesday" "Wednesday" "Thursday" "Friday" "Saturday" "Sunday")
declare -ga MSE_GLOBAL_LABEL_DAYPERIOD=("" "Dawn" "Morning" "Afternoon" "Night")


lbl_err_lostParameters="Lost [[LOST]] parameters."
lbl_err_variableAlreadExists="Variable \"[[VAR]]\" already exists"
lbl_err_variableDoNotExists="Variable \"[[VAR]]\" do not exists"
lbl_err_variableDoNotExistsInSection="Variable \"[[VAR]]\" do not exists in \"[[SECTION]]\" section"

lbl_err_paramA_HasInvalidValue="Parameter \"[[PARAM_A]]\" has an invalid value"
lbl_err_paramA_HasInvalidOption="Parameter \"[[PARAM_A]]\" has an invalid option"
lbl_err_paramA_IsOutOfRange="Parameter \"[[PARAM_A]]\" is out of range"
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

lbl_err_checkForValidOptionsUsingFunction="Check for valid options using the \"[[FUNCTION]]\" function"
lbl_err_chooseOneOfThisOptions="Choose for one of this options: "

lbl_err_cannotIdentifyTargetLine="Cannot identify the target line to perform this operation."