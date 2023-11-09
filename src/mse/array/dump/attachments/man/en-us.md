# Synopsis

Processes the keys and values of the target array and returns a collection of 
lines of data capable of reassembling it.



&nbsp;

# Description

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

## string arrayNewName

- aka       : -ann --arrayNewName
- hint      :
  If informed, it will use this value as the name of the array in the final 
  output.


&nbsp;

## string prefixLines

- aka       : -pl --prefixLines
- hint      :
  If prompted, it will use this value in front of each line.

Useful if you want to print a commendable version of the array code.



&nbsp;



&nbsp;

# Returns string

One or more lines of data representing the declaration and populating of the 
array target.

Remember that associative arrays do not maintain the position of their keys.
To make it easier to read and understand, the keys will be shown in 
alphabetical order