#
# @desc
# Writes one or more lines of data to the target file at the indicated position.
#
# @param string $1
# Path to the change target file.
#
# @param string $2
# Name of the array containing the new rows of data to be added.
#
# @param string $3
# Optional. Type of operation to be performed.
# - prepend | p : Add newlines to the beginning of the file.
# - append | a : Adds the new lines to the end of the file.
# - replace | r : Adds the new lines in place of an existing line.
# - delete | d : Deletes the indicated line or lines.
# If omitted or "" the "append" option will be used
#
# @param int|string $4
# Optional for 'prepend' and 'append'; Required for 'replace' and 'delete'.
# Indicates the line number to be used as the starting position for writing
# of the new content.
#
# If this parameter is not defined and the type is:
# - prepend : equivalent to setting the value '1'.
# - append : equivalent to setting the number of the last line of the file.
# - replace : will fail execution.
# - delete : will fail execution.
#
# IF
# the value passed is a string, it should be:
# - the name of a function to be executed to identify the line number in
#   that writing must be done.
# OR
# - 2 integer valuesseparated by space, these two values being the range
#   between 2 lines in which the new value will be added
#   (ex: "10 15" will completely replace the contents of lines 10, 11, 12, 13,
#   14 and 15 for new content to be added)
#
# In either case, if you do not receive valid integer values (between 1 and
# last line number of the file as it is currently saved) to
# action will not be taken and a failure will occur.
#
# @return
# Print '1' if you can change the target file.
# Or
# Print the error message.