#
# @desc
# Show a table of colors that the terminal is able to use
# for styling fonts and background.
#
# @param int $1
# Color system.
# There are 3 color description systems that can be used as per the
# compatibility of your terminal.
# Choose one of these:
#
#   - 4   : Uses 4 bits for color representation (16 colors).
#           This is the most common system among the various terminals.
#   - 8   : Uses 8 bits for color representation (256 colors).
#   - 32  : Uses 32 bits for color representation (true color).
#
# If omitted, or if given an invalid value, the representation will be used
# 4-bit by default.
# There is no (currently) prepared sampling for a 32-bit collection.
#
# @param string $2
# Indicates the type of sampling.
#   - fg  : Will show the color table focusing on the font color (default).
#   - bg  : Will show the color table focusing on the background colors.
#
# The 'fg' value will be automatically set if the color set
# be 4-bit.
#
# @param int $3
# Optional.
# Indicate the number of items per line to be displayed.
# If omitted, assumes a total of 12 items per line.
#
# @return
# Print a table containing the selected color set on the screen.