# Synopsis

Splits the string passed in an array where each line will have at most the 
number of characters entered.
The identified words will be kept without being separated between the lines



&nbsp;

# Parameters

## string string

- aka       : -s --string
- hint      :  
  Original string.

&nbsp;


## int maxLineLength

- aka       : -m -maxLineLength
- hint      :  
  Maximum number of characters per line.

If not set, or, if invalid, uses the current value of the variable `$COLUMNS`.

&nbsp;



# Returns array

The result will be defined in the variable `MSE_LAST_FUNCTION_RETURN`.