# Synopsis

Prepares an associative array by filling in the keys required to execute a 
`mse_file_read` command.



&nbsp;

# Description

Reading a file allows you to filter and transform the desired parts according 
to the settings you set.

There are four configuration sets that can be used, below is the description of 
each one and which configurations are part of it.
The description of each configuration can be seen in the information about the 
parameters used for this function.


&nbsp;

## Part 01: Text block-level control

Allows you to identify which parts of the document should be returned or
from where it should be ignored.  
Keys defined in this part:

- block_start_check
- block_start_check_args
- block_start_check_args_sep
- block_start_get_first_line
- block_end_check
- block_end_check_args
- block_end_check_args_sep
- block_end_get_last_line
- block_check_invert


&nbsp;

## Part 02: Line-Level Control

Allows you to pass rules that will do line-by-line validation to identify those
that should be returned.  
Keys defined in this part:

- line_check
- line_check_args
- line_check_args_sep
- line_check_invert
- line_check_has_linenumber


&nbsp;

## Part 03: Transformation Controls

Configures transformations to be applied to the lines that will be returned.  
Keys defined in this part:

- line_transform
- line_transform_args
- line_transform_args_sep
- line_transform_has_linenumber


&nbsp;

## Part 04: Other settings
  
General use for settings that do not necessarily fall under any of the above.  
Keys defined in this part:

- line_hide_empty
- line_show_number



&nbsp;

## VALIDATING and TRANSFORMATION FUNCTIONS

When reading a file you can identify the areas of it that should be returned 
and also if any transformation should be made in the lines that will be 
presented. For each of these tasks you must write a function that tells the 
algorithm what to do.

To identify the blocks to be returned, it is necessary to write a validator 
function.
This function aims to analyze the contents of one of the lines of the file and 
test whether or not it should be treated as the beginning of a valid block of 
text.

To identify the blocks to be returned, it is necessary to write a validator 
function.
This function aims to analyze the contents of one of the lines of the file and 
test whether or not it should be treated as the beginning of a valid block of 
text.

Both types of functions have the same parameter signature but differ in 
expected return. The validator functions return a boolean and the transformers 
a string.


### INTERFACE

```
  # Parameters
  ## assoc arrayName
  Name of the associative array that brings the read settings currently in use.

  ## int lineNumber
  Line number.

  ## string lineContent
  Line Contents.

  ## bool isRaw
  Use `0` to inform you that the lines being processed are in "raw" format 
  (just like in the original file).
  Use `1` to inform that there is, in the content of each line, the information 
  of its respective number within the target file.

  ## string args
  Optional argument.


  # Returns bool|string
  `bool` for **validating functions**
  `1` if the test is positive and `0` if it is negative.

  `string` for **transformation functions**
  Returns the transformed line.
```



&nbsp;

# Parameters

## assoc arrayName

- aka       : -a --arrayName
- hint      :  
  Name of the associative array that will be populated.


&nbsp;

## function blockStartCheck

- aka       : --blockStartCheck
- hint      :  
  Name of a validator function to identify the beginning of the valid part of 
  the file.

["block_start_check"]
Indicates the name of a validator function that can identify the beginning of a 
**valid** part of a file that you want to return.

Keeping this value empty will cause the entire contents of the file to be 
considered **returnable**.
On the contrary, by indicating a validator function will cause all lines to be
considered **non-returnable** until reaching one whose test returns positive.

See the **VALIDATING and TRANSFORMATION FUNCTIONS** section.


&nbsp;

## string blockStartCheckArgs

- aka       : --blockStartCheckArgs
- hint      :  
  Sets extra arguments for the function defined in **blockStartCheck**.

["block_start_check_args"]
Allows you to pass some information that will be used in the validator function
as an extra argument.

See the **VALIDATING and TRANSFORMATION FUNCTIONS** section.


&nbsp;

## string blockStartCheckArgsSep

- aka       : --blockStartCheckArgsSep
- hint      :  
  Value separator for the arguments of the **blockStartCheck** function.

["block_start_check_args_sep"]
Indicates the string that should be used to **split** the collection of 
arguments passed in **blockStartCheckArgs**.


&nbsp;

## bool blockStartGetFirstLine

- aka       : --blockStartGetFirstLine
- default   : 0
- hint      :  
  Indicates whether the first valid row of the block should be returned.

["block_start_get_first_line"]
By default, the key line that indicates the beginning of a valid block is not 
returned. Use this parameter to change this behavior.





&nbsp;

## function blockEndCheck

- aka       : --blockEndCheck
- hint      :  
  Name of a validator function to identify the end of the valid part of the 
  file.

["block_end_check"]
Indicates the name of a validator function that can identify the ending of a 
**valid** part of a file.

By keeping this value empty, the file will be returned from the first valid 
line to its last line.
On the other hand, defining a validator function will cause the return of the 
content to stop when it reaches the first line that satisfies the defined 
criterion.

See the **VALIDATING and TRANSFORMATION FUNCTIONS** section.


&nbsp;

## string blockEndCheckArgs

- aka       : --blockEndCheckArgs
- hint      :  
  Sets extra arguments for the function defined in **blockEndCheck**.

["block_end_check_args"]
Allows you to pass some information that will be used in the validator function
as an extra argument.

See the **VALIDATING and TRANSFORMATION FUNCTIONS** section.


&nbsp;

## string blockEndCheckArgsSep

- aka       : --blockEndCheckArgsSep
- hint      :  
  Value separator for the arguments of the **blockEndCheck** function.

["block_end_check_args_sep"]
Indicates the string that should be used to **split** the collection of 
arguments passed in **blockEndCheckArgs**.


&nbsp;

## bool blockEndGetLastLine

- aka       : --blockEndGetLastLine
- default   : 0
- hint      :  
  Indicates whether the last valid row of the block should be returned.

["block_end_get_last_line"]
By default, the key line that indicates the ending of a valid block is not 
returned. Use this parameter to change this behavior.





&nbsp;


## bool blockCheckInvert

- aka       : --blockCheckInvert
- default   : 0
- hint      :  
  Reverses the result of the **blockStartCheck** and **blockEndCheck** 
  functions.

["block_check_invert"]
Indicate whether the result of the functions defined in **blockStartCheck** and 
**blockEndCheck** should be reversed.





&nbsp;


## function lineCheck

- aka       : --lineCheck
- hint      :  
  Name of a validator function that identifies valid lines.

["line_check"]
Indicates the name of a validator function that allows you to identify whether 
the line currently being processed should be returned.

Keeping this value empty will cause all lines within a valid block to be 
returnable.
On the contrary, by indicating a validator function will cause all lines to be 
considered **non-returnable** except those that pass the proposed test.

See the **VALIDATING and TRANSFORMATION FUNCTIONS** section.


&nbsp;

## string lineCheckArgs

- aka       : --lineCheckArgs
- hint      :  
  Sets extra arguments for the function defined in **lineCheck**.

["line_check_args"]
Allows you to pass some information that will be used in the validator function
as an extra argument.

See the **VALIDATING and TRANSFORMATION FUNCTIONS** section.


&nbsp;

## string lineCheckArgsSep

- aka       : --lineCheckArgsSep
- hint      :  
  Value separator for the arguments of the **lineCheck** function.

["line_check_args_sep"]
Indicates the string that should be used to **split** the collection of 
arguments passed in **lineCheck**.



&nbsp;


## bool lineCheckInvert

- aka       : --lineCheckInvert
- default   : 0
- hint      :  
  Reverses the result of the **lineCheck** function.

["line_check_invert"]
Indicate whether the result of the function defined in **lineCheck** should be 
reversed.



&nbsp;


## bool lineCheckHasLineNumber

- aka       : --lineCheckHasLineNumber
- default   : 0
- hint      :  
  Indicates when line number information is present in line content.

["line_check_has_linenumber"]
Indicates when line number information is present in line content.





&nbsp;

## function lineTransform

- aka       : --lineTransform
- hint      :  
  Name of the transformer function that will be used on valid lines.

["line_transform"]
Indicates the name of a function that will promote a transformation on the 
target line, allowing it to be seen differently from what is currently 
registered in the file.

No changes will be made to the file itself.

See the **VALIDATING and TRANSFORMATION FUNCTIONS** section.


&nbsp;

## string lineTransformArgs

- aka       : --lineTransformArgs
- hint      :  
  Sets extra arguments for the function defined in **lineTransform**.

["line_transform_args"]
Allows you to pass some information that will be used in the transformation
function as an extra argument.

See the **VALIDATING and TRANSFORMATION FUNCTIONS** section.


&nbsp;

## string lineTransformArgsSep

- aka       : --lineTransformArgsSep
- hint      :  
  Value separator for the arguments of the **lineTransform** function.

["line_transform_args_sep"]
Indicates the string that should be used to **split** the collection of 
arguments passed in **lineTransform**.



&nbsp;


## bool lineTransformHasLineNumber

- aka       : --lineTransformHasLineNumber
- default   : 0
- hint      :  
  Indicates when line number information is present in line content.

["line_transform_has_linenumber"]
Indicates when line number information is present in line content.





&nbsp;

## bool lineHideEmpty

- aka       : --lineHideEmpty
- default   : 0
- hint      :  
  Indicate whether empty lines should be removed.

["line_hide_empty"]
Indicate whether empty lines should be removed.



&nbsp;

## bool lineShowNumber

- aka       : --lineShowNumber
- default   : 0
- hint      :  
  Indicate whether to display the number of each line.

["line_show_number"]
Indicate whether to display the number of each line.



&nbsp;

# Returns void