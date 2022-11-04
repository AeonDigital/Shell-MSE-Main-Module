#
# @desc
# Show an alert message to the user using the theme that is
# currently set in the "MSE_GLOBAL_THEME_NAME" variable.
#
# @param string $1
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
# @param string $2
# Optional (for default theme)
# Title of the message.
#
#
# @param string $3
# Optional (for default theme)
# Name of a one-dimensional array containing the message lines.
#
#
# @return
# Print on the screen the message indicated according to the configuration passed.