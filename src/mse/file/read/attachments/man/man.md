# Synopsis

Reads a file or string line by line.



&nbsp;

# Description

Returns all lines that match the definitions indicated in the read settings.



&nbsp;

# Parameters

## string target

- aka       : -t --target
- hint      :  
  Path to the file or string that will be read.


&nbsp;

## assoc arrayName

- aka       : -a --arrayName
- hint      :  
  Name of the associative array that brings the settings for reading the file.

To configure this associative array, you can use the **mse_file_prepareRead** 
function.


&nbsp;

## bool removeEmptyLines

- aka       : -rel --removeEmptyLines
- default   : 0
- hint      :  
  Indicate whether you want to remove the empty lines.

Use `0` to show all lines including empty ones or `1` to remove them.
This setting rewrites the **line_hide_empty** key in configuration array.


&nbsp;

## bool showLineNumbers

- aka       : -sln --showLineNumbers
- default   : 0
- hint      :  
  Indicate whether you want to show the number of selected lines.

Use `0` to hide and `1` to show the number of selected lines.
This setting rewrites the **line_show_number** key in configuration array.

The line number will be returned as the first information and will be separated from the beginning of the text by a `#` character.



&nbsp;

# Returns string

Collection of selected lines when reading the file according to the criteria 
indicated.