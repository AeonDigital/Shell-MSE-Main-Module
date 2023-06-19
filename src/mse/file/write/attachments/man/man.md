# Synopsis

Writes one or more lines of data to the target file at the indicated position.



&nbsp;

# Parameters

## string file

- aka       : -f --file
- hint      :  
  Path to the target file.


&nbsp;

## array newLines

- aka       : -n --newLines
- hint      :  
  Name of the array containing the new lines of data.


&nbsp;

## string mode

- aka       : -m --mode
- default   : a
- options   :
  - p: p prepend
  - a: a append
  - r: r replace
  - d: d delete
- hint      :  
  Writing mode that will be done.

Allows you to set the mode in which the writing will be done.

- prepend : Adds the new lines at the beginning of the file.
- append  : Adds the new lines at the end of the file.
- replace : Adds the new lines in replacement of an existing line.
- delete  : Deletes the indicated line or lines.


&nbsp;

## int|string|function targetLine

- aka       : -t --targetLine
- hint      :  
  Target line number of this action.
  Intervals (of lines) in which the content will be written.
  Function responsible for returning the target line number or the ranges in 
  that writing will be done.

If this parameter is not set, the selected mode will configure it accordingly: 
The indications below:

- prepend : equivalent to setting the value `1`.
- append  : equivalent to setting the number of the last line of the file.
- replace : nothing will be done.
- delete  : nothing will be done.

[int]
The writing will take place on the number line indicated.


[string]
In this case, the content of the string must be 2 integers separated by a space 
(such as the result of mse_file_getBoundaryLineNumbers).

**example**  
Receiving the values "10 15" will totally replace the contents of 10 lines, 
11, 12, 13, 14, and 15 for the new content to be added.


[function]
Must be the name of a function capable of returning a **int** or **string** 
value as per the rules defined above.


In either case, if you do not receive valid integer values (between 1 and the
number of the last line of the file as it is currently saved) the action 
nothing will be done.




&nbsp;

# Returns bool

Print `0` if any failure occurs or `1` if writing occurred without fail.