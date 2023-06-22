# Synopsis

Prints the variables from the indicated configuration file.



&nbsp;

# Description

Prints the variables from the indicated configuration file.
Commented and empty lines will not be shown.



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

## bool showLineNumbers

- aka       : -sln --showLineNumbers
- default   : 0
- hint      :  
  Indicate whether you want to show the number of rows returned.



&nbsp;

# Returns int

Prints all variables in the file as indicated configuration.