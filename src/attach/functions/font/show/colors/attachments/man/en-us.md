# Synopsis

Shows a table of colors that the terminal is able to use for the 
stylization of fonts and background.



&nbsp;

# Parameters

## int colorSystem

- aka       : -c --colorSystem
- default   : 4
- options   : 
  - 4:
  - 8:
  - 32:
- hint      :  
  Color system (4, 8 or 32 bits).

There are 3 color description systems that can be used according to the 
compatibility of your terminal.

Choose one of these:

- 4   : Uses 4 bits for color representation (16 colors).
        This is the most common system among the various terminals.
- 8   : Uses 8 bits for color representation (256 colors).
- 32  : Uses 32 bits for true color representation.

There is (at this time) no sampling prepared for a 32-bit collection.


&nbsp;

## char focus

- aka       : -f --focus
- default   : f
- options   :
  - f: foreground
  - b: background
- hint      :
  Indicates the type of sampling (font or background color).

The value `f` is automatically set if the color set is of the 
4-bit.



&nbsp;

## int itensPerLine

- aka       : -ipl --itensPerLine
- default   : 12
- min       : 4
- max       : 255
- hint      :
  Indicate the number of items per line that should be shown.




&nbsp;

# Returns string

Prints a table containing the selected color set on the screen.



&nbsp;

## Dependencies

- column
- sed