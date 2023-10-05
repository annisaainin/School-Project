-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 23 Jan 2022 pada 16.47
-- Versi Server: 10.1.28-MariaDB
-- PHP Version: 5.6.32

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `datalogistik2`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_barang`
--

CREATE TABLE `tb_barang` (
  `id_barang` varchar(11) NOT NULL,
  `nama_barang` varchar(128) NOT NULL,
  `berat_barang` int(11) NOT NULL,
  `lebar_barang` int(5) NOT NULL,
  `tinggi_barang` int(5) NOT NULL,
  `harga_barang` int(11) NOT NULL,
  `stok_barang` int(11) NOT NULL,
  `tgl_produksi` date NOT NULL,
  `id_jenis_barang` varchar(11) NOT NULL,
  `id_gudang` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tb_barang`
--

INSERT INTO `tb_barang` (`id_barang`, `nama_barang`, `berat_barang`, `lebar_barang`, `tinggi_barang`, `harga_barang`, `stok_barang`, `tgl_produksi`, `id_jenis_barang`, `id_gudang`) VALUES
('BR00001', 'VGA1', 1, 1, 2, 500000, 90, '2021-12-22', 'JB00001', 'GD00001'),
('BR00002', 'Vga3', 3, 53, 3, 3, 50, '2021-12-23', 'JB00002', 'GD00002'),
('BR00003', 'Kipas', 8, 8, 8, 8, 88, '2021-12-29', 'JB00001', 'GD00001'),
('BR00004', 'Kursi', 44, 44, 44, 44, 44, '2022-01-06', 'JB00003', 'GD00001'),
('BR00005', 'Bayam', 2, 2, 5, 1400000, 80, '2022-01-23', 'JB00001', 'GD00001');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_detail_gambar`
--

CREATE TABLE `tb_detail_gambar` (
  `id_gambar` int(11) NOT NULL,
  `file_gambar` text NOT NULL,
  `id_lain` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tb_detail_gambar`
--

INSERT INTO `tb_detail_gambar` (`id_gambar`, `file_gambar`, `id_lain`) VALUES
(1, '29092020153123men-s-white-dress-shirt-936229.jpg', 'US00001'),
(2, '29092020153123men-s-white-dress-shirt-936229.jpg', 'BR00005'),
(4, 'WhatsApp Image 2021-11-25 at 10.03.54.jpeg', 'BR00001'),
(5, '29092020153123men-s-white-dress-shirt-936229.jpg', 'US00003'),
(6, '1638009400540.jpg', 'BR00002'),
(7, 'maxresdefault (1).jpg', 'BR00003'),
(8, 'smiley_02.jpg', 'BR00004'),
(9, 'pro-img-06.jpg', 'BR00005');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_detail_pengiriman`
--

CREATE TABLE `tb_detail_pengiriman` (
  `id_detail_kirim` int(11) NOT NULL,
  `id_pengiriman` varchar(15) NOT NULL,
  `id_pesanan` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tb_detail_pengiriman`
--

INSERT INTO `tb_detail_pengiriman` (`id_detail_kirim`, `id_pengiriman`, `id_pesanan`) VALUES
(1, 'PG00007', 'PS00004'),
(2, 'PG00006', 'PS00003'),
(4, 'PG00006', 'PS00006'),
(5, 'PG00006', 'PS00007'),
(6, 'PG00010', 'PS00005'),
(7, 'PG00008', 'PS00008'),
(8, 'PG00009', 'PS00009'),
(9, 'PG00009', 'PS00010'),
(10, 'PG00011', 'PS00011'),
(11, 'PG00012', 'PS00016'),
(12, 'PG00012', 'PS00015'),
(13, 'PG00013', 'PS00018'),
(14, 'PG00013', 'PS00017');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_detail_pesanan`
--

CREATE TABLE `tb_detail_pesanan` (
  `id_transaksi` int(11) NOT NULL,
  `kuantitas_detail` int(11) NOT NULL,
  `sub_total` int(11) NOT NULL,
  `detail_total_harga` int(11) NOT NULL,
  `id_pesanan` varchar(11) NOT NULL,
  `id_barang` varchar(15) NOT NULL,
  `id_user` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tb_detail_pesanan`
--

INSERT INTO `tb_detail_pesanan` (`id_transaksi`, `kuantitas_detail`, `sub_total`, `detail_total_harga`, `id_pesanan`, `id_barang`, `id_user`) VALUES
(2, 4, 44, 176, 'PS00003', 'BR00004', 'US00003'),
(3, 1, 3, 3, 'PS00003', 'BR00002', 'US00003'),
(4, 3, 500000, 1500000, 'PS00003', 'BR00001', 'US00003'),
(5, 3, 8, 24, 'PS00004', 'BR00003', 'US00003'),
(6, 3, 500000, 1500000, 'PS00004', 'BR00001', 'US00003'),
(7, 1, 3, 3, 'PS00005', 'BR00002', 'US00003'),
(8, 4, 44, 176, 'PS00005', 'BR00004', 'US00003'),
(9, 2, 500000, 1000000, 'PS00005', 'BR00001', 'US00003'),
(10, 1, 3, 3, 'PS00006', 'BR00002', 'US00003'),
(11, 3, 8, 24, 'PS00006', 'BR00003', 'US00003'),
(12, 1, 500000, 500000, 'PS00007', 'BR00001', 'US00003'),
(13, 4, 44, 176, 'PS00009', 'BR00004', 'US00003'),
(17, 2, 3, 6, 'PS00010', 'BR00002', 'US00004'),
(18, 2, 44, 88, 'PS00011', 'BR00004', 'US00002'),
(19, 2, 44, 88, 'PS00012', 'BR00004', 'US00002'),
(20, 2, 500000, 1000000, 'PS00012', 'BR00001', 'US00002'),
(21, 2, 500000, 1000000, 'PS00013', 'BR00001', 'US00003'),
(22, 2, 3, 6, 'PS00013', 'BR00002', 'US00003'),
(23, 3, 44, 132, 'PS00014', 'BR00004', 'US00004'),
(24, 2, 500000, 1000000, 'PS00014', 'BR00001', 'US00004'),
(25, 1, 44, 44, 'PS00016', 'BR00004', 'US00002'),
(26, 2, 3, 6, 'PS00016', 'BR00002', 'US00002'),
(27, 2, 500000, 1000000, 'PS00016', 'BR00001', 'US00002'),
(28, 3, 8, 24, 'PS00015', 'BR00003', 'US00004'),
(29, 2, 3, 6, 'PS00015', 'BR00002', 'US00004'),
(30, 3, 8, 24, 'PS00017', 'BR00003', 'US00002'),
(31, 2, 500000, 1000000, 'PS00018', 'BR00001', 'US00003'),
(32, 1, 44, 44, 'PS00018', 'BR00004', 'US00003');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_gudang`
--

CREATE TABLE `tb_gudang` (
  `id_gudang` varchar(15) NOT NULL,
  `nama_gudang` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tb_gudang`
--

INSERT INTO `tb_gudang` (`id_gudang`, `nama_gudang`) VALUES
('GD00001', 'Gudang 1'),
('GD00002', 'Gudang3');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_hak_akses`
--

CREATE TABLE `tb_hak_akses` (
  `id_hak_akses` varchar(15) NOT NULL,
  `jenis_hak_akses` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tb_hak_akses`
--

INSERT INTO `tb_hak_akses` (`id_hak_akses`, `jenis_hak_akses`) VALUES
('HK00001', 'Adminstator'),
('HK00002', 'Pelanggan');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_jenis_barang`
--

CREATE TABLE `tb_jenis_barang` (
  `id_jenis_barang` varchar(11) NOT NULL,
  `nama_jenis_barang` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tb_jenis_barang`
--

INSERT INTO `tb_jenis_barang` (`id_jenis_barang`, `nama_jenis_barang`) VALUES
('JB00001', 'Low End'),
('JB00002', 'Mid End'),
('JB00003', 'High End');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_kendaraan`
--

CREATE TABLE `tb_kendaraan` (
  `id_kendaraan` varchar(15) NOT NULL,
  `no_pol` varchar(8) NOT NULL,
  `nama_kendaraan` text NOT NULL,
  `tipe_kendaraan` varchar(8) NOT NULL,
  `merk_kendaraan` text NOT NULL,
  `tahun_kendaraan` varchar(50) NOT NULL,
  `batas_berat` int(11) NOT NULL,
  `panjang_kendaraan` int(11) NOT NULL,
  `lebar_kendaraan` int(11) NOT NULL,
  `tinggi_kendaraan` int(11) NOT NULL,
  `batas_sementara` int(15) NOT NULL,
  `jarak_sementara` int(11) NOT NULL,
  `status_kendaraan` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tb_kendaraan`
--

INSERT INTO `tb_kendaraan` (`id_kendaraan`, `no_pol`, `nama_kendaraan`, `tipe_kendaraan`, `merk_kendaraan`, `tahun_kendaraan`, `batas_berat`, `panjang_kendaraan`, `lebar_kendaraan`, `tinggi_kendaraan`, `batas_sementara`, `jarak_sementara`, `status_kendaraan`) VALUES
('KD00002', '54353', 'Truk Pick Up', 'ds1', 'adsa1', '2021-04', 200, 232, 34, 5, 0, 0, 0),
('KD00003', '54353', 'Truk Colt Diesel Double', 'ds1', 'adsa1', '2021-04', 300, 190, 34, 5, 0, 0, 0),
('KD00004', '54353', 'Truk Fuso', 'ds1', 'adsa1', '2021-04', 200, 0, 34, 5, 0, 0, 0),
('KD00005', '54353', 'Truk Tronton', 'ds1', 'adsa1', '2021-04', 45, 231, 341, 5, 0, 0, 0),
('KD00006', 'L 6782 H', 'Truk Trailer', 'Daseil', 'Honda', '2022-06', 150, 5, 8, 5, 0, 0, 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_konfirmasi`
--

CREATE TABLE `tb_konfirmasi` (
  `id_konfirmasi` int(11) NOT NULL,
  `kon_bayar` int(11) NOT NULL,
  `tgl_bayar` datetime NOT NULL,
  `kon_kirim` int(11) NOT NULL,
  `tgl_kirim` datetime NOT NULL,
  `kon_sampai` int(11) NOT NULL,
  `tgl_sampai` datetime NOT NULL,
  `id_pesanan` varchar(15) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data untuk tabel `tb_konfirmasi`
--

INSERT INTO `tb_konfirmasi` (`id_konfirmasi`, `kon_bayar`, `tgl_bayar`, `kon_kirim`, `tgl_kirim`, `kon_sampai`, `tgl_sampai`, `id_pesanan`) VALUES
(0, 2, '2022-01-23 20:13:19', 2, '2022-01-23 20:16:24', 0, '0000-00-00 00:00:00', 'PS00015'),
(1, 2, '2021-12-27 22:43:01', 2, '2021-12-31 18:23:42', 1, '2022-01-23 11:47:23', 'PS00003'),
(2, 2, '2021-12-28 11:20:50', 2, '2021-12-31 18:31:48', 1, '2022-01-23 11:47:02', 'PS00004'),
(3, 2, '2021-12-28 15:29:28', 2, '2022-01-22 21:57:09', 0, '0000-00-00 00:00:00', 'PS00005'),
(4, 2, '2021-12-29 12:52:04', 2, '2021-12-31 18:23:14', 0, '0000-00-00 00:00:00', 'PS00006'),
(5, 2, '2021-12-29 20:05:11', 2, '2021-12-31 16:46:54', 1, '2021-12-31 20:02:39', 'PS00007'),
(6, 2, '2021-12-31 21:07:31', 2, '2021-12-31 21:09:32', 1, '2021-12-31 21:10:02', 'PS00008'),
(7, 2, '2022-01-03 09:48:16', 2, '2022-01-03 10:04:29', 1, '2022-01-03 10:08:29', 'PS00009'),
(8, 2, '2022-01-03 09:57:02', 2, '2022-01-03 10:05:02', 1, '2022-01-03 10:07:04', 'PS00010'),
(9, 2, '2022-01-22 22:36:06', 2, '2022-01-23 01:32:37', 1, '2022-01-23 20:28:18', 'PS00011'),
(10, 2, '2022-01-22 22:45:01', 1, '2022-01-23 12:28:34', 0, '0000-00-00 00:00:00', 'PS00012'),
(11, 0, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 'PS00013'),
(12, 2, '2022-01-23 12:26:28', 1, '2022-01-23 12:26:57', 0, '0000-00-00 00:00:00', 'PS00014'),
(13, 0, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 'PS00014'),
(14, 2, '2022-01-23 20:14:09', 2, '2022-01-23 20:16:35', 1, '2022-01-23 20:28:03', 'PS00016'),
(15, 2, '2022-01-23 20:30:02', 2, '2022-01-23 20:35:01', 0, '0000-00-00 00:00:00', 'PS00017'),
(16, 2, '2022-01-23 20:31:08', 2, '2022-01-23 21:08:04', 0, '0000-00-00 00:00:00', 'PS00018');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_metode_pembayaran`
--

CREATE TABLE `tb_metode_pembayaran` (
  `id_metode` varchar(15) NOT NULL,
  `nama_metode` text NOT NULL,
  `cashback` int(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tb_metode_pembayaran`
--

INSERT INTO `tb_metode_pembayaran` (`id_metode`, `nama_metode`, `cashback`) VALUES
('MP00003', 'fsdsd', 43),
('MP0001', 'Debit Online', 1000),
('MP0002', 'OVO', 20000),
('MP0003', 'GoPay', 5000),
('MP0004', 'Dana', 0),
('MP0005', 'Kredivo', 0),
('MP0006', 'Credit Card1', 32),
('MP0007', 'Virtual Account ', 0),
('MP0008', 'COD', 6456),
('MP0009', 'Alfamart', 2000),
('MP0010', 'Indomaret', 34),
('MP0012', 'oke', 432);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_pengiriman`
--

CREATE TABLE `tb_pengiriman` (
  `id_pengiriman` varchar(15) NOT NULL,
  `id_kendaraan2` varchar(15) NOT NULL,
  `tgl_pengiriman` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tb_pengiriman`
--

INSERT INTO `tb_pengiriman` (`id_pengiriman`, `id_kendaraan2`, `tgl_pengiriman`) VALUES
('PG00002', '-', '0000-00-00 00:00:00'),
('PG00003', '-', '0000-00-00 00:00:00'),
('PG00004', '-', '0000-00-00 00:00:00'),
('PG00005', '-', '0000-00-00 00:00:00'),
('PG00006', 'KD00003', '2021-12-31 15:13:00'),
('PG00007', 'KD00004', '2021-12-31 17:40:00'),
('PG00010', 'KD00003', '2022-01-22 13:55:00'),
('PG00011', 'KD00003', '2022-01-24 10:32:00'),
('PG00012', 'KD00004', '2022-01-26 20:15:00'),
('PG00013', 'KD00002', '2022-01-23 13:34:00');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_pesanan`
--

CREATE TABLE `tb_pesanan` (
  `id_pesanan` varchar(15) NOT NULL,
  `tgl_pesanan` datetime NOT NULL,
  `total_kuantitas` int(50) NOT NULL,
  `total_berat` int(11) NOT NULL,
  `harga_kg` int(50) NOT NULL,
  `harga_km` int(50) NOT NULL,
  `total_cashback` int(50) NOT NULL,
  `total_keseluruhan` int(50) NOT NULL,
  `des_pesanan` text NOT NULL,
  `id_user` varchar(15) NOT NULL,
  `id_toko` varchar(11) NOT NULL,
  `id_metode` varchar(25) NOT NULL,
  `status_bayar` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tb_pesanan`
--

INSERT INTO `tb_pesanan` (`id_pesanan`, `tgl_pesanan`, `total_kuantitas`, `total_berat`, `harga_kg`, `harga_km`, `total_cashback`, `total_keseluruhan`, `des_pesanan`, `id_user`, `id_toko`, `id_metode`, `status_bayar`) VALUES
('PS00001', '2021-12-23 06:18:16', 0, 0, 0, 0, 0, 8000000, 'Oke', '', 'TK00001', 'BR00001', 0),
('PS00002', '2021-12-25 00:00:00', 0, 0, 0, 0, 0, 5, 'gg', '', 'TK00003', 'BR00001', 0),
('PS00003', '2021-12-25 17:03:16', 6, 50, 274000, 126000, 20000, 1380135, 'fds', 'US00003', 'TK00004', 'MP0002', 1),
('PS00004', '2021-12-28 11:19:07', 4, 80, 22000, 126000, 2000, 1646008, 'fd', 'US00003', 'TK00005', 'MP0009', 1),
('PS00005', '2021-12-28 15:23:31', 5, 93, 186000, 126000, 1000, 1311091, 'oke', 'US00003', 'TK00004', 'MP0001', 1),
('PS00006', '2021-12-29 12:51:41', 4, 27, 54000, 31000, 5000, 80027, 'aa', 'US00003', 'TK00005', 'MP0003', 1),
('PS00007', '2021-12-29 20:04:06', 1, 1, 2000, 126000, 2000, 626000, 'sa', 'US00003', 'TK00004', 'MP0009', 1),
('PS00010', '2022-01-03 09:56:29', 2, 6, 12000, 0, 2000, 10006, 'oke', 'US00004', 'TK00006', 'MP0009', 1),
('PS00011', '2022-01-22 22:35:48', 2, 88, 176000, 0, 1000, 175088, 'rfd', 'US00002', 'TK00001', 'MP0001', 1),
('PS00012', '2022-01-22 22:44:30', 4, 90, 180000, 11000, 5000, 1186088, 'dw', 'US00002', 'TK00003', 'MP0003', 1),
('PS00013', '2022-01-23 11:48:28', 4, 8, 16000, 126000, 2000, 1140006, 'coba2', 'US00003', 'TK00004', 'MP0009', 1),
('PS00014', '2022-01-23 12:25:51', 5, 134, 268000, 0, 20000, 1248132, 'dae', 'US00004', 'TK00006', 'MP0002', 1),
('PS00015', '2022-01-23 20:10:44', 4, 22, 44000, 5000, 2000, 47022, 'bang kirim dong', 'US00004', 'TK00006', 'MP0009', 1),
('PS00016', '2022-01-23 20:13:48', 5, 52, 104000, 11000, 0, 1115050, 'awas cilok', 'US00002', 'TK00003', 'MP0007', 1),
('PS00017', '2022-01-23 20:29:41', 3, 24, 48000, 12000, 0, 60024, 'asa', 'US00002', 'TK00001', 'MP0004', 1),
('PS00018', '2022-01-23 20:30:54', 3, 46, 92000, 31000, 20000, 1103044, '', 'US00003', 'TK00005', 'MP0002', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_toko`
--

CREATE TABLE `tb_toko` (
  `id_toko` varchar(15) NOT NULL,
  `nama_toko` varchar(128) NOT NULL,
  `telp_toko` varchar(30) NOT NULL,
  `wa_toko` varchar(30) NOT NULL,
  `rt_toko` int(11) NOT NULL,
  `rw_toko` int(11) NOT NULL,
  `jalan_toko` text NOT NULL,
  `desa_toko` text NOT NULL,
  `kec_toko` text NOT NULL,
  `wil_toko` text NOT NULL,
  `prov_toko` text NOT NULL,
  `kode_pos` int(12) NOT NULL,
  `des_toko` text NOT NULL,
  `jarak_toko` varchar(11) NOT NULL,
  `gmaps` text NOT NULL,
  `id_user` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tb_toko`
--

INSERT INTO `tb_toko` (`id_toko`, `nama_toko`, `telp_toko`, `wa_toko`, `rt_toko`, `rw_toko`, `jalan_toko`, `desa_toko`, `kec_toko`, `wil_toko`, `prov_toko`, `kode_pos`, `des_toko`, `jarak_toko`, `gmaps`, `id_user`) VALUES
('TK00001', 'Teknologi Sejati', '6285791340248', '6285791340248', 1, 15, 'Jalan Pahlawan', 'Karang', 'Sooko', 'Mojokerto', 'Jawa Timur', 61361, 'Apa Aja', '12', 'https://g.page/ITTelkomSurabaya?share', 'US00002'),
('TK00003', 'toko21', '62871623861811', '628631832311', 111, 211, 'fff1', 'Mojoekrto11', 'Sooko11', 'Mojokeorto11', 'Jwtim11', 4324211, 'fffw1', '11', '2311', 'US00002'),
('TK00004', 'toko6', '34243216', '43241216', 11126, 23126, 'bbb6', 'oke6', 'aa6', 'asd6', 'ds6', 432421136, '3esds6', '126', 'wefsd6', 'US00003'),
('TK00005', 'Sejatra Selalu1', '431', '432412161', 51, 61, '431', 'rew1', 'fg1', 'tre1', '5t1', 61, 'gtdgv1', '31', 'bfvd1', 'US00003'),
('TK00006', 'Toko Bangunan', '534', '534', 88, 5, '09', 'jnm', 'hyt', 'hyt', 'yr', 654, 'yhbf', '5', 'vfd', 'US00004'),
('TK00007', 'Sepeda Eka Jaya', '081703580809', '081703580809', 6, 4, 'Jl. Raya Menganti No.6 ', 'DK. Gogor', 'Menganti', 'Surabaya', 'Jawa Timur', 876543, 'Jual Sepeda', '2', 'https://toko-sepeda-eka-jaya.business.site/', 'US00003');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_user`
--

CREATE TABLE `tb_user` (
  `id_user` varchar(15) NOT NULL,
  `nip_user` int(18) NOT NULL,
  `nama_user` text NOT NULL,
  `alamat_user` text NOT NULL,
  `email_user` varchar(60) NOT NULL,
  `telp_user` varchar(15) NOT NULL,
  `ttl_user` date NOT NULL,
  `username_user` varchar(50) NOT NULL,
  `password_user` varchar(50) NOT NULL,
  `jenis_kelamin` varchar(2) NOT NULL,
  `id_hak_akses` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tb_user`
--

INSERT INTO `tb_user` (`id_user`, `nip_user`, `nama_user`, `alamat_user`, `email_user`, `telp_user`, `ttl_user`, `username_user`, `password_user`, `jenis_kelamin`, `id_hak_akses`) VALUES
('US00001', 631863123, 'nana', 'mojokerto', 'iqbal@gmail.com', '08346734254', '2021-12-22', 'nana', 'nana', 'P', 'HK00001'),
('US00002', 631863131, 'lala', 'mojokerto', 'lala@gmail.com', '08346734254', '2021-12-22', 'lala', 'lala', 'P', 'HK00002'),
('US00003', 631863131, 'kaka', 'mojokerto', 'lala@gmail.com', '08346734254', '2021-12-22', 'kaka', 'kaka', 'L', 'HK00002'),
('US00004', 543534, 'sasa', 'was', 'iqbalmaulana.im270@gmail.com', '42432', '2021-12-30', 'sasa', 'sasa', 'P', 'HK00002');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tb_barang`
--
ALTER TABLE `tb_barang`
  ADD PRIMARY KEY (`id_barang`);

--
-- Indexes for table `tb_detail_gambar`
--
ALTER TABLE `tb_detail_gambar`
  ADD PRIMARY KEY (`id_gambar`);

--
-- Indexes for table `tb_detail_pengiriman`
--
ALTER TABLE `tb_detail_pengiriman`
  ADD PRIMARY KEY (`id_detail_kirim`);

--
-- Indexes for table `tb_detail_pesanan`
--
ALTER TABLE `tb_detail_pesanan`
  ADD PRIMARY KEY (`id_transaksi`);

--
-- Indexes for table `tb_gudang`
--
ALTER TABLE `tb_gudang`
  ADD PRIMARY KEY (`id_gudang`);

--
-- Indexes for table `tb_hak_akses`
--
ALTER TABLE `tb_hak_akses`
  ADD PRIMARY KEY (`id_hak_akses`);

--
-- Indexes for table `tb_jenis_barang`
--
ALTER TABLE `tb_jenis_barang`
  ADD PRIMARY KEY (`id_jenis_barang`);

--
-- Indexes for table `tb_kendaraan`
--
ALTER TABLE `tb_kendaraan`
  ADD PRIMARY KEY (`id_kendaraan`);

--
-- Indexes for table `tb_konfirmasi`
--
ALTER TABLE `tb_konfirmasi`
  ADD PRIMARY KEY (`id_konfirmasi`);

--
-- Indexes for table `tb_metode_pembayaran`
--
ALTER TABLE `tb_metode_pembayaran`
  ADD PRIMARY KEY (`id_metode`);

--
-- Indexes for table `tb_pengiriman`
--
ALTER TABLE `tb_pengiriman`
  ADD PRIMARY KEY (`id_pengiriman`);

--
-- Indexes for table `tb_pesanan`
--
ALTER TABLE `tb_pesanan`
  ADD PRIMARY KEY (`id_pesanan`);

--
-- Indexes for table `tb_toko`
--
ALTER TABLE `tb_toko`
  ADD PRIMARY KEY (`id_toko`);

--
-- Indexes for table `tb_user`
--
ALTER TABLE `tb_user`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tb_detail_gambar`
--
ALTER TABLE `tb_detail_gambar`
  MODIFY `id_gambar` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `tb_detail_pengiriman`
--
ALTER TABLE `tb_detail_pengiriman`
  MODIFY `id_detail_kirim` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `tb_detail_pesanan`
--
ALTER TABLE `tb_detail_pesanan`
  MODIFY `id_transaksi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
