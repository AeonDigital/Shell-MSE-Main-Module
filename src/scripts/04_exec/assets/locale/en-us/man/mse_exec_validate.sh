#
# @desc
# Executes the validation of the parameters of a function.
#
# @param string $1
# Name of the function whose parameters will be tested.
#
# @param mixed $2 3 4 ...
# Parameters that will be tested for the indicated function.
#
# @return
# '1' if 'true'
# '0' if 'false'
#
# Also returns '1' if the function has no validation rules defined
# in a function of the same name and with the suffix '_vldtr'.
