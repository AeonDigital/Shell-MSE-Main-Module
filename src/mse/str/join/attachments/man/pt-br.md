# Synopsis

Concatena os itens de um array usando uma string especial indicada.



&nbsp;

# Parameters

## string glue

- aka       : -g --glue
- hint      :  
  String que será usada como `cola`.

&nbsp;


## array arrayName

- aka       : -a --arrayName
- hint      :  
  Nome do array.

&nbsp;



# Example

``` shell
  myArray=("2022" "12" "22")
  mse_str_join "-" "myArray"
  2022-12-22
```


&nbsp;

# Returns string

Printa os valores do array separados pela string definida como `cola`.