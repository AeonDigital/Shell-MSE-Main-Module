# Synopsis

Shows a message to the user and stops the script from running until he types a 
key.



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

Configure the type of message to show to the user.


&nbsp;

## string titleString

- aka       : --titleString
- hint      :  
  Message title.

If `""`, use the default title as per the message `type`, or, leave the title 
line empty in case of message type `none`.



&nbsp;

# Returns string

Prints the indicated message on the screen and waits for the user to preciona 
any key to proceed.