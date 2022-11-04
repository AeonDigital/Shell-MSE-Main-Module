#
# @desc
# Converts a 'char' to its respective 'hex'.
#
# @param char $1
# Value to be converted.
#
# @return
# 'hex' representation of the 'char' informed.
# Multibyte characters will return more than one value, each one representing
# one of its bytes.
#
# @example
#   mse_str_convert_charToHex "í"    # convert to -> "C3 AD"
#   result=$(mse_str_convert_charToHex "í" 1)
