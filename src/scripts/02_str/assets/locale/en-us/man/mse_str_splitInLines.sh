#
# @desc
# Makes a split in the string passed in an array where each line will have at
# most the number of characters informed.
# The identified words will be kept without being separated between the lines.
#
# @param string $1
# Original string.
#
# @param int $2
# Maximum number of characters per line.
# If not defined, or if invalid, will use the current value of the variable
# "$COLUMNS".
#
# @return
# Fill the global array 'MSE_GLOBAL_MODULE_SPLIT_RESULT' with the result of
# the 'split' done..
