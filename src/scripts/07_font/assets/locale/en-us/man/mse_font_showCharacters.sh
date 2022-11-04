#
# @desc
# Print the 256 characters present in your terminal's current font.
#
# @param string $1
# Return format.
# Choose one of the options:
#   - table     : table with all header markers and others
#                 visual separators (default).
#   - char      : list of each character, 1 to 1, separated by a single
#                 space and where each line will have a total of 16 items.
#                 None adornment will be added.
#   - code      : table where each line will contain the codes used
#                 for different encodings of the same character. This one
#                 case will easily occupy many lines and to facilitate the
#                 reading it is possible to use the next parameters.
#
# @param int $2
# Used only if $1='code'
# Integer (from 33) that indicates which item the list generated in the
# 'code' option should start.
#
# @param int $3
# Used only if $1='code'
# Integer (up to 255) that indicates the last item to be displayed when
# the 'code' option is being used.
#
# @example
# mse_font_showCharacters 'code' 50 70
# mse_font_showCharacters 'code' | less -r
#