#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]


test_mse_str_split_inLines() {
  unset testArray
  declare -a testArray=()


  mse_str_split_inLines "testArray" "Isto e apenas um teste para\nverificar como que ficará."

  testResult="${#testArray[@]}"
  testExpected="2"

  mse_utest_assert_equals


  testResult="${testArray[0]}"
  testExpected="Isto e apenas um teste para"

  mse_utest_assert_equals


  testResult="${testArray[1]}"
  testExpected="verificar como que ficará."

  mse_utest_assert_equals




  mse_str_split_inLines "testArray" "Isto é apenas um teste para verificar como que ficará." "10"

  testResult="${#testArray[@]}"
  testExpected="6"

  mse_utest_assert_equals


  testResult="${testArray[0]}"
  testExpected="Isto é"

  mse_utest_assert_equals


  testResult="${testArray[1]}"
  testExpected="apenas um"

  mse_utest_assert_equals


  testResult="${testArray[2]}"
  testExpected="teste para"

  mse_utest_assert_equals


  testResult="${testArray[3]}"
  testExpected="verificar"

  mse_utest_assert_equals


  testResult="${testArray[4]}"
  testExpected="como que"

  mse_utest_assert_equals


  testResult="${testArray[5]}"
  testExpected="ficará."

  mse_utest_assert_equals





  mse_str_split_inLines "testArray" "Isto  é  apenas um teste para verificar como que ficará." "20"

  testResult="${#testArray[@]}"
  testExpected="3"

  mse_utest_assert_equals


  testResult="${testArray[0]}"
  testExpected="Isto  é  apenas um"

  mse_utest_assert_equals


  testResult="${testArray[1]}"
  testExpected="teste para verificar"

  mse_utest_assert_equals


  testResult="${testArray[2]}"
  testExpected="como que ficará."

  mse_utest_assert_equals




  read -r -d '' strTeste << 'EOF'
Normalmente apenas definir o tipo de retorno é suficiente mas se necessário é
possível agregar informações neste espaço explicando o que  é  esperado de
retorno conforme o tipo de `processamento` definido nos parametros.
EOF

  mse_str_split_inLines "testArray" "${strTeste}" "80"

  testResult="${#testArray[@]}"
  testExpected="3"

  mse_utest_assert_equals


  testResult="${testArray[0]}"
  testExpected="Normalmente apenas definir o tipo de retorno é suficiente mas se necessário é"

  mse_utest_assert_equals


  testResult="${testArray[1]}"
  testExpected="possível agregar informações neste espaço explicando o que  é  esperado de"

  mse_utest_assert_equals


  testResult="${testArray[2]}"
  testExpected="retorno conforme o tipo de \`processamento\` definido nos parametros."

  mse_utest_assert_equals





  mse_str_split_inLines "testArray" "${strTeste}" "60" "1"

  testResult="${#testArray[@]}"
  testExpected="4"

  mse_utest_assert_equals


  testResult="${testArray[0]}"
  testExpected="Normalmente apenas definir o tipo de retorno é suficiente"

  mse_utest_assert_equals


  testResult="${testArray[1]}"
  testExpected="mas se necessário é possível agregar informações neste"

  mse_utest_assert_equals


  testResult="${testArray[2]}"
  testExpected="espaço explicando o que  é  esperado de retorno conforme o"

  mse_utest_assert_equals


  testResult="${testArray[3]}"
  testExpected="tipo de \`processamento\` definido nos parametros."

  mse_utest_assert_equals




  read -r -d '' strTeste << 'EOF'
Este teste deve demonstrar como fica uma linha que não pode ser dividida.
A URL a seguir vai acabar ficando em uma linha só dela: http://domain.com/uri-greater-than-the-established-limit-must-be-on-a-single-line-regardless-of-its-size
pois é maior que o limite especificado.
EOF

  mse_str_split_inLines "testArray" "${strTeste}" "80"

  testResult="${#testArray[@]}"
  testExpected="4"

  mse_utest_assert_equals


  testResult="${testArray[0]}"
  testExpected="Este teste deve demonstrar como fica uma linha que não pode ser dividida."

  mse_utest_assert_equals


  testResult="${testArray[1]}"
  testExpected="A URL a seguir vai acabar ficando em uma linha só dela:"

  mse_utest_assert_equals


  testResult="${testArray[2]}"
  testExpected="http://domain.com/uri-greater-than-the-established-limit-must-be-on-a-single-line-regardless-of-its-size"

  mse_utest_assert_equals


  testResult="${testArray[3]}"
  testExpected="pois é maior que o limite especificado."

  mse_utest_assert_equals
}