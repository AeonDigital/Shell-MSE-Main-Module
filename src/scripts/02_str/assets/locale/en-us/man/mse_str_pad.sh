#
# @desc
# Fills a string with the given character.
#
# @param string $1
# String that will be filled.
#
# @param char $2
# String that will be used to fill in.
#
# @param int $3
# Total characters that the final string must have.
#
# @param string $4
# Enter "l" to fill on the left.
# Enter "r" to fill on the right.
#
# @return
# Adds to the original string a total of $2 characters on the
# left or right (as per $4) until it has the total characters
# indicated in $3.
# An empty string will be returned in case of any failure.
#
# @example
#   mse_str_pad "32" "0" "5" "l"
#   "00032"
