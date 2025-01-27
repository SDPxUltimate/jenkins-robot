*** Settings ***
Library           RequestsLibrary


*** Keywords ***

Get Calculation JSON
    [Arguments]    ${num1}    ${num2}
    ${resp}=     GET    http://127.0.0.1:5000/plus/${num1}/${num2}

    # Verify the status code is 200 (OK)
    Should Be Equal    ${resp.status_code}    ${200}

    # Get the response content as a JSON object
    [return]    ${resp.json()}


Test Plus Numbers 8 and 4

    ${resp}=     GET    http://127.0.0.1:5000/plus/8/4

    # Verify the status code is 200 (OK)
    Should Be Equal    ${resp.status_code}    ${200}

    # Get the response content as a JSON object
    ${json_resp}=    Set Variable  ${resp.json()}

    # Verify the response of plus operation
    Should Be Equal    ${json_resp['result']}    ${12}


Test Plus Numbers 4 and 2

    ${json_resp}=    Get Calculation JSON    ${4}    ${2}

    # Verify the response of plus operation
    Should Be Equal    ${json_resp['result']}    ${6}


Test Plus Numbers 8.4 and 4

    ${json_resp}=    Get Calculation JSON    ${8.4}    ${4}

    # Verify the response of plus operation
    Should Be Equal    ${json_resp['result']}    ${12.4}


Test Plus Numbers 4 and 8.4

    ${json_resp}=    Get Calculation JSON    ${4}    ${8.4}

    # Verify the response of plus operation
    Should Be Equal    ${json_resp['result']}    ${12.4}


Test Plus Numbers -4 and 2

    ${json_resp}=    Get Calculation JSON    ${-4}    ${2}

    # Verify the response of plus operation
    Should Be Equal    ${json_resp['result']}    ${-2}


Test Plus Numbers 4 and -2

    ${json_resp}=    Get Calculation JSON    ${4}    ${-2}

    # Verify the response of plus operation
    Should Be Equal    ${json_resp['result']}    ${2}


Test Plus Numbers -4 and -2

    ${json_resp}=    Get Calculation JSON    ${-4}    ${-2}

    # Verify the response of plus operation
    Should Be Equal    ${json_resp['result']}    ${-6}


Test Plus Numbers a and b

    ${json_resp}=    Get Calculation JSON    ${a}    ${b}

    # Verify the response of plus operation
    Should Be Equal    ${json_resp['error_msg']}    inputs must be numbers


Test Plus Numbers 0 and b

    ${json_resp}=    Get Calculation JSON    ${0}    ${b}

    # Verify the response of plus operation
    Should Be Equal    ${json_resp['error_msg']}    inputs must be numbers


Test Plus Numbers a and 0

    ${json_resp}=    Get Calculation JSON    ${a}    ${0}

    # Verify the response of plus operation
    Should Be Equal    ${json_resp['error_msg']}    inputs must be numbers