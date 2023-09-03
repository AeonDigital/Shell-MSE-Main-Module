# Synopsis

Identifies/Enables/Disables the UTF-8 mode of the `bash` terminal.



&nbsp;

# Parameters

## string action

- aka       : -a --action
- default   : check
- options   : 
  - check : c
  - on    : 1
  - off   : 0
- hint      :  
  Action to be taken.

If it is omitted, or, if `check` will try to draw on the screen the unicode 
character `White Horse` of the chess `♘`.
The conference must be done visually by the human operator.

Indicating `on` or `off` will respectively enable or disable your UTF-8 
terminal.



&nbsp;

# Returns string

In any use case will try to print the unicode character `white horse` of the 
chess `♘` for visual user conference on the current state of this configuration.