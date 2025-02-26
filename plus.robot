*** Settings ***
Library           RequestsLibrary

*** Variables ***
${BASE_URL}       http://127.0.0.1:5001/cir_sur

*** Keywords ***

Get Calculation JSON
    [Arguments]    ${num1}    ${status}
    ${resp}=     GET    ${BASE_URL}/${num1}    expected_status=${status}
    Run Keyword If    ${resp.status_code} == ${status}    Return From Keyword    ${resp.json()} 
    # Run Keyword If    ${resp.status_code} == ${status}    Return From Keyword    ${resp.text} 
    Fail    Unexpected status code: ${resp.status_code}


*** Test Cases ***

Test X Is 1
    ${json_resp}=    Get Calculation JSON    1    200
    Should Be Equal As Numbers     ${json_resp}    12.56

Test Is Prime 36
    ${json_resp}=    Get Calculation JSON    -10    200
    Should Be Equal As Numbers    ${json_resp}    0.00

Test Is Prime 13219
    ${json_resp}=    Get Calculation JSON    1.5    200
    Should Be Equal As Numbers     ${json_resp}    28.26

# Test Plus Numbers 8 and 4
#     ${json_resp}=    Get Calculation JSON    8    4    200
#     Should Be Equal As Numbers    ${json_resp['result']}    12

# Test Plus Numbers 4 and 2
#     ${json_resp}=    Get Calculation JSON    4    2    200
#     Should Be Equal As Numbers    ${json_resp['result']}    6

# Test Plus Numbers 8.4 and 4
#     ${json_resp}=    Get Calculation JSON    8.4    4    200
#     Should Be Equal As Numbers    ${json_resp['result']}    12.4

# Test Plus Numbers 4 and 8.4
#     ${json_resp}=    Get Calculation JSON    4    8.4    200
#     Should Be Equal As Numbers    ${json_resp['result']}    12.4

# Test Plus Numbers -4 and 2
#     ${json_resp}=    Get Calculation JSON    -4    2    200
#     Should Be Equal As Numbers    ${json_resp['result']}    -2

# Test Plus Numbers 4 and -2
#     ${json_resp}=    Get Calculation JSON    4    -2    200
#     Should Be Equal As Numbers    ${json_resp['result']}    2

# Test Plus Numbers -4 and -2
#     ${json_resp}=    Get Calculation JSON    -4    -2    200
#     Should Be Equal As Numbers    ${json_resp['result']}    -6

# Test Plus Numbers a and b
#     ${json_resp}=    Get Calculation JSON    a   b    400
#     Should Be Equal   ${json_resp['error_msg']}    inputs must be numbers

# Test Plus Numbers 0 and b
#     ${json_resp}=    Get Calculation JSON    0    b    400
#     Should Be Equal   ${json_resp['error_msg']}    inputs must be numbers

# Test Plus Numbers a and 0
#     ${json_resp}=    Get Calculation JSON    a    0    400
#     Should Be Equal    ${json_resp['error_msg']}    inputs must be numbers
