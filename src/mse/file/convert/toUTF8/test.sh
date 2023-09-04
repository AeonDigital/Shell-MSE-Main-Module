#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]


test_mse_file_convert_toUTF8() {
  local dir=$(dirname "${BASH_SOURCE}")
  local originalDir="${dir}/attachments/test/original"
  local expectedDir="${dir}/attachments/test/expected"


  local mseEncoding=""
  cp "${originalDir}/file-iso-8859-1" "${expectedDir}/file-iso-8859-1"

  #
  # Check the original encoding
  mseEncoding=$(file -bi "${expectedDir}/file-iso-8859-1")
  testResult="${mseEncoding##*charset=}"
  testExpected="iso-8859-1"

  mse_md_utest_assertEqual



  #
  # Convert file anc check the new encoding
  testResult=$(mse_file_convert_toUTF8 "${expectedDir}/file-iso-8859-1")
  testExpected="1"

  mse_md_utest_assertEqual


  mseEncoding=$(file -bi "${expectedDir}/file-iso-8859-1")
  testResult="${mseEncoding##*charset=}"
  testExpected="utf-8"

  mse_md_utest_assertEqual



  local mseFileExists=""
  if [ -f "${expectedDir}/file-new" ]; then
    rm "${expectedDir}/file-new"
  fi

  if [ -f "${expectedDir}/file-new" ]; then mseFileExists="1"; else mseFileExists="0"; fi
  testResult="${mseFileExists}"
  testExpected="0"

  mse_md_utest_assertEqual


  testResult=$(mse_file_convert_toUTF8 "${expectedDir}/file-iso-8859-1" "${expectedDir}/file-new")
  testExpected="1"

  mse_md_utest_assertEqual


  if [ -f "${expectedDir}/file-new" ]; then mseFileExists="1"; else mseFileExists="0"; fi
  testResult="${mseFileExists}"
  testExpected="1"

  mse_md_utest_assertEqual
}
