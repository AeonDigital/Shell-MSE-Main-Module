# Synopsis

Activates a spinner that aims to give the user the perception that a process is 
in progress. 

This function activates the `+m` setting of bash that causes all processes to 
run detached.

To interrupt the spinner just evoke this function again; In this case the `+m` 
setting will be disabled.



&nbsp;

# Parameters

## array spinnerPhases

- aka       : -sp --spinnerPhases
- default   : 
- hint      :  
  Name of the array containing the characters used for the spinner's 
  `animation`.

If omitted or invalid, the default value set in 'MSE_SPINNER_DEFAULT' is used.

Out-of-the-box options are the templates:
- MSE_SPINNER_COMEANDGO
- MSE_SPINNER_STICK_STAR.


## float interval

- aka       : -i --interval
- default   : 0.2
- hint      :
  Time interval (in seconds) between each phase of the `animation``.


&nbsp;

# Another informations

The construction of this spinner was based on the guidelines of the following 
tutorial:
- https://willcarh.art/blog/how-to-write-better-bash-spinners



&nbsp;

# Returns string

Printa na tela a barra de progresso conforme configuração passada.