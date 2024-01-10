import os
import queue

#membuat class queue
class myqueue:
    def __init__(self):
        self.items = queue.Queue()
        
    def isEmpty(self):
        return self.items.empty()
    # menambah data ke queue
    def qput(self, item):
        self.items.put(item)
    # mengeluarkan data dari queue
    def qget(self):
        if not self.items.empty():
            return self.items.get()
        else:
            return "empty"
    # menghitung panjang queue
    def size(self):
        return self.items.qsize()
    # main menu aplikasi
    def mainmenu(self):
        pilih = "y"
        while (pilih == "y"):
            os.system("cls")
            print("=============================")
            print("|    Menu aplikasi queue    |")
            print("=============================")
            print("1. Menambah Antrian")
            print("2. Menghapus Antrian")
            print("3. Cek antrian kosong")
            print("4. cek panjang antrian")
            print("=============================")
            pilihan = str(input(("silahkan masukan pilihan anda: ")))
            if (pilihan == "1"):
                os.system("cls")
                obj = str(input("Masukan antrian yang ingin anda tambahkan > "))
                self.qput(obj)
                print("Antrian {} telah ditambahkan".format(obj))
                x = input("\ntekan (Enter) untuk kembali")
            elif (pilihan == "2"):
                os.system("cls")
                temp = self.qget()
                if temp != "empty":
                    print("Antrian {} dihapus".format(temp))
                else:
                    print("Queue kosong")
                x = input("\ntekan (Enter) untuk kembali")
            elif (pilihan == "3"):
                os.system("cls")
                print("apakah antrian kosong > {}".format(self.isEmpty()))
                x = input("\ntekan (Enter) untuk kembali")
            elif (pilihan == "4"):
                os.system("cls")
                print("panjang dari antrian adalah > " + str(self.size()))
                x = input("\ntekan (Enter) untuk kembali")
            else:
                pilih = "n"

if __name__ == "__main__":
    q = myqueue()
    q.mainmenu()