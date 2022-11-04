#
# @desc
# Converts a 'hex' to its respective 'octal'.
#
# @param charHex $1
# Value to be converted.
#
# @return
# 'octal' representation of the 'hex' informed.
#
# @example
#   mse_str_convert_hexToOctal "A1"      # convert to -> 241
#   mse_str_convert_hexToOctal "C3 AD"   # convert to -> "303 255"
#   result=$(mse_str_convert_hexToOctal "A1" 1)
