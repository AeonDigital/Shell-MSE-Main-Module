# Synopsis

Shows the font attributes that can be used for styling interface messages.



&nbsp;

# Parameters

## char format

- aka       : -f --format
- default   : l
- options   : 
  - l: list
  - t: table
- hint      :  
  Indicates the format in which the attributes should be displayed.

Use `l | list` or omit this parameter to see a line-by-line list with the name 
of each attribute or `t | table`.


&nbsp;

## int itensPerLine

- aka       : -ipl --itensPerLine
- default   : 6
- hint      :
  Indicate the number of items per line that should be shown.

If omitted, it assumes a total of 6 items per line.



&nbsp;

# Returns string

Prints the attribute options on the screen according to the presentation format 
selected.



&nbsp;

## Dependencies

- column