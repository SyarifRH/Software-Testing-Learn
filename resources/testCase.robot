*** Settings ***
Library    SeleniumLibrary
Library    XML
Variables    variableGlobal.py

*** Variables ***
${imageProfil}    D:\\DATA RIDHO\\AKSARAMAYA\\Software-Testing-Learn\\resources\\image\\picture1.jpg
*** Keywords ***
Login
    Open Browser   https://d1cjkrpphak3fo.cloudfront.net/   chrome 
    Wait Until Element Is Visible   //input[@id='normal_login_email']
    Maximize Browser Window
    Input Text           //input[@id='normal_login_email']        emailValid@gmail.com 
    Input Password       //input[@id='normal_login_password']     passwordValid.com
    Click Element        //span[contains(text(),'Masuk')]
    Wait Until Element Is Visible    //div[contains(text(),'Kategori Buku')]
    Page Should Contain    Halaman Utama
    Close Browser

# Register
#     Open Browser   ${URLWeb}   chrome 
#     Wait Until Element Is Visible    //div[@id='sign-up-btn']
#     Maximize Browser Window
#     Click Element    //div[@id='sign-up-btn']
#     Sleep    3
#     Input Text    //input[@id='email']    huj11602@omeie.com
#     Input Password    //input[@id='password']    12345678
#     Input Password    //input[@id='confirm']    12345678
#     Input Text    //input[@id='name']    Testing
#     Input Text    //input[@id='phone']    123456789
#     Input Text    //input[@id='address']    Purwokerto
#     #Dropdwon Kecamatan Handle
#     Click Element    css=.ant-select-selection-item
#     Input Text    id=rc_select_1    Kec. Baturaden
#     Sleep    2
#     Press Keys    id=rc_select_1    RETURN

#     Click Element    //button[@type='submit']
#     Wait Until Element Contains    //h1[contains(text(),'Masuk')]    Masuk

    
Negativelogin
    Open Browser   ${URL}   chrome 
    Wait Until Element Is Visible   //input[@id='normal_login_email']
    Maximize Browser Window
    Input Text           //input[@id='normal_login_email']        emaiInvalid@gmail.com
    Input Password       //input[@id='normal_login_password']     invalidPassword
    Click Element        //span[contains(text(),'Masuk')]
    Wait Until Element Is Visible    //input[@id='normal_login_email']
    Wait Until Element Contains    //div[contains(text(),'Username atau password salah')]    Username atau password salahh
    Close Browser

    

Beranda
    Open Browser   ${URL}   chrome 
    Wait Until Element Is Visible   //input[@id='normal_login_email']
    Maximize Browser Window
    Input Text           //input[@id='normal_login_email']        ${emailValid}
    Input Password       //input[@id='normal_login_password']     ${passwordValid}
    Click Element        //span[contains(text(),'Masuk')]
    Wait Until Element Is Visible    //div[contains(text(),'Kategori Buku')]
    Page Should Contain    Jumlah Koleksi ePustaka DRM
    Close Browser

Lihat Profil Pengguna
    Open Browser   ${URL}   chrome 
    Wait Until Element Is Visible   //input[@id='normal_login_email']
    Maximize Browser Window
    Input Text           //input[@id='normal_login_email']        ${emailValid}
    Input Password       //input[@id='normal_login_password']     ${passwordValid}
    Click Element        //span[contains(text(),'Masuk')]
    Wait Until Element Is Visible    //div[contains(text(),'Kategori Buku')]
    Go To    https://d1cjkrpphak3fo.cloudfront.net/profile/
    Page Should Contain    Profil Pengguna
    Page Should Contain    iinhu@grr.la
    Close Browser
Ubah Password Pengguna
    Open Browser   ${URL}   chrome 
    Wait Until Element Is Visible   //input[@id='normal_login_email']
    Maximize Browser Window
    Input Text           //input[@id='normal_login_email']        ${emailValid}
    Input Password       //input[@id='normal_login_password']     ${passwordValid}
    Click Element        //span[contains(text(),'Masuk')]
    Wait Until Element Is Visible    //div[contains(text(),'Kategori Buku')]
    Go To    https://d1cjkrpphak3fo.cloudfront.net/profile/
    Click Element    //span[contains(text(),'Ubah Password')]
    Input Password    //input[@id='old_password']    12345678
    Input Password    //input[@id='password']        87654321
    Input Password    //input[@id='re_password']     87654321
    Click Element    //span[contains(text(),'Simpan')]
    Wait Until Element Contains    //h1[contains(text(),'Hai, Selamat datang kembali')]    Hai, Selamat datang kembali
    Page Should Contain    Password Berhasil Dirubah
    Close Browser

Ubah Password Delfaut
    Open Browser   ${URL}   chrome 
    Wait Until Element Is Visible   //input[@id='normal_login_email']
    Maximize Browser Window
    Input Text           //input[@id='normal_login_email']        ${emailValid}
    Input Password       //input[@id='normal_login_password']     ${passwordTestcase}
    Click Element        //span[contains(text(),'Masuk')]
    Wait Until Element Is Visible    //div[contains(text(),'Kategori Buku')]
    Go To    https://d1cjkrpphak3fo.cloudfront.net/profile/
    Click Element    //span[contains(text(),'Ubah Password')]
    Input Password    //input[@id='old_password']    87654321
    Input Password    //input[@id='password']        12345678
    Input Password    //input[@id='re_password']     12345678
    Click Element    //span[contains(text(),'Simpan')]
    Wait Until Element Contains    //h1[contains(text(),'Hai, Selamat datang kembali')]    Hai, Selamat datang kembali
    Page Should Contain    Password Berhasil Dirubah
    Close Browser
    
Ubah Profil Pengguna
    Open Browser   ${URL}   chrome 
    Wait Until Element Is Visible   //input[@id='normal_login_email']
    Maximize Browser Window
    Input Text           //input[@id='normal_login_email']        ${emailValid}
    Input Password       //input[@id='normal_login_password']     ${passwordValid}
    Click Element        //span[contains(text(),'Masuk')]
    Wait Until Element Is Visible    //div[contains(text(),'Kategori Buku')]
    Go To    https://d1cjkrpphak3fo.cloudfront.net/profile/
    Click Element    //span[contains(text(),'Ubah Profil Pengguna')]
    Wait Until Element Is Visible    //body/div[@id='__next']/section[1]/section[1]/section[1]/main[1]/div[1]/div[1]/div[2]/div[1]/div[1]/span[1]
    Press Keys    //input[@id='profleForm_name']    CTRL+A+BACKSPACE
    Input Text    //input[@id='profleForm_name']    Admin iINHU 1
    Press Keys    //input[@id='profleForm_phone']    CTRL+A+BACKSPACE
    Input Text    //input[@id='profleForm_phone']    087837311151
    Press Keys    //textarea[@id='profleForm_bio']    CTRL+A+BACKSPACE
    Input Text   //textarea[@id='profleForm_bio']    -
    Press Keys    //textarea[@id='profleForm_address']    CTRL+A+BACKSPACE
    Input Text   //textarea[@id='profleForm_address']    -
    # Click Element   //button[@title='Hapus file']
    # Choose File    //span[@role='button']  ${CURDIR}//resources//image//picture1.jpg  
    Click Element    //button[@type='submit']
    Wait Until Element Contains    //div[@class='ant-page-header-content']//div[2]//div[1]//div[1]    Admin iINHU 1
    Close Browser

Data Profil Instansi
    Open Browser   ${URL}   chrome 
    Wait Until Element Is Visible   //input[@id='normal_login_email']
    Maximize Browser Window
    Input Text           //input[@id='normal_login_email']        ${emailValid}
    Input Password       //input[@id='normal_login_password']     ${passwordValid}
    Click Element        //span[contains(text(),'Masuk')]
    Wait Until Element Is Visible    //div[contains(text(),'Kategori Buku')]
    Click Element    //a[contains(text(),'Profil Instansi')]
    Page Should Contain    Profil Instansi
    Close Browser

Ubah Profil Instansi
    Open Browser   ${URL}   chrome 
    Wait Until Element Is Visible   //input[@id='normal_login_email']
    Maximize Browser Window
    Input Text           //input[@id='normal_login_email']        ${emailValid}
    Input Password       //input[@id='normal_login_password']     ${passwordValid}
    Click Element        //span[contains(text(),'Masuk')]
    Wait Until Element Is Visible    //div[contains(text(),'Kategori Buku')]
    Click Element    //a[contains(text(),'Profil Instansi')]
    Click Element    //span[contains(text(),'Ubah Profil Instansi')]
    Wait Until Element Is Visible    //input[@id='profleForm_organization_name']    10
    Press Keys    //input[@id='profleForm_organization_name']    CTRL+A+BACKSPACE
    Input Text    //input[@id='profleForm_organization_name']    Dev Centralized
    Press Keys    //input[@id='profleForm_email']                CTRL+A+BACKSPACE
    Input Text    //input[@id='profleForm_email']                iinhu@grr.la
    Press Keys    //input[@id='profleForm_phone']                CTRL+A+BACKSPACE
    Input Text    //input[@id='profleForm_phone']                081222222222
    Click Element    //span[contains(text(),'Simpan')]
    Page Should Contain    Profil Instansi
    Wait Until Element Contains    //body/div[@id='__next']/section[1]/section[1]/section[1]/main[1]/div[1]/div[1]/div[2]/div[2]/div[2]/div[1]/div[1]/div[2]/div[1]/div[1]/div[1]    Dev Centralized
    Close Browser
    
Ubah Pesan Sambutan
    Open Browser   ${URL}   chrome 
    Wait Until Element Is Visible   //input[@id='normal_login_email']
    Maximize Browser Window
    Input Text           //input[@id='normal_login_email']        ${emailValid}
    Input Password       //input[@id='normal_login_password']     ${passwordValid}
    Click Element        //span[contains(text(),'Masuk')]
    Wait Until Element Is Visible    //div[contains(text(),'Kategori Buku')]
    Click Element    //a[contains(text(),'Profil Instansi')]
    Click Element    //span[contains(text(),'Ubah Profil Instansi')]
    Wait Until Element Is Visible    //input[@id='profleForm_organization_name']    10
    Scroll Element Into View    //a[contains(text(),'Aksaramaya')]
    Press Keys    //input[@id='profleForm_greeting_title']    CTRL+A+BACKSPACE
    Input Text    //input[@id='profleForm_greeting_title']    Selamat Datang
    Press Keys    //input[@id='profleForm_greeting_message']    CTRL+A+BACKSPACE
    Input Text    //input[@id='profleForm_greeting_message']    Yuk Baca Buku
    Click Element    //span[contains(text(),'Simpan')]
    Page Should Contain    Profil Instansi
    Close Browser

#ePustaka
List ePustaka
    Open Browser   ${URL}   chrome 
    Wait Until Element Is Visible   //input[@id='normal_login_email']
    Maximize Browser Window
    Input Text           //input[@id='normal_login_email']        ${emailValid}
    Input Password       //input[@id='normal_login_password']     ${passwordValid}
    Click Element        //span[contains(text(),'Masuk')]
    Wait Until Element Is Visible    //div[contains(text(),'Kategori Buku')]
    Click Element    //span[contains(text(),'ePustaka')]
    Wait Until Element Is Visible    //a[normalize-space()='ePustaka']
    Click Element    //a[normalize-space()='ePustaka']
    Page Should Contain    ePustaka
    Close Browser

# Filter Berdasarkan Tanggal
#     Open Browser   ${URL}   chrome 
#     Wait Until Element Is Visible   //input[@id='normal_login_email']
#     Maximize Browser Window
#     Input Text           //input[@id='normal_login_email']        ${emailValid}
#     Input Password       //input[@id='normal_login_password']     ${passwordValid}
#     Click Element        //span[contains(text(),'Masuk')]
#     Wait Until Element Is Visible    //div[contains(text(),'Kategori Buku')]
#     Click Element    //span[contains(text(),'ePustaka')]
#     Wait Until Element Is Visible    //a[normalize-space()='ePustaka']
#     Click Element    //a[normalize-space()='ePustaka']
#     Click Element    //input[@id='date']
#     Click Element    //td[@title='2024-01-01']//div[@class='ant-picker-cell-inner'][normalize-space()='1']
#     Sleep    5
    
*** Keywords ***
Tambah ePustaka
    Open Browser   ${URL}   chrome 
    Wait Until Element Is Visible   //input[@id='normal_login_email']
    Maximize Browser Window
    Input Text           //input[@id='normal_login_email']        ${emailValid}
    Input Password       //input[@id='normal_login_password']     ${passwordValid}
    Click Element        //span[contains(text(),'Masuk')]
    Wait Until Element Is Visible    //div[contains(text(),'Kategori Buku')]
    Click Element    //span[contains(text(),'ePustaka')]
    Wait Until Element Is Visible    //a[normalize-space()='ePustaka']
    Click Element    //a[normalize-space()='ePustaka']    
    Wait Until Element Is Visible    //span[contains(text(),'Tambahkan')]
    Click Element    //span[contains(text(),'Tambahkan')]
    Wait Until Element Is Visible    //textarea[@id='epustakaForm_epustaka_aboutus']
    Input Text    //input[@id='epustakaForm_epustaka_name']    Belajar Bersama | Testing
    Input Text    //input[@id='epustakaForm_loan_term']    1
    Input Text    //input[@id='epustakaForm_maximum_borrow']    1
    Input Text    //input[@id='epustakaForm_period_of_time']    1
    Input Text    //textarea[@id='epustakaForm_epustaka_aboutus']    ePustaka Testing
    Click Element    //span[contains(text(),'ePustaka Publik')]
    Press Keys        //input[@id='epustakaForm_membership_duration']    RETURN     #Handle durasi 6 Bulan
    Click Element    //div[@id='epustakaForm_epustaka_isactive']//label[@class='ant-radio-button-wrapper']   
    Wait Until Element Is Visible    //span[@class='ant-upload'] 
    #choose file 
    ${file_input} =    Get WebElement    //input[@type='file']    # Assuming the file input is of type 'file'
    Choose File    ${file_input}    ${imageProfil}

    Sleep    3
    Click Element    //span[contains(text(),'OK')]
    Sleep    3
    Click Element    //span[contains(text(),'Simpan')]
    Wait Until Element Contains    //span[@title='Pustaka']    Pustaka
    Page Should Contain    Pustaka
    Close Browser

Ubah ePustaka
    Open Browser   ${URL}   chrome 
    Wait Until Element Is Visible   //input[@id='normal_login_email']
    Maximize Browser Window
    Input Text           //input[@id='normal_login_email']        ${emailValid}
    Input Password       //input[@id='normal_login_password']     ${passwordValid}
    Click Element        //span[contains(text(),'Masuk')]
    Wait Until Element Is Visible    //div[contains(text(),'Kategori Buku')]
    Click Element    //span[contains(text(),'ePustaka')]
    Wait Until Element Is Visible    //a[normalize-space()='ePustaka']
    Click Element    //a[normalize-space()='ePustaka']    
    Sleep    3
    Page Should Contain    Pustaka
    Click Element    //tbody/tr[2]/td[11]/button[1]
    Sleep    2
    Click Element    //span[contains(text(),'Ubah')]
    Wait Until Element Is Visible    //span[contains(text(),'Dev Centralized')]
    Press Keys    //input[@id='epustakaForm_epustaka_name']    CTRL+A+BACKSPACE
    Input Text    //input[@id='epustakaForm_epustaka_name']    Development   
