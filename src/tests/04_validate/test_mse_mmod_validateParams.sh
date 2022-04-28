#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







#
# Teste
test_mse_mmod_validateParams() {
  declare -a pData=("one")
  declare -A pRules
  pRules["count"]=1
  pRules["param_0"]="wrong definition"

  testResult=$(mse_mmod_validateParams "pRules" "pData")
  testExpected="Invalid parameter definition; [ wrong definition ]"

  mse_utest_assertEqual



  #
  # Definição correta
  pData=("one")
  pRules["param_0"]="P1 :: o :: string"

  testResult=$(mse_mmod_validateParams "pRules" "pData")
  testExpected="1"

  mse_utest_assertEqual





  #
  # FAIL DEFINITION: Label
  pData=("one")
  pRules["param_0"]=" :: :: "

  testResult=$(mse_mmod_validateParams "pRules" "pData")
  testExpected="Invalid parameter definition; [ Label field cannot be empty ]"


  mse_utest_assertEqual





  #
  # FAIL DEFINITION: Required
  pData=("one")
  pRules["param_0"]="P1 :: :: "

  testResult=$(mse_mmod_validateParams "pRules" "pData")
  testExpected="Invalid parameter definition; [ Required field cannot be empty ]"

  mse_utest_assertEqual


  #
  # SUCCESS DEFINITION: Required options
  pData=("one")
  pRules["param_0"]="P1 :: optional :: string"

  testResult=$(mse_mmod_validateParams "pRules" "pData")
  testExpected="1"

  mse_utest_assertEqual


  #
  pData=("one")
  pRules["param_0"]="P1 :: opt :: string"

  testResult=$(mse_mmod_validateParams "pRules" "pData")
  testExpected="1"

  mse_utest_assertEqual


  #
  pData=("one")
  pRules["param_0"]="P1 :: o :: string"

  testResult=$(mse_mmod_validateParams "pRules" "pData")
  testExpected="1"

  mse_utest_assertEqual


  #
  pData=("one")
  pRules["param_0"]="P1 :: 0 :: string"

  testResult=$(mse_mmod_validateParams "pRules" "pData")
  testExpected="1"

  mse_utest_assertEqual


  #
  pData=("one")
  pRules["param_0"]="P1 :: required :: string"

  testResult=$(mse_mmod_validateParams "pRules" "pData")
  testExpected="1"

  mse_utest_assertEqual


  #
  pData=("one")
  pRules["param_0"]="P1 :: req :: string"

  testResult=$(mse_mmod_validateParams "pRules" "pData")
  testExpected="1"

  mse_utest_assertEqual


  #
  pData=("one")
  pRules["param_0"]="P1 :: r :: string"

  testResult=$(mse_mmod_validateParams "pRules" "pData")
  testExpected="1"

  mse_utest_assertEqual


  #
  pData=("one")
  pRules["param_0"]="P1 :: 1 :: string"

  testResult=$(mse_mmod_validateParams "pRules" "pData")
  testExpected="1"

  mse_utest_assertEqual





  #
  # FAIL DEFINITION: Type
  pData=("one")
  pRules["param_0"]="P1 :: o :: "

  testResult=$(mse_mmod_validateParams "pRules" "pData")
  testExpected="Invalid parameter definition; [ Type field cannot be empty ]"


  mse_utest_assertEqual


  #
  # SUCCESS DEFINITION: Type options
  pData=("")
  pRules["param_0"]="P1 :: 0 :: bool"

  testResult=$(mse_mmod_validateParams "pRules" "pData")
  testExpected="1"

  mse_utest_assertEqual


  #
  # SUCCESS DEFINITION: Type options
  pData=("")
  pRules["param_0"]="P1 :: 0 :: string"

  testResult=$(mse_mmod_validateParams "pRules" "pData")
  testExpected="1"

  mse_utest_assertEqual


  #
  pData=("")
  pRules["param_0"]="P1 :: 0 :: char"

  testResult=$(mse_mmod_validateParams "pRules" "pData")
  testExpected="1"

  mse_utest_assertEqual


  #
  pData=("")
  pRules["param_0"]="P1 :: 0 :: charDecimal"

  testResult=$(mse_mmod_validateParams "pRules" "pData")
  testExpected="1"

  mse_utest_assertEqual


  #
  pData=("")
  pRules["param_0"]="P1 :: 0 :: charHex"

  testResult=$(mse_mmod_validateParams "pRules" "pData")
  testExpected="1"

  mse_utest_assertEqual


  #
  pData=("")
  pRules["param_0"]="P1 :: 0 :: charOctal"

  testResult=$(mse_mmod_validateParams "pRules" "pData")
  testExpected="1"

  mse_utest_assertEqual


  #
  pData=("")
  pRules["param_0"]="P1 :: 0 :: int"

  testResult=$(mse_mmod_validateParams "pRules" "pData")
  testExpected="1"

  mse_utest_assertEqual


  #
  pData=("")
  pRules["param_0"]="P1 :: 0 :: fileName"

  testResult=$(mse_mmod_validateParams "pRules" "pData")
  testExpected="1"

  mse_utest_assertEqual


  #
  pData=("")
  pRules["param_0"]="P1 :: 0 :: dirName"

  testResult=$(mse_mmod_validateParams "pRules" "pData")
  testExpected="1"

  mse_utest_assertEqual


  #
  pData=("")
  pRules["param_0"]="P1 :: 0 :: arrayName"

  testResult=$(mse_mmod_validateParams "pRules" "pData")
  testExpected="1"

  mse_utest_assertEqual


  #
  pData=("")
  pRules["param_0"]="P1 :: 0 :: assocName"

  testResult=$(mse_mmod_validateParams "pRules" "pData")
  testExpected="1"

  mse_utest_assertEqual


  #
  # pData=("")
  pRules["param_0"]="P1 :: 0 :: list"
  pRules["param_0_labels"]="lbl1, lbl2"
  pRules["param_0_values"]="1, 2"

  testResult=$(mse_mmod_validateParams "pRules" "pData")
  testExpected="1"

  mse_utest_assertEqual





  #
  # FAIL DEFINITION: Bool: Invalid
  pData=("2")
  pRules["param_0"]="P1 :: o :: bool"

  testResult=$(mse_mmod_validateParams "pRules" "pData")
  testExpected="Parameter \"P1\" is not a bool"


  mse_utest_assertEqual


  #
  pData=("0")
  pRules["param_0"]="P1 :: o :: bool"

  testResult=$(mse_mmod_validateParams "pRules" "pData")
  testExpected="1"


  mse_utest_assertEqual


  #
  pData=("1")
  pRules["param_0"]="P1 :: o :: bool"

  testResult=$(mse_mmod_validateParams "pRules" "pData")
  testExpected="1"


  mse_utest_assertEqual





  #
  # FAIL DEFINITION: String: MaxLength
  pData=("one")
  pRules["param_0"]="P1 :: o :: string :: :: invalid"

  testResult=$(mse_mmod_validateParams "pRules" "pData")
  testExpected="Invalid parameter definition; [ MaxLength field must be an integer ]"


  mse_utest_assertEqual


  #
  pData=("one")
  pRules["param_0"]="P1 :: o :: string :: :: 0"

  testResult=$(mse_mmod_validateParams "pRules" "pData")
  testExpected="Invalid parameter definition; [ MaxLength field must be greater than 0 ]"


  mse_utest_assertEqual





  #
  # FAIL DEFINITION: Int: Min|Max
  pData=("")
  pRules["param_0"]="P1 :: 0 :: int :: :: invalid"

  testResult=$(mse_mmod_validateParams "pRules" "pData")
  testExpected="Invalid parameter definition; [ Min field must be an integer ]"

  mse_utest_assertEqual


  #
  pData=("")
  pRules["param_0"]="P1 :: 0 :: int :: :: 0 :: invalid"

  testResult=$(mse_mmod_validateParams "pRules" "pData")
  testExpected="Invalid parameter definition; [ Max field must be an integer ]"

  mse_utest_assertEqual


  #
  pData=("")
  pRules["param_0"]="P1 :: 0 :: int :: :: 2 :: 1"

  testResult=$(mse_mmod_validateParams "pRules" "pData")
  testExpected="Invalid parameter definition; [ Min field is greater than Max field ]"

  mse_utest_assertEqual


  # SUCCESS DEFINITION: Int: Min|Max
  pData=("")
  pRules["param_0"]="P1 :: 0 :: int :: :: 10"

  testResult=$(mse_mmod_validateParams "pRules" "pData")
  testExpected="1"

  mse_utest_assertEqual


  #
  pData=("")
  pRules["param_0"]="P1 :: 0 :: int :: :: 1 :: 2"

  testResult=$(mse_mmod_validateParams "pRules" "pData")
  testExpected="1"

  mse_utest_assertEqual





  #
  # FAIL DEFINITION: arrayName: Min|Max
  pData=("")
  pRules["param_0"]="P1 :: 0 :: arrayName :: :: invalid"

  testResult=$(mse_mmod_validateParams "pRules" "pData")
  testExpected="Invalid parameter definition; [ Min field must be an integer ]"

  mse_utest_assertEqual


  #
  pData=("")
  pRules["param_0"]="P1 :: 0 :: arrayName :: :: 0 :: invalid"

  testResult=$(mse_mmod_validateParams "pRules" "pData")
  testExpected="Invalid parameter definition; [ Max field must be an integer ]"

  mse_utest_assertEqual


  #
  pData=("")
  pRules["param_0"]="P1 :: 0 :: arrayName :: :: 2 :: 1"

  testResult=$(mse_mmod_validateParams "pRules" "pData")
  testExpected="Invalid parameter definition; [ Min field is greater than Max field ]"

  mse_utest_assertEqual


  #
  pData=("")
  pRules["param_0"]="P1 :: 0 :: arrayName :: :: -1 :: 1"

  testResult=$(mse_mmod_validateParams "pRules" "pData")
  testExpected="Invalid parameter definition; [ For \"arrayName\" type, Min field must be greater or equals to 0 ]"

  mse_utest_assertEqual


  #
  pData=("")
  pRules["param_0"]="P1 :: 0 :: arrayName :: :: 0 :: 0"

  testResult=$(mse_mmod_validateParams "pRules" "pData")
  testExpected="Invalid parameter definition; [ For \"arrayName\" type, Max field must be greater or equals to 1 ]"

  mse_utest_assertEqual


  # SUCCESS DEFINITION: arrayName: Min|Max
  pData=("")
  pRules["param_0"]="P1 :: 0 :: arrayName :: :: 10"

  testResult=$(mse_mmod_validateParams "pRules" "pData")
  testExpected="1"

  mse_utest_assertEqual


  #
  pData=("")
  pRules["param_0"]="P1 :: 0 :: arrayName :: :: 1 :: 2"

  testResult=$(mse_mmod_validateParams "pRules" "pData")
  testExpected="1"

  mse_utest_assertEqual





  #
  # FAIL DEFINITION: fileName|dirName: Create
  pData=("")
  pRules["param_0"]="P1 :: 0 :: fileName :: :: invalid"

  testResult=$(mse_mmod_validateParams "pRules" "pData")
  testExpected="Invalid parameter definition; [ Create field has an invalid option ]"

  mse_utest_assertEqual


  #
  # SUCCESS DEFINITION: fileName|dirName options
  pData=("")
  pRules["param_0"]="P1 :: 0 :: dirName :: :: create"

  testResult=$(mse_mmod_validateParams "pRules" "pData")
  testExpected="1"

  mse_utest_assertEqual


  #
  pData=("")
  pRules["param_0"]="P1 :: 0 :: fileName :: :: yes"

  testResult=$(mse_mmod_validateParams "pRules" "pData")
  testExpected="1"

  mse_utest_assertEqual


  #
  pData=("")
  pRules["param_0"]="P1 :: 0 :: dirName :: :: y"

  testResult=$(mse_mmod_validateParams "pRules" "pData")
  testExpected="1"

  mse_utest_assertEqual


  #
  pData=("")
  pRules["param_0"]="P1 :: 0 :: fileName :: :: 1"

  testResult=$(mse_mmod_validateParams "pRules" "pData")
  testExpected="1"

  mse_utest_assertEqual


  #
  pData=("")
  pRules["param_0"]="P1 :: 0 :: dirName :: :: nocreate"

  testResult=$(mse_mmod_validateParams "pRules" "pData")
  testExpected="1"

  mse_utest_assertEqual


  #
  pData=("")
  pRules["param_0"]="P1 :: 0 :: fileName :: :: no"

  testResult=$(mse_mmod_validateParams "pRules" "pData")
  testExpected="1"

  mse_utest_assertEqual


  #
  pData=("")
  pRules["param_0"]="P1 :: 0 :: dirName :: :: n"

  testResult=$(mse_mmod_validateParams "pRules" "pData")
  testExpected="1"

  mse_utest_assertEqual


  #
  pData=("")
  pRules["param_0"]="P1 :: 0 :: fileName :: :: 0"

  testResult=$(mse_mmod_validateParams "pRules" "pData")
  testExpected="1"

  mse_utest_assertEqual


  #
  pData=("src/tests/00_assets/expected/mse_mmod_validateParams_fileName")
  pRules["param_0"]="P1 :: 1 :: fileName"

  testResult=$(mse_mmod_validateParams "pRules" "pData")
  testExpected="1"

  mse_utest_assertEqual


  # FAIL : File not exist
  pData=("src/tests/00_assets/expected/mse_mmod_validateParams_nonexist")
  pRules["param_0"]="P1 :: 1 :: fileName"

  testResult=$(mse_mmod_validateParams "pRules" "pData")
  testExpected="Parameter \"P1\" points to a non existent file"

  mse_utest_assertEqual


  # FAIL : File not exist but created
  if [ -f "src/tests/00_assets/expected/mse_mmod_validateParams_created" ]; then
    rm "src/tests/00_assets/expected/mse_mmod_validateParams_created"
  fi
  pData=("src/tests/00_assets/expected/mse_mmod_validateParams_created")
  pRules["param_0"]="P1 :: 1 :: fileName :: :: 1"

  testResult=$(mse_mmod_validateParams "pRules" "pData")
  testExpected="1"

  mse_utest_assertEqual

  testResult=$([ -f "src/tests/00_assets/expected/mse_mmod_validateParams_created" ] && echo "1")
  testExpected="1"

  mse_utest_assertEqual


  mse_utest_assertEqual


  #
  pData=("src/tests/00_assets/expected/dirName")
  pRules["param_0"]="P1 :: 1 :: dirName"

  testResult=$(mse_mmod_validateParams "pRules" "pData")
  testExpected="1"

  mse_utest_assertEqual


  # FAIL : Directory not exist
  pData=("src/tests/00_assets/expected/nonexist")
  pRules["param_0"]="P1 :: 1 :: dirName"

  testResult=$(mse_mmod_validateParams "pRules" "pData")
  testExpected="Parameter \"P1\" points to a non existent directory"

  mse_utest_assertEqual


  # FAIL : Directory not exist but created
  if [ -d "src/tests/00_assets/expected/created" ]; then
    rm -rf "src/tests/00_assets/expected/created"
  fi
  pData=("src/tests/00_assets/expected/created")
  pRules["param_0"]="P1 :: 1 :: dirName :: :: 1"

  testResult=$(mse_mmod_validateParams "pRules" "pData")
  testExpected="1"

  mse_utest_assertEqual

  testResult=$([ -d "src/tests/00_assets/expected/created" ] && echo "1")
  testExpected="1"

  mse_utest_assertEqual






  #
  # FAIL DEFINITION: list : labels|values
  unset pRules[param_0_labels]
  unset pRules[param_0_values]

  pData=("")
  pRules["param_0"]="P1 :: 0 :: list :: "

  testResult=$(mse_mmod_validateParams "pRules" "pData")
  testExpected="Invalid parameter definition; [ List field lost the label collection ]"

  mse_utest_assertEqual


  #
  pData=("")
  pRules["param_0"]="P1 :: 0 :: list :: "
  pRules["param_0_labels"]=""

  testResult=$(mse_mmod_validateParams "pRules" "pData")
  testExpected="Invalid parameter definition; [ List field has an empty label collection ]"

  mse_utest_assertEqual


  #
  pData=("")
  pRules["param_0"]="P1 :: 0 :: list :: "
  pRules["param_0_labels"]="lbl1, lbl2"

  testResult=$(mse_mmod_validateParams "pRules" "pData")
  testExpected="Invalid parameter definition; [ List field lost the value collection ]"

  mse_utest_assertEqual


  #
  pData=("")
  pRules["param_0"]="P1 :: 0 :: list :: "
  pRules["param_0_labels"]="lbl1, lbl2"
  pRules["param_0_values"]=""

  testResult=$(mse_mmod_validateParams "pRules" "pData")
  testExpected="Invalid parameter definition; [ List field has an empty value collection ]"

  mse_utest_assertEqual


  #
  pData=("")
  pRules["param_0"]="P1 :: 0 :: list :: "
  pRules["param_0_labels"]="lbl1, lbl2"
  pRules["param_0_values"]="1"

  testResult=$(mse_mmod_validateParams "pRules" "pData")
  testExpected="Invalid parameter definition; [ List field has an incorrect correlation between labels and values ]"

  mse_utest_assertEqual











  #
  # SUCCESS: Required Parameter accept with empty value
  pData=("")
  pRules["param_0"]="P1 :: 1 :: string"

  testResult=$(mse_mmod_validateParams "pRules" "pData")
  testExpected="1"

  mse_utest_assertEqual


  # SUCCESS: Required Parameter suplyied by default
  pData=("")
  pRules["param_0"]="P1 :: 1 :: string :: def"

  testResult=$(mse_mmod_validateParams "pRules" "pData")
  testExpected="1"

  mse_utest_assertEqual





  #
  # STRING
  # FAIL: MaxLength
  pData=("bigger than limit string")
  pRules["param_0"]="P1 :: 1 :: string :: :: 10"

  testResult=$(mse_mmod_validateParams "pRules" "pData")
  testExpected="Parameter \"P1\" is greater than the defined max length ( 10 )"

  mse_utest_assertEqual


  # SUCCESS: MaxLength
  pData=("allowed")
  pRules["param_0"]="P1 :: 1 :: string :: :: 10"

  testResult=$(mse_mmod_validateParams "pRules" "pData")
  testExpected="1"

  mse_utest_assertEqual


  # SUCCESS: MaxLength UTF-8
  pData=("í")
  pRules["param_0"]="P1 :: 1 :: string :: :: 1"

  testResult=$(mse_mmod_validateParams "pRules" "pData")
  testExpected="1"

  mse_utest_assertEqual





  #
  # CHAR
  # FAIL: Invalid char
  pData=("one")
  pRules["param_0"]="P1 :: 1 :: char"

  testResult=$(mse_mmod_validateParams "pRules" "pData")
  testExpected="Parameter \"P1\" is not a char"


  mse_utest_assertEqual


  # SUCCESS: Valid char
  pData=("o")
  pRules["param_0"]="P1 :: 1 :: char"

  testResult=$(mse_mmod_validateParams "pRules" "pData")
  testExpected="1"


  mse_utest_assertEqual


  # SUCCESS: Valid char (UTF-8 safe)
  pData=("ó")
  pRules["param_0"]="P1 :: 1 :: char"

  testResult=$(mse_mmod_validateParams "pRules" "pData")
  testExpected="1"


  mse_utest_assertEqual





  #
  # CHARDECIMAL
  # FAIL: Invalid charDecimal
  pData=("one")
  pRules["param_0"]="P1 :: 1 :: charDecimal"

  testResult=$(mse_mmod_validateParams "pRules" "pData")
  testExpected="Parameter \"P1\" is not a valid decimal representation of char"


  mse_utest_assertEqual


  # SUCCESS: Valid charDecimal
  pData=("105")
  pRules["param_0"]="P1 :: 1 :: charDecimal"

  testResult=$(mse_mmod_validateParams "pRules" "pData")
  testExpected="1"


  mse_utest_assertEqual


  # SUCCESS: Valid charDecimal (UTF-8 safe)
  pData=("195 173")
  pRules["param_0"]="P1 :: 1 :: charDecimal"

  testResult=$(mse_mmod_validateParams "pRules" "pData")
  testExpected="1"


  mse_utest_assertEqual





  #
  # CHARHEX
  # FAIL: Invalid charHex
  pData=("one")
  pRules["param_0"]="P1 :: 1 :: charHex"

  testResult=$(mse_mmod_validateParams "pRules" "pData")
  testExpected="Parameter \"P1\" is not a valid hexadecimal representation of char"


  mse_utest_assertEqual


  # SUCCESS: Valid charHex
  pData=("69")
  pRules["param_0"]="P1 :: 1 :: charHex"

  testResult=$(mse_mmod_validateParams "pRules" "pData")
  testExpected="1"


  mse_utest_assertEqual


  # SUCCESS: Valid charHex (UTF-8 safe)
  pData=("C3 AD")
  pRules["param_0"]="P1 :: 1 :: charHex"

  testResult=$(mse_mmod_validateParams "pRules" "pData")
  testExpected="1"


  mse_utest_assertEqual





  #
  # CHAROCTAL
  # FAIL: Invalid charOctal
  pData=("one")
  pRules["param_0"]="P1 :: 1 :: charOctal"

  testResult=$(mse_mmod_validateParams "pRules" "pData")
  testExpected="Parameter \"P1\" is not a valid octal representation of char"


  mse_utest_assertEqual


  # SUCCESS: Valid charOctal
  pData=("105")
  pRules["param_0"]="P1 :: 1 :: charOctal"

  testResult=$(mse_mmod_validateParams "pRules" "pData")
  testExpected="1"


  mse_utest_assertEqual


  # SUCCESS: Valid charOctal (UTF-8 safe)
  pData=("303 255")
  pRules["param_0"]="P1 :: 1 :: charOctal"

  testResult=$(mse_mmod_validateParams "pRules" "pData")
  testExpected="1"


  mse_utest_assertEqual





  #
  # INT
  # FAIL: Not Integer
  pData=("not integer")
  pRules["param_0"]="P1 :: 1 :: int"

  testResult=$(mse_mmod_validateParams "pRules" "pData")
  testExpected="Parameter \"P1\" is not an integer"

  mse_utest_assertEqual


  # SUCCESS: Negative Integer
  pData=("-33")
  pRules["param_0"]="P1 :: 1 :: int"

  testResult=$(mse_mmod_validateParams "pRules" "pData")
  testExpected="1"

  mse_utest_assertEqual


  # SUCCESS: positive Integer
  pData=("33")
  pRules["param_0"]="P1 :: 1 :: int"

  testResult=$(mse_mmod_validateParams "pRules" "pData")
  testExpected="1"

  mse_utest_assertEqual


  # FAIL: Min
  pData=("0")
  pRules["param_0"]="P1 :: 1 :: int :: :: 1 :: 10"

  testResult=$(mse_mmod_validateParams "pRules" "pData")
  testExpected="Parameter \"P1\" must be greater or equals than 1"

  mse_utest_assertEqual


  # FAIL: Max
  pData=("11")
  pRules["param_0"]="P1 :: 1 :: int :: :: 1 :: 10"

  testResult=$(mse_mmod_validateParams "pRules" "pData")
  testExpected="Parameter \"P1\" must be less or equals than 10"

  mse_utest_assertEqual


  # SUCCESS: Min|Max
  pData=("10")
  pRules["param_0"]="P1 :: 1 :: int :: :: 1 :: 10"

  testResult=$(mse_mmod_validateParams "pRules" "pData")
  testExpected="1"

  mse_utest_assertEqual





  #
  # FUNCTIONNAME
  # FAIL: Non existent
  pData=("invalidFunction")
  pRules["param_0"]="P1 :: 1 :: functionName"

  testResult=$(mse_mmod_validateParams "pRules" "pData")
  testExpected="Parameter \"P1\" must be a name of a existent function"

  mse_utest_assertEqual


  # SUCCESS: existent
  pData=("test_mse_mmod_validateParams")
  pRules["param_0"]="P1 :: 1 :: functionName"

  testResult=$(mse_mmod_validateParams "pRules" "pData")
  testExpected="1"

  mse_utest_assertEqual





  #
  # ARRAYNAME
  # FAIL: Non existent
  pData=("invalidArray")
  pRules["param_0"]="P1 :: 1 :: arrayName"

  testResult=$(mse_mmod_validateParams "pRules" "pData")
  testExpected="Parameter \"P1\" is not an array name"

  mse_utest_assertEqual


  # SUCCESS: existent
  testArrayName=("one" "two")
  pData=("testArrayName")
  pRules["param_0"]="P1 :: 1 :: arrayName"

  testResult=$(mse_mmod_validateParams "pRules" "pData")
  testExpected="1"

  mse_utest_assertEqual


  # FAIL: Min
  testArrayName=("one" "two")
  pData=("testArrayName")
  pRules["param_0"]="P1 :: 1 :: arrayName :: :: 3 :: 5"

  testResult=$(mse_mmod_validateParams "pRules" "pData")
  testExpected="Parameter \"P1\" must be an array with at least 3 elements"

  mse_utest_assertEqual


  # FAIL: Max
  testArrayName=("one" "two" "tree" "four" "five" "six")
  pData=("testArrayName")
  pRules["param_0"]="P1 :: 1 :: arrayName :: :: 3 :: 5"

  testResult=$(mse_mmod_validateParams "pRules" "pData")
  testExpected="Parameter \"P1\" must be an array with at most 5 elements"

  mse_utest_assertEqual


  # SUCCESS: Min|Max
  testArrayName=("one" "two" "tree" "four")
  pData=("testArrayName")
  pRules["param_0"]="P1 :: 1 :: arrayName :: :: 3 :: 5"

  testResult=$(mse_mmod_validateParams "pRules" "pData")
  testExpected="1"

  mse_utest_assertEqual





  #
  # ASSOCNAME
  # FAIL: Non existent
  pData=("invalidAssoc")
  pRules["param_0"]="P1 :: 1 :: assocName"

  testResult=$(mse_mmod_validateParams "pRules" "pData")
  testExpected="Parameter \"P1\" is not an associative array name"

  mse_utest_assertEqual


  # SUCCESS: existent
  unset testAssocArrayName
  declare -A testAssocArrayName
  testAssocArrayName["one"]="1"
  testAssocArrayName["two"]="2"
  testAssocArrayName["tree"]="3"
  pData=("testAssocArrayName")
  pRules["param_0"]="P1 :: 1 :: assocName"

  testResult=$(mse_mmod_validateParams "pRules" "pData")
  testExpected="1"

  mse_utest_assertEqual


  # FAIL: Keys
  pData=("testAssocArrayName")
  pRules["param_0"]="P1 :: 1 :: assocName :: :: one, two, nondefined"

  testResult=$(mse_mmod_validateParams "pRules" "pData")
  testExpected="Parameter \"P1\" lost the required key \"nondefined\""

  mse_utest_assertEqual


  # SUCCESS: Keys
  pData=("testAssocArrayName")
  pRules["param_0"]="P1 :: 1 :: assocName :: :: one, two"

  testResult=$(mse_mmod_validateParams "pRules" "pData")
  testExpected="1"

  mse_utest_assertEqual





  #
  # LIST
  # FAIL: Invalid Option
  pData=("4")
  pRules["param_0"]="P1 :: 1 :: list"
  pRules["param_0_labels"]="one, two, tree"
  pRules["param_0_values"]="1, 2, 3"

  testResult=$(mse_mmod_validateParams "pRules" "pData")
  testExpected="Parameter \"P1\" has an invalid value"

  mse_utest_assertEqual


  # SUCCESS: Valid Option
  pData=("one")
  pRules["param_0"]="P1 :: 1 :: list"
  pRules["param_0_labels"]="one, two, tree"
  pRules["param_0_values"]="1, 2, 3"

  testResult=$(mse_mmod_validateParams "pRules" "pData")
  testExpected="1"

  mse_utest_assertEqual


  # SUCCESS: Valid Option
  pData=("1")
  pRules["param_0"]="P1 :: 1 :: list"
  pRules["param_0_labels"]="one, two, tree"
  pRules["param_0_values"]="1, 2, 3"

  testResult=$(mse_mmod_validateParams "pRules" "pData")
  testExpected="1"

  mse_utest_assertEqual











  #
  # FAIL: lost ValidateRules
  testResult=$(mse_mmod_validateParams)
  testExpected="Parameter \"ValidateRules\" is required"

  mse_utest_assertEqual


  #
  # FAIL: lost 'count' in 'ValidateRules'
  unset pRules
  unset pData
  declare -A pRules

  testResult=$(mse_mmod_validateParams "pRules")
  testExpected="Parameter \"ValidateRules\" lost the required key \"count\""

  mse_utest_assertEqual


  #
  # FAIL: lost ValidateData
  unset pRules
  unset pData
  declare -A pRules
  pRules["count"]=1

  testResult=$(mse_mmod_validateParams "pRules")
  testExpected="Parameter \"ValidateData\" is required"

  mse_utest_assertEqual

}
