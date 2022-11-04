#
# @desc
# Converts an 'octal' to its respective 'hex'.
#
# @param charOctal $1
# Value to be converted.
#
# @return
# 'hex' representation of the given 'octal'.
#
# @example
#   mse_str_convert_octalToHex "241"       # convert to -> A1
#   mse_str_convert_octalToHex "303 255"   # convert to -> "C3 AD"
#   result=$(mse_str_convert_octalToHex "241" 1)
