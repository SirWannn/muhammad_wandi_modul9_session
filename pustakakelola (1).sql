-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 29, 2025 at 03:55 PM
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
-- Database: `pustakakelola`
--

-- --------------------------------------------------------

--
-- Table structure for table `anggota`
--

CREATE TABLE `anggota` (
  `id` int(11) NOT NULL,
  `id_kota` int(11) NOT NULL,
  `id_organisasi` tinyint(4) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `alamat` varchar(100) NOT NULL,
  `telpon` varchar(60) NOT NULL,
  `email` varchar(30) NOT NULL,
  `tanggal_daftar` date NOT NULL,
  `jenis_kelamin` char(1) NOT NULL,
  `jenis` char(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `anggota`
--

INSERT INTO `anggota` (`id`, `id_kota`, `id_organisasi`, `nama`, `alamat`, `telpon`, `email`, `tanggal_daftar`, `jenis_kelamin`, `jenis`) VALUES
(6, 5, 1, 'Nauval Qais Annabil', 'Komp. Manglayang ', '09349023424', 'nauval@gmail.com', '2025-02-22', 'W', 'Mahasiswa'),
(8, 2, 1, 'Dini Alpiani', 'Deket Ducil', '0834900234', 'dini@gmail.com', '2025-03-22', 'W', 'Mahasiswa');

-- --------------------------------------------------------

--
-- Table structure for table `buku`
--

CREATE TABLE `buku` (
  `kode_buku` char(6) NOT NULL,
  `kode_kategori` char(3) NOT NULL,
  `judul` varchar(255) NOT NULL,
  `pengarang` varchar(100) NOT NULL,
  `penerbit` varchar(100) NOT NULL,
  `tahun_terbit` smallint(6) NOT NULL,
  `edisi` tinyint(4) NOT NULL,
  `tanggal_pengadaan` date NOT NULL,
  `nama_kategori` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `buku`
--

INSERT INTO `buku` (`kode_buku`, `kode_kategori`, `judul`, `pengarang`, `penerbit`, `tahun_terbit`, `edisi`, `tanggal_pengadaan`, `nama_kategori`) VALUES
('543210', '800', 'seni emot merah', 'pei', 'peicollection', 2025, 1, '2025-05-21', 'Sastra');

-- --------------------------------------------------------

--
-- Table structure for table `kategori_buku`
--

CREATE TABLE `kategori_buku` (
  `kode_kategori` char(3) NOT NULL,
  `nama_kategori` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `kategori_buku`
--

INSERT INTO `kategori_buku` (`kode_kategori`, `nama_kategori`) VALUES
('000', 'Karya Umum'),
('100', 'Filsafat dan Psikolo'),
('200', 'Agama'),
('300', 'Ilmu-ilmu Sosial'),
('400', 'Bahasa'),
('500', 'Ilmu Pengetahuan Alam dan Matematika'),
('600', 'Teknologi dan Ilmu-ilmu Terapan'),
('700', 'Seni, Hiburan, dan Olahraga'),
('800', 'Sastra'),
('900', 'Geografi dan Sejarah');

-- --------------------------------------------------------

--
-- Table structure for table `kota`
--

CREATE TABLE `kota` (
  `id` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `kota`
--

INSERT INTO `kota` (`id`, `nama`) VALUES
(1, 'KOTA BANDUNG'),
(2, 'KAB. BANDUNG'),
(3, 'KAB. BANDUNG BARAT'),
(4, 'KAB. BANDUNG TIMUR'),
(5, 'KOTA KARAWANG'),
(6, 'KAB KARAWANG'),
(7, 'KOTA SUMEDANG'),
(9, 'KAB. BANTEN BARAT'),
(10, 'KOTA BANTEN');

-- --------------------------------------------------------

--
-- Table structure for table `organisasi`
--

CREATE TABLE `organisasi` (
  `id` tinyint(4) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `jenis` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `organisasi`
--

INSERT INTO `organisasi` (`id`, `nama`, `jenis`) VALUES
(1, 'Himpunan Mahasiswa Teknik', 'Unit');

-- --------------------------------------------------------

--
-- Table structure for table `session`
--

CREATE TABLE `session` (
  `session_id` varchar(50) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(32) NOT NULL,
  `fullname` varchar(100) NOT NULL,
  `role` varchar(10) NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `session`
--

INSERT INTO `session` (`session_id`, `username`, `password`, `fullname`, `role`, `created_at`) VALUES
('b2340b35-606e-4e56-9da4-d647c0cbc8ff', 'admin', '202cb962ac59075b964b07152d234b70', 'Admin Pustakaloka', 'admin', '2025-05-23 12:58:05');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `username` varchar(20) NOT NULL,
  `password` varchar(32) NOT NULL,
  `fullname` varchar(100) NOT NULL,
  `role` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`username`, `password`, `fullname`, `role`) VALUES
('admin', '202cb962ac59075b964b07152d234b70', 'Admin Pustakaloka', 'admin'),
('user1', '202cb962ac59075b964b07152d234b70', 'Staff 1', 'staff');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `anggota`
--
ALTER TABLE `anggota`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_kota` (`id_kota`),
  ADD KEY `id_organisasi` (`id_organisasi`);

--
-- Indexes for table `buku`
--
ALTER TABLE `buku`
  ADD PRIMARY KEY (`kode_buku`);

--
-- Indexes for table `kategori_buku`
--
ALTER TABLE `kategori_buku`
  ADD PRIMARY KEY (`kode_kategori`);

--
-- Indexes for table `kota`
--
ALTER TABLE `kota`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `organisasi`
--
ALTER TABLE `organisasi`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `session`
--
ALTER TABLE `session`
  ADD PRIMARY KEY (`session_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `anggota`
--
ALTER TABLE `anggota`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `kota`
--
ALTER TABLE `kota`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `organisasi`
--
ALTER TABLE `organisasi`
  MODIFY `id` tinyint(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `anggota`
--
ALTER TABLE `anggota`
  ADD CONSTRAINT `anggota_ibfk_1` FOREIGN KEY (`id_kota`) REFERENCES `kota` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `anggota_ibfk_2` FOREIGN KEY (`id_organisasi`) REFERENCES `organisasi` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
