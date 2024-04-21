# Synopsis

Splits the passed string by splitting it into multiple lines using the 
character `\n` as a divider.



&nbsp;

# Description

You can set a maximum number of characters per line.

In this case, after the initial split (using the `\n` character), each line
will be checked individually and, if any of them has a number of characters 
beyond the defined limit, it will then be divided into as many lines as 
necessary for each of them to conform to the above limitation.

If a word is too big to fit on one line, it will stay on one line just for you 
that may exceed the exposed limit.



&nbsp;

# Parameters

## array arrayName

- aka       : -a --arrayName
- hint      :  
  Name of the array that will be populated with the processing result.
    

&nbsp;


## string string

- aka       : -s --string
- hint      :  
  Original string.

&nbsp;


## int maxLineLength

- aka       : -m -maxLineLength
- default   : -1
- hint      :  
  Maximum number of characters per line.

By default, the value of this parameter will be `-1`, which means there is no 
limit of characters for each identified line. This will also be the value used 
in if you receive an invalid value.
If the value entered is `0`, it will be used as a character limiter for
Each row the current value of the variable `$COLUMNS`.


&nbsp;


## bool isParagraph

- aka       : -p -isParagraph
- default   : 0
- hint      :  
  Indicates when the original string should be treated as a paragraph.

If `1` will first remove all existing line breaks by replacing them with empty 
spaces, then split the lines using the defined line size limit.


&nbsp;



# Returns array

The result will be defined in the indicated array.