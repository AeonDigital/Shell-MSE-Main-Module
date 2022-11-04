#
# @desc
# Converts a 'decimal' to its respective 'hex'.
#
# @param charDecimal $1
# Value to be converted.
#
# @return
# 'hex' representation of the given 'decimal'.
#
# @example
#   mse_str_convert_decimalToHex "161"       # convert to -> A1
#   mse_str_convert_decimalToHex "195 173"   # convert to -> "C3 AD"
#   result=$(mse_str_convert_decimalToHex "161" 1)
