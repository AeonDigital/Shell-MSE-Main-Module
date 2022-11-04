#
# @desc
# Show a progress bar in the terminal.
#
#
# @param string $1
# Name of the associative array that brings the settings for the presentation
# of the progress bar.
# If "" or invalid, start associative array
# "MSE_GLOBAL_SHOW_PROGRESSBAR_CONFIG" using the default theme and this will
# be used for slash formatting.
#
# @param string $2
# Format.
# Each theme can provide multiple slash formats, if any, in this
# parameter must be indicated which one should be used. Otherwise the format
# pattern will be used.
#
# @param string $3
# Total size of the progress bar (in characters).
# The theme used can modify this value according to its own rules.
#
# @param int $4
# Current progress progress percentage.
# Use only values ​​between 0 and 100.
# Invalid values ​​will revert to "0".
#
# @param string $5
# Positioning of the information area in relation to the progress bar.
#   - l | left  : on the left.
#   - r | right : to the right (default).
#
# @param string $6
# Optional.
# Information that should be used to fill in the information area.
#
# @return
# Print the progress bar on the screen according to the configuration passed.