#
# @desc
# Identifies whether the indicated value exists in the target array.
#
# @param string $1
# Value being searched.
#
# @param string $2
# Name of the array on which to search.
#
# @param bool $3
# Indicates whether the check should be done in "case insensitive"
#   - Omit or enter "0" for "case sensitive" (default)
#   - Enter "1" for "case insensitive"
#
# @param bool $4
# Expected return type.
#   - Omit or indicate "0" to return only "1" or "0" indicating the
#     presence or not of the element in the target array.
#   - Enter "1" to return the index of the identified element.
#     If nothing is found, it will return an empty string "".
#
# @return
# It varies according to the parameter $4
# If the parameter $4 is omitted or "0", it will return:
#   - '1' if 'true'   : element found in array
#   - '0' if 'false'  : element not found in array
#
# If parameter $4 is "1"
#   - Returns the element index if it is found.
#   - Returns "" if the element does not exist.
#
# If more than one value in the target array is compatible with the
# verification, the information regarding the first one found will be
# taken into account.
