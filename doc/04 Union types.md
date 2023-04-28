# 04 - Union Types

You can define a parameter to be represented by more than one type of
variable.  
To do this you must separe any accepted type using the pipe character.
The most commom use of this feature is to declare a nullable type.  
See the exemples below:

- `null|string`     Accepts any string or the "MSE_NULL" value.
- `!string`         Same as above
- `null|int|string` Accepts the "MSE_NULL" value, an integer or an string.
