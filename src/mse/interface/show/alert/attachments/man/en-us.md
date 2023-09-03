# Synopsis

Shows an alert message to the user using the theme they are currently in 
configured in the variable `MSE_MESSAGE_THEME_NAME`.



&nbsp;

# Parameters

## string type

- aka       : --type
- default   : n
- options   : 
  - n   : none
  - i   : info
  - a   : attention
  - w   : warning
  - e   : error
  - f   : fail
  - s   : success
- hint      :  
  Message type.


&nbsp;

## string titleString

- aka       : --titleString
- hint      :  
  Message title.


&nbsp;

## array bodyLines

- aka       : --bodyLines
- hint      :  
  Name of the array that brings the rows of data to be presented.



&nbsp;

# Returns string

Prints on the screen the message indicated according to the past configuration.