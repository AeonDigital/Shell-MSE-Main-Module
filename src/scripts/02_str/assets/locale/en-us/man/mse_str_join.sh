#
# @desc
# 'Join' the items of an array using a special specified string.
#
# @param string $1
# String that will be used as 'glue' for the join.
#
# @param string $2
# Array name.
#
# @return
# Prints the values of the array separated by the string defined in $1.
#
# @example
#   myArray=("2022" "12" "22")
#   mse_str_join '-' "myArray"
#   2022-12-22
