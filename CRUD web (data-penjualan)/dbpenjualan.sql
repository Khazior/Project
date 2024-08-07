-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 22, 2024 at 05:25 PM
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
-- Table structure for table `jenis`
--

CREATE TABLE `jenis` (
  `id_jenis` int(5) NOT NULL,
  `jenis_brg` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `jenis`
--

INSERT INTO `jenis` (`id_jenis`, `jenis_brg`) VALUES
(1, 'Handphone'),
(2, 'Laptop'),
(3, 'Motor');

-- --------------------------------------------------------

--
-- Table structure for table `tb_barang`
--

CREATE TABLE `tb_barang` (
  `kdbarang` char(4) NOT NULL,
  `nama_brg` varchar(35) NOT NULL,
  `id_jenis` int(5) NOT NULL,
  `kondisi` varchar(10) NOT NULL,
  `harga` bigint(20) NOT NULL,
  `deskripsi` text NOT NULL,
  `foto` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tb_barang`
--

INSERT INTO `tb_barang` (`kdbarang`, `nama_brg`, `id_jenis`, `kondisi`, `harga`, `deskripsi`, `foto`) VALUES
('br01', 'Xiaomi 13T', 1, 'Baru', 6499000, 'kondisi masih baru dan sangat langka di pasaran dikarenakan spesifikasi yang diberikan sangat powerfull', 'xiaomi_13T.png'),
('br02', 'Laptop axio pongo', 2, 'Baru', 15589000, 'Laptop buatan indonesia yang sangat powerfull menggunakan bahan yang tidak kalah bersaing dari merek luar sangat cocok buat yang suka gaming, multitasking, dan rendering video, gambar dsb', 'laptop axio pongo.png'),
('br03', 'Samsung S24 Plus', 1, 'Baru', 15479000, 'Handphone android yang sangat powerfull dalam segala hal, handphone tingkat mid to high end dari samsung', 'samsung s24 plus.png'),
('br04', 'Oppo A60', 1, 'Baru', 2599000, 'buat yang suka handphone kamera bagus dan tahan banting oppo A60 menjadi pilihan utama', 'oppo A60.png'),
('br05', 'Poco X6 Pro', 1, 'Baru', 5299000, 'Handphone mid range yang allrounded bisa digunakan untuk gaming ringan maupun berat sangat cocok buat kaum mendang mending', 'poco x6.png'),
('br06', 'Asus Rog Flow X16', 2, 'Baru', 28999000, 'Laptop gaming dari brand asus, memiliki body yang tipis namun tidak mudah patah, desain yang mantap disertai lampu RGB khusus laptop gaming dengan performa mesin yang tidak kaleng-kaleng, mendominasi pasar laptop gaming', 'asus rog.png'),
('br07', 'Techno Spark 20 Pro+', 1, 'Baru', 2999000, 'Hp keluaran tenshion holding brand vivo, desain tampak mewah, bezel yang tipis, kamera bisa rekam 4k 60fps serta mesin yang bisa gaming gaming tipis mid to lower high sangat cocok buat yang suka foto-foto dan flexing', 'techno spark 20 pro+.png'),
('br08', 'Vivo X100', 1, 'Baru', 14199000, 'Dengan kamera yang bisa nge-zoom hingga 200x tanpa burem, layar curv, performa ganas buat gaming rata kanan, dengan harga yang lebih murah dibanding brand sebelah, menjadi pesaing berat samsung S24 ultra', 'vivo x100.png'),
('br09', 'Motor sport black', 3, 'Baru', 125000000, 'motor sport yang baru dan lincah, yang diproduksi terbatas dengan bahan yang berkualitas', 'motor sport black.png'),
('br10', 'Motor sport red', 3, 'Baru', 120000000, 'berani dan tangguh disegala rintangan bebatuan hingga pegunungan', 'motor sport red.png'),
('br11', 'Motor sport bred', 3, 'Baru', 140000000, 'diam dan gahar auman dari motor seperti suara singa hutan rimba', 'motor sport silver.png'),
('br12', 'Motor sport orange', 3, 'Baru', 135000000, 'warna yang elegan dengan body ramping, menjadi motor sport impian', 'motor sport orange.png'),
('br13', 'Motor sport green', 3, 'Baru', 100000000, 'menyamar seperti daun muncul dengan penuh gaya dengan bahan yang berkualitas', 'motor sport green.png'),
('br14', 'Motor sport white', 3, 'Baru', 150000000, 'tiap tapi membunuh, itulah julukan dari motor ini yang kalem dan berani, tangguh disegala medan serta mudah dibersihkan', 'motor sport white.png'),
('br15', 'Asus Rog Strix-G', 2, 'Baru', 15499000, 'laptop gaming dari asus rog, dengan backlit yang cerah dan powefull', 'asus rog strix-g.png'),
('br16', 'asus vivobook Go 14', 2, 'Baru', 6085000, 'laptop edisi terbaru dari asus yang cocok bagi pekerja kantoran', 'asus vivobook Go 14.png'),
('br17', 'vivobook Go 14 Flip', 2, 'Baru', 7149000, 'laptop edisi terbaru, lanjutan dari seri sebelumnya namun bisa di flip/putar hingga 180 derajat cocok bagi pekerja kantoran sekaligus editing', 'asus vivobook Go 14 Flip.png'),
('br18', 'asus tuf gaming A15', 2, 'Baru', 15975000, 'laptop terbaru asus rog, bisa buat gaming triple A dan rendering yang kuat', 'asus tuf gaming A15.png');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `email` varchar(35) NOT NULL,
  `password` varchar(40) NOT NULL,
  `nama_lengkap` varchar(35) NOT NULL,
  `alamat` text NOT NULL,
  `telepon` char(15) NOT NULL,
  `level` varchar(9) NOT NULL,
  `verifikasi` varchar(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`email`, `password`, `nama_lengkap`, `alamat`, `telepon`, `level`, `verifikasi`) VALUES
('atmin@gmail.com', 'f92be2845ad0f4e5df77143fec533fdd7c5cf914', 'salahudin', 'jepang', '089233765990', 'admin', 'Y'),
('kaziro@gmail.com', '83194dfaacb709498c24ccc72b0e5b038c0125e1', 'gibran maulana syamroni', 'btn perumahan sandik baru lombok barat ntb', '083129157937', 'admin', 'Y'),
('kecap@gmail.com', '49079920830521134b9b9e030a04cbd0375362f3', 'kecap sedap', 'ladang di swiss', '081907040158', 'user', 'Y');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `jenis`
--
ALTER TABLE `jenis`
  ADD PRIMARY KEY (`id_jenis`);

--
-- Indexes for table `tb_barang`
--
ALTER TABLE `tb_barang`
  ADD PRIMARY KEY (`kdbarang`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `jenis`
--
ALTER TABLE `jenis`
  MODIFY `id_jenis` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
