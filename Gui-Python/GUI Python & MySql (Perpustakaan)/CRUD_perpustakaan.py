# sebelum menjalankan kodenya, harus menginstall tkinter
# dan mysql connector
import tkinter as tk
from tkinter import ttk, messagebox
import mysql.connector

def GetValue(event):
    nama_buku.delete(0, tk.END)
    id_buku.delete(0, tk.END)
    id_petugas.delete(0, tk.END)
    id_mhs.delete(0, tk.END)
    tgl_pinjam.delete(0, tk.END)
    jumlah_pinjam.delete(0, tk.END)
    try:
        row_id = listBox.selection()[0]
        select = listBox.item(row_id)
    except Exception as e:
            messagebox.showerror("Error!", str(e))    
    nama_buku.insert(0, select['values'][0])
    id_buku.insert(0, select['values'][1])
    id_petugas.insert(0, select['values'][2])
    id_mhs.insert(0, select['values'][3])
    tgl_pinjam.insert(0, select['values'][4])
    jumlah_pinjam.insert(0, select['values'][5])

def Add():
    judul_buku = nama_buku.get()
    identitas_buku = id_buku.get()
    identitas_petugas = id_petugas.get()
    identitas_mahasiswa = id_mhs.get()
    tggal_pinjam = tgl_pinjam.get()
    juml_pinjam = jumlah_pinjam.get()
    mysqldb = mysql.connector.connect(host="localhost", user="root", password="", database="perpustakaan")
    mycursor = mysqldb.cursor()
    try:
        sql = "INSERT INTO peminjaman (nama_buku, id_buku, id_petugas, id_mhs, tgl_pinjam, jumlah_pinjam) VALUES (%s, %s, %s, %s, %s, %s)"
        val = (judul_buku, identitas_buku, identitas_petugas, identitas_mahasiswa, tggal_pinjam, juml_pinjam)
        mycursor.execute(sql, val)
        mysqldb.commit()
        messagebox.showinfo("Informasi", "Data berhasil ditambah...")
        ClearFields()
        Show()
    except Exception as e:
        print(e)
        mysqldb.rollback()
    finally:
        mysqldb.close()

def Update():
    judul_buku = nama_buku.get()
    identitas_buku = id_buku.get()
    identitas_petugas = id_petugas.get()
    tggal_pinjam = tgl_pinjam.get()
    juml_pinjam = jumlah_pinjam.get()
    identitas_mahasiswa = id_mhs.get()
    mysqldb = mysql.connector.connect(host="localhost", user="root", password="", database="perpustakaan")
    mycursor = mysqldb.cursor()
    try:
        sql = "UPDATE peminjaman SET nama_buku=%s, id_buku=%s, id_petugas=%s, tgl_pinjam=%s, jumlah_pinjam=%s WHERE id_mhs=%s"
        val = (judul_buku, identitas_buku, identitas_petugas, tggal_pinjam, juml_pinjam, identitas_mahasiswa)
        mycursor.execute(sql, val)
        mysqldb.commit()
        messagebox.showinfo("Informasi", "Data berhasil diubah...")
        ClearFields()
        Show()
    except Exception as e:
        print(e)
        mysqldb.rollback()
    finally:
        mysqldb.close()

def Delete():
    identitas_mahasiswa = id_mhs.get()
    mysqldb = mysql.connector.connect(host="localhost", user="root", password="", database="perpustakaan")
    mycursor = mysqldb.cursor()
    try:
        sql = "DELETE FROM peminjaman WHERE id_mhs=%s"
        val = (identitas_mahasiswa,)
        mycursor.execute(sql, val)
        mysqldb.commit()
        messagebox.showinfo("Informasi", "Data berhasil dihapus...")
        ClearFields()
        Show()
    except Exception as e:
        print(e)
        mysqldb.rollback()
    finally:
        mysqldb.close()

def Search():
    search_keyword = search_entry.get()
    mysqldb = mysql.connector.connect(host="localhost", user="root", password="", database="perpustakaan")
    mycursor = mysqldb.cursor()
    try:
        sql = "SELECT nama_buku, id_buku, id_petugas, id_mhs, tgl_pinjam, jumlah_pinjam FROM peminjaman WHERE id_mhs LIKE %s"
        val = ('%' + search_keyword + '%',)
        mycursor.execute(sql, val)
        records = mycursor.fetchall()

        listBox.delete(*listBox.get_children())
        for i, (nama_buku, id_buku, id_petugas, id_mhs, tgl_pinjam, jumlah_pinjam) in enumerate(records, start=1):
            listBox.insert("", "end", values=(nama_buku, id_buku, id_petugas, id_mhs, tgl_pinjam, jumlah_pinjam))
    except Exception as e:
        print(e)
    finally:
        mysqldb.close()

def Show():
    mysqldb = mysql.connector.connect(host="localhost", user="root", password="", database="perpustakaan")
    mycursor = mysqldb.cursor()
    mycursor.execute("SELECT nama_buku, id_buku, id_petugas, id_mhs, tgl_pinjam, jumlah_pinjam FROM peminjaman")
    records = mycursor.fetchall()

    listBox.delete(*listBox.get_children())
    for i, (nama_buku, id_buku, id_petugas, id_mhs, tgl_pinjam, jumlah_pinjam) in enumerate(records, start=1):
        listBox.insert("", "end", values=(nama_buku, id_buku, id_petugas, id_mhs, tgl_pinjam, jumlah_pinjam))

    mysqldb.close()

def ClearFields():
    nama_buku.delete(0, tk.END)
    id_buku.delete(0, tk.END)
    id_petugas.delete(0, tk.END)
    id_mhs.delete(0, tk.END)
    tgl_pinjam.delete(0, tk.END)
    jumlah_pinjam.delete(0, tk.END)
# Window tkinter
root = tk.Tk()
root.title("Data Peminjam Buku")
root.geometry("1222x500")
# Label
tk.Label(root, text="nama buku").place(x=10, y=10)
tk.Label(root, text="id buku").place(x=10, y=60)
tk.Label(root, text="id petugas").place(x=10, y=110)
tk.Label(root, text="nim").place(x=10, y=160)
tk.Label(root, text="tggl pinjam").place(x=10, y=210)
tk.Label(root, text="jumlah pinjam").place(x=10, y=260)
tk.Label(root, text="cari nim").place(x=825, y=8)
# Teks box
nama_buku = tk.Entry(root, width=40)
nama_buku.place(x=110, y=13)

id_buku = tk.Entry(root, width=15)
id_buku.place(x=110, y=62)

id_petugas = tk.Entry(root, width=15)
id_petugas.place(x=110, y=113)

id_mhs = tk.Entry(root, width=15)
id_mhs.place(x=110, y=163)

tgl_pinjam = tk.Entry(root, width=15)
tgl_pinjam.place(x=110, y=213)

jumlah_pinjam = tk.Entry(root, width=15)
jumlah_pinjam.place(x=110, y=263)

search_entry = tk.Entry(root, width=15)
search_entry.place(x=885, y=9)
# Tombol
tk.Button(root, text="Tambah", command=Add, height=1, width=10).place(x=500, y=300)
tk.Button(root, text="Ubah", command=Update, height=1, width=10).place(x=590, y=300)
tk.Button(root, text="Hapus", command=Delete, height=1, width=10).place(x=680, y=300)
tk.Button(root, text="Cari", command=Search, height=1, width=10).place(x=1000, y=3)

cols = ('nama buku', 'id buku', 'id petugas', 'nim', 'tanggal pinjam', 'jumlah pinjam')
listBox = ttk.Treeview(root, columns=cols, show="headings")
for col in cols:
    listBox.heading(col, text=col)
listBox.place(x=10, y=350)
Show()
listBox.bind('<ButtonRelease-1>', GetValue)
root.mainloop()
