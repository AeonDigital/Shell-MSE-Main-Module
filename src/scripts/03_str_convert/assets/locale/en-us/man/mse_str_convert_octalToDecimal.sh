#
# @desc
# Converts an 'octal' to its respective 'decimal'.
#
# @param charOctal $1
# Value to be converted.
#
# @return
# 'Decimal' representation of the reported 'octal'.
#
# @example
#   mse_str_convert_octalToDecimal "241"       # convert to -> 161
#   mse_str_convert_octalToDecimal "303 255"   # convert to -> "195 173"
#   result=$(mse_str_convert_octalToDecimal "241" 1)
