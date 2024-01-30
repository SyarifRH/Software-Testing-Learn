*** Settings ***
Library    SeleniumLibrary
Resource    resources/testCase.robot


*** Variables ***
# ${asik}    huhu

*** Test Cases ***
Login
    Login
    Negativelogin

# Register
#     Register

Beranda
    Beranda

Profil Pengguna
    Lihat Profil Pengguna

Ubah Password Pengguna Test Case
    Ubah Password Pengguna

Ubah Password Pengguna Delfaut
    Ubah Password Delfaut

Ubah Profil Pengguna 
    Ubah Profil Pengguna
    
Profil Instansi
    Data Profil Instansi
    Ubah Profil Instansi
    Ubah Pesan Sambutan

ePustaka
    # List ePustaka
    # Filter Berdasarkan Tanggal ( BELUM SOLVE )
    # Tambah ePustaka
    Ubah ePustaka
    # Filter Berdasarkan Nama ePustaka
    # Hapus Filter
    # Filter Berdasarkan Status
    # Filter Berdasarkan Tipe
    # Ekspor
    # Detail ePustaka

