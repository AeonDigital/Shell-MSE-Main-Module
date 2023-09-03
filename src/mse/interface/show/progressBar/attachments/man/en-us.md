# Synopsis

Mostra uma barra de progresso no terminal.



&nbsp;

# Parameters

## assoc arrayConfig

- aka       : -a --arrayConfig
- hint      :  
  Name of the associative array containing the message settings.

If omitted or invalid, the associative array is started 
`MSE_PROGRESSBAR_THEME_CONFIG` using the default theme and this will be used 
for the message formatting.


&nbsp;

## string format

- aka       : --format
- hint      :  
  Progress bar presentation format style (as available by theme).

Each theme can provide multiple bar formats, if any, in this parameter should 
be indicated which should be used. Otherwise the format default will be used.


&nbsp;

## int barMaxCharLength

- aka       : --barMaxCharLength
- hint      :  
  Total size of the progress bar (in characters).

The theme used can modify this value according to the rules themselves.


&nbsp;

## int barAtualProgress

- aka       : --barAtualProgress
- default   : 0
- min       : 0
- max       : 100
- hint      :  
  Current percentage of progress progress (from 0 to 100).

Invalid values will revert to `0`.


&nbsp;

## char infoAlign

- aka       : --infoAlign
- default   : r
- options   :
  - r: right
  - l: left
- hint      :  
  Positioning of the information area in relation to the progress bar.


&nbsp;

## string infoData

- aka       : --infoData
- hint      :  
  Information that should be used to fill in the information area.

If the advance percentage is to appear as well, this information will appear 
after the same.



&nbsp;

# Returns string

Prints the progress bar on the screen as per the past configuration.