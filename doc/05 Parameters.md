# 05 - Parameters

Each parameter of a function can be defined using the properties below.
All properties are used to validate the parameter and to guide the user
with the completion hint.

- `type`        [ string ]  
  The name of the type of the expected value.  
  You can use any type descripted in "Types" section (except "void")

- `name`        [ string ]  
  The name of the parameter.

- `required`    [ bool ]  
  Indicates whether the parameter is mandatory for the function to work.

- `default`     [ same type of "type" ]  
  Defines a default value for this parameter if it has not been defined by
  the user. Constant value "MSE_UNDEF" should be used in case the default
  value should not be used.

- `min`         [ int ]  
  Valid only to "string" and "int" types.
  For "string" indicates the smallest length the value should be.
  for "int" indicates the smallest size the numeral must have.

- `max`         [ int ]  
  Valid only to "string" and "int" types.
  For "string" indicates the largest length the value should be.
  for "int" indicates the largest size the numeral must have.

- `options`     [ string ]  
  Represents a collection of valid options for the user to select.
  Fill this key with multiple rows of data where each row represents a 
  value and a set of captions associated with it.
  Each value must be separated from the respective captions using the ":" 
  character, and each caption must be separated from the other using the 
  "," character.

  Ex:
  ["param.2.options"]="
  ["param.2.options"]+="1: yes, y, ok, confirm\n"
  ["param.2.options"]+="0: no, n, cancel\n"

- `description` [ string ]  
  Description of the parameter

