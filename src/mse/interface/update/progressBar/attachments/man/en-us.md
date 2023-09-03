# Synopsis

Refreshes the progress bar on the prompt line (initiated by the command
`mse_interface_show_progressBar`).



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

## int barAtualProgress

- aka       : --barAtualProgress
- default   : 0
- min       : 0
- max       : 100
- hint      :  
  Current percentage of progress progress (from 0 to 100).

Invalid values will revert to `0`.


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