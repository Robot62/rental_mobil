-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 23, 2022 at 02:24 PM
-- Server version: 10.4.25-MariaDB
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `rental_mobil`
--

-- --------------------------------------------------------

--
-- Table structure for table `akun`
--

CREATE TABLE `akun` (
  `id` int(11) NOT NULL,
  `username` varchar(15) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `akun`
--

INSERT INTO `akun` (`id`, `username`, `password`) VALUES
(12, 'admin', 'admin123');

-- --------------------------------------------------------

--
-- Table structure for table `jenis_bayar`
--

CREATE TABLE `jenis_bayar` (
  `id` int(11) NOT NULL,
  `jenis_bayar` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `jenis_bayar`
--

INSERT INTO `jenis_bayar` (`id`, `jenis_bayar`) VALUES
(3, 'Cash'),
(4, 'Kredit'),
(5, 'Transfer'),
(6, 'GoPay'),
(7, 'OVO');

-- --------------------------------------------------------

--
-- Table structure for table `merk`
--

CREATE TABLE `merk` (
  `id` int(11) NOT NULL,
  `merk` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `merk`
--

INSERT INTO `merk` (`id`, `merk`) VALUES
(8, 'Toyota'),
(9, 'Suzuki'),
(13, 'Lamborghini'),
(14, 'Ford'),
(15, 'Ferarri'),
(16, 'Daihatsu'),
(17, 'Honda');

-- --------------------------------------------------------

--
-- Table structure for table `mobil`
--

CREATE TABLE `mobil` (
  `id` int(11) NOT NULL,
  `nama_mobil` varchar(30) DEFAULT NULL,
  `warna` varchar(20) DEFAULT NULL,
  `no_polisi` varchar(10) DEFAULT NULL,
  `jumlah_kursi` int(1) DEFAULT NULL,
  `tahun_beli` int(4) DEFAULT NULL,
  `id_merk` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `mobil`
--

INSERT INTO `mobil` (`id`, `nama_mobil`, `warna`, `no_polisi`, `jumlah_kursi`, `tahun_beli`, `id_merk`) VALUES
(13, 'Toyota Kijang Innova', 'Putih', 'R 6788 KM', 6, 2019, NULL),
(14, 'Toyota Kijang Innova', 'Abu Abu', 'R 1309 KN', 7, 2018, 8),
(15, 'Suzuki All New Ertiga', 'Putih', 'R 1739 KN', 8, 2018, 9),
(16, 'Lamborghini Aventador', 'Kuning', 'L 81 SHF', 2, 2012, 13),
(18, 'Ferrari Portofino', 'Silver', 'Luky F4hm1', 2, 2020, 15),
(19, 'Toyota All New Avanza', 'Hitam', 'L 777 SH', 8, 2019, 8),
(20, 'Toyota Agya', 'Putih', 'B 1831 RH', 5, 2015, 8),
(21, 'Daihatsu Terios', 'Putih', 'B 2628 ZGR', 8, 2020, 16),
(22, 'Honda Jazz Rs', 'Putih', 'B 555 HRT', 5, 2019, 17);

-- --------------------------------------------------------

--
-- Table structure for table `pemesan`
--

CREATE TABLE `pemesan` (
  `id` int(11) NOT NULL,
  `nama` varchar(50) DEFAULT NULL,
  `alamat` varchar(100) DEFAULT NULL,
  `jenis_kelamin` enum('L','P') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pemesan`
--

INSERT INTO `pemesan` (`id`, `nama`, `alamat`, `jenis_kelamin`) VALUES
(8, 'Putri Shofi', 'Jalan Jalan dulu, asalkan bahagia', 'P'),
(9, 'Mochammad Nafisa Chafith', 'Surabaya', 'L'),
(10, 'Luky Fahmi', 'Sidoarjo', 'L');

-- --------------------------------------------------------

--
-- Table structure for table `perjalanan`
--

CREATE TABLE `perjalanan` (
  `id` int(11) NOT NULL,
  `asal` varchar(20) DEFAULT NULL,
  `tujuan` varchar(20) DEFAULT NULL,
  `jarak` int(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `perjalanan`
--

INSERT INTO `perjalanan` (`id`, `asal`, `tujuan`, `jarak`) VALUES
(3, 'Cilacap', 'Jogjakarta', 300),
(4, 'Cilacap', 'Ciamis', 70),
(5, 'Sidoarjo', 'Malang', 72),
(6, 'Surabaya', 'Bandung', 777),
(7, 'Surabaya', 'Malang', 95),
(8, 'Surabaya', 'Jogjakarta', 325),
(9, 'Sidoarjo', 'Jojgakarta', 324);

-- --------------------------------------------------------

--
-- Table structure for table `pesanan`
--

CREATE TABLE `pesanan` (
  `id` int(11) NOT NULL,
  `harga` int(11) DEFAULT NULL,
  `tgl_pinjam` date DEFAULT NULL,
  `tgl_kembali` date DEFAULT NULL,
  `id_pemesan` int(11) DEFAULT NULL,
  `id_mobil` int(11) DEFAULT NULL,
  `id_perjalanan` int(11) DEFAULT NULL,
  `id_jenis_bayar` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pesanan`
--

INSERT INTO `pesanan` (`id`, `harga`, `tgl_pinjam`, `tgl_kembali`, `id_pemesan`, `id_mobil`, `id_perjalanan`, `id_jenis_bayar`) VALUES
(1, 1000000, '2020-01-01', '2020-01-04', NULL, 13, NULL, NULL),
(6, 2000000, '2020-01-17', '2020-01-20', NULL, 14, 3, 3),
(8, 1500000, '2020-01-18', '2020-01-21', NULL, 15, 4, 3),
(9, 600000, '2020-12-15', '2020-12-20', 8, 14, 5, 5),
(10, 10000000, '2020-12-15', '2020-12-25', 10, 18, 5, 3),
(11, 20000000, '2020-12-15', '2020-12-31', 9, 16, 6, 3);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `akun`
--
ALTER TABLE `akun`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jenis_bayar`
--
ALTER TABLE `jenis_bayar`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `merk`
--
ALTER TABLE `merk`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mobil`
--
ALTER TABLE `mobil`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mobil_ibfk_2` (`id_merk`);

--
-- Indexes for table `pemesan`
--
ALTER TABLE `pemesan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `perjalanan`
--
ALTER TABLE `perjalanan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pesanan`
--
ALTER TABLE `pesanan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_pemesan` (`id_pemesan`),
  ADD KEY `id_mobil` (`id_mobil`),
  ADD KEY `id_perjalanan` (`id_perjalanan`),
  ADD KEY `id_jenis_bayar` (`id_jenis_bayar`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `akun`
--
ALTER TABLE `akun`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `jenis_bayar`
--
ALTER TABLE `jenis_bayar`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `merk`
--
ALTER TABLE `merk`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `mobil`
--
ALTER TABLE `mobil`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `pemesan`
--
ALTER TABLE `pemesan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `perjalanan`
--
ALTER TABLE `perjalanan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `pesanan`
--
ALTER TABLE `pesanan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `mobil`
--
ALTER TABLE `mobil`
  ADD CONSTRAINT `mobil_ibfk_2` FOREIGN KEY (`id_merk`) REFERENCES `merk` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `pesanan`
--
ALTER TABLE `pesanan`
  ADD CONSTRAINT `pesanan_ibfk_1` FOREIGN KEY (`id_pemesan`) REFERENCES `pemesan` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `pesanan_ibfk_2` FOREIGN KEY (`id_mobil`) REFERENCES `mobil` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `pesanan_ibfk_3` FOREIGN KEY (`id_perjalanan`) REFERENCES `perjalanan` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `pesanan_ibfk_4` FOREIGN KEY (`id_jenis_bayar`) REFERENCES `jenis_bayar` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
