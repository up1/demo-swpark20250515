*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}    https://seleniumbase.io/coffee/


*** Test Cases ***
Success :: สั่งซื้อ esspresso จำนวน 2 แก้ว
    ลูกค้าเข้ามายังหน้า menu กาแฟ
    ทำการสั่งซื้อ esspresso จำนวน 2 แก้ว
    เข้าไปดูรายละเอียดการสั่งซื้อในหน้า cart มีราคา 20.00 บาท
    ทำการสั่งซื้อ โดยกรอกชื่อ somkiat และ email=somkiat@xx.com และรับข่าวสาร
    ลุกค้าได้รับข้อความยืนยันการสั่งซื้อเรียบร้อย

*** Keywords ***
ทำการสั่งซื้อ โดยกรอกชื่อ ${name} และ email=${email} และรับข่าวสาร
    Click Element    xpath://*[@data-test="checkout"]
    Input Text    id:name    ${name}
    Input Text    id:email   ${email}
    Click Element    id:promotion


เข้าไปดูรายละเอียดการสั่งซื้อในหน้า cart มีราคา 20.00 บาท
    Click Element   xpath=//*[@id="app"]/ul/li[2]
    Wait Until Element contains    xpath://*[@data-test="checkout"]   Total: $20.00

ทำการสั่งซื้อ esspresso จำนวน 2 แก้ว
    Click Element    xpath://*[@data-test="Espresso"]
    Click Element    xpath://*[@data-test="Espresso"]
    Wait Until Element contains    xpath=//*[@id="app"]/ul/li[2]   cart (2)

ลูกค้าเข้ามายังหน้า menu กาแฟ
    Open Browser    ${URL}    chrome
    ...    options=add_experimental_option("detach", True)
    Maximize Browser Window
    # 9 menus
    Page Should Contain Element	  xpath://*[@id="app"]/div[2]/ul/li	  limit=9