# Synopsis

Conta a quantidade de vezes que uma substring aparece em uma string.



&nbsp;

# Parameters

## string substring

- aka       : -ss --substring
- hint      :  
  Substring que será contabilizada.

&nbsp;


## string string

- aka       : -s --string
- hint      :  
  String base para a contagem de substrings.

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

Número de vezes em que a substring aparece na string base.