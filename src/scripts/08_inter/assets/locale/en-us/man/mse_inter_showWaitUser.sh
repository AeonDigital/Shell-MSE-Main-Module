#
# @desc
# Display a message to the user and stop script execution until
# let him type any key.
#
# @param string $1
# Message type.
#
# [[ Alert Messages ]]
#
# - ""          | "" : Not defined (default value).
# - none        | n : Not defined (same as above).
# - info        | i : Generic information.
# - attention   | a : Attention.
# - warning     | w : Alert.
# - error       | e : Error in an operation.
# - fail        | f : An operation failed.
# - success     | s : Success in an operation.
#
#
# @param string $2
# Optional (for default theme)
# Title of the message.
#
# @return
# Print the desired information on the screen according to the configuration
# passed.