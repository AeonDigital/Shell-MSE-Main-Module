#
# @desc
# Show a status message to the user using the theme that is
# currently set in the "MSE_GLOBAL_THEME_NAME" variable.
#
# A status message has the characteristic of leaving the cursor
# positioned at the end of the line allowing carriage return and replacement
# the same as a script runs and thus updates the information.
#
#
# @param string $1
# Message type.
#
# [[ Alert Messages ]]
#
#   - ""        | "" : Not defined (default value).
#   - none      | n : Not defined (same as above).
#   - info      | i : Generic information.
#   - attention | a : Attention.
#   - warning   | w : Alert.
#   - error     | e : Error in an operation.
#   - fail      | f : An operation failed.
#   - success   | s : Success in an operation.
#
#
# @param string $2
# Optional (for default theme)
# Title of the message.
#
#
# @return
# Print on the screen the message indicated according to the configuration passed.