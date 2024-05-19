# Synopsis

Counts the number of times a substring appears in a string.



&nbsp;

# Parameters

## string substring

- aka       : -ss --substring
- hint      :  
  Substring that will be counted.

&nbsp;


## string string

- aka       : -s --string
- hint      :  
  Base string for the substring count.

&nbsp;



# Example

``` shell
  mse_str_count_substring "l" "hello world!!"
  3

  mse_str_count_substring "o" "hello world!!"
  2

  mse_str_count_substring "hell" "hello world!!"
  1
```


&nbsp;

# Returns int

Number of times the substring appears in the base string.