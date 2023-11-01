# Synopsis

Converts the target file of the current encoding to UTF-8.



&nbsp;

# Parameters

## string file

- aka       : -f --file
- hint      :  
  Path to the file that will be converted.


&nbsp;

## string newFile

- aka       : -nf --newFile
- default   : 
- hint      :  
  Path to the new file generated from the original.

If no file is defined, the original is overwritten.



&nbsp;

# Returns bool

`1` if the conversion is performed otherwise `0`.



&nbsp;

## Dependencies

- iconv