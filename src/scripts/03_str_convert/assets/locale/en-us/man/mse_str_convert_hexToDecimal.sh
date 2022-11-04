#
# @desc
# Converts a 'hex' to its respective 'decimal'.
#
# @param charHex $1
# Value to be converted.
#
# @return
# 'Decimal' representation of the 'hex' informed.
#
# @example
#   mse_str_convert_hexToDecimal "A1"      # convert to -> 161
#   mse_str_convert_hexToDecimal "C3 AD"   # convert to -> "195 173"
#   result=$(mse_str_convert_hexToDecimal "161" 1)
