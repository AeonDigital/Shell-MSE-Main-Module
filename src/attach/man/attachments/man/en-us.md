# Synopsis

Expõe na tela um manual de função em formato `MarkDown`.



&nbsp;

# Description




&nbsp;
    
# Parameters

## function|file target

- aka       : -t --target
- hint      :  
  Nome da função ou caminho completo até o arquivo do manual.


&nbsp;

## string rules

- aka       : -r --rules
- default   : 
- hint      : 
  Regras de como exibir o manual.

Se nenhuma informação for passada para este parametro o manual será exibido na 
integra.

Se optar por usar este parametro, você pode especificar precisamente quais 
itens do manual devem ser mostrados usando a seguinte notação:

```
sectionName[ sectionComponents ]
```

`sectionName`
No lugar de `sectionName` você deve indicar o nome da seção que será mostrada. 
Você pode se referir a todas as seções existentes usando o caracter `*`.
Seções não existentes serão ignoradas.

As seguintes seções são esperadas na maioria dos manuais:
- synopsis
- description
- parameters
- returns
- examples
- dependencies


`sectionComponents`
Após o nome de cada uma das seções você pode colocar uma subcoleção de regras 
dentro de colchetes.

Dentro dos colchetes você pode definir um ou mais dos seguintes itens:
- title
- summary
- description
- subsections
- type [ apenas para a seção `returns` ]


`parameters`
Assim como as demais seções, a seção `parameters` pode possuir um `component` 
chamado `subsections`. Neste caso, ela refere-se ao espaço reservado onde 
constam as regras de cada parametro relatado no manual.

Você pode especificar que tipo de informação deseja retornar sobre os parametros usando uma notação aninhada conforme o exemplo abaixo:

```
parameters[ subsections[ *[ type, name, default, aka ] ] ]
```

No exemplo acima serão retornados os dados `type`, `name`, `default` e `aka`
de todos os parametros.
Caso o dado requerido não se aplique para o parametro, o mesmo será ignorado.


---


Com esta notação você pode compor o manual conforme desejar.
Usando "," você pode descrever várias regras distintas para cada seção.

O exemplo abaixo listaria apenas o nome de cada seção

```
*[title]
```

Já o exemplo abaixo listaria apenas a sinopse, algumas regras de todos os 
parametros além do tipo de retorno esperado.

```
synopsis[summary], parameters[ subsections[ *[ type, name, default, aka, hint ] ] ], returns[type, summary]
```


---


*Importante*

A ordem das definições será seguida na exposição do manual.




&nbsp;

# Returns string

Printa na tela o manual alvo conforme as configurações selecionadas.