# Synopsis

Shows a message to the user and allows the user to offer a response.

The result selected/typed by the user will be defined in the variable
global `MSE_PROMPT_RESULT`.



&nbsp;

# Parameters

## assoc arrayConfig

- aka       : -a --arrayConfig
- hint      :  
  Name of the associative array containing the message settings.

If omitted or invalid, the associative array is started 
`MSE_MESSAGE_THEME_CONFIG` using the default theme and this will be used 
for the message formatting.


&nbsp;

## string type

- aka       : --type
- default   : n
- options   : 
  - n   : none
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

**Prompt Messages**

- friendly  | fr  : Friendly. Unimportant question.
- ordinary  | or  : Ordinary. Standard question.
- caution   | ca  : Caution. Issue that requires user attention or has the 
                    potential for some permanent change.
- important | im  : Important. Issue with the potential to cause permanent 
                    change in script processing or on the PC itself.


&nbsp;

## string titleString

- aka       : --titleString
- hint      :  
  Message title.

If `""`, use the default title as per the message `type`, or, leave the title 
line empty in case of message type `none`.


&nbsp;

## string returnType

- aka       : --returnType
- default   : v
- options   : 
  - b  : bool
  - l  : list
  - v  : value
- hint      :  
  Type of value that is expected as a response to the prompt.

If no value is entered, or, if entered an invalid value, use the type `value`.

Below is a brief description of each of the return types.

- b | bool  : expect a Boolean response
- l | list  : expects a response based on a predefined list.
- v | value : accepts any response as valid.

For `bool` types the comparison of values will always be made in insensitive 
case and will ignore glyphs (see parameters below).


&nbsp;

## assoc arrayListOptions

- aka       : -alo --arrayListOptions
- hint      :  
  Name of the associative array containing the valid selection options.

Used only for prompts that have `list` as `returnType`.
For this case, consider that:
  key   : Values that will be effectively set by the user's action.
  value : Collection of labels that can be used to represent this value.
          Separate each label by space.
          It is good practice to enclose each label in quotation marks to allow 
          this the use of names with spaces.

If the value of this parameter is set and is invalid, the `returnType` is 
converted to type `value`.


&nbsp;

## bool caseSensitive

- aka       : -cs --caseSensitive
- default   : 1
- hint      :  
  Indicates when the comparison of valid values should be made in case 
  sensitive.

Used only for prompts that have `list` as `returnType`.

When the `returnType` this value will always be `0`.


&nbsp;

## bool ignoreGlyphs

- aka       : -ig --ignoreGlyphs
- default   : 0
- hint      :  
  Indicate whether the value comparison should ignore the glyphs.

In this case the tested values will be converted to ASCII.
Omit or indicate `0` to make a comparison using the actual value.
Enter `1` to ignore the glyphs in the comparison.

When the `returnType` this value will always be `1`.



&nbsp;

# Returns string

Prints the prompt message as configured past and waits for a user response.



&nbsp;

## Dependencies

- expr