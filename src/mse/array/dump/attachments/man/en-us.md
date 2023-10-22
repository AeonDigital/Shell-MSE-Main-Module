# Synopsis

Processes the keys and values of the target array and returns a collection of 
lines of data capable of reassembling it.

In each line of data, a single value of the array will be present, either a 
common array or an associative type.



&nbsp;

# Parameters

## array arrayName

- aka       : -a --arrayName
- hint      :  
  Name of the target array.


&nbsp;

## bool isGlobal

- aka       : -g --isGlobal
- default   : 0
- hint      :
  Indicates when the array should be marked as global in scope.



&nbsp;

# Returns string

One or more lines of data representing the declaration and populating of the 
array target.

Remember that associative arrays do not maintain the position of their keys.