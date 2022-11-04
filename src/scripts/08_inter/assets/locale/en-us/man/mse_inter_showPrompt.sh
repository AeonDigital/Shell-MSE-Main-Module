#
# @desc
# Shows a message to the user and allows them to provide a response.
#
# The result selected/typed by the user will be defined in the variable
# global 'MSE_GLOBAL_PROMPT_RESULT'.
#
#
# @param string $1
# Name of the associative array that brings the settings for the presentation of the
# message.
# If "" or invalid, start associative array
# "MSE_GLOBAL_SHOW_PROMPT_CONFIG" using the default theme and this will be used for
# the message formatting.
#
#
# @param string $2
# Message type.
#
# [[ Prompt Messages ]]
#
#   - friendly  | fr  : Friendly. An unimportant question.
#   - ordinary  | or  : Common. Standard question.
#   - caution   | ca  : Careful. Issue that requires user attention or that
#                       has the potential for some permanent change.
#   - important | im  : Important. Issue with the potential to cause change
#                       permanent in script processing or on the PC itself
#
#
# @param string $3
# Title of the message.
#
#
# @param string $4
# Enter the type of value that is expected in response to the prompt.
# If no value is provided, or if an invalid value is entered,
# will use type 'value'.
#
# Valid types are:
#   - bool  : expect a boolean response [ yes|no ]
#   - list  : expect a response based on a predefined list.
#   - value : accepts any answer as valid.
#
#
# @param string $5
# Name of an associative array. Used for the 'list' return type.
#   - key   : Values ​​that will be effectively defined by the user's action.
#   - value : Collection of strings that can be used to represent this
#             value. Use "::" to separate each value.
#
# The selected value will be stored in the global variable
# 'MSE_GLOBAL_PROMPT_RESULT'.
#
# If the value of this parameter is invalid, the prompt will be converted to
# the type 'value'.
#
#
# @param bool $6
# By default the comparison is case sensitive.
# Indicates "1" if the comparison should be made in case insensitive
# Use "0" for case sensitive comparison (default differentiates "a" from "A").
# Use "1" for case insensitive comparison.
#
#
# @return
# Print on the screen the message indicated according to the configuration
# passed.