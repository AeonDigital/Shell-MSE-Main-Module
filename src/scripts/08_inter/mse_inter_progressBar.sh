#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







#
# @desc
# Monta uma barra de progresso no terminal em um determinado percentual indicado.
#
# @param char $1
# Caracter que será usado para montar a barra de progresso.
# Se for deixado vazio, usará o caracter "#"
#
# @param int $2
# Tamanho total da barra de progresso (em caracteres).
# O valor mínimo aceitável é de 20 caracteres e o máximo de 100.
# Esta é a medida apenas da própria barra de progresso. ao final da mesma será
# adicionada uma informação contendo o total percentual atual do progresso.
# Se for deixado vazio, usará o valor padrão de 30 caracteres.
#
# @param int $3
# Percentual atual de andamento do progresso. Use apenas valores entre 0 e 100.
# Valores inválidos serão revertidos para "0".
#
# @return
# printa a barra de progresso conforme as indicações passadas.
mse_inter_progressBar() {
  if [ $# -ge 3 ]; then
    local mseBarChar
    local mseBarLength
    local mseBarProgress
    local mseCheck

    local mseStrBar
    local mseStrBarInfo

    local i
    local mseStrCharLength=0



    #
    # Resgata o caracter usado para montar a barra de progresso
    mseBarChar="#"
    if [ "${#1}" == "1" ]; then
      mseBarChar="$1"
    fi


    #
    # Resgata o tamanho total da barra de progresso a ser printada
    mseCheck=$(mse_check_isInteger "$2")

    mseBarLength=30
    if [ "${mseCheck}" == "1" ]; then
      if [ "${2}" -lt "20" ]; then
        mseBarLength=20
      elif [ "${2}" -gt "100" ]; then
        mseBarLength=100
      else
        mseBarLength="${2}"
      fi
    fi


    #
    # Resgata o progresso atual da barra
    mseCheck=$(mse_check_isInteger "$3")

    mseBarProgress=0
    if [ "${mseCheck}" == "1" ]; then
      if [ "${3}" -le "0" ]; then
        mseBarProgress=0
      elif [ "${3}" -ge "100" ]; then
        mseBarProgress=100
      else
        mseBarProgress="${3}"
      fi
    fi



    #
    # Monta a barra em si
    mseStrCharLength=0
    ((mseStrCharLength = (mseBarLength * mseBarProgress) / 100))

    mseStrBar=""
    for ((i=0; i<mseBarLength; i++)); do
      if [ "${i}" -le "${mseStrCharLength}" ]; then
        mseStrBar+="${mseBarChar}"
      else
        mseStrBar+=" "
      fi
    done


    #
    # Monta a parte de informações.
    mseStrBarInfo=""
    if [ "${mseBarProgress}" -lt "10" ]; then
      mseStrBarInfo+="  "
    elif [ "${mseBarProgress}" -lt "100" ]; then
      mseStrBarInfo+=" "
    fi
    mseStrBarInfo+="${mseBarProgress}%"

    #
    # Efetivamente printa a barra na tela
    printf "\r%s (%s)" "${mseStrBar}" "${mseStrBarInfo}"

    #
    # Ao encerrar, vai para a nova linha.
    if [ "${mseBarProgress}" -ge 100 ]; then
      printf "\n"
    fi
  fi
}

