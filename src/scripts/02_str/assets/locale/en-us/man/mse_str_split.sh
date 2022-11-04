#
# @desc
# Performs a split on the passed string using the indicated separator.
#
# @param string $1
# Separator.
#
# @param string $2
# Original string (which will be 'splitted')
#
# @param bool $3
# Enter "1" to eliminate empty strings.
# By omitting or informing "0" the empty strings will be kept.
#
# @param bool $4
# Enter "1" so that each element found is passed through a "trim".
# Omitting or entering "0" will not do anything.
#
# @return
# Fill the global array 'MSE_GLOBAL_MODULE_SPLIT_RESULT' with the result
# of the 'split' done.
