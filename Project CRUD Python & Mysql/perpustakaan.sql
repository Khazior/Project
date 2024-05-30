-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 30, 2024 at 02:51 AM
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
-- Database: `perpustakaan`
--

-- --------------------------------------------------------

--
-- Table structure for table `peminjaman`
--

CREATE TABLE `peminjaman` (
  `urutan` int(11) NOT NULL,
  `nama_buku` varchar(100) NOT NULL,
  `id_buku` varchar(7) NOT NULL,
  `id_petugas` enum('SAT-001','SAT-002','SAT-003') NOT NULL,
  `id_mhs` varchar(7) NOT NULL,
  `tgl_pinjam` varchar(12) NOT NULL,
  `jumlah_pinjam` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `peminjaman`
--

INSERT INTO `peminjaman` (`urutan`, `nama_buku`, `id_buku`, `id_petugas`, `id_mhs`, `tgl_pinjam`, `jumlah_pinjam`) VALUES
(5, 'Web development', 'BK-005', 'SAT-002', 'RPL2202', '12/03/2023', 1),
(3, 'Php dan Mysql', 'BK-004', 'SAT-002', 'TI22015', '14/03/2023', 1),
(1, 'Pemrograman python', 'BK-001', 'SAT-001', 'TI22037', '13/02/2023', 1),
(4, 'Jaringan dan software', 'BK-003', 'SAT-001', 'TK22012', '09/05/2023', 1),
(2, 'Mobile development & Bahasa Inggris', 'BK-002', 'SAT-001', 'TK22031', '10/02/2023', 2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `peminjaman`
--
ALTER TABLE `peminjaman`
  ADD PRIMARY KEY (`id_mhs`),
  ADD UNIQUE KEY `unique_urutan` (`urutan`),
  ADD UNIQUE KEY `id_buku` (`id_buku`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `peminjaman`
--
ALTER TABLE `peminjaman`
  MODIFY `urutan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
