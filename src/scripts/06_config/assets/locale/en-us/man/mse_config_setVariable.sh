#
# @desc
# Allows you to edit variables stored in standard configuration files or
# in scripts prepared for that.
#
# Default configuration files use values ​​defined in pairs of type
# key/value and that can have their settings logically separated by
# sections.
#
# Ex:
# [SectionName]
# VARNAME = VALUE
#
# If the configuration file is badly formatted and exists within it
# section a duplicate variable, only the first one will be taken into account.
#
#
# Other files, like scripts, need to be prepared to be edited
# using this function. Such preparation is the marking of editable zones. In
# case, each variable that you want to be able to change in this way must be
# identified as per the model below:
#
# Ex:
# # [[INI-MSE_AVAILABLE_MODULES]]
# declare -gA MSE_AVAILABLE_MODULES
# # [[END-MSE_AVAILABLE_MODULES]]
#
# It is important to note that the "INI" and "END" tags MUST be commented out
# and in the beginning of the line and the name of each section must be
# identical to the variable it is enabling editing.
#
# @param string $1
# Path to target file.
#
# @param char $2
# Character used to comment out lines within the target file.
#
# @param bool $3
# Identifies whether it is a configuration file or a script.
# This changes the way the editable section is searched.
#   - Omit or use "0" for script files.
#   - Indicate "1" if this is a standard configuration file.
#
# @param string $4
# Identifier of the start of the target section.
# Use only for editing standard configuration files.
#
# @param string $5
# Type of variable being used
#   - Use "s" or "scalar" for simple variables.
#   - Use "i" or "index" for one-dimensional arrays.
#   - Use "a" or "assoc" for associative arrays.
#
# @param string $6
# Name of the target variable in the file.
#
# @param string $7
# Variable value.
# For "index" or "assoc" variables, enter the name of an array of the same type
# that contains the values ​​that will be used.
#
# @param string $8
# Type of operation to be performed:
#   - add | a : to add a new variable.
#   - delete | d : to remove an existing variable.
#   - change | ch : to change the value of a variable.
#   - comment | c : to comment out a variable.
#   - uncomment | u : to uncomment a variable.
#
# Use only for editing standard configuration files.
#
# @param string $9
# Optional. Indicates the position where the variable should be added.
# Used only in case of 'add' operation.
# - prepend | p : Adds the variable at the beginning of the file/section.
# - append | a : Adds the variable to the end of the file/section.
#                     This is the default operation in case of 'add' operation
#
# Use only for editing standard configuration files.
#
# @return
# Print '1' if you can make the required change.
# Or
# Print the error message.