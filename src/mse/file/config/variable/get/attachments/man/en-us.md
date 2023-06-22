# Synopsis

Prints the value of the searched variable on the screen.



&nbsp;

# Description

If the configuration file is badly formatted and exists within it section a 
duplicate variable, only the first one will be taken into account.



&nbsp;

# Parameters

## string file

- aka       : -f --file
- hint      :  
  Path to the target configuration file.


&nbsp;

## string section

- aka       : -s --section
- hint      :  
  Name of the target section. Omit to read the entire file.


&nbsp;

## string varName

- aka       : -vn --varName
- hint      :  
  Target variable name.



&nbsp;

# Returns string

Prints the value of the indicated variable.
Attention to cases where the value of the variable is empty ( "" ) because the 
fact that it does not getting an output can be interpreted in the same way as 
if it didn't exist in the indicated configuration file or section.