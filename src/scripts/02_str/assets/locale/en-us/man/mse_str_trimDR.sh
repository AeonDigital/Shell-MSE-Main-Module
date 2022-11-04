#
# @desc
# Deletes any whitespace immediately AFTER the given delimiter.
#
# @param string $1
# Delimiter.
#
# @param string $2
# String to be changed.
#
# @return
# Print the treated string.
#
# @example
#   result=$(mse_str_trimDR "," "Keep calm   ,   and...")
#   printf $result # "Keep calm   ,and..."
