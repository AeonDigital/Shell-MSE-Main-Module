# Synopsis

Fills a string with the indicated character.



&nbsp;

# Description

Adds to the original string a total of `pad` characters to the left or right 
(as per `position`) until it has the total characters indicated at at `length`.



&nbsp;

# Parameters

## string string

- aka       : -s --string
- hint      :  
  String that will be populated.

&nbsp;


## char pad

- aka       : -p --pad
- hint      :  
  String that will be used to populate.

&nbsp;


## int length

- aka       : -l --length
- hint      :  
  Total characters that the final string should have.

&nbsp;


## char position

- aka       : -pos --position
- options   :
  - l: left
  - r: right
- hint      :  
  Position in which the filling should be done.

&nbsp;



# Example

``` shell
  mse_str_pad "32" "0" "5" "l"
  00032
```


&nbsp;

# Returns string

Returns the changed string.