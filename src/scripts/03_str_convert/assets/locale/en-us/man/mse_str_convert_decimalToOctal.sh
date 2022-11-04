#
# @desc
# Converts a 'decimal' to its respective 'octal'.
#
# @param charDecimal $1
# Value to be converted.
#
# @return
# 'octal' representation of the 'decimal' reported.
#
# @example
#   mse_str_convert_decimalToOctal "161"       # convert to -> 241
#   mse_str_convert_decimalToOctal "195 173"   # convert to -> "303 255"
#   result=$(mse_str_convert_decimalToOctal "161" 1)
