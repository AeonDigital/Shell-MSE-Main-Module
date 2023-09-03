# Synopsis

Replaces one or more `placeholder` in a string with the given values.



&nbsp;

# Description

The `placeholders` need to be defined using the following pattern: [[PHNAME]]
After the third argument, new argument pairs can be passed to be used in place 
of a new placeholder within the same original string.



&nbsp;

# Parameters

## string string

- aka       : -s --string
- hint      :  
  Original string that contains the `placeholders` and that will be returned 
  with the appropriate substitutions.

&nbsp;


## string placeHolderName

- aka       : -phn --placeHolderName
- hint      :  
  Name of a placeholder to be replaced (enter the name without the square 
  brackets).

&nbsp;


## string placeHolderValue

- aka       : -phv --placeHolderValue
- hint      :  
  Value to use in place of the placeholder.

&nbsp;



# Example

``` shell
  mse_str_replacePlaceHolder "my name is [[NAME]]" \
    "NAME" "Katze"
  my name is Katze

  mse_str_replacePlaceHolder "my name is [[NAME]] and i living in [[COUNTRY]]" \
    "NAME" "Katze" \
    "COUNTRY" "Brasil"
  my name is Katze and i living in Brasil
```


&nbsp;

# Returns string

Prints the original string with the replacement of the placeholders by the new 
indicated contents.