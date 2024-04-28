-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 28 Apr 2024 pada 16.29
-- Versi server: 10.4.28-MariaDB
-- Versi PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `tugasmandiri4`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `dokter`
--

CREATE TABLE `dokter` (
  `idDokter` int(11) NOT NULL,
  `nama` varchar(100) DEFAULT NULL,
  `spesialis` varchar(100) DEFAULT NULL,
  `telp` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `dokter`
--

INSERT INTO `dokter` (`idDokter`, `nama`, `spesialis`, `telp`) VALUES
(1, 'Dr. Adi Nuzul Pratama', 'Bedah Umum', '082169984329'),
(2, 'Dr. M.Abdurrahman', 'Anak', '082386674776'),
(3, 'Dr. Anggoro setyo Nugroho ', 'Kandungan', '0895389430709'),
(4, 'Dr. Noe prihantoyo simanjuntak', 'Jantung', '082287448674'),
(5, 'Dr. Destian chikal sukatmawan', 'Mata', '083117737343');

-- --------------------------------------------------------

--
-- Struktur dari tabel `kunjungan`
--

CREATE TABLE `kunjungan` (
  `idKunjungan` int(11) NOT NULL,
  `idDokter` int(11) DEFAULT NULL,
  `idPasien` int(11) DEFAULT NULL,
  `catatan` text DEFAULT NULL,
  `tipeKunjungan` enum('Rawat Jalan','Rawat Inap') DEFAULT NULL,
  `tanggalJamMasuk` datetime DEFAULT NULL,
  `tanggalJamKeluar` datetime DEFAULT NULL,
  `idRuangan` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `kunjungan`
--

INSERT INTO `kunjungan` (`idKunjungan`, `idDokter`, `idPasien`, `catatan`, `tipeKunjungan`, `tanggalJamMasuk`, `tanggalJamKeluar`, `idRuangan`) VALUES
(1, 1, 1, 'Pasien mengeluhkan nyeri perut.', 'Rawat Jalan', '2024-04-28 08:00:00', '2024-04-28 09:30:00', NULL),
(2, 2, 2, 'Pasien datang untuk cek rutin.', 'Rawat Jalan', '2024-04-28 09:30:00', '2024-04-28 10:15:00', NULL),
(3, 3, 3, 'Pasien hamil 7 bulan dengan keluhan kontraksi.', 'Rawat Jalan', '2024-04-28 10:00:00', '2024-04-28 11:45:00', NULL),
(4, 4, 4, 'Pasien mengalami nyeri dada.', 'Rawat Jalan', '2024-04-28 11:00:00', '2024-04-28 12:30:00', NULL),
(5, 5, 5, 'Pasien butuh konsultasi untuk operasi katarak.', 'Rawat Jalan', '2024-04-28 12:30:00', '2024-04-28 13:45:00', NULL),
(6, 1, 6, 'Pasien perlu operasi usus buntu.', 'Rawat Inap', '2024-04-28 13:00:00', '2024-04-29 10:00:00', NULL),
(7, 2, 7, 'Pasien datang dengan demam tinggi.', 'Rawat Inap', '2024-04-29 08:00:00', '2024-04-29 12:00:00', NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `pasien`
--

CREATE TABLE `pasien` (
  `idPasien` int(11) NOT NULL,
  `nama` varchar(100) DEFAULT NULL,
  `alamat` varchar(255) DEFAULT NULL,
  `telp` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `pasien`
--

INSERT INTO `pasien` (`idPasien`, `nama`, `alamat`, `telp`) VALUES
(1, 'John Doe', 'Jl. Pahlawan No. 123', '081234567890'),
(2, 'Jane Smith', 'Jl. Mangga No. 456', '087654321098'),
(3, 'Michael Johnson', 'Jl. Melati No. 789', '085432176543'),
(4, 'Emily Brown', 'Jl. Kenanga No. 1011', '081237645231'),
(5, 'David Lee', 'Jl. Anggrek No. 1213', '089876543210'),
(6, 'Sarah Johnson', 'Jl. Dahlia No. 1415', '081234567891'),
(7, 'Robert Smith', 'Jl. Teratai No. 1617', '087654321097'),
(8, 'Emma Wilson', 'Jl. Mawar No. 1819', '085432176544'),
(9, 'Christopher Davis', 'Jl. Sakura No. 2021', '081237645232'),
(10, 'Olivia Miller', 'Jl. Melur No. 2223', '089876543211');

-- --------------------------------------------------------

--
-- Struktur dari tabel `ruangan`
--

CREATE TABLE `ruangan` (
  `idRuangan` int(11) NOT NULL,
  `namaRuangan` varchar(100) DEFAULT NULL,
  `jenisRuangan` enum('Rawat Inap','Rawat Jalan') DEFAULT NULL,
  `kapasitas` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `ruangan`
--

INSERT INTO `ruangan` (`idRuangan`, `namaRuangan`, `jenisRuangan`, `kapasitas`) VALUES
(1, 'Ruangan 1', 'Rawat Jalan', 20),
(2, 'Ruangan 2', 'Rawat Jalan', 15),
(3, 'Ruangan 3', 'Rawat Inap', 10),
(4, 'Ruangan 4', 'Rawat Inap', 8);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `dokter`
--
ALTER TABLE `dokter`
  ADD PRIMARY KEY (`idDokter`);

--
-- Indeks untuk tabel `kunjungan`
--
ALTER TABLE `kunjungan`
  ADD PRIMARY KEY (`idKunjungan`),
  ADD KEY `idDokter` (`idDokter`),
  ADD KEY `idPasien` (`idPasien`),
  ADD KEY `fk_ruangan` (`idRuangan`);

--
-- Indeks untuk tabel `pasien`
--
ALTER TABLE `pasien`
  ADD PRIMARY KEY (`idPasien`);

--
-- Indeks untuk tabel `ruangan`
--
ALTER TABLE `ruangan`
  ADD PRIMARY KEY (`idRuangan`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `dokter`
--
ALTER TABLE `dokter`
  MODIFY `idDokter` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `kunjungan`
--
ALTER TABLE `kunjungan`
  MODIFY `idKunjungan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `pasien`
--
ALTER TABLE `pasien`
  MODIFY `idPasien` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT untuk tabel `ruangan`
--
ALTER TABLE `ruangan`
  MODIFY `idRuangan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `kunjungan`
--
ALTER TABLE `kunjungan`
  ADD CONSTRAINT `fk_ruangan` FOREIGN KEY (`idRuangan`) REFERENCES `ruangan` (`idRuangan`),
  ADD CONSTRAINT `kunjungan_ibfk_1` FOREIGN KEY (`idDokter`) REFERENCES `dokter` (`idDokter`),
  ADD CONSTRAINT `kunjungan_ibfk_2` FOREIGN KEY (`idPasien`) REFERENCES `pasien` (`idPasien`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
