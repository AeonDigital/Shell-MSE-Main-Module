#
# @desc
# Deletes any whitespace immediately BEFORE and AFTER the
# given delimiter.
#
# @param string $1
# Delimiter.
#
# @param string $2
# String to be changed.
#
# @param string $3
# If defined, it must be informed only:
#   r : to do a 'trim' just to the right of the separator
#   l : to do a 'trim' just to the left of the separator
#   Any other value will be ignored
#
# @return
# Print the treated string.
#
# @example
#   result=$(mse_str_trimD ":" "  Keep  calm   :   and   ... :   think  ")
#   printf $result # "  Keep  calm:and   ...:think"
