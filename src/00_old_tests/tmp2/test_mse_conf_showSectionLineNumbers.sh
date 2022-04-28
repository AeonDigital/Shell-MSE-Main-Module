#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







#
# Teste
test_mse_conf_showSectionLineNumbers() {
  testResult=$(mse_conf_showSectionLineNumbers)
  testExpected="Parameter \"PathToFile\" is required"

  mse_utest_assertEqual


  testResult=$(mse_conf_showSectionLineNumbers "${mseTMPDIR}/tests/.config")
  testExpected="Parameter \"SectionName\" is required"

  mse_utest_assertEqual


  testResult=$(mse_conf_showSectionLineNumbers "${mseTMPDIR}/tests/.config" "teste")
  testExpected="Parameter \"CommentChar\" is required"

  mse_utest_assertEqual


  testResult=$(mse_conf_showSectionLineNumbers "${mseTMPDIR}/tests/.config" "teste" "#")
  testExpected="55 58"

  mse_utest_assertEqual
}
