#
# @desc
# Read a file or string line by line.
# Returns all lines that match the definitions given in the
# read settings.
#
# @param string $1
# Path to the file or string to be read.
#
# @param string $2
# Name of the associative array that contains the settings for reading the file
# thus allowing you to identify the content you want to return.
#
# To configure this associative array use the "mse_file_prepareRead" function.
#
# @param bool $3
# Whether "" or "0" will show all lines including empty ones.
# If "1" will remove empty lines.
# If set, rewrites "line_hide_empty" setting from settings
# passed.
#
# @param bool $4
# If "" or "0" will bring the raw value of the line, as it appears in the
# original file.
# If "1" will display the number of each line at its beginning.
# If set, rewrites "line_show_number" setting from settings
# passed.
# The line number will be returned as the first information and will be
# separated from the beginning of the text by a "#" character.
#
# @return
# Collection of lines selected when reading the file according to the criteria
# indicated.