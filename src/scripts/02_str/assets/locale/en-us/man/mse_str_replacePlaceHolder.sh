#
# @desc
# Replaces one or more 'placeholder' in a string with the given values.
# The 'placeholders' need to be defined using the following pattern:
# [[PHNAME]]
#
# @param string $1
# String that contains the 'placeholders' and that will be returned with the
# appropriate replacements.
#
# @param string ${2}
# Name of a placeholder to replace (enter the name without the square brackets).
#
# @param string ${3}
# Value to use in place of the placeholder.
#
#
# @obs
# After the third argument, new pairs of arguments can be passed to be used
# instead of a new placeholder within the same original string.
#
# @return
# Prints the original string replacing the placeholders with the new contents
# indicated.
