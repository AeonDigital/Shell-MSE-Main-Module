# Synopsis

Prints the 256 characters present in the current font of your terminal.



&nbsp;

# Parameters

## char outputFormat

- aka       : -o --outputFormat
- default   : t
- options   : 
  - t : table
  - c : concise
  - d : detailed
- hint      :  
  Indicates the output format of the data.

The following options are available:

- t : Full table of characters from 0 to 255 containing hexadecimal headers.
      Each line contains 16 characters.
- c : Table of characters from 33 to 255 without headers.
      Each line contains 16 characters.
- d : Listing of the characters showing information of their representations in 
      decimal, hex and octal.


&nbsp;

## int fromChar

- aka       : -f --fromChar
- default   : 33
- min       : 33
- max       : 255
- hint      :
  Index of the first character in the list.
  Used only if "outputFormat" is `d`.



&nbsp;

## int toChar

- aka       : -t --toChar
- default   : 255
- min       : 33
- max       : 255
- hint      :
  Index of the last character in the list.
  Used only if "outputFormat" is `d`.




&nbsp;

# Example

``` shell
  mse_font_show_characters 'code' 50 70
  mse_font_show_characters 'code' | less -r
```



&nbsp;

# Returns string

Prints the attribute options on the screen according to the presentation format 
selected.