*** Settings ***
Library           AppiumLibrary
*** Variables ***
${REMOTE_URL}     http://localhost:4723/wd/hub
${PLATFORM_NAME}    Android
${PLATFORM_VERSION}    8.1
${DEVICE_NAME_ANDROID}    PIXEL_2_XL_API_27
${SEARCH_TEXT}          Elvis

*** Test Cases ***
Launch Wikipedia App
    Open Android app
Enter the search key and open it from the search list
    Input text   //android.widget.TextView    ${SEARCH_TEXT}
    wait until keyword succeeds  1 min  1 sec   Click Search Result
Assert the content and title
    wait until keyword succeeds  1 min  1 sec   Assert Title
    wait until keyword succeeds  1 min  1 sec   Assert Subtitle
    wait until keyword succeeds  1 min  1 sec   Assert Content


*** Keywords ***
Open Android app
    Open Application  ${REMOTE_URL}  app=${CURDIR}/app/org.wikipedia.apk  platformName=${PLATFORM_NAME}  deviceName=${DEVICE_NAME_ANDROID}

Click Search Result
    click element  xpath=//android.widget.TextView[starts-with(@text, 'Elvis Presley')]

Assert Title
    element should contain text  xpath=//android.widget.TextView[starts-with(@text, 'Elvis Presley')]     Elvis Presley

Assert Subtitle
    element should contain text  xpath=//android.widget.TextView[starts-with(@text, 'American singer and actor')]    American singer and actor

Assert Content
    page should contain element  xpath=//android.view.View[starts-with(@content-desc, 'one of the most significant cultural icons')]


