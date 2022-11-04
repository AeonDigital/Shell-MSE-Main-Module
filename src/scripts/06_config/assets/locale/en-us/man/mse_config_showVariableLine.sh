#
# @desc
# Prints on the screen the entire information line about the variable
# with the given name.
#
# If the configuration file is badly formatted and exists within it
# section a duplicate variable, only the first one will be taken into account.
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
# @param bool $4
# Omit, enter "" or "0" to return only target rows.
# Enter "1" to bring the number of each of the returned rows.
#
# @return
# Print the line of the indicated variable