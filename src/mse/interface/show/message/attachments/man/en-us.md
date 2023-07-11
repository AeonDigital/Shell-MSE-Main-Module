# Synopsis

Shows a message to the user in the terminal.



&nbsp;

# Parameters

## assoc arrayConfig

- aka       : -a --arrayConfig
- hint      :  
  Name of the associative array containing the message settings.

If omitted or invalid, the associative array is started 
"MSE_GLOBAL_SHOW_MESSAGE_CONFIG" using the default theme and this will be used 
for the message formatting.


&nbsp;

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

  - fr  : friendly
  - or  : ordinary
  - ca  : caution
  - im  : important
- hint      :  
  Message type.

Configure the type of message to show to the user.
Each theme has the responsibility to make the necessary adjustments as it 
follows parameter.

Below is a brief description of the meaning of each type and for which 
purpose it should be used.

**Alert Messages**

- none      | n   : Not defined; none
- info      | i   : Generic information.
- attention | a   : Attention.
- warning   | w   : Warning.
- error     | e   : Error in an operation.
- fail      | f   : An operation failed.
- success   | s   : Success in an operation.


**Prompt Messages**

- friendly  | fr  : Friendly. Unimportant question.
- ordinary  | or  : Ordinary. Standard question.
- caution   | ca  : Caution. Issue that requires user attention or has the 
                    potential for some permanent change.
- important | im  : Important. Issue with the potential to cause permanent 
                    change in script processing or on the PC itself.


&nbsp;

## string format

- aka       : --format
- hint      :  
  Style of the message display format (as available by theme).

Each theme can provide multiple message formats, if any, in this parameter 
should be indicated which should be used. Otherwise the format default will be 
used.


&nbsp;

## string titleString

- aka       : --titleString
- hint      :  
  Message title.

If "", use the default title as per the message `type`, or, leave the title 
line empty in case of message type `none`.


&nbsp;

## array bodyLines

- aka       : --bodyLines
- hint      :  
  Name of the array that brings the rows of data to be presented.


&nbsp;

## assoc extraConfig

- aka       : --extraConfig
- hint      :  
  Name of an associative array bringing extra settings. 

Used to expand themes.
These are unforeseen configurations within the default scheme.



&nbsp;

# Returns string

Prints on the screen the message indicated according to the past configuration.