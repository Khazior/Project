#JUDUL PROJECT > Membuat Database Sementara Dengan Format txt Menggunakan Perulangan While

import os
os.system("cls")

database = "ini_data.txt"

# comment bagian ini agar data yang sudah dibuat tidak hilang
with open(database, "w", encoding="utf-8") as file:
    file.write("")
# -----------------------------------------------------------

with open(database, "r") as baca:
    print("data anda sebelumnya :\n"+baca.read())

percobaan = 0
while True:
    nama = input("masukan nama anda > ")
    nim = input("Masukan nim anda > ")
    prodi = input("program studi anda > ")
    
    with open(database, "a", encoding="utf-8") as tambah:
        tambah.write(f"nama > {nama} | nim > {nim} | prodi > {prodi}\n")
        
    with open(database, "r") as baca:
        print("\nData saat ini :\n"+baca.read())
        
    percobaan += 1
    print("anda memasukkan data sebanyak > " + str(percobaan))
    
    while True:
        lanjutkan = input("lanjut (l) stop (s) : ")
        if lanjutkan == "l":
            break
        elif lanjutkan == "s":
            print("keluar dari program!!!")
            exit()
        else:
            print("masukkan sesuai instruksi!")


