#
# @desc
# Converts a 'char' to its respective 'octal'.
#
# @param char $1
# Value to be converted.
#
# @return
# 'octal' representation of the 'char' informed.
# Multibyte characters will return more than one value, each one representing
# one of its bytes.
#
# @example
#   mse_str_convert_charToOctal "í"    # convert to -> "303 255"
#   result=$(mse_str_convert_charToOctal "í" 1)
