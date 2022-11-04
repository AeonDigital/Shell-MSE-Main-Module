#
# @desc
# Display information regarding the use of the target function as a description of
# parameters to be passed and their respective return.
#
# This information is taken from the definition files of each
# occupation.
#
# By default, the "less" command is triggered to allow a preview
# more user-friendly.
#
# A description of a function is identified by a line in the file that
# start with "# @desc". From this line, all will be captured until
# that some line is not the continuation of the same comment area.
#
# @param string $1
# Name of target function.
#
# @param bool $2
# Indicate if you want to print the result of the manual on the screen. In this case the
# command "less" will not be triggered.
#   - Omit or enter "1" to use "less"
#   - Enter "0" to print the result in the terminal.
#
# @return
# Target function usage information.