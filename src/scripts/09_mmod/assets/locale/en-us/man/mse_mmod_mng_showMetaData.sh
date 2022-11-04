#
# @desc
# Display the metadata of modules, submodules and functions formatted as
# the configuration passed in the parameters.
#
#
# @param bool $1
# Optional.
# Omit or enter "0" so that the output is a simple list.
# Enter "1" for a styled output.
#
# @param bool $2
# Optional.
# Indicates whether to display the functions of each module and sub-module.
#   - Omit or enter "1" to show all.
#   - Enter "0" to hide.
#
# @param string $3
# Optional. Module filtering.
# Specify part or all of the name of a currently loaded module for
# only the information referring to it.
#
# The search will be "case insensitive"
#
#
# @param string $4
# Optional. Submodule filtering.
# Specify the identifier prefix of a submodule to be returned
# only the information referring to it.
#
# Use the value "-" to indicate that you want to return all functions that are
# NOT belong to any module and yes, exclusively to the main module.
#
# Keep in mind that a submodule is defined logically using a string
# used as a prefix in all functions that you want to be part of it
# and that are present in the same main module. Therefore, different from
# filtering of modules and functions, it is necessary to indicate the full name
# and correct submodule so that the search is done correctly.
#
# The search will be "case insensitive"
#
#
# @param string $5
# Optional. Function filtering.
# Specify part or all of a function name for it to be searched
# between modules and submodules.
#
# The search will be "case insensitive"
#
# @return
# A list containing all required information formatted as
# indicated. The list will always be sorted alphabetically.