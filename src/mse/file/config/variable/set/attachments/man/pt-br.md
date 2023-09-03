# Synopsis

Permite editar variáveis armazenadas em arquivos de configuração padrão ou em 
scripts preparados para tal.



&nbsp;

# Description

Arquivos de configuração padrão usa valores definidos em pares do tipo chave/
valor e que podem ter suas configurações separadas logicamente por seções.

**Exemplo:**

``` any.cfg
  [SectionName]
  VARNAME   = VALUE
```

Se o arquivo de configuração estiver mal formatado e existir dentro da mesma
seção uma variável duplicada, apenas a primeira será levada em consideração.

Outros arquivos, tipo scripts, precisam estar preparados para serem editados 
usando esta função. Tal preparo é a marcação das zonas editáveis. No caso, cada 
variável que se deseja poder alterar desta forma deve estar identificada 
conforme o modelo abaixo:

**Exemplo:**

``` any.cfg
  # [[INI-MSE_AVAILABLE_MODULES]]
  declare -gA MSE_AVAILABLE_MODULES
  # [[END-MSE_AVAILABLE_MODULES]]
```

Importante notar que as marcações `INI` e `END` DEVEM estar comentadas e no 
início da linha e o nome de cada seção deve ser idêntico à variável que ela 
está habilitando a edição.



&nbsp;

# Parameters

## string file

- aka       : -f --file
- hint      :  
  Caminho até o arquivo de configuração alvo.


&nbsp;

## bool configFile

- aka       : -cf --configFile
- hint      :  
  Indique `0` para arquivos de configuração ou `1` para scripts.


&nbsp;

## char commentChar

- aka       : -c --commentChar
- hint      :  
  Caracter usado para comentar as linhas dentro do arquivo alvo.


&nbsp;

## string section

- aka       : -s --section
- hint      :  
  Nome da seção alvo em que a variável alvo está. Omita para ler todo o arquivo.


&nbsp;

## char varType

- aka       : -vt --varType
- options   :
  - s : sc scalar
  - a : ar array
  - A : as assoc
- hint      :  
  Tipo de variável que está sendo escrita.

Especifica o tipo de variável alvo da ação.
- Use `scalar` para variáveis simples.
- Use `array` para arrays unidimencionais.
- Use `assoc` para arrays associativos.


&nbsp;

## string varName

- aka       : -vn --varName
- hint      :  
  Nome da variável alvo.


&nbsp;

## string|array|assoc varValue

- aka       : -vv --varValue
- hint      :  
  Valor da variável.

Para variáveis do tipo `array` ou `assoc` informe o nome de um array de mesmo 
tipo que contenha os valores que serão usados.


&nbsp;

## char mode

- aka       : -m --mode
- options   :
  - a: add adicionar
  - d: del delete deletar
  - m: mod modify modificar
  - c: com comment comentar
  - u: unc uncomment descomentar
- hint      :  
  Modo de escrita que será efetuada.

Permite definir o modo em que a escrita será feita.

**Use apenas para edição de arquivos de configuração padrão.**


&nbsp;

## char position

- aka       : -p --position
- default   : a
- options   :
  - p: p prepend
  - a: a append
- hint      :  
  Indica a posição em que a variável deve ser adicionada.
  Necessário apenas para o mode `a`.

Se selecionado `prepend` a variável será adicionada no início do arquivo/seção 
e se for selecionado `append` a variável será adicionada ao final do arquivo/
seção.

**Use apenas para edição de arquivos de configuração padrão.**



&nbsp;

# Returns bool

`1` se `true` ou `0` se `false`.