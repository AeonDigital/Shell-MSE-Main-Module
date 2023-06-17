# 05 Function Manual

To describe a function to allow it to be correctly interpreted by _myShellEnv_ 
and its definitions to be applied to validate its parameters and also to help 
the user with a manual, you need to create a MarkDown file named _man.md_ that 
follows the guidelines mentioned below.



&nbsp;

## The Synopsys Section

In the first line of the document you MUST declare the _Synopsys_ header.
This section is used to provide a brief introduction to the function. This
text should not be much longer than one or two lines.



&nbsp;

## The Description Section

Optionally, after the _Synopsis_ section, you CAN declare a new called 
_Description_ with a complete function information. Use this space for a long 
description.



&nbsp;

## The Parameters Section

If the function uses parameters, you MUST declare a section named 
_Parameters_.  
Within this section, each parameter will receive a subsection containing its 
rules for validation, usage, and its own description.  

To correctly declare each parameter follow the rules mentioned below.



&nbsp;

### Declaration of a parameter subsection

Each parameter must be declared as a subsection of the _Parameters_ section.  
The declaration of the section corresponding to each parameter must follow the 
following specification:


&nbsp;

**Meta-model**

```
  ## [[type]] [[name]]
  - [[properties]]

  [[description]]
```

- [[type]]  
  MUST contain the accepted data type/s for this parameter.  
  Check more information about types in _Types.md_.

- [[name]]  
  Must contain the cononical name of this parameter.  
  This is the name that´s will be used with the hints.

- [[properties]]  
  A list of the validation properties and fill hints for this parameter.

- [[description]]  
  Full description of parameter usage.


&nbsp;

### Parameter properties

In the first non-empty line after declaring the subsection of a parameter, you 
MUST declare a list using MarkDown, containing the validation properties of 
the parameter. 

Each property must be declared on one line and its value must be described 
after the first character of _colon_ (:) after its name.


&nbsp;

#### aka

Brings the names that allow you to identify this parameter on the command line. 
Typically a short form is given in which the name is abbreviated (-s) and a 
long form where the parameter name is used in full (--longName).

Each valid name must be separated from the other by one or more space 
characters.

If it is not defined the parameter can only be used using the positional 
declaration, that is, the first argument will correspond to the first parameter 
and so on.

Remembering that the user CAN ALWAYS use the positional declaration form and 
that the named format will only be able to be used when ALL parameters have 
this property declared.


&nbsp;

**Example**

```
  # Parameters
  ## string value
  - aka : -v --value

  ...
```


&nbsp;

#### default

You CAN provide a default value for this parameter. Such value will be assumed 
by the same whenever it is not evoked by the user.

The presence or absence of this property indicates when a parameter is 
required. When it has a default value, then the absence of its declaration when 
evoking the function will be supplied by the default value.

It is good practice to always enclose values in single or double quotation 
marks.


&nbsp;

**Example**

```
  # Parameters
  ## string value
  - default : "use this value if this parameter is not set"

  ...
```


&nbsp;

#### min

Your understanding of usage differs depending on the type of value being used.

For numeric values, sets the smallest value that the passed parameter should 
have, for text type values, indicates the smallest number of 
characters that sentence should have and for objects of type array defines the 
minimum number of elements it must have.

For a summary related to each valid type, see the summary below:

- `bool`        : aways set to **0**
- `int`         : defined by the developer.
- `char`        : aways set to **1**
- `charDecimal` : aways set to **1**
- `charHex`     : aways set to **1**
- `charOctal`   : aways set to **1**
- `string`      : defined by the developer.
- `array`       : defined by the developer.
- `assoc`       : defined by the developer.



&nbsp;

#### max

Your understanding of usage differs depending on the type of value being used.

For numeric values, sets the largest value that the passed parameter should 
have, for text type values, indicates the highest number of 
characters that sentence must have and for objects of type array defines the 
maximum number of elements it must have.

For a summary related to each valid type, see the summary below:

- `bool`        : aways set to **1**
- `int`         : defined by the developer.
- `char`        : aways set to **1**
- `charDecimal` : aways set to **1**
- `charHex`     : aways set to **1**
- `charOctal`   : aways set to **1**
- `string`      : defined by the developer.
- `array`       : defined by the developer.
- `assoc`       : defined by the developer.



&nbsp;

#### options

Use this property to declare a list of options of valid values for this 
parameter. To do this, create a sublist of options according to the template 
below and remember to indent the sublist with two spaces.

By default, the match between typed values, labels, and valid values occurs in 
case-insensitive. If you want the comparison of the entered value to be done in 
a case-sensitive way just declare this property as **option cs**


&nbsp;

**Meta-models**

```
  # Parameters
  ## string type
  - options:
    - [[real_value]]: [[labels]]

  ...

  ## string typeCaseSensitive
  - options cs:
    - [[real_value]]: [[labels]]
```

- [[real_value]]
  This is the value that will actually be used internally by the function and 
  that corresponds to any label correlated with it.  
  You must separate this value from the labels by using a colon character
- [[labels]]
  A collection of labels (separated by space) that can be used by the user to 
  select the corresponding actual value.  


&nbsp;

**Examples**

```
  # Parameters
  ## bool confirm
  - options:
    - 0: no n not cancel
    - 1: yes y ok confirm

  ...

  ## int direction
  - options:
    - 0: u up t top
    - 1: l left
    - 2: d down b bottom
    - 3: r right

  ...

  ## string answer
  - options:
    - "africa"        : 1 af
    - "antarctica"    : 2 an
    - "asia"          : 3 as
    - "europe"        : 4 eu
    - "north america" : 5 na
    - "oceania"       : 6 oc
    - "south america" : 7 sa

  ...
  
```



&nbsp;

#### hint

Formulate a fill hint to provide to the user at the time they should declare 
this parameter. You can use more than one line of text if necessary, but try to 
be brief.


&nbsp;

**Examples**

```
  # Parameters
  ## string oneLine
  - hint: one line type hint.

  ...

  ## string multiLines
  - hint:
    first line of this hint.
    second line.
    remember to keep the lines indented
  
  ...
```


&nbsp;

### Parameter description

After declaring the parameter's property list, you can describe it verbatim.
This same information (along with the properties information) will be used as a 
fill hint for the user.



&nbsp;

## The Examples Section

Optionally, you CAN declare a section named _Examples_ containing one or more  
examples of using the function.



&nbsp;

## The Returns Section

You MUST declare a section called _Returns_. It will contain what is expected  
to be obtained in return for the execution of the function.
Use the template below to correctly define this section:

```
## Returns [[type]]

[[description]]
```

- [[type]]  
  Indicates the type/s of return that is expected when executing the function.
- [[description]]
  Details that influence the processing return or how it should be interpreted 
  by the user.

By default the result is printed with the "echo" command but it will be
stored in "MSE_LAST_FUNCTION_RETURN" global variable too.



&nbsp;

## Another Sections

You CAN declare any other section in order to provide informations not 
relationed with the sections above.