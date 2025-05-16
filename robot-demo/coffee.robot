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
ลูกค้าเข้ามายังหน้า menu กาแฟ
    Open Browser    ${URL}    chrome
    ...    options=add_experimental_option("detach", True)
    Maximize Browser Window
