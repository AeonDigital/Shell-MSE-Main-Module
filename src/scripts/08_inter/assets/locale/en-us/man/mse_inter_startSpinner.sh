#
# @desc
# Activates a spinner that aims to give the user the perception that a
# process is still in progress.
# This function activates the bash "+m" setting which makes all
# processes run detached.
#
# To stop the spinner use the "mse_inter_stopSpinner" function.
#
# @param string $1
# Name of an array containing each step of the spinner that will be presented.
# If omitted, or if name is invalid, use default spinner.
#
# @link
# The construction of this spinner was based on the guidelines of the
# following tutorial
# https://willcarh.art/blog/how-to-write-better-bash-spinners