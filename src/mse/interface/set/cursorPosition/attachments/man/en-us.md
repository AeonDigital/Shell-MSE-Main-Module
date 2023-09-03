# Synopsis

Moves the cursor through the terminal according to the settings passed.



&nbsp;

# Parameters

## char position

- aka       : -p --position
- default   : 
- options   :
    - t: top
    - r: right
    - b: bottom
    - l: left
- hint      :  
  Direction in which the cursor should be moved.

Keep in mind that due to the operation of the terminal, when you perform the 
`enter` of a command The following events occur in the following order:

  1. A new row is created and the cursor is positioned in the first column of 
     this new row.
  2. The command you typed in the line above is executed.
  3. The prompt is rewritten
  4. The cursor is repositioned at the end of the new prompt.

The above information will serve to explain the operation of this action and 
how you should notice the differences between making them within a script 
(location where a new prompt is not created until the end of it) and its use in 
own terminal (which is an inadvisable use of it).

When this same command is executed within a script, the position of the cursor 
will be linked to the last output that occurred, so the cursor does not return 
to the beginning of the line in a `natural` way.


&nbsp;

## int distance

- aka       : -d --distance
- default   : 0
- hint      :  
  How many rows or columns the cursor moves.


&nbsp;

## char anchorPosition

- aka       : -a --anchorPosition
- default   : 
- options   :
    - r: right
    - l: left
- hint      :  
  If set, it will `anchor` the cursor at the maximum position of the chosen 
  limit.




# Returns void



&nbsp;

# Informations

Learn about other terminal control codes at this location:
http://www.climagic.org/mirrors/VT100_Escape_Codes.html