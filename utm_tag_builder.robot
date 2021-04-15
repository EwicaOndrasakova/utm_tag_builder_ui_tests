*** Settings ***
Library    SeleniumLibrary
Test Setup    Open Browser at utm tag builder web site
Test Teardown    Close Browser

*** Variables ***
${base_url} =    https://utmtagbuilder.com
${utm_terns} =    xpath:/html/body/div/div/div/div/div[2]/div/form/div[7]/input
${campaing_content} =    xpath:/html/body/div/div/div/div/div[2]/div/form/div[8]/input
${copy_url_button} =    xpath:/html/body/div/div[2]/div/div/div[2]/div/form/div[2]/button

*** Keywords ***
Open Browser at utm tag builder web site
    Open Browser    ${base_url}    Chrome
    Wait Until Page Contains    UTM Tag Builder    20 sec
    Wait Until Page Contains    URL Address   10 sec
    Sleep    2 sec


*** Test Cases ***
Succesfull Generated URL
    Input Text    newURLAddress    https://www.alza.sk/mobilne-telefony-apple-iphone-12/18882721.htm
    Input Text    newUTMSource    facebook
    Input Text    newUTMMedium    banner
    Input Text    newUTMCampaign    summer_sales
    Input Text    ${utm_terns}    484567
    Input Text    ${campaing_content}    phones
    Scroll Element Into View    ${copy_url_button}
    Sleep    2 sec
    ${new_url} =   Get Value    generatedUrl
    Go To    ${new_url} 
    Wait Until Page Contains    Mobilné telefóny Apple iPhone 12    10 sec
    