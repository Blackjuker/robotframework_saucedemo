*** Settings ***
Resource    ../templates/login_template.robot
Test Template    Login Avec Cridentials Corrects
Test Setup    Open Browser    http://www.saucedemo.com    chrome    remote_url=http://192.168.1.119:4444/wd/hub
Test Teardown    Close Browser

*** Test Cases ***    username    password

Login Avec Cridentials Corrects    standard_user       secret_sauce
Login Avec Cridentials Corrects    problem_user       secret_sauce
Login Avec Cridentials Corrects    visual_user       secret_sauce