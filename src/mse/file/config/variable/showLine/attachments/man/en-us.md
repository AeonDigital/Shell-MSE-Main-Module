# Synopsis

Prints on the screen the entire informational line about the indicated name 
variable.



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

## bool showLineNumbers

- aka       : -sln --showLineNumbers
- default   : 0
- hint      :  
  Indicate whether you want to show the number of rows returned.



&nbsp;

# Returns string

Prints the line of the indicated variable.