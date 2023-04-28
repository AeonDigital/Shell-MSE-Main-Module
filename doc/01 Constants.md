# 01 - Constants

## MSE_NULL

Used to represent a null value.

Value = <<<\0null>>>
Check = [ $(printf '%b' '<<<\0null>>>' | wc -c) = 11 ] && echo "s" || echo "n"

``` shell
  declare -r MSE_NULL="<<<\0null>>>"
```


## MSE_UNDEF

Used to represent a undefined value.

Value = <<<\0undef>>>
Check = [ $(printf '%b' '<<<\0undef>>>' | wc -c) = 12 ] && echo "s" || echo "n"

``` shell
  declare -r MSE_UNDEF="<<<\0undef>>>"
```