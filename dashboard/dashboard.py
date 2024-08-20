# Import library
import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns
import streamlit as st
import gdown

sns.set(style='dark')

# URL dan ID file dari Google Drive
# mengintegrasikan dataset di google drive karena ukuran terlalu besar untuk di upload di github
url = 'https://drive.google.com/uc?id=11HoUhA6iMfAAHvChYg2tEf9DeWlgn-6V'
output = 'main_data.csv'

# Fungsi untuk mengunduh dan membaca file, menggunakan caching
@st.cache_data
def download_file(url, output):
    gdown.download(url, output, quiet=False)
    return pd.read_csv(output)

# Mengunduh dan menampilkan data
df = download_file(url, output)

# Menghitung jumlah pesanan untuk setiap kota
city_sales = df['customer_city'].value_counts().head(10)

st.subheader('1. City With Best Selling Product')
fig, ax = plt.subplots(figsize=(12, 6))
bars = city_sales.plot(kind='bar', ax=ax)
ax.set_title('10 Kota Teratas dengan Penjualan Tertinggi')
ax.set_xlabel('Kota')
ax.set_ylabel('Jumlah Pesanan')

plt.xticks(rotation=45)
bars.patches[0].set_facecolor('red')
st.pyplot(fig)

# Metode pembayaran yang paling sering digunakan
payment_method = df['payment_type'].value_counts().head(5)

st.subheader('2. Most Using Payments')
fig, ax = plt.subplots(figsize=(12, 6))
bars = payment_method.plot(kind='bar', ax=ax)
ax.set_title('5 Metode Pembayaran yang Paling Sering Digunakan')
ax.set_xlabel('Metode Pembayaran')
ax.set_ylabel('Jumlah')

plt.xticks(rotation=45, fontsize=10)
bars.patches[0].set_facecolor('red')
st.pyplot(fig)

# Skor ulasan rata-rata untuk produk
average_review_score = df['review_score'].value_counts().head(5)

st.subheader('3. Average Review Score')
fig, ax = plt.subplots(figsize=(12, 6))
bars = average_review_score.plot(kind='bar', ax=ax)
ax.set_title('5 Skor Ulasan Rata-Rata Tertinggi')
ax.set_xlabel('Skor Ulasan')
ax.set_ylabel('Jumlah')

plt.xticks(rotation=0, fontsize=10)
bars.patches[0].set_facecolor('red')
st.pyplot(fig)

# Penjual teratas berdasarkan jumlah pesanan
top_seller = df['seller_id'].value_counts().head(10)

st.subheader('4. Top Seller')
fig, ax = plt.subplots(figsize=(12, 6))
bars = top_seller.plot(kind='bar', ax=ax)
ax.set_title('10 Penjual Teratas Berdasarkan Jumlah Pesanan')
ax.set_xlabel('Penjual')
ax.set_ylabel('Jumlah')

plt.xticks(rotation=45, fontsize=10)
bars.patches[0].set_facecolor('red')
st.pyplot(fig)

# Waktu tersibuk dalam setahun untuk penjualan
df['month'] = pd.to_datetime(df['order_purchase_timestamp']).dt.month

st.subheader('5. Busiest Time of Year')
fig, ax = plt.subplots(figsize=(12, 6))
df.groupby('month')['order_id'].count().plot(kind='line', ax=ax)
ax.set_title('Jumlah Penjualan Terbanyak dalam Setahun')
ax.set_xlabel('Bulan')
ax.set_ylabel('Jumlah')
plt.xticks(range(1, 13), ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'])
st.pyplot(fig)
