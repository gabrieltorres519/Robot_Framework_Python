*** Settings ***
Documentation   Browser Related Keyword Flow
Library         RPA.Browser.Selenium


*** Variables   ***
# DOWNLOAD CHOME DRIVER : https://chromedriver.chromium.org/downloads
${DRIVER_PATH}          /home/gabriel/Documentos/RPA/Browser_Selenium_Library/browser-driver/chromedriver
${SourceLanButton}      //button[@aria-label="Más idiomas de origen"]
${DestLanButton}        //button[@aria-label="Más idiomas de destino"]
${SourceLanText}        //input[@aria-label="Buscar idiomas"]
${srcTextArea}          //textarea[@aria-label="Texto de origen"]
${copyClipButton}       //button[@aria-label="Copiar traducción"]
${clearText}            //button[@aria-label="Borrar texto original"]


# +
*** Keywords ***
Open Google Translate Page
    Set Selenium Timeout       10
    Open Browser    https://translate.google.com/      browser=Chrome   executable_path=${DRIVER_PATH}
    Wait Until Element Is Visible       ${SourceLanButton}

Set Source Language
    [Arguments]      ${SourceLan}    
    Click Element    ${SourceLanButton}
    Input Text When Element Is Visible     ${SourceLanText}       ${SourceLan} 
    sleep  1
    Click Element At Coordinates    ${SourceLanText}    xoffset=0	yoffset=60
    sleep  1
    
Set Target Language
    [Arguments]      ${DesLan}    
    Click Element    ${DestLanButton}
    ${elem_list} =  Get WebElements     ${SourceLanText}
    Input Text     ${elem_list}[1]       ${DesLan} 
    sleep  1
    Click Element At Coordinates    ${elem_list}[1]    xoffset=0	yoffset=60
    sleep  1

Convert Sentence And Copy To ClipBoard
    [Arguments]      ${sentence}
    Input Text When Element Is Visible      ${srcTextArea}      ${sentence}
    Wait Until Element Is Visible     ${copyClipButton}
    Click Element        ${copyClipButton}
    sleep   1
    Click Element        ${clearText}
    
    
Close Current Browser 
    sleep   2
    Close Browser
    
