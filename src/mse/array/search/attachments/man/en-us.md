# Synopsis

Identifies whether the indicated value exists in the target array.



&nbsp;

# Parameters

## string value

- aka       : -v --value
- hint      :  
  Value being researched.


&nbsp;

## assoc arrayName

- aka       : -a --arrayName
- hint      :  
  Name of the array where the search is to be made.


&nbsp;

## bool caseSensitive

- aka       : -cs --caseSensitive
- default   : 0
- hint      :  
  Indicates whether the check should be done in "insensitive case"

Omit or indicate "0" for "case sensitive" (default)
Indicate "1" for "case insensitive"


&nbsp;

## bool ignoreGlyphs

- aka       : -ig --ignoreGlyphs
- default   : 0
- hint      :  
  Indicate whether you want the comparison to be made by ignoring glyphs.

In this case the tested values will be converted to ASCII.
Omit or indicate "0" to make a comparison using the actual value.
Enter "1" to ignore the glyphs in the comparison.


&nbsp;

## bool subArray

- aka       : -sa --subArray
- default   : 0
- hint      :  
  Indicate whether the values of the passed array should be treated as a sub 
  array of values.

Omit or enter "0" so that the comparison is made using the full value of each 
item (default).
Enter "1" to perform the sub-value check.


&nbsp;

## string returnType

- aka       : -r --returnType
- default   : b
- options   : 
  - b  : bool
  - i  : index k key
- hint      :  
  Indicate the type of return expected

If "b", returns a Boolean indicating the existence or not of the past value 
between the array values.
If "i", returns the index or name of the key where the value passed was 
found. An empty string is returned if it does not exist.



&nbsp;

# Returns bool|string

Varies depending on the definition of the "returnType" parameter.