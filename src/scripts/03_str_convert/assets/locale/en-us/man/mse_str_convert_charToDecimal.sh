#
# @desc
# Converts a 'char' to its respective 'decimal'.
#
# @param char $1
# Value to be converted.
#
# @return
# 'Decimal' representation of the 'char' informed.
# Multibyte characters will return more than one value, each one representing
# one of its bytes.
#
# @example
#   mse_str_convert_charToDecimal "í"    # convert to -> "195 173"
#   result=$(mse_str_convert_charToDecimal "í" 1)
