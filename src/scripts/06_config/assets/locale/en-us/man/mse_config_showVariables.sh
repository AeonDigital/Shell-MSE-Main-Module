#
# @desc
# Prints the variables from the indicated configuration file.
# Commented and empty lines will not be shown.
#
# @param string $1
# Path to the file to be scanned.
#
# @param string $2
# Target section name.
# Use "" to show variables from the entire file.
#
# @param bool $3
# Omit, enter "" or "0" to return only target rows.
# Enter "1" to bring the number of each of the returned rows.
#
# @return
# Prints all the variables in the file according to the configuration
# indicated.