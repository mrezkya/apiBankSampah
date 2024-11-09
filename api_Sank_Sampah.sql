-- phpMyAdmin SQL Dump
-- version 5.2.1deb1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Nov 09, 2024 at 10:42 AM
-- Server version: 10.11.6-MariaDB-0+deb12u1
-- PHP Version: 8.2.20

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `api_Sank_Sampah`
--

-- --------------------------------------------------------

--
-- Table structure for table `pengguna`
--

CREATE TABLE `pengguna` (
  `NIK` bigint(16) NOT NULL,
  `username` varchar(60) NOT NULL,
  `nomor_hp` bigint(12) NOT NULL,
  `email` varchar(50) NOT NULL,
  `alamat` varchar(50) NOT NULL,
  `auth` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pengguna`
--

INSERT INTO `pengguna` (`NIK`, `username`, `nomor_hp`, `email`, `alamat`, `auth`) VALUES
(12345, 'test', 9777, 'panini@gmil.com', 'watonea', 'user'),
(123455, 'testi', 9777, 'panini@gmil.com', 'watonea', 'user'),
(239732, 'asdhaksd', 198237912, 'dhaksjda', 'ajshdaksd', 'user'),
(1234551, 'testi2', 9777, 'panini@gmil.com', 'watonea', 'user'),
(12345678, 'alif', 899, 'dien@hotmail.com', 'Perdos', 'user'),
(1234567890, 'Dicky', 8123456789, 'dicky@me.com', 'Jl. Kebon Jeruk', 'user'),
(123321123321123, 'Maya Sara Sihombing', 6283135026072, 'mrezkya@hotmail.com', 'JL. Banteng', 'admin'),
(123123123123123123, 'panini', 83135026072, 'mrezkya@hotmail.com', 'watonea', 'user'),
(123123123123123321, 'okelh', 1234567890, 'askda@gmail.com', 'asdjaks', 'user'),
(321321321321321321, 'Abdul Fath Ramadhan', 82123212312, 'madan@gmail.com', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `pesanan`
--

CREATE TABLE `pesanan` (
  `id_Pesan` bigint(20) NOT NULL,
  `Nama` varchar(50) NOT NULL,
  `Jenis_Sampah` varchar(50) NOT NULL,
  `Berat_Sampah` int(100) NOT NULL,
  `Nomor_HP` bigint(16) NOT NULL,
  `Alamat` varchar(50) NOT NULL,
  `kordinat_A` double NOT NULL,
  `kordinat_B` float NOT NULL,
  `Waktu` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pesanan`
--

INSERT INTO `pesanan` (`id_Pesan`, `Nama`, `Jenis_Sampah`, `Berat_Sampah`, `Nomor_HP`, `Alamat`, `kordinat_A`, `kordinat_B`, `Waktu`) VALUES
(58, 'Dicky', 'kardus', 5, 8123456789, 'Jl. Kebon Jeruk', -6.21462, 106.846, '2023-01-01'),
(59, 'Dicky', 'kardus', 5, 8123456789, 'Jl. Kebon Jeruk', -6.21462, 106.846, '2023-01-01'),
(66, 'Maya Sara Sihombing', 'Sampah Plastik', 1, 6283135026072, 'JL. Banteng', -122.083922, 37.4221, '2024-11-08');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `pengguna`
--
ALTER TABLE `pengguna`
  ADD PRIMARY KEY (`NIK`);

--
-- Indexes for table `pesanan`
--
ALTER TABLE `pesanan`
  ADD PRIMARY KEY (`id_Pesan`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `pesanan`
--
ALTER TABLE `pesanan`
  MODIFY `id_Pesan` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=67;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
