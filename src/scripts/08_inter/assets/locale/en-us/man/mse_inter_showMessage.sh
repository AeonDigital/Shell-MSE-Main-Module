#
# @desc
# Show a message to the user in the terminal.
#
#
# @param string $1
# Name of the associative array that brings the settings for the presentation
# of the message.
# If "" or invalid, start associative array
# "MSE_GLOBAL_SHOW_MESSAGE_CONFIG" using the default theme and this will be
# used for the message formatting.
#
#
# @param string $2
# Message type.
#
# [[ Alert Messages ]]
#
#   - ""        | ""  : Not defined (default value).
#   - none      | n   : Not defined (same as above).
#   - info      | i   : Generic information.
#   - attention | a   : Attention.
#   - warning   | w   : Alert.
#   - error     | e   : Error in an operation.
#   - fail      | f   : An operation failed.
#   - success   | s   : Success in an operation.
#
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
# @param string $3
# Message format.
# Must conform to one of the formats provided by the theme being
# currently used. In case of an invalid value, the default format will be used
# indicated by the theme itself.
#
#
# @param string $4
# Title of the message.
#
#
# @param string $5
# Name of a one-dimensional array containing the message lines.
#
#
# @param string $6
# Optional.
# Name of an associative array containing unforeseen configurations
# initially. Used to expand themes.
#
#
# @return
# Print on the screen the message indicated according to the configuration
# passed.