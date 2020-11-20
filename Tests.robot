*** Settings ***
Library SeleniumLibrary

*** Variables ***
${Browser}    Chrome
URL    https://qainterview.pythonanywhere.com/
Input_box    xpath=//input[@id='number']
Calculate    xpath=//button[@id='getFactorial']
@{Input_values}    | 3 | 10 | 2 | 0

*** Test cases ***
Check application elements
    Open Broswer    URL    ${Browser}
    Page should contain    The greatest factorial calculator!
    Page should contain element    Input_box
    Page should contain element    Calculate
[Teardown]    Close all browsers

Check Allowed Input values
    Open Broswer    URL    ${Browser}
    Allowed values    @{Input_values}
[Teardown]    Close all browsers

*** Keywords ***   
Allowed values
    [Arguments]    @{Input_values} 
    FOR ${input} IN @{Input_values}
        Input text    Input_box    Input
        Click element    Calculate
        Page should contain    The factorial of ${input} is:
        
    