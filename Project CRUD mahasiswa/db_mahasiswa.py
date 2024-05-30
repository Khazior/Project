import tkinter as tk
from tkinter import ttk, messagebox
import mysql.connector

def GetValue(event):
    nama_entry.delete(0, tk.END)
    nim_entry.delete(0, tk.END)
    prodi_entry.delete(0, tk.END)
    jk_entry.delete(0, tk.END)
    
    row_id = listBox.selection()[0]
    select = listBox.item(row_id)
    
    nama_entry.insert(0, select['values'][0])
    nim_entry.insert(0, select['values'][1])
    prodi_entry.insert(0, select['values'][2])
    jk_entry.insert(0, select['values'][3])

def Add():
    nama = nama_entry.get()
    nim = nim_entry.get()
    prodi = prodi_entry.get()
    jk = jk_entry.get()

    mysqldb = mysql.connector.connect(host="localhost", user="root", password="", database="db_mahasiswa")
    mycursor = mysqldb.cursor()

    try:
        sql = "INSERT INTO datamhs (nama, nim, prodi, jk) VALUES (%s, %s, %s, %s)"
        val = (nama, nim, prodi, jk)
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
    nama = nama_entry.get()
    nim = nim_entry.get()
    prodi = prodi_entry.get()
    jk = jk_entry.get()

    mysqldb = mysql.connector.connect(host="localhost", user="root", password="", database="db_mahasiswa")
    mycursor = mysqldb.cursor()

    try:
        sql = "UPDATE datamhs SET nama=%s, prodi=%s, jk=%s WHERE nim=%s"
        val = (nama, prodi, jk, nim)
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
    nim = nim_entry.get()

    mysqldb = mysql.connector.connect(host="localhost", user="root", password="", database="db_mahasiswa")
    mycursor = mysqldb.cursor()

    try:
        sql = "DELETE FROM datamhs WHERE nim=%s"
        val = (nim,)
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

    mysqldb = mysql.connector.connect(host="localhost", user="root", password="", database="db_mahasiswa")
    mycursor = mysqldb.cursor()

    try:
        sql = "SELECT nama, nim, prodi, jk FROM datamhs WHERE nim LIKE %s"
        val = ('%' + search_keyword + '%',)
        mycursor.execute(sql, val)
        records = mycursor.fetchall()

        listBox.delete(*listBox.get_children())
        for i, (nama, nim, prodi, jk) in enumerate(records, start=1):
            listBox.insert("", "end", values=(nama, nim, prodi, jk))
    except Exception as e:
        print(e)
    finally:
        mysqldb.close()

def Show():
    mysqldb = mysql.connector.connect(host="localhost", user="root", password="", database="db_mahasiswa")
    mycursor = mysqldb.cursor()
    mycursor.execute("SELECT nama, nim, prodi, jk FROM datamhs")
    records = mycursor.fetchall()

    listBox.delete(*listBox.get_children())
    for i, (nama, nim, prodi, jk) in enumerate(records, start=1):
        listBox.insert("", "end", values=(nama, nim, prodi, jk))

    mysqldb.close()

def ClearFields():
    nama_entry.delete(0, tk.END)
    nim_entry.delete(0, tk.END)
    prodi_entry.delete(0, tk.END)
    jk_entry.delete(0, tk.END)

root = tk.Tk()
root.title("Data Mahasiswa")
root.geometry("825x500")

tk.Label(root, text="Nama mhs").place(x=10, y=10)
tk.Label(root, text="NIM mhs").place(x=10, y=60)
tk.Label(root, text="Prodi mhs").place(x=10, y=110)
tk.Label(root, text="Jenis kelamin").place(x=10, y=160)
tk.Label(root, text="Cari nim").place(x=445, y=10)

nama_entry = tk.Entry(root)
nama_entry.place(x=120, y=10)

nim_entry = tk.Entry(root)
nim_entry.place(x=120, y=60)

prodi_entry = tk.Entry(root)
prodi_entry.place(x=120, y=110)

jk_entry = tk.Entry(root)
jk_entry.place(x=120, y=160)

search_entry = tk.Entry(root)
search_entry.place(x=500, y=10)

tk.Button(root, text="Add", command=Add, height=1, width=10).place(x=30, y=250)
tk.Button(root, text="Update", command=Update, height=1, width=10).place(x=140, y=250)
tk.Button(root, text="Delete", command=Delete, height=1, width=10).place(x=250, y=250)
tk.Button(root, text="Search", command=Search, height=1, width=10).place(x=650, y=10)

cols = ('Nama Mahasiswa', 'NIM mahasiswa', 'Program studi', 'Jenis kelamin')
listBox = ttk.Treeview(root, columns=cols, show="headings")

for col in cols:
    listBox.heading(col, text=col)

listBox.place(x=10, y=300)

Show()
listBox.bind('<ButtonRelease-1>', GetValue)

root.mainloop()
