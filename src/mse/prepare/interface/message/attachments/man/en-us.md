# Synopsis

Prepares an associative array by filling in the keys required for execution of 
a command **mse_interface_message_show**.



&nbsp;

# Description

If no configuration criteria are passed, every message is defined 
by the current theme.

The configuration is done in five parts, each of which is responsible for the 
settings of an area of the message.

The anatomy of the components of the messages can be described as follows:

[[top_separator]]

  [[title_top_separator]]
    [[title_indent]] [[title_bullet]] [[title_string]] [[title_string_end]]
  [[title_bottom_separator]]

  [[body_top_separator]]
    [[body_first_line_indent]] [[body_first_line_bullet]] [[body_first_line]]
    [[body_lines_indent]] [[body_lines_bullet]] [[body_lines]]
  [[body_bottom_separator]]

[[ bottom_separator]]


&nbsp;

## Part 01: Meta formatting

Here are defined properties that affect all other parts of the body of the 
message.
Keys defined in this part:

- meta_type
- meta_theme
- meta_format


&nbsp;

## Part 02: Message top tab

Allows you to define a separator at the top of the message that will be shown 
to the user.
Keys defined in this part:

- top_separator_string
- top_separator_color
- top_separator_color_alt
- top_separator_colorize


&nbsp;

## Part 03: Tittle

Configures how the message title will be shown.
Keys defined in this part:

- title_show
- title_type
- title_top_separator_string
- title_top_separator_color
- title_top_separator_color_alt
- title_top_separator_colorize
- title_indent
- title_bullet
- title_bullet_color
- title_bullet_color_alt
- title_bullet_colorize
- title_string
- title_string_color
- title_string_color_alt
- title_string_colorize
- title_string_end
- title_bottom_separator_string
- title_bottom_separator_color
- title_bottom_separator_color_alt
- title_bottom_separator_colorize


&nbsp;

## Part 04: Message body
  
Configures sampling of the message body.
Keys defined in this part:

- body_show
- body_top_separator_string
- body_top_separator_color
- body_top_separator_color_alt
- body_top_separator_colorize
- body_first_line_indent
- body_first_line_bullet
- body_first_line_bullet_color
- body_first_line_bullet_color_alt
- body_first_line_bullet_colorize
- body_lines_indent
- body_lines_bullet
- body_lines_bullet_color
- body_lines_bullet_color_alt
- body_lines_bullet_colorize
- body_lines
- body_lines_color
- body_lines_color_alt
- body_lines_colorize
- body_bottom_separator_string
- body_bottom_separator_color
- body_bottom_separator_color_alt
- body_bottom_separator_colorize


&nbsp;

## Part 05: Bottom tab of the message

Allows you to define a separator below the message that will be shown to the 
user.
Keys defined in this part:

- bottom_separator_string
- bottom_separator_color
- bottom_separator_color_alt
- bottom_separator_colorize



&nbsp;

# Parameters

## string arrayName

- aka       : -a --arrayName
- hint      :  
  Name of the associative array that will be populated.


&nbsp;

## string type

- aka       : --type
- default   : n
- options   : 
  - n   : none
  - i   : info
  - a   : attention
  - w   : warning
  - e   : error
  - f   : fail
  - s   : success

  - fr  : friendly
  - or  : ordinary
  - ca  : caution
  - im  : important
- hint      :  
  Message type.

["meta_type"]
Configure the type of message to show to the user.
Each theme has the responsibility to make the necessary adjustments as it 
follows parameter.

Below is a brief description of the meaning of each type and for which 
purpose it should be used.

**Alert Messages**

- n | none      : Not defined; none
- i | info      : Generic information.
- a | attention : Attention.
- w | warning   : Warning.
- e | error     : Error in an operation.
- f | fail      : An operation failed.
- s | success   : Success in an operation.


**Prompt Messages**

- fr | friendly   : Friendly. Unimportant question.
- or | ordinary   : Ordinary. Standard question.
- ca | caution    : Caution. Issue that requires user attention or has the 
                    potential for some permanent change.
- im | important  : Important. Issue with the potential to cause permanent 
                    change in script processing or on the PC itself.


&nbsp;

## string theme

- aka       : --theme
- hint      :  
  Name of the theme to use to generate the message.

["meta_theme"]
Theme settings will override any other settings defined in this function.


&nbsp;

## string format

- aka       : --format
- hint      :  
  Style of the message display format (as available by theme).

["meta_format"]
Each theme can provide multiple message formats, if any, in this parameter 
should be indicated which should be used. Otherwise the format default will be 
used.





&nbsp;

## string topSeparatorString

- aka       : --topSeparatorString
- hint      :  
  String used for this separator.

["top_separator_string"]
It can be just a newline character (\n) or any other that will be displayed as 
a separator.

If no characters are defined, this component is omitted entirely.


&nbsp;

## string topSeparatorColor

- aka       : --topSeparatorColor
- hint      :  
  Code of the color that should be used in this component.

["top_separator_color"]
This setting only makes sense if a separator character is defined and if it is 
visible.


&nbsp;

## string topSeparatorColorAlt

- aka       : --topSeparatorColorAlt
- hint      :  
  Alternate color code for this component.

["top_separator_color_alt"]
Setting an alternate color to the main color.

Depending on the meta settings, the theme can use a color set as an alternative 
to the message.


&nbsp;

## bool topSeparatorColorize

- aka       : --topSeparatorColorize
- default   : 1
- hint      :  
  Indicates whether colors should be applied to this component.

["top_separator_colorize"]
Allows you to switch between a version with or without colors for this 
component.





&nbsp;

## bool titleShow

- aka       : --titleShow
- default   : 1
- hint      :  
  Indicates whether this component should be shown or omitted.

["title_show"]


&nbsp;

## bool titleType

- aka       : --titleType
- hint      :  
  Indicates the type of title that should be shown (varies by theme).

["title_type"]
Themes can provide different types of titles and can change the way they are 
presented.

If nothing is specified for this property, the default value defined by the 
theme being used is used.





&nbsp;

## bool titleTopSeparatorString

- aka       : --titleTopSeparatorString
- hint      :  
  String used for this separator.

["title_top_separator_string"]
It can be just a newline character (\n) or any other that will be displayed as 
a separator.

If no characters are defined, this component is omitted entirely.


&nbsp;

## string titleTopSeparatorColor

- aka       : --titleTopSeparatorColor
- hint      :  
  Code of the color that should be used in this component.

["title_top_separator_color"]
This setting only makes sense if a separator character is defined and if it is 
visible.


&nbsp;

## string titleTopSeparatorColorAlt

- aka       : --titleTopSeparatorColorAlt
- hint      :  
  Alternate color code for this component.

["title_top_separator_color_alt"]
Setting an alternate color to the main color.

Depending on the meta settings, the theme can use a color set as an alternative 
to the message.


&nbsp;

## bool titleTopSeparatorColorize

- aka       : --titleTopSeparatorColorize
- default   : 1
- hint      :  
  Indicates whether colors should be applied to this component.

["title_top_separator_colorize"]
Allows you to switch between a version with or without colors for this 
component.





&nbsp;

## string titleIndent

- aka       : --titleIndent
- hint      :  
  Indentation for the title.

["title_indent"]
Use only whitespace.
If no characters are defined, this component is omitted entirely.





&nbsp;

## bool titleBullet

- aka       : --titleBullet
- hint      :  
  String used for bullet.

["title_bullet"]
String used for bullet.
If no characters are defined, this component is omitted entirely.


&nbsp;

## string titleBulletColor

- aka       : --titleBulletColor
- hint      :  
  Code of the color that should be used in this component.

["title_bullet_color"]
Code of the color that should be used in this component.


&nbsp;

## string titleBulletColorAlt

- aka       : --titleBulletColorAlt
- hint      :  
  Alternate color code for this component.

["title_bullet_color_alt"]
Setting an alternate color to the main color.

Depending on the meta settings, the theme can use a color set as an alternative 
to the message.


&nbsp;

## bool titleBulletColorize

- aka       : --titleBulletColorize
- default   : 1
- hint      :  
  Indicates whether colors should be applied to this component.

["title_bullet_colorize"]
Allows you to switch between a version with or without colors for this 
component.





&nbsp;

## string titleString

- aka       : --titleString
- hint      :  
  Message title.

["title_string"]
If "", use the default title as per the message `type`, or, leave the title 
line empty in case of message type `none`.


&nbsp;

## string titleStringColor

- aka       : --titleStringColor
- hint      :  
  Code of the color that should be used in this component.

["title_string_color"]
Code of the color that should be used in this component.


&nbsp;

## string titleStringColorAlt

- aka       : --titleStringColorAlt
- hint      :  
  Alternate color code for this component.

["title_string_color_alt"]
Setting an alternate color to the main color.

Depending on the meta settings, the theme can use a color set as an alternative 
to the message.


&nbsp;

## bool titleStringColorize

- aka       : --titleStringColorize
- default   : 1
- hint      :  
  Indicates whether colors should be applied to this component.

["title_string_colorize"]
Allows you to switch between a version with or without colors for this 
component.





&nbsp;

## string titleStringEnd

- aka       : --titleStringEnd
- hint      :  
  String usada ao final da linha de texto do título.

["title_string_end"]
Typically, if used, it will be set to a `\n` character to force the break line 
before starting the next component.





&nbsp;

## bool titleBottomSeparatorString

- aka       : --titleBottomSeparatorString
- hint      :  
  String used for this separator.

["title_bottom_separator_string"]
It can be just a newline character (\n) or any other that will be displayed as 
a separator.

If no characters are defined, this component is omitted entirely.


&nbsp;

## string titleBottomSeparatorColor

- aka       : --titleBottomSeparatorColor
- hint      :  
  Code of the color that should be used in this component.

["title_bottom_separator_color"]
This setting only makes sense if a separator character is defined and if it is 
visible.


&nbsp;

## string titleBottomSeparatorColorAlt

- aka       : --titleBottomSeparatorColorAlt
- hint      :  
  Alternate color code for this component.

["title_bottom_separator_color_alt"]
Setting an alternate color to the main color.

Depending on the meta settings, the theme can use a color set as an alternative 
to the message.


&nbsp;

## bool titleBottomSeparatorColorize

- aka       : --titleBottomSeparatorColorize
- default   : 1
- hint      :  
  Indicates whether colors should be applied to this component.

["title_bottom_separator_colorize"]
Allows you to switch between a version with or without colors for this 
component.





&nbsp;

## bool bodyShow

- aka       : --bodyShow
- default   : 1
- hint      :  
  Indicates whether this component should be shown or omitted.

["body_show"]





&nbsp;

## bool bodyTopSeparatorString

- aka       : --bodyTopSeparatorString
- hint      :  
  String used for this separator.

["body_top_separator_string"]
It can be just a newline character (\n) or any other that will be displayed as 
a separator.

If no characters are defined, this component is omitted entirely.


&nbsp;

## string bodyTopSeparatorColor

- aka       : --bodyTopSeparatorColor
- hint      :  
  Code of the color that should be used in this component.

["body_top_separator_color"]
This setting only makes sense if a separator character is defined and if it is 
visible.


&nbsp;

## string bodyTopSeparatorColorAlt

- aka       : --bodyTopSeparatorColorAlt
- hint      :  
  Alternate color code for this component.

["body_top_separator_color_alt"]
Setting an alternate color to the main color.

Depending on the meta settings, the theme can use a color set as an alternative 
to the message.


&nbsp;

## bool bodyTopSeparatorColorize

- aka       : --bodyTopSeparatorColorize
- default   : 1
- hint      :  
  Indicates whether colors should be applied to this component.

["body_top_separator_colorize"]
Allows you to switch between a version with or without colors for this 
component.





&nbsp;

## string bodyFirstLineIndent

- aka       : --bodyFirstLineIndent
- hint      :  
  Indentation for the title.

["body_first_line_indent"]
Use only whitespace.
If no characters are defined, this component is omitted entirely.





&nbsp;

## bool bodyFirstLineBullet

- aka       : --bodyFirstLineBullet
- hint      :  
  String used for bullet.

["body_first_line_bullet"]
String used for bullet.
If no characters are defined, this component is omitted entirely.


&nbsp;

## string bodyFirstLineBulletColor

- aka       : --bodyFirstLineBulletColor
- hint      :  
  Code of the color that should be used in this component.

["body_first_line_bullet_color"]
Code of the color that should be used in this component.


&nbsp;

## string bodyFirstLineBulletColorAlt

- aka       : --bodyFirstLineBulletColorAlt
- hint      :  
  Alternate color code for this component.

["body_first_line_bullet_color_alt"]
Setting an alternate color to the main color.

Depending on the meta settings, the theme can use a color set as an alternative 
to the message.


&nbsp;

## bool bodyFirstLineBulletColorize

- aka       : --bodyFirstLineBulletColorize
- default   : 1
- hint      :  
  Indicates whether colors should be applied to this component.

["body_first_line_bullet_colorize"]
Allows you to switch between a version with or without colors for this 
component.





&nbsp;

## string bodyLinesIndent

- aka       : --bodyLinesIndent
- hint      :  
  Indentation for message lines.

["body_lines_indent"]
Use only whitespace.
If no characters are defined, this component is omitted entirely.





&nbsp;

## bool bodyLinesBullet

- aka       : --bodyLinesBullet
- hint      :  
  String used for bullet.

["body_lines_bullet"]
String used for bullet.
If no characters are defined, this component is omitted entirely.


&nbsp;

## string bodyLinesBulletColor

- aka       : --bodyLinesBulletColor
- hint      :  
  Code of the color that should be used in this component.

["body_lines_bullet_color"]
Code of the color that should be used in this component.


&nbsp;

## string bodyLinesBulletColorAlt

- aka       : --bodyLinesBulletColorAlt
- hint      :  
  Alternate color code for this component.

["body_lines_bullet_color_alt"]
Setting an alternate color to the main color.

Depending on the meta settings, the theme can use a color set as an alternative 
to the message.


&nbsp;

## bool bodyLinesBulletColorize

- aka       : --bodyLinesBulletColorize
- default   : 1
- hint      :  
  Indicates whether colors should be applied to this component.

["body_lines_bullet_colorize"]
Allows you to switch between a version with or without colors for this 
component.





&nbsp;

## array bodyLines

- aka       : --bodyLines
- hint      :  
  Name of the array that brings the rows of data to be presented.

["body_lines"]


&nbsp;

## string bodyLinesColor

- aka       : --bodyLinesColor
- hint      :  
  Code of the color that should be used in this component.

["body_lines_color"]
Code of the color that should be used in this component.


&nbsp;

## string bodyLinesColorAlt

- aka       : --bodyLinesColorAlt
- hint      :  
  Alternate color code for this component.

["body_lines_color_alt"]
Setting an alternate color to the main color.

Depending on the meta settings, the theme can use a color set as an alternative 
to the message.


&nbsp;

## bool bodyLinesColorize

- aka       : --bodyLinesColorize
- default   : 1
- hint      :  
  Indicates whether colors should be applied to this component.

["body_lines_colorize"]
Allows you to switch between a version with or without colors for this 
component.





&nbsp;

## bool bodyBottomSeparatorString

- aka       : --bodyBottomSeparatorString
- hint      :  
  String used for this separator.

["body_bottom_separator_string"]
It can be just a newline character (\n) or any other that will be displayed as 
a separator.

If no characters are defined, this component is omitted entirely.


&nbsp;

## string bodyBottomSeparatorColor

- aka       : --bodyBottomSeparatorColor
- hint      :  
  Code of the color that should be used in this component.

["body_bottom_separator_color"]
This setting only makes sense if a separator character is defined and if it is 
visible.


&nbsp;

## string bodyBottomSeparatorColorAlt

- aka       : --bodyBottomSeparatorColorAlt
- hint      :  
  Alternate color code for this component.

["body_bottom_separator_color_alt"]
Setting an alternate color to the main color.

Depending on the meta settings, the theme can use a color set as an alternative 
to the message.


&nbsp;

## bool bodyBottomSeparatorColorize

- aka       : --bodyBottomSeparatorColorize
- default   : 1
- hint      :  
  Indicates whether colors should be applied to this component.

["body_bottom_separator_colorize"]
Allows you to switch between a version with or without colors for this 
component.





&nbsp;

## string bottomSeparatorString

- aka       : --bottomSeparatorString
- hint      :  
  String used for this separator.

["bottom_separator_string"]
It can be just a newline character (\n) or any other that will be displayed as 
a separator.

If no characters are defined, this component is omitted entirely.


&nbsp;

## string bottomSeparatorColor

- aka       : --bottomSeparatorColor
- hint      :  
  Code of the color that should be used in this component.

["bottom_separator_color"]
This setting only makes sense if a separator character is defined and if it is 
visible.


&nbsp;

## string bottomSeparatorColorAlt

- aka       : --bottomSeparatorColorAlt
- hint      :  
  Alternate color code for this component.

["bottom_separator_color_alt"]
Setting an alternate color to the main color.

Depending on the meta settings, the theme can use a color set as an alternative 
to the message.


&nbsp;

## bool bottomSeparatorColorize

- aka       : --bottomSeparatorColorize
- default   : 1
- hint      :  
  Indicates whether colors should be applied to this component.

["bottom_separator_colorize"]
Allows you to switch between a version with or without colors for this 
component.





&nbsp;

# Returns void