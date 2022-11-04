#
# @desc
# Prepare an associative array by filling in the keys needed for the
# execution of a "mse_file_read" command.
#
# If no configuration criteria are passed, the entire document will be
# considered valid.
#
# The configuration is done in five blocks:
#
# - Block 01: Block level control
#   allows you to identify which part of the document should be returned or the
#   from where it should be ignored.
#
# - Block 02: Line level control
#   allows you to pass rules that will validate line by line for those
#   that must be returned.
#
# - Block 03: Transformation Controls
#   Configures transformations to be applied to the rows that will be returned.
#
# - Block 03: Other settings
#   General use for configurations that do not necessarily fall under any
#   of those mentioned above.
#
#
# @param string $1
# Name of the associative array that will be populated.
#
#
#
# [[ Block 01: Block Level Control ]]
#
# @param string $2
# ["block_start_check"]
# Indicates the name of a validator function that can identify the beginning of a
# "valid" part of a file to be returned.
#
# Keeping this value empty will cause the entire contents of the file to be
# considered as "returnable".
# On the contrary, when indicating a validator function will make all the
# lines are considered "non-returnable" until you reach one whose
# test returns positive.
#
# See in the section "VALIDATING FUNCTIONS" below the interface of the functions
# that can be defined here.
#
# @param string $3
# ["block_start_check_args"]
# Allows passing some information that will be used in the validator function as a
# extra argument.
#
# @param string $4
# ["block_start_check_args_sep"]
# Indicates the character that should be used to "split" the arguments collection
# passed in "block_start_check_args".
#
# @param bool $5
# ["block_start_get_first_line"]
# Enter "" or "0" so that the start line of a valid block is omitted.
# Indicate "1" so that this first identified row is also returned.
#
# @param string $6
# ["block_end_check"]
# Indicates the name of a validator function that will mark the end of a part
# "valid" of a file to be returned.
#
# See in the section "VALIDATING FUNCTIONS" below the interface of the functions
# that can be defined here.
#
# @param string $7
# ["block_end_check_args"]
# Allows passing some information that will be used in the validator function as a
# extra argument.
#
# @param string $8
# ["block_end_check_args_sep"]
# Indicates the character that should be used to "split" the arguments collection
# passed in "block_end_check_args".
#
# @param bool $9
# ["block_end_get_last_line"]
# Enter "" or "0" so that the final line of a valid block is omitted.
# Indicate "1" so that this last identified line is also returned.
#
# @param bool $10
# ["block_check_invert"]
# Enter "1" to invert the output of the function defined in "block_start_check"
# and "block_end_check".
#
#
#
# [[ Block 02: Line Level Control ]]
#
# @param bool $11
# ["line_check"]
# Indicates the name of a validator function that allows identifying whether the
# line currently being processed should be returned.
#
# Keeping this value empty will make all lines inside a valid block
# be "returnable".
# On the contrary, when indicating a validator function will make all the
# lines are considered "non-returnable" except those that pass the
# proposed test.
#
# See in the section "VALIDATING FUNCTIONS" below the interface of the functions
# that can be defined here.
#
# @param string $12
# ["line_check_args"]
# Allows passing some information that will be used in the validator function as
# a extra argument.
#
# @param string $13
# ["line_check_args_sep"]
# Indicates the character that should be used to "split" the arguments collection
# passed in "line_check_args".
#
# @param bool $14
# ["line_check_invert"]
# Enter "1" to invert the output of the function defined in "line_check".
#
# @param bool $15
# ["line_check_has_linenumber"]
# Use "1" to indicate that the lines being processed are coming with their
# respective numbers at the beginning.
#
#
#
# [[ Block 03: Transformation Controls ]]
#
# @param string $16
# ["line_transform"]
# Indicates the name of a function that will receive the same arguments as
# arguments information than the validating functions but, in this case, it will
# promote a transformation on the line, allowing it to be seen differently
# the one that is currently recorded in the file.
# No changes will be made to the file itself.
#
# See in the "TRANSFORMER FUNCTIONS" section below the interface of the
# functions that can be defined here.
#
# @param string $17
# ["line_transform_args"]
# Allows you to pass some information that will be used in the transform function
# as an extra argument.
#
# @param string $18
# ["line_transform_args_sep"]
# Indicates the character that should be used to "split" the arguments collection
# passed in "line_transform_args".
#
# @param bool $19
# ["line_transform_has_linenumber"]
# Use "1" to indicate that the lines being processed are coming with their
# respective numbers at the beginning.
#
#
#
# [[ Block 04: Other Settings ]]
#
# @param bool $20
# ["line_hide_empty"]
# Whether "" or "0" will show all lines including empty ones.
# If "1" will remove empty lines.
#
# @param bool $21
# ["line_show_number"]
# If "" or "0" will bring the raw value of the line, as it appears in the
# original file.
# If "1" will display the number of each line at its beginning.
# The line number will be returned as the first information and will be
# separated from the beginning of the text by a '#' character.
#
#
#
# ---
#
# [[ VALIDATING FUNCTIONS ]]
# Used both to identify the beginning and end of a section and to
# check if a line contains the type of information you are looking for
# such functions must follow the following interface:
#
# Description of the check being performed.
#
# @param string $1
# Name of the associative array that brings the settings for reading being
# currently used.
#
# @param int $2
# Line number being checked.
#
# @param string $3
# Row contents being checked.
#
# @param bool $4
# Use "0" to inform that the lines being processed are in "raw" format
# (as in the original file).
# Use "1" to inform that there is, in the content of each line, the information
# of its respective number within the target file.
#
# @param string $5
# Optional argument to supplement verification.
# As implementation may be mandatory.
#
# @return
# Prints '1' if the test is positive.
# Prints '0' if the test is negative.
#
#
#
# ---
#
# [[ TRANSFORMER FUNCTIONS ]]
# Used to transform information from lines identified as valid
# such functions must follow the following interface:
#
# Description of the transformation being performed.
#
# @param string $1
# Name of the associative array that brings the settings for reading being
# currently used.
#
# @param int $2
# Line number being transformed.
#
# @param string $3
# Contents of the row being transformed.
#
# @param bool $4
# Indicate "0" to inform that the lines being processed are in
# 'raw' (as in the original file).
# Indicate "1" to inform that, in the content of each line, there is the
# information of its respective number within the target file.
#
# @param string $5
# Optional argument to supplement verification.
# As implementation may be mandatory.
#
# @return
# Brings the original string transformed as indicated in the description.
# ---
