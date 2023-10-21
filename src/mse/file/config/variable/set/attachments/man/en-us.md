# Synopsis

Allows you to edit variables stored in default configuration files or in 
scripts prepared for this.



&nbsp;

# Description

Default configuration files use values defined in key/value pairs and that can 
have their settings logically separated by sections.

**Example:**

``` any.cfg
  [SectionName]
  VARNAME   = VALUE
```

If the configuration file is badly formatted and exists within it section a 
duplicate variable, only the first one will be taken into account.

Other files, such as scripts, need to be prepared to be edited using this 
function. Such preparation is the marking of editable zones. In this case, each 
variable that you want to be able to change in this way must be identified as 
per the model below:

**Example:**

``` any.cfg
  # [[INI-MSE_AVAILABLE_MODULES]]
  declare -gA MSE_AVAILABLE_MODULES
  # [[END-MSE_AVAILABLE_MODULES]]
```

It is important to note that the `INI` and `END` markings MUST be commented out 
and in the beginning of the line and the name of each section must be identical 
to the variable it is in is enabling editing.



&nbsp;

# Parameters

## file file

- aka       : -f --file
- hint      :  
  Path to the target configuration file.


&nbsp;

## bool isConfigFile

- aka       : -icf --isConfigFile
- hint      :  
  Identifies whether it is a configuration file or another type.

This changes the way the section is searched.
Use `0` for files of any type or `1` when it is a default setting (where 
sections are defined using the [section] notation).


&nbsp;

## char commentChar

- aka       : -c --commentChar
- hint      :  
  Character used to comment out lines within the target file.


&nbsp;

## string section

- aka       : -s --section
- hint      :  
  Name of the target section where the target variable is. Omit to read the 
  entire file.


&nbsp;

## char varType

- aka       : -vt --varType
- options   :
  - s : sc scalar
  - a : ar array
  - A : as assoc
- hint      :  
  Type of variable being written.

Specifies the target variable type of the action.
- Use `scalar` for simple variables.
- Use `array` for one-dimensional arrays.
- Use `assoc` for associative arrays..


&nbsp;

## string varName

- aka       : -vn --varName
- hint      :  
  Target variable name.


&nbsp;

## string|array|assoc varValue

- aka       : -vv --varValue
- hint      :  
  Variable value.

For variables of type `array` or `assoc` enter the name of an array of same 
type that contains the values that will be used.


&nbsp;

## char mode

- aka       : -m --mode
- options   :
  - a: add
  - d: del delete
  - m: mod modify
  - c: com comment
  - u: unc uncomment
- hint      :  
  Writing mode that will be done.

Allows you to set the mode in which the writing will be done.

**Use only for editing default configuration files.**


&nbsp;

## char position

- aka       : -p --position
- default   : a
- options   :
  - p: prepend
  - a: append
- hint      :  
  Indicates the position at which the variable should be added.
  Required only for the `a` mode.

If selected `prepend` the variable will be added at the beginning of the file/
section and if `append` is selected, the variable is added to the end of the 
file/section.

**Use only for editing default configuration files.**



&nbsp;

# Returns bool+

`1` if `true` or `0` if `false`.