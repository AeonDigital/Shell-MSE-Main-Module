#
# @desc
# Replaces one or more 'placeholder' in a string with the specified
# values by adding the specified color to it.
# The 'placeholders' need to be defined using the following pattern:
# [[PHNAME]]
#
# @param string $1
# String that contains the 'placeholders' and that will be returned with
# the appropriate replacements.
#
# @param string ${2}
# Name of a placeholder to replace (enter the name without the square
# brackets).
#
# @param string ${3}
# Value to use in place of the placeholder.
#
# @param string ${4}
# Color code to be used.
#
#
# @obs
# After the fourth argument, new trios of arguments can be passed to be
# used instead of a new placeholder within the same original string.
#
# @return
# Prints the original string replacing the placeholders with the new
# contents indicated.
