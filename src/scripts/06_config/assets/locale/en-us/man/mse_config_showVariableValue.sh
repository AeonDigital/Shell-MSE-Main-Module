#
# @desc
# Prints the value of the searched variable on the screen.
#
# If the configuration file is badly formatted and a variable exists
# duplicated, only the first one will be taken into account.
#
# @param string $1
# Path to the file to be scanned.
#
# @param string $2
# Target section name.
# Use "" to search the entire file for the variable.
#
# @param string $3
# Target variable name.
#
# @return
# Prints the value of the indicated variable.
# Attention to cases where the variable value is empty ( "" ) because the fact
# of not getting an output can be interpreted in the same way as if it
# did not exist in the indicated configuration file or section.
