#
# @desc
# Display a list containing metadata information regarding modules,
# submodules and functions of target objects.
#
# The output will contain, on each line, the data of a single object following the
# following models:
#
#   - Module Lines
#   [M::ModuleName::TotalFunctionCount]
#   - Rows of Submodules
#   [S::ModuleName::SubModuleName::TotalFunctionCount]
#   Value: Total functions
#   - Lines of Functions
#   [F::ModuleName::SubModuleName::FunctionName::PathToFunctionFile]
#
#
# @param bool $1
# Optional.
# Indicates whether, in the returned list, the name of the modules should be returned.
#   - Omit or enter "1" to show.
#   - Enter "0" to ignore.
#
# @param bool $2
# Indicates whether, in the returned list, the name of the submodules should be returned.
#   - Omit or enter "1" to show.
#   - Enter "0" to ignore.
#
# If yes, and if it is to show the name of the functions, they will be listed
# grouped under each submodule.
#
# @param bool $3
# Indicates whether, in the returned list, should return the name of the functions.
#   - Omit or enter "1" to show.
#   - Enter "0" to ignore.
#
#
# @param string $4
# Optional. Module filtering.
# Specify part or all of the name of a currently loaded module for
# only the information referring to it.
#
# The search will be "case insensitive"
#
#
# @param string $5
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
# filtering of modules and functions, it is necessary to indicate the full
# name and correct submodule so that the search is done correctly.
#
# The search will be "case insensitive"
#
#
# @param string $6
# Optional. Function filtering.
# Specify part or all of a function name for it to be searched
# between modules and submodules.
#
# The search will be "case insensitive"
#
#
# @param bool $7
# Optional. Search type for roles.
# Indicates whether to perform a search for the exact name of the given
# function.
#   - Omit or enter "0" to do a rough search.
#   - Indicate "1" for an objective search.
#
#
# @return
# A list containing all required information formatted as
# indicated. The list will always be sorted alphabetically.