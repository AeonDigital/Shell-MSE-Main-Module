#
# @desc
# Validates the arguments of a function according to the rules specified
# in the indicated rules.
#
# @param string $1
# Name of the associative array containing the rules that will be used to
# test the arguments passed.
#
# @param string $2
# Name of the one-dimensional array containing each of the parameters that
# will be tested.
#
# @param bool $3
# Optional.
# Omit, enter "" or "0" for validation to occur naturally.
# Enter "1" to let the algorithm know it is validating its own inputs.
#
# @return
# '1' if all parameters are correct or error message encountered
# (referring to the first validation error).
