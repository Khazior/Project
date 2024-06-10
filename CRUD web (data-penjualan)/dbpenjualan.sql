-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 10, 2024 at 09:38 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dbpenjualan`
--

-- --------------------------------------------------------

--
-- Table structure for table `tb_barang`
--

CREATE TABLE `tb_barang` (
  `kdbarang` char(4) NOT NULL,
  `nama_brg` varchar(35) NOT NULL,
  `jenis` varchar(30) NOT NULL,
  `kondisi` varchar(10) NOT NULL,
  `harga` bigint(20) NOT NULL,
  `deskripsi` text NOT NULL,
  `foto` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tb_barang`
--

INSERT INTO `tb_barang` (`kdbarang`, `nama_brg`, `jenis`, `kondisi`, `harga`, `deskripsi`, `foto`) VALUES
('br01', 'Xiaomi 13T', 'Elektronik', 'Baru', 12000000, 'kondisi masih baru dan sangat langka di pasaran dikarenakan spesifikasi yang diberikan sangat powerfull', 'xiaomi_13T.png'),
('br02', 'Laptop axio pongo', 'Elektronik', 'Bekas', 17000000, 'Laptop bekas namun masih berkualitas, bisa digunakan buat multitasking dan gaming', 'pongo.png'),
('br03', 'Samsung s24 ultra', 'Elektronik', 'Baru', 34000000, 'Handphone android yang sangat powerfull dalam segala hal, handphone tingkat tinggi dari samsung', 'samsung.png'),
('br04', 'Oppo reno 11', 'Elektronik', 'Baru', 7000000, 'buat yang suka handphone kamera bagus dan tahan banting oppo menjadi pilihan utama', 'oppo.png'),
('br05', 'Motor suzuki', 'Kendaraan', 'Baru', 15000000, 'Kendaraan yang ramah lingkungan, lincah di segala medan dan penggunaan bensin yang sangat irit', 'sujuki.jpg'),
('br06', 'Lamborghini', 'Kendaraan', 'Baru', 9000000000, 'lamborghini adalah kendaraan bermobil yang langka dan mahal karena barangnya sudah tidak di produksi lagi, khusus buat orang yang mau flexing', 'lamborghini.jpg'),
('br07', 'Pesawat terbang', 'Kendaraan', 'Baru', 200000000000, 'Kapal udara, alat transportasi yang dikendarai di atas langit yang digerakkan oleh mesin bertenaga tinggi dan dibantu oleh angin yang membuatnya stabil ketika mengudara', 'logo kapal.kpg.jpg'),
('br08', 'Kemeja pria', 'Pakaian', 'Baru', 120000, 'dengan kain yang dibuat dari benang berkualitas membuat kemeja ini nyaman ketika digunakan saat cuaca panas maupun cuaca dingin', 'kemeja.jpg');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tb_barang`
--
ALTER TABLE `tb_barang`
  ADD PRIMARY KEY (`kdbarang`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
