# 03 - Types

Essentially, Bash variables are character strings, but, depending on context,
Bash permits arithmetic operations and comparisons on variables.
therefore, to simulate different types, follow the guidelines below.

Obs:
By default it is ideal that you always use the parameters enclosed in quotes.


`null | !`  
Accepts the value of the const `MSE_NULL`.  
Often used in conjunction with a type union operator to represent a value
that may also be null.  
Check for `Union Types` section.

`bool`  
Accepts only values ​​`0` or `1`.

`int`  
Any integer value.  
The maxvalue accepts depends on your CPU architecture.

`float`  
Any float value (as string).  
The maxvalue accepts depends on your CPU architecture.

`char`  
Accepts only one char (UTF-8).

`charDecimal`  
Accepts only one char in decimal format (including multibyte values).

`charHex`  
Accepts only one char in hexadecimal format (including multibyte values).

`charOctal`  
Accepts only one char in octal format (including multibyte values).

`string`  
Accepts any sequence of chars.

`array`  
The name of a declared array in the current scope.

`assoc`  
The name of a declared associative array in the current scope.

`regex`  
Any regex pattern valid to use with the `test` steatment.

`function`  
The name of a declared function in the current scope.

`mixed`  
Any type described above.

`void`  
Use only for `return` declaration.  
Indicates that the function does not returns any printable results.