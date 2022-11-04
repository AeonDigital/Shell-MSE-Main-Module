#
# @desc
# Executes the indicated function only after validating their respective
# parameters and, if they are considered valid.
#
# @param string $1
# Function name.
#
# @param mixed $2 3 4 ...
# Parameters that will be passed to the function.
#
# @return
# It fills the global variables 'MSE_GLOBAL_RETURN' and 'MSE_GLOBAL_LASTERR'
# according to the success or failure of the validation and/or execution of
# the function.
# On the screen, no output will be made.
#
# @exemple
# A form of use to obtain the result of the validation/execution could be
# according to the following model:
#
# > mse_exec_ifValidate "mse_check_hasKeyInAssocArray" "k1" "arr" &&
#     printf "${MSE_GLOBAL_RETURN}" ||
#     printf "${MSE_GLOBAL_LASTERR}"
