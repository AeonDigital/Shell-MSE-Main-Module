# 02 - Global variables

## MSE_LAST_FUNCTION_RETURN

Stores the last function return value.
This value is defined to "MSE_UNDEF" imediatly before the function starts.

``` shell
  declare MSE_LAST_FUNCTION_RETURN="${MSE_UNDEF}"
```


## MSE_LAST_FUNCTION_ERR_CODE

Stores the last function error code.
The "0" value indicates that´s no error ocourred.
This value is defined to "0" imediatly before the function starts.

``` shell
  declare MSE_LAST_FUNCTION_ERR_CODE="0"
```


## MSE_LAST_FUNCTION_ERR_MESSAGE
Stores the last function error message.
This value is defined to "" imediatly before the function starts.

``` shell
  declare MSE_LAST_FUNCTION_ERR_MESSAGE=""
```