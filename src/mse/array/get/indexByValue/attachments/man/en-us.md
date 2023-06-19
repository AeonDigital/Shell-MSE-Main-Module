# Synopsis

Identifies the index corresponding to the value passed in the indicated array.



&nbsp;

# Parameters

## string value

- aka       : -v --value
- hint      :  
  Value being searched for.


&nbsp;

## array arrayName

- aka       : -a --arrayName
- hint      :  
  Name of the array where the search is to be made.


&nbsp;

## bool caseSensitive

- aka       : -cs --caseSensitive
- default   : 1
- hint      :  
  Should the research be done in a `case-sensitive`?



&nbsp;

# Returns int

Returns the index on the array that corresponds to the indicated value.
An empty value is returned if nothing is found.