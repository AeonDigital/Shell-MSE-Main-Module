# Synopsis

Completely erases the contents of the line where the cursor is currently.



&nbsp;

# Parameters

## char toThe

- aka       : -t --toThe
- default   : 
- options   :
    - l: left
    - r: right
- hint      :  
  If set, it erases the contents of the row from the current cursor position to 
  the selected end.


&nbsp;

## bool carriageReturn

- aka       : -cr --carriageReturn
- default   : 0
- hint      :  
  Indicates whether or not to move the cursor to the beginning of the line at 
  the end of the action.



&nbsp;

# Returns void



&nbsp;

# Informations

Learn about other terminal control codes at this location:
http://www.climagic.org/mirrors/VT100_Escape_Codes.html