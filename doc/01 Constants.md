# 01 - Constants

## MSE_NULL

Used to represent a null value.

Value = <<<\0null>>>
Check = [[ "${Value}" == "${MSE_NULL}" ]] && echo "yes" || echo "no";

``` shell
  declare -r MSE_NULL="<<<\0null>>>"
```


## MSE_UNDEF

Used to represent a undefined value.

Value = <<<\0undef>>>
Check = [[ "${Value}" == "${MSE_UNDEF}" ]] && echo "yes" || echo "no";

``` shell
  declare -r MSE_UNDEF="<<<\0undef>>>"
```


## MSE_ERROR

Used to override a value that is considered invalid for a property or function 
return.

Value = <<<\0error>>>
Check = [[ "${Value}" == "${MSE_ERROR}" ]] && echo "yes" || echo "no";

``` shell
  declare -r MSE_ERROR="<<<\0error>>>"
```