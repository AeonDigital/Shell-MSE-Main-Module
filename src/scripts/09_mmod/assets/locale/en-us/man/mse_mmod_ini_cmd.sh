#
# @desc
# Used in conjunction with an "alias" that makes it easy to get to this command,
# allows you to invoke previously defined functions in a less verbose way.
#
# @param string $1
# Name of target function.
#
# @param bool ${2..}
# Other identifiers or parameters that will be passed to the target function.
#
# @example
# Assuming there is an "alias" for this function called "mse":
#
#   > mse search replace
#
#   The above example will be the same as evoking:
#   > mse_mmod_searchFunction replace
#