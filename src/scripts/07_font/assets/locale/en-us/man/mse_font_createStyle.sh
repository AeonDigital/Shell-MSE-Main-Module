#
# @desc
# Creates a color style code for text conforming to the
# informed parameters.
#
# @param string $1
# Color system.
# There are 3 color description systems that can be used as per the
# terminal compatibility.
# Choose one of these:
#
#   - 4   : Uses 4 bits for color representation (16 colors).
#           This is the most common system among the various terminals.
#   - 8   : Uses 8 bits for color representation (256 colors).
#   - 32  : Uses 32 bits for color representation (true color).
#
# If omitted, or if given an invalid value, the representation will be used.
# 4-bit by default.
#
#
# @param string|int $2
# Code or name of the font attribute to use.
# You can set more than one value by separating them with a comma.
#
#   Code    : Name        : Effect
#   20      : NONE        : Resets any defined attributes (default value).
#
#    1      : BOLD        : Bold
#    2      : DARK        : Darkened
#    3      : ITALIC      : Italic
#    4      : UNDERLINE   : Underline
#    5      : BLINKS      : Blinking (slow)
#    6      : BLINKF      : Blinking (fast)
#    7      : REVERSE     : Inverts the selection of font color and background color
#    8      : HIDE        : Hidden
#    9      : STRIKE      : Scratched
#
#   21      : RBOLD       : Remove Bold
#   22      : RDARK       : Remove Darkened
#   23      : RITALIC     : Removes Italics
#   24      : RUNDERLINE  : Removes Underscore
#   25      : RBLINKS     : Remove Blinking (slow)
#   26      : RBLINKF     : Remove Blinking (fast)
#   27      : RREVERSE    : Remove Inversion
#   28      : RHIDE       : Remove Hidden
#   29      : RSTRIKE     : Remove Strikethrough
#
# Values considered invalid will be ignored.
#
#
# @param string|int $3
# Background color to use. The value to be described varies according to the type
# of the selected color system.
#
# 4 bit system
# In this case you can use the code or the color name as shown in the table below:
#
#   Code    : Name        : Effect
#   49      : NONE        : Resets the background color (default value).
#
#   Normal Palette
#   40      : BLACK       : Black
#   41      : RED         : Red
#   42      : GREEN       : Green
#   43      : YELLOW      : Yellow
#   44      : BLUE        : Blue
#   45      : PURPLE      : Purple
#   46      : CYAN        : Cyan
#   47      : WHITE       : White
#
#   Light / Bright Palette
#   100      : LBLACK     : Black
#   101      : LRED       : Red
#   102      : LGREEN     : Green
#   103      : LYELLOW    : Yellow
#   104      : LBLUE      : Blue
#   105      : LPURPLE    : Purple
#   106      : LCYAN      : Cyan
#   107      : LWHITE     : White
#
#
# 8 bit system
# Enter a value between 0 and 255 for the desired color.
# The default value in this case is "0" (black)
#
# 32 bit system
# Enter a value between 0 and 255 for each of the separate R, G and B vectors
# per ";".
# The default value in this case is "0;0;0" (black)
#
# Values considered invalid will revert to the default value of each
# system.
#
#
# @param string|int $4
# Font color to use. The value to be described varies according to the type
# of the selected color system.
#
# 4 bit system
# In this case you can use the code or the color name as shown in the table below:
# Note: the 'DARK' version of the colors is a non-standard implementation and works
# just as a 'wrapper' to set said color with DARK attribute.
#
#   Code    : Name        : Effect
#   39      : NONE        : Resets the background color (default value).
#
#   Normal Palette
#   30      : BLACK       : Black
#   31      : RED         : Red
#   32      : GREEN       : Green
#   33      : YELLOW      : Yellow
#   34      : BLUE        : Blue
#   35      : PURPLE      : Purple
#   36      : CYAN        : Cyan
#   37      : WHITE       : White
#
#   Normal Palette + Dark Attribute
#   230     : DBLACK      : Black
#   231     : DRED        : Red
#   232     : DGREEN      : Green
#   233     : DYELLOW     : Yellow
#   234     : DBLUE       : Blue
#   235     : DPURPLE     : Purple
#   236     : DCYAN       : Cyan
#   237     : DWHITE      : White
#
#   Light / Bright Palette
#   90      : LBLACK      : Black
#   91      : LRED        : Red
#   92      : LGREEN      : Green
#   93      : LYELLOW     : Yellow
#   94      : LBLUE       : Blue
#   95      : LPURPLE     : Purple
#   96      : LCYAN       : Cyan
#   97      : LWHITE      : White
#
#   Light/Light Palette + Dark Attribute
#   290     : LDBLACK     : Black
#   291     : LDRED       : Red
#   292     : LDGREEN     : Green
#   293     : LDYELLOW    : Yellow
#   294     : LDBLUE      : Blue
#   295     : LDPURPLE    : Purple
#   296     : LDCYAN      : Cyan
#   297     : LDWHITE     : White
#
#
# 8 bit system
# Enter a value between 0 and 255 for the desired color.
# The default value in this case is "255" (white)
#
# 32 bit system
# Enter a value between 0 and 255 for each of the separate R, G and B vectors
# per ";".
# The default value in this case is "255;255;255" (white)
#
# Values considered invalid will revert to the default value of each
# system.
#
#
# @param bool $5
# Optional.
# Indicate "1" if you want the return to be a ready-made style code
# to be used.
# Omit or indicate "0" if you want to return only the color code as a
# string
#
# @return
# Prints the code of the created style.
#
# @example
#   result=$(mse_exec_ifValidate mse_font_createStyle "4" "BOLD" "DWHITE" "LBLUE")
#   printf "${result}Formatted as I wanted"
