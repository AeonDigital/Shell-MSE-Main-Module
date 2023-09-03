# Synopsis

Joins the items in an array using a special string indicated.



&nbsp;

# Parameters

## string glue

- aka       : -g --glue
- hint      :  
  String that will be used as `glue`.

&nbsp;


## array arrayName

- aka       : -a --arrayName
- hint      :  
  Array name.

&nbsp;



# Example

``` shell
  myArray=("2022" "12" "22")
  mse_str_join "-" "myArray"
  2022-12-22
```


&nbsp;

# Returns string

Prints the array values separated by the string set at `glue`.