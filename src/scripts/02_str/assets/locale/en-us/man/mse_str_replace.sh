#
# @desc
# Replaces every occurrence of the string $1 with
# the string $2 found in the string defined in $3.
#
# @param string $1
# Old string (which will be replaced).
#
# @param string $2
# New string (which will be added in place of the old one).
#
# @param string $3
# Original string. Where will the replacement take place.
#
# @return
# Prints the result of the replacement performed.
#
# @example
#   result=$(mse_str_replace "22" "20" "2022-12-22")
#   printf $result # "2020-12-20"
