# Synopsis

Returns the number of the first and last lines involved in the valid block of 
reading the file.



&nbsp;

# Parameters

## string target

- aka       : -t --target
- hint      :  
  Path to the target file or string.


&nbsp;

## char commentChar

- aka       : -c --commentChar
- hint      :  
  Character used to comment out lines within the target file.


&nbsp;

## bool isConfigFile

- aka       : -icf --isConfigFile
- default   : 0
- hint      :  
  Identifies whether it is a configuration file or another type.

This changes the way the section is searched.
Use `0` for files of any type or `1` when it is a default setting (where 
sections are defined using the [section] notation).


&nbsp;

## string startSection

- aka       : -s --startSection
- hint      :  
  Name or identifier of the beginning of the section.

For files in general, the section will be identified by a line whose value is 
same as indicated. For configuration files, enter only the name of the target 
section.
Ignore or set `""` for this parameter if you want to use the entire file.


&nbsp;

## string endSection

- aka       : -e --endSection
- hint      :  
  Section end identifier.

For files in general, the end of the section will be identified by a line whose
value is equal to the indicated. For configuration files, this value should be 
left blank because the section ends when starting a new one or at the end of 
the own file.


&nbsp;

## bool ignoreTrailingEmptyLines

- aka       : -itel --ignoreTrailingEmptyLines
- default   : 0
- hint      :  
  Indicate whether the empty lines at the end of the target section should be 
  considered.

Use `0` to count the empty rows at the end of the target section and `1` if 
you want such lines to be ignored.




&nbsp;

# Returns string

Prints the start and end line number of the target section separated by a 
space. Nothing is returned if the target section or file is not found.