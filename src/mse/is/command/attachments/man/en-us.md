# Synopsis

From a command that executes a program, it identifies whether it is available 
for use.



&nbsp;

# Parameters

## string value

- aka       : -v --value
- hint      :  
  Command that will be used to test program availability.

It is recommended to use some low-impact command option like the typical `-v` 
or `--version`.



&nbsp;

# Returns bool

`1` if `true` or `0` if `false`.