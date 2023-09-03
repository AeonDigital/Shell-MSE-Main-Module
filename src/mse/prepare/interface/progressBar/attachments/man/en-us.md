# Synopsis

Prepares an associative array by filling in the keys required to execute a 
command **mse_interface_progressBar**.



&nbsp;

# Description

If no configuration criteria are passed, every message is defined by the 
current theme.

The progress bar is a single-line component, and the possible settings are 
divided into three blocks.



&nbsp;

## Part 01: Meta formatação

Here are defined properties that affect all other parts of the body of the 
progress bar.
Keys defined in this part:

- meta_theme
- meta_format
- meta_indent


&nbsp;

## Part 02: Meta formatting

It is about the formation of the progress bar itself.
Keys defined in this part:

- bar_ini_string
- bar_end_string
- bar_fill_char
- bar_max_char_length
- bar_atual_progress
- bar_atual_bar_length
- bar_color
- bar_color_alt
- bar_colorize


&nbsp;

## Part 03: Informações

Configures the information that appears next to the bar.
Keys defined in this part:

- info_show
- info_align
- info_ini_string
- info_end_string
- info_use_percent
- info_data
- info_color
- info_color_alt
- info_colorize



&nbsp;

# Parameters

## string arrayName

- aka       : -a --arrayName
- hint      :  
  Name of the associative array that will be populated.





&nbsp;

## string theme

- aka       : --theme
- hint      :  
  Name of the theme to use to generate the progress bar.

["meta_theme"]
The theme settings will override any other settings defined in this function.


&nbsp;

## string format

- aka       : --format
- hint      :  
  Progress bar presentation format style (as available by theme).

["meta_format"]
Each theme can provide multiple bar formats, if any, in this parameter should 
be indicated which should be used. Otherwise the format default will be used.


&nbsp;

## string indent

- aka       : --indent
- hint      :  
  Indentation for the progress bar.

["meta_indent"]
Use only whitespace or leave empty not to use.





&nbsp;

## string barIniString

- aka       : --barIniString
- hint      :  
  Characters that mark the beginning of the progress bar.

["bar_ini_string"]


&nbsp;

## string barEndString

- aka       : --barEndString
- hint      :  
  Characters that mark the end of the progress bar.

["bar_end_string"]


&nbsp;

## char barFillChar

- aka       : --barFillChar
- hint      :  
  Character that will be used to fill the progress bar.

["bar_fill_char"]
If left empty, uses the default character defined in the theme.


&nbsp;

## int barMaxCharLength

- aka       : --barMaxCharLength
- hint      :  
  Total size of the progress bar (in characters).

["bar_max_char_length"]
The theme used can modify this value according to the rules themselves.


&nbsp;

## int barAtualProgress

- aka       : --barAtualProgress
- default   : 0
- min       : 0
- max       : 100
- hint      :  
  Current percentage of progress progress (from 0 to 100).

["bar_atual_progress"]
Invalid values will revert to `0`.


&nbsp;

## int barAtualBarLength

- aka       : --barAtualBarLength
- hint      :  
  Total size (in chars) that the bar component should have.

["bar_atual_bar_length"]
Almost all themes will control this value internally. This is the calculation 
of the total size (in chars) that the bar component must have to represent the 
current percentage of progress.


&nbsp;

## string barColor

- aka       : --barColor
- hint      :  
  Code of the color that should be used in this component.

["bar_color"]


&nbsp;

## string barColorAlt

- aka       : --barColorAlt
- hint      :  
  Alternate color code for this component.

["bar_color_alt"]
Setting an alternate color to the main color.

Depending on the meta settings, the theme can use a color set to: 
alternative to the message.


&nbsp;

## bool barColorize

- aka       : --barColorize
- default   : 1
- hint      :  
  Indicates whether colors should be applied to this component.

["bar_colorize"]
Allows you to switch between a version with or without colors for this 
component.





&nbsp;

## bool infoShow

- aka       : --infoShow
- default   : 0
- hint      :  
  Indicates whether this component should be shown or omitted.

["info_show"]


&nbsp;

## char infoAlign

- aka       : --infoAlign
- default   : r
- options   :
  - r: right
  - l: left
- hint      :  
  Positioning of the information area in relation to the progress bar.

["info_align"]





&nbsp;

## string infoIniString

- aka       : --infoIniString
- hint      :  
  Characters that mark the beginning of the information area.

["info_ini_string"]
Leave empty not to use.


&nbsp;

## string infoEndString

- aka       : --infoEndString
- hint      :  
  Characters that demarcate the end of the information area.

["info_end_string"]
Leave empty not to use.


&nbsp;

## bool infoUsePercent

- aka       : --infoUsePercent
- default   : 0
- hint      :  
  Enter `true` to use the current percentage to populate the information area.

["info_use_percent"]


&nbsp;

## string infoData

- aka       : --infoData
- hint      :  
  Information that should be used to fill in the information area.

["info_data"]
If the advance percentage is to appear as well, this information will appear 
after the same.


&nbsp;

## string infoColor

- aka       : --infoColor
- hint      :  
  Code of the color that should be used in this component.

["info_color"]


&nbsp;

## string infoColorAlt

- aka       : --infoColorAlt
- hint      :  
  Alternate color code for this component.

["info_color_alt"]
Setting an alternate color to the main color.

Depending on the meta settings, the theme can use a color set as an alternative 
to the message.


&nbsp;

## bool infoColorize

- aka       : --infoColorize
- default   : 1
- hint      :  
  Indicates whether colors should be applied to this component.

["info_colorize"]
Allows you to switch between a version with or without colors for this 
component.





&nbsp;

# Returns void