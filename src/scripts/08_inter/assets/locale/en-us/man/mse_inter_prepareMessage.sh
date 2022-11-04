#
# @desc
# Prepare an associative array by filling in the keys needed for the
# execution of a "mse_inter_showMessage" command.
#
# If no configuration criteria are passed, every message will be set
# by theme.
#
# The configuration is done in five blocks:
#
# - Block 01: Meta formatting
# - Block 02: Top message separator
# - Block 03: Title
# - Block 04: Message body
# - Block 05: Bottom message separator
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
# ["meta_type"]
# Message type.
#
# Alert Messages
#
#   - ""        | "" : Not defined (default value).
#   - none      | n   : Not defined (same as above).
#   - info      | i   : Generic information.
#   - attention | a   : Attention.
#   - warning   | w   : Alert.
#   - error     | e   : Error in an operation.
#   - fail      | f   : An operation failed.
#   - success   | s   : Success in an operation.
#
#
# Prompt messages
#
#   - friendly  | fr  : Friendly. An unimportant question.
#   -  ordinary | or  : Common. Standard question.
#   - caution   | ca  : Careful. Issue that requires user attention or that
#                       has the potential for some permanent change.
#   - important | im  : Important. Issue with the potential to cause change
#                       permanent in script processing or on the PC itself
#
# @param string $3
# ["meta_theme"]
# Name of the theme used to render the message to be shown on the screen.
# Theme settings will override any other settings
# defined in this function.
#
# @param string $4
# ["meta_format"]
# Message format.
# Each theme can provide multiple message formats, if applicable, in this
# parameter must be indicated which one should be used. Otherwise the format
# pattern will be used.
#
#
#
#
#
# [[ Block 02: Top message separator ]]
#
# @param string $5
# ["top_separator_string"]
# Top message separator.
#
# @param string $6
# ["top_separator_color"]
# Code of the color to use for this element.
#
# @param string $7
# ["top_separator_color_alt"]
# Alternate color code to be used on this element.
#
# @param bool $8
# ["top_separator_colorize"]
# Indicates whether to allow colorization of the message's top separator.
# Use "0" for no.
# Use "1" for yes.
#
#
#
#
#
# [[ Block 03: Title ]]
#
# @param bool $9
# ["title_show"]
# Show title.
# Use "0" to omit.
# Use "1" to show.
#
# @param int $10
# ["title_type"]
# Title type identifier.
# Valid identifiers are defined and controlled by each theme.
#
#
#
# @param string $11
# ["title_top_separator_string"]
# Top title separator.
#
# @param string $12
# ["title_top_separator_color"]
# Code of the color to use for this element.
#
# @param string $13
# ["title_top_separator_color_alt"]
# Alternate color code to be used on this element.
#
# @param bool $14
# ["title_top_separator_colorize"]
# Indicates whether to allow colorization of the title's top separator.
# Use "0" for no.
# Use "1" for yes.
#
#
#
# @param string $15
# ["title_indent"]
# Indentation for the title.
# Use only white space.
# Leave empty not to use.
#
#
#
# @param string $16
# ["title_bullet"]
# Bullet for the title.
# Leave empty not to use.
#
# @param string $17
# ["title_bullet_color"]
# Code of the color to use for this element.
#
# @param string $18
# ["title_bullet_color_alt"]
# Alternate color code to be used on this element.
#
# @param bool $19
# ["title_bullet_colorize"]
# Indicates whether to allow the title bullet to be colored.
# Use "0" for no.
# Use "1" for yes.
#
#
#
# @param string $20
# ["title_string"]
# Title of the message.
# If "", it will use the default title according to the message type, or,
# leave the empty title line in case of "none" message type.
#
# @param string $21
# ["title_string_color"]
# Code of the color to use for this element.
#
# @param string $22
# ["title_string_color_alt"]
# Alternate color code to be used on this element.
#
# @param bool $23
# ["title_string_colorize"]
# Indicates whether to allow title coloring.
# Use "0" for no.
# Use "1" for yes.
#
# @param string $24
# ["title_string_end"]
# String used at the end of the title text line.
# Normally, if used, will be set to a "\n" character to force the
# line break before starting the next component.
#
#
#
# @param string $25
# ["title_bottom_separator_string"]
# Bottom title separator.
#
# @param string $26
# ["title_bottom_separator_color"]
# Code of the color to use for this element.
#
# @param string $27
# ["title_bottom_separator_color_alt"]
# Alternate color code to be used on this element.
#
# @param bool $28
# ["title_bottom_separator_colorize"]
# Indicates whether to allow colorization of the title's lower separator.
# Use "0" for no.
# Use "1" for yes.
#
#
#
#
#
# [[ Block 04: Message body ]]
#
# @param bool $29
# ["body_show"]
# Show the message body.
# Use "0" to omit.
# Use "1" to show.
#
#
#
# @param string $30
# ["body_top_separator_string"]
# Top message body separator.
#
# @param string $31
# ["body_top_separator_color"]
# Code of the color to use for this element.
#
# @param string $32
# ["body_top_separator_color_alt"]
# Alternate color code to be used on this element.
#
# @param bool $33
# ["body_top_separator_colorize"]
# Indicates whether to allow colorization of the upper body separator of the
# message.
# Use "0" for no.
# Use "1" for yes.
#
#
#
# @param string $34
# ["body_first_line_indent"]
# Indentation for the first line of the message body.
# Use only white space.
# Leave empty not to use.
#
#
#
# @param string $35
# ["body_first_line_bullet"]
# Bullet for the first line of the message body.
# Leave empty not to use.
#
# @param string $36
# ["body_first_line_bullet_color"]
# Code of the color to use for this element.
#
# @param string $37
# ["body_first_line_bullet_color_alt"]
# Alternate color code to be used on this element.
#
# @param bool $38
# ["body_first_line_bullet_colorize"]
# Indicates whether or not to allow the bullet colorization of the first line of the
# message body.
# Use "0" for no.
# Use "1" for yes.
#
#
#
# @param string $39
# ["body_lines_indent"]
# Indentation for the second line in front of the message body.
# Use only white space.
# Leave empty not to use.
#
#
#
# @param string $40
# ["body_lines_bullet"]
# Bullet for the second line in front of the message body.
# Leave empty not to use.
#
# @param string $41
# ["body_lines_bullet_color"]
# Code of the color to use for this element.
#
# @param string $42
# ["body_lines_bullet_color_alt"]
# Alternate color code to be used on this element.
#
# @param bool $43
# ["body_lines_bullet_colorize"]
# Indicates whether or not to allow the bullet colorization of the second
# line in in front of the message body.
# Use "0" for no.
# Use "1" for yes.
#
#
#
# @param string $44
# ["body_lines"]
# Name of a one-dimensional array containing the sentences that must be
# used to assemble the message body.
#
# @param string $45
# ["body_lines_color"]
# Code of the color to use for this element.
#
# @param string $46
# ["body_lines_color_alt"]
# Alternate color code to be used on this element.
#
# @param bool $47
# ["body_lines_colorize"]
# Indicates whether or not to allow message body colorization.
# Use "0" for no.
# Use "1" for yes.
#
#
#
# @param string $48
# ["body_bottom_separator_string"]
# Lower message body separator.
#
# @param string $49
# ["body_bottom_separator_color"]
# Code of the color to use for this element.
#
# @param string $50
# ["body_bottom_separator_color_alt"]
# Alternate color code to be used on this element.
#
# @param bool $51
# ["body_bottom_separator_colorize"]
# Indicates whether to allow the colorization of the lower separator of the
# body of the message.
# Use "0" for no.
# Use "1" for yes.
#
#
#
#
#
# [[ Block 05: Bottom message separator ]]
#
# @param string $52
# ["bottom_separator_string"]
# Bottom message separator.
#
# @param string $53
# ["bottom_separator_color"]
# Code of the color to use for this element.
#
# @param string $54
# ["bottom_separator_color_alt"]
# Alternate color code to be used on this element.
#
# @param bool $55
# ["bottom_separator_colorize"]
# Indicates whether to allow colorization of the message's lower separator.
# Use "0" for no.
# Use "1" for yes.
#