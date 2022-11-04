#
# @desc
# Identifies the number of the first and last line of a file or a
# data section identified by an objectively defined start and end.
#
# In case you are fetching the data of a section, both the line number
# that identifies the beginning of the section and the line number that identifies
# your order will be returned.
#
# @param string $1
# Path to target file.
#
# @param char $2
# Character used to comment out lines within the target file.
#
# @param bool $3
# Identifies whether it is a configuration file or something else.
# This changes the way the section is searched.
#   - Omit or use "0" for files of any type.
#   - Indicate "1" if this is a standard configuration file.
#
# @param string $4
# Identifier of the beginning of the section.
# For files in general, the section will be identified by a line whose value
# be the same as indicated. For configuration files, enter only the
# name of the searched section.
# Use "" if you want to ignore this setting.
#
# @param string $5
# End of section identifier.
# For files in general, the end of the section will be identified by a line whose
# value is the same as indicated. For configuration files, this value
# must be left blank as the section ends when starting a new one or when
# end of the file itself.
#
# @param bool $6
# Omit, Use "" or "0" to include empty lines at the end of the section
# that is being searched.
# Use "1" to remove blank lines from the end of the target section.
#
# @return
# Prints the start and end line number separated by a space.
# There is no return if the target section or file is not found.