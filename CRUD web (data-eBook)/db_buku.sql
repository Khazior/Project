-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 26, 2024 at 07:35 AM
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
-- Database: `db_buku`
--

-- --------------------------------------------------------

--
-- Table structure for table `akun_admin`
--

CREATE TABLE `akun_admin` (
  `id_admin` int(11) NOT NULL,
  `email` varchar(75) NOT NULL,
  `password` varchar(40) NOT NULL,
  `level` varchar(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `akun_admin`
--

INSERT INTO `akun_admin` (`id_admin`, `email`, `password`, `level`) VALUES
(1, 'admin@gmail.com', 'f865b53623b121fd34ee5426c792e5c33af8c227', 'Y');

-- --------------------------------------------------------

--
-- Table structure for table `buku_digital`
--

CREATE TABLE `buku_digital` (
  `kode_ebook` char(5) NOT NULL,
  `judul_ebook` varchar(70) NOT NULL,
  `penulis` varchar(50) NOT NULL,
  `bidang` varchar(40) NOT NULL,
  `deskripsi` text NOT NULL,
  `file` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `buku_digital`
--

INSERT INTO `buku_digital` (`kode_ebook`, `judul_ebook`, `penulis`, `bidang`, `deskripsi`, `file`) VALUES
('101', 'Algoritma Pemrograman Python', 'Wendi Zarman', 'Ilmu teknologi', 'buku dasar bahasa pemrograman algoritma dengan python', 'sampul-buku-python.png'),
('102', 'Php & MySQL', 'Heni A. Puspitosari', 'Ilmu teknologi', 'Pemrograman web dengan Php dan MySQL', 'sampul-buku-php.png'),
('103', 'Pemrograman Javascript', 'Johnson Sihombing', 'Ilmu teknologi', 'Buku pemrograman javascript untuk pemula', 'sampul-buku-javascript.png');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `akun_admin`
--
ALTER TABLE `akun_admin`
  ADD PRIMARY KEY (`id_admin`);

--
-- Indexes for table `buku_digital`
--
ALTER TABLE `buku_digital`
  ADD PRIMARY KEY (`kode_ebook`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `akun_admin`
--
ALTER TABLE `akun_admin`
  MODIFY `id_admin` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
