# Synopsis

Splits the string passed in an array where each line will have at most the 
number of characters entered.
The identified words will be kept without being separated between the lines



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



# Returns array

The result will be defined in the indicated array.