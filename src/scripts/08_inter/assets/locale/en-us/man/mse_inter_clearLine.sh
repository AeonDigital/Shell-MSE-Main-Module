#
# @desc
# Completely erases the contents of the line where the cursor is currently.
#
# @param char $1
# Optional. If set, will erase the line from the current cursor position
# up to the chosen limit:
#   - l   : erases from the current position to the left edge of the line.
#   - r   : erases from the current position to the right edge of the line.
#
# @param bool $2
# Optional. Indicates whether or not to move the cursor to the beginning of the line.
# Use "1" to move the cursor to the beginning of the line.
# Omit or use "0" to keep the cursor at the current location.
#
# @link
# Meet other terminal control codes at this location:
# http://www.climagic.org/mirrors/VT100_Escape_Codes.html