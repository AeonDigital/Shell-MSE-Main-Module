# Synopsis

Identifies the key corresponding to the value passed in the indicated 
associative array.



&nbsp;

# Parameters

## string value

- aka       : -v --value
- hint      :  
  Value being searched for.


&nbsp;

## assoc arrayName

- aka       : -a --arrayName
- hint      :  
  Name of the associative array where the search is to be made.


&nbsp;

## bool caseSensitive

- aka       : -cs --caseSensitive
- default   : 1
- hint      :  
  Should the research be done in a `case-sensitive`?



&nbsp;

# Returns int

Returns the key on the associative array that corresponds to the value.
An empty value is returned if nothing is found.