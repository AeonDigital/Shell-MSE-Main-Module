#
# @desc
# Move the cursor through the terminal according to the settings passed.
#
# @param string $1
# Direction in which the cursor should be moved.
#   - top     : up x lines.
#   - bottom  : down x lines.
#   - left    : from the left margin x columns.
#   - right   : from the right margin x columns.
#
# Keep in mind that due to how the terminal works, when you do
# the "enter" of a command the following events occur in the following order:
#
#   1. A new row is created and the cursor is positioned in the first column
#      of this new line.
#   2. The command typed in the above line is executed.
#   3. The prompt is rewritten
#   4. The cursor is repositioned at the end of the new prompt.
#
# The information above will serve to explain the operation of this action
# and of as you should notice the differences between performing them inside a
# script (place where a new prompt is not created until the end of it) and its
# use in the terminal itself (which is an unadvised use of it).
#
# When this same command is executed inside a script, the position of the
# cursor will be linked to the last output that occurred, so the cursor
# does not return to the beginning of the line 'naturally'.
#
# @param int $2
# Number of rows or columns to move the cursor.
#
# @param char $3
# Optional. Defines whether or not to "anchor" the cursor before starting the
# your repositioning.
# Select one of the following options:
#   - "l" : Moves the cursor to the first column of the row.
#   - "r" : Moves the cursor to the last column of the row.
#
# @link
# Meet other terminal control codes at this location:
# http://www.climagic.org/mirrors/VT100_Escape_Codes.html