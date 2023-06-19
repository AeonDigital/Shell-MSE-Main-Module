# Synopsis

Counts the lines of the file or string and prints the result



&nbsp;

# Parameters

## string file

- aka       : -f --file
- hint      :  
  Path to the file or string that will be used.



&nbsp;

# Returns int

Total file lines.
Because of the way bash works with respect to handling empty lines at the end 
of files, keep in mind that the line count will only go up to the last 
non-empty line of the indicated file.