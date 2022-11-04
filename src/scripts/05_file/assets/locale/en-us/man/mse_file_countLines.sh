#
# @desc
# It counts the lines of the passed file or string and prints the result.
# Due to the way bash works with regards to row handling
# empty at the end of the files, keep in mind that the line count will
# only up to the last non-empty line of the indicated file.
#
# @param string $1
# Path to the file or string that will be used.
#
# @return
# Total lines in the file