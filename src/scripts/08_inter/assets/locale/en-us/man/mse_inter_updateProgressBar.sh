#
# @desc
# Update the progress bar on the prompt line (started by the command
# "mse_inter_showProgressBar".
#
#
# @param string $1
# Name of the associative array that brings the settings for the presentation
# of the progress bar.
# If "" or invalid, start associative array
# "MSE_GLOBAL_SHOW_PROGRESSBAR_CONFIG" using the default theme and this will
# be used for slash formatting.
#
# @param int $2
# Current progress progress percentage.
# Use only values ​​between 0 and 100.
# Invalid values ​​will revert to "0".
#
# @param string $3
# Optional.
# Information that should be used to fill in the information area.
#
# @return
# Print the progress bar on the screen according to the configuration passed.