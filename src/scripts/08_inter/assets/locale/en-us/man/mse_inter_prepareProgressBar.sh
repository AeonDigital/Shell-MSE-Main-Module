#
# @desc
# Prepare an associative array by filling in the keys needed for the
# execution of a command "mse_inter_showProgressBar".
#
# If no configuration criteria are passed, the values ​​will be used
# defaults defined by the theme.
#
# The progress bar is a single-line component.
# The possible configurations are divided into three blocks:
#
# - Block 01: Meta formatting
# - Block 02: Progress bar
# - Block 03: Information
#
#
# @param string $1
# Name of the associative array to be populated.
#
#
#
#
#
# [[ Block 01: Meta formatting ]]
#
# @param string $2
# ["meta_theme"]
# Name of the theme used to render the progress bar on the screen.
# Theme settings will override any other settings
# defined in this function.
#
# @param string $3
# ["meta_format"]
# Format.
# Each theme can provide multiple slash formats, if any, in this
# parameter must be indicated which one should be used. Otherwise the format
# pattern will be used.
#
# @param string $4
# ["meta_indent"]
# Indentation for the slash.
# Use only blanks or leave empty not to use.
#
#
#
#
#
# [[ Block 02: Progress bar ]]
#
# @param string $5
# ["bar_ini_string"]
# Characters that mark the beginning of the progress bar.
# Leave empty not to use.
#
# @param string $6
# ["bar_end_string"]
# Characters that mark the end of the progress bar.
# Leave empty not to use.
#
#
# @param char $7
# ["bar_fill_char"]
# Character that will be used to fill the progress bar.
# If left empty, will use the default character defined in the theme.
#
# @param int $8
# ["bar_max_char_length"]
# Total size of the progress bar (in characters).
# The theme used can modify this value according to its own rules.
#
# @param int $9
# ["bar_current_progress"]
# Current progress progress percentage.
# Use only values ​​between 0 and 100.
# Invalid values ​​will revert to "0".
#
# ["bar_current_bar_length"]
# INTERNALLY CONTROLLED
# Calculation of the total size (in chars) that the bar component must have
# to represent the current progress percentage.
#
#
# @param string $10
# ["bar_color"]
# Code of the color to use for this element.
#
# @param string $11
# ["bar_color_alt"]
# Alternate color code to be used on this element.
#
# @param bool $12
# ["bar_colorize"]
# Indicates whether to allow colorization of this element.
# Use "0" for no.
# Use "1" for yes.
#
#
#
#
# [[ Block 03: Information ]]
#
# @param bool $13
# ["info_show"]
# Indicates whether to show the informational area of ​​the bar containing
# information extras about it.
# Use "0" to not show (default).
# Use "1" to show.
#
# @param string $14
# ["info_align"]
# Positioning of the information area in relation to the progress bar.
# - l | left : on the left.
# - r | right : to the right (default).
#
#
# @param string $15
# ["info_ini_string"]
# Characters that mark the beginning of the information area.
# Leave empty not to use.
#
# @param string $16
# ["info_end_string"]
# Characters that mark the end of the information area.
# Leave empty not to use.
#
#
# @param bool $17
# ["info_use_percent"]
# Indicates whether to use the current percentage of progress to fill in the
# information from the information area.
# Use "0" for no.
# Use "1" for yes.
#
# @param string $18
# ["info_data"]
# Information that should be used to fill in the information area.
# If the feed percentage is to appear as well, this information will appear
# after the same.
#
#
# @param string $19
# ["info_color"]
# Code of the color to use for this element.
#
# @param string $20
# ["info_color_alt"]
# Alternate color code to be used on this element.
#
# @param bool $21
# ["info_colorize"]
# Indicates whether to allow colorization of this element.
# Use "0" for no.
# Use "1" for yes.
#
