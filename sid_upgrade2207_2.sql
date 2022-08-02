-- phpMyAdmin SQL Dump
-- version 4.6.6deb5ubuntu0.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Aug 02, 2022 at 08:17 AM
-- Server version: 5.7.39-0ubuntu0.18.04.2
-- PHP Version: 7.4.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sid_upgrade2207_devsid`
--

-- --------------------------------------------------------

--
-- Table structure for table `agenda`
--

CREATE TABLE `agenda` (
  `id` int(11) NOT NULL,
  `id_artikel` int(11) NOT NULL,
  `tgl_agenda` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `koordinator_kegiatan` varchar(50) NOT NULL,
  `lokasi_kegiatan` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `analisis_indikator`
--

CREATE TABLE `analisis_indikator` (
  `id` int(11) NOT NULL,
  `id_master` int(11) NOT NULL,
  `nomor` varchar(10) DEFAULT NULL,
  `pertanyaan` varchar(400) NOT NULL,
  `id_tipe` tinyint(4) NOT NULL DEFAULT '1',
  `bobot` tinyint(4) NOT NULL DEFAULT '0',
  `act_analisis` tinyint(1) NOT NULL DEFAULT '2',
  `id_kategori` int(11) NOT NULL,
  `is_publik` tinyint(1) NOT NULL DEFAULT '0',
  `is_teks` tinyint(1) NOT NULL DEFAULT '0',
  `referensi` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `analisis_kategori_indikator`
--

CREATE TABLE `analisis_kategori_indikator` (
  `id` int(11) NOT NULL,
  `id_master` tinyint(4) NOT NULL,
  `kategori` varchar(50) NOT NULL,
  `kategori_kode` varchar(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `analisis_klasifikasi`
--

CREATE TABLE `analisis_klasifikasi` (
  `id` int(11) NOT NULL,
  `id_master` int(11) NOT NULL,
  `nama` varchar(20) NOT NULL,
  `minval` double(7,2) NOT NULL,
  `maxval` double(7,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `analisis_master`
--

CREATE TABLE `analisis_master` (
  `id` int(11) NOT NULL,
  `nama` varchar(40) NOT NULL,
  `subjek_tipe` tinyint(4) NOT NULL,
  `lock` tinyint(1) NOT NULL DEFAULT '1',
  `deskripsi` text NOT NULL,
  `kode_analisis` varchar(5) NOT NULL DEFAULT '00000',
  `id_kelompok` int(11) DEFAULT NULL,
  `pembagi` varchar(10) NOT NULL DEFAULT '100',
  `id_child` smallint(6) DEFAULT NULL,
  `format_impor` tinyint(4) DEFAULT NULL,
  `jenis` tinyint(4) NOT NULL DEFAULT '2',
  `gform_id` text,
  `gform_nik_item_id` text,
  `gform_last_sync` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `analisis_parameter`
--

CREATE TABLE `analisis_parameter` (
  `id` int(11) NOT NULL,
  `id_indikator` int(11) NOT NULL,
  `jawaban` varchar(200) NOT NULL,
  `nilai` int(11) NOT NULL DEFAULT '0',
  `kode_jawaban` int(11) DEFAULT '0',
  `asign` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `analisis_partisipasi`
--

CREATE TABLE `analisis_partisipasi` (
  `id` int(11) NOT NULL,
  `id_subjek` int(11) NOT NULL,
  `id_master` int(11) NOT NULL,
  `id_periode` int(11) NOT NULL,
  `id_klassifikasi` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `analisis_periode`
--

CREATE TABLE `analisis_periode` (
  `id` int(11) NOT NULL,
  `id_master` int(11) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `id_state` tinyint(4) NOT NULL DEFAULT '1',
  `aktif` tinyint(1) NOT NULL DEFAULT '0',
  `keterangan` varchar(100) NOT NULL,
  `tahun_pelaksanaan` year(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `analisis_ref_state`
--

CREATE TABLE `analisis_ref_state` (
  `id` tinyint(4) NOT NULL,
  `nama` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `analisis_ref_subjek`
--

CREATE TABLE `analisis_ref_subjek` (
  `id` tinyint(4) NOT NULL,
  `subjek` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `analisis_respon`
--

CREATE TABLE `analisis_respon` (
  `id_indikator` int(11) NOT NULL,
  `id_parameter` int(11) NOT NULL,
  `id_subjek` int(11) NOT NULL,
  `id_periode` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `analisis_respon_bukti`
--

CREATE TABLE `analisis_respon_bukti` (
  `id_master` tinyint(4) NOT NULL,
  `id_periode` tinyint(4) NOT NULL,
  `id_subjek` int(11) NOT NULL,
  `pengesahan` varchar(100) NOT NULL,
  `tgl_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `analisis_respon_hasil`
--

CREATE TABLE `analisis_respon_hasil` (
  `id_master` tinyint(4) NOT NULL,
  `id_periode` tinyint(4) NOT NULL,
  `id_subjek` int(11) NOT NULL,
  `akumulasi` double(8,3) NOT NULL,
  `tgl_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `analisis_tipe_indikator`
--

CREATE TABLE `analisis_tipe_indikator` (
  `id` tinyint(4) NOT NULL,
  `tipe` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `anggota_grup_kontak`
--

CREATE TABLE `anggota_grup_kontak` (
  `id_grup_kontak` int(11) NOT NULL,
  `id_grup` int(11) NOT NULL,
  `id_kontak` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `anjungan`
--

CREATE TABLE `anjungan` (
  `id` int(11) NOT NULL,
  `ip_address` varchar(100) NOT NULL,
  `keterangan` varchar(300) DEFAULT NULL,
  `keyboard` tinyint(1) DEFAULT '1',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `mac_address` varchar(100) DEFAULT NULL,
  `printer_ip` varchar(100) DEFAULT NULL,
  `printer_port` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `area`
--

CREATE TABLE `area` (
  `id` int(11) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `path` text,
  `enabled` int(11) NOT NULL DEFAULT '1',
  `ref_polygon` int(11) NOT NULL,
  `foto` varchar(100) DEFAULT NULL,
  `id_cluster` int(11) DEFAULT NULL,
  `desk` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `artikel`
--

CREATE TABLE `artikel` (
  `id` int(11) NOT NULL,
  `gambar` varchar(200) DEFAULT NULL,
  `isi` text NOT NULL,
  `enabled` int(11) NOT NULL DEFAULT '1',
  `tgl_upload` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `id_kategori` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `judul` varchar(100) NOT NULL,
  `headline` int(11) NOT NULL DEFAULT '0',
  `gambar1` varchar(200) DEFAULT NULL,
  `gambar2` varchar(200) DEFAULT NULL,
  `gambar3` varchar(200) DEFAULT NULL,
  `dokumen` varchar(400) DEFAULT NULL,
  `link_dokumen` varchar(200) DEFAULT NULL,
  `boleh_komentar` tinyint(1) NOT NULL DEFAULT '1',
  `slug` varchar(200) DEFAULT NULL,
  `hit` int(11) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `captcha_codes`
--

CREATE TABLE `captcha_codes` (
  `id` varchar(40) NOT NULL,
  `namespace` varchar(32) NOT NULL,
  `code` varchar(32) NOT NULL,
  `code_display` varchar(32) NOT NULL,
  `created` int(11) NOT NULL,
  `audio_data` mediumblob
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `cdesa`
--

CREATE TABLE `cdesa` (
  `id` int(10) UNSIGNED NOT NULL,
  `nomor` varchar(20) NOT NULL,
  `nama_kepemilikan` varchar(100) NOT NULL,
  `jenis_pemilik` tinyint(1) NOT NULL DEFAULT '0',
  `nama_pemilik_luar` varchar(100) DEFAULT NULL,
  `alamat_pemilik_luar` varchar(200) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `cdesa_penduduk`
--

CREATE TABLE `cdesa_penduduk` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_cdesa` int(10) UNSIGNED NOT NULL,
  `id_pend` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `config`
--

CREATE TABLE `config` (
  `id` int(11) NOT NULL,
  `nama_desa` varchar(100) NOT NULL,
  `kode_desa` varchar(100) NOT NULL,
  `kode_pos` int(5) DEFAULT NULL,
  `nama_kecamatan` varchar(100) NOT NULL,
  `kode_kecamatan` varchar(100) NOT NULL,
  `nama_kepala_camat` varchar(100) NOT NULL,
  `nip_kepala_camat` varchar(100) NOT NULL,
  `nama_kabupaten` varchar(100) NOT NULL,
  `kode_kabupaten` varchar(100) NOT NULL,
  `nama_propinsi` varchar(100) NOT NULL,
  `kode_propinsi` varchar(100) NOT NULL,
  `logo` varchar(100) DEFAULT NULL,
  `lat` varchar(20) DEFAULT NULL,
  `lng` varchar(20) DEFAULT NULL,
  `zoom` tinyint(4) DEFAULT NULL,
  `map_tipe` varchar(20) DEFAULT NULL,
  `path` text,
  `alamat_kantor` varchar(200) DEFAULT NULL,
  `email_desa` varchar(50) DEFAULT NULL,
  `telepon` varchar(50) DEFAULT NULL,
  `website` varchar(100) DEFAULT NULL,
  `kantor_desa` varchar(100) DEFAULT NULL,
  `warna` varchar(10) DEFAULT NULL,
  `pamong_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `covid19_pantau`
--

CREATE TABLE `covid19_pantau` (
  `id` int(11) NOT NULL,
  `id_pemudik` int(11) DEFAULT NULL,
  `tanggal_jam` datetime DEFAULT NULL,
  `suhu_tubuh` decimal(4,2) DEFAULT NULL,
  `batuk` varchar(20) DEFAULT NULL,
  `flu` varchar(20) DEFAULT NULL,
  `sesak_nafas` varchar(20) DEFAULT NULL,
  `keluhan_lain` varchar(255) DEFAULT NULL,
  `status_covid` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `covid19_pemudik`
--

CREATE TABLE `covid19_pemudik` (
  `id` int(11) NOT NULL,
  `id_terdata` int(11) DEFAULT NULL,
  `tanggal_datang` date DEFAULT NULL,
  `asal_mudik` varchar(255) DEFAULT NULL,
  `durasi_mudik` varchar(50) DEFAULT NULL,
  `tujuan_mudik` varchar(255) DEFAULT NULL,
  `keluhan_kesehatan` varchar(255) DEFAULT NULL,
  `status_covid` varchar(50) DEFAULT NULL,
  `no_hp` varchar(20) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `keterangan` varchar(255) DEFAULT NULL,
  `is_wajib_pantau` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Stand-in structure for view `daftar_anggota_grup`
-- (See below for the actual view)
--
CREATE TABLE `daftar_anggota_grup` (
`id_grup_kontak` int(11)
,`id_grup` int(11)
,`nama_grup` varchar(30)
,`id_kontak` int(11)
,`nama` varchar(100)
,`no_hp` varchar(15)
,`sex` varchar(9)
,`alamat_sekarang` varchar(200)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `daftar_grup`
-- (See below for the actual view)
--
CREATE TABLE `daftar_grup` (
`id_grup` int(11)
,`nama_grup` varchar(30)
,`jumlah_anggota` bigint(21)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `daftar_kontak`
-- (See below for the actual view)
--
CREATE TABLE `daftar_kontak` (
`id_kontak` int(11)
,`id_pend` int(11)
,`nama` varchar(100)
,`no_hp` varchar(15)
,`sex` varchar(9)
,`alamat_sekarang` varchar(200)
);

-- --------------------------------------------------------

--
-- Table structure for table `detail_log_penduduk`
--

CREATE TABLE `detail_log_penduduk` (
  `id` int(11) NOT NULL,
  `nama` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `disposisi_surat_masuk`
--

CREATE TABLE `disposisi_surat_masuk` (
  `id_disposisi` int(11) NOT NULL,
  `id_surat_masuk` int(11) NOT NULL,
  `id_desa_pamong` int(11) DEFAULT NULL,
  `disposisi_ke` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `dokumen`
--

CREATE TABLE `dokumen` (
  `id` int(11) NOT NULL,
  `satuan` varchar(200) DEFAULT NULL,
  `nama` varchar(200) NOT NULL,
  `enabled` int(11) NOT NULL DEFAULT '1',
  `tgl_upload` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `id_pend` int(11) NOT NULL DEFAULT '0',
  `kategori` tinyint(4) NOT NULL DEFAULT '1',
  `attr` text NOT NULL,
  `tahun` int(11) DEFAULT NULL,
  `kategori_info_publik` tinyint(4) DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `id_syarat` int(11) DEFAULT NULL,
  `id_parent` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` varchar(16) DEFAULT NULL,
  `updated_by` varchar(16) DEFAULT NULL,
  `dok_warga` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Stand-in structure for view `dokumen_hidup`
-- (See below for the actual view)
--
CREATE TABLE `dokumen_hidup` (
`id` int(11)
,`satuan` varchar(200)
,`nama` varchar(200)
,`enabled` int(11)
,`tgl_upload` timestamp
,`id_pend` int(11)
,`kategori` tinyint(4)
,`attr` text
,`tahun` int(11)
,`kategori_info_publik` tinyint(4)
,`updated_at` timestamp
,`deleted` tinyint(1)
,`id_syarat` int(11)
,`id_parent` int(11)
,`created_at` timestamp
,`created_by` varchar(16)
,`updated_by` varchar(16)
,`dok_warga` tinyint(1)
);

-- --------------------------------------------------------

--
-- Table structure for table `gambar_gallery`
--

CREATE TABLE `gambar_gallery` (
  `id` int(11) NOT NULL,
  `parrent` int(11) DEFAULT '0',
  `gambar` varchar(200) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `enabled` int(11) NOT NULL DEFAULT '1',
  `tgl_upload` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `tipe` int(11) DEFAULT '0',
  `slider` tinyint(1) DEFAULT NULL,
  `urut` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `garis`
--

CREATE TABLE `garis` (
  `id` int(11) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `path` text,
  `enabled` int(11) NOT NULL DEFAULT '1',
  `ref_line` int(11) NOT NULL,
  `foto` varchar(100) DEFAULT NULL,
  `desk` text,
  `id_cluster` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `gis_simbol`
--

CREATE TABLE `gis_simbol` (
  `id` int(11) NOT NULL,
  `simbol` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `grup_akses`
--

CREATE TABLE `grup_akses` (
  `id` int(11) NOT NULL,
  `id_grup` int(11) NOT NULL,
  `id_modul` int(11) NOT NULL,
  `akses` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `inbox`
--

CREATE TABLE `inbox` (
  `UpdatedInDB` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ReceivingDateTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Text` text NOT NULL,
  `SenderNumber` varchar(20) NOT NULL DEFAULT '',
  `Coding` enum('Default_No_Compression','Unicode_No_Compression','8bit','Default_Compression','Unicode_Compression') NOT NULL DEFAULT 'Default_No_Compression',
  `UDH` text NOT NULL,
  `SMSCNumber` varchar(20) NOT NULL DEFAULT '',
  `Class` int(11) NOT NULL DEFAULT '-1',
  `TextDecoded` text NOT NULL,
  `ID` int(10) UNSIGNED NOT NULL,
  `RecipientID` text NOT NULL,
  `Processed` enum('false','true') NOT NULL DEFAULT 'false'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `inventaris_asset`
--

CREATE TABLE `inventaris_asset` (
  `id` int(11) NOT NULL,
  `nama_barang` varchar(255) NOT NULL,
  `kode_barang` varchar(64) NOT NULL,
  `register` varchar(64) NOT NULL,
  `jenis` varchar(255) NOT NULL,
  `judul_buku` varchar(255) DEFAULT NULL,
  `spesifikasi_buku` varchar(255) DEFAULT NULL,
  `asal_daerah` varchar(255) DEFAULT NULL,
  `pencipta` varchar(255) DEFAULT NULL,
  `bahan` varchar(255) DEFAULT NULL,
  `jenis_hewan` varchar(255) DEFAULT NULL,
  `ukuran_hewan` varchar(255) DEFAULT NULL,
  `jenis_tumbuhan` varchar(255) DEFAULT NULL,
  `ukuran_tumbuhan` varchar(255) DEFAULT NULL,
  `jumlah` int(11) NOT NULL,
  `tahun_pengadaan` year(4) NOT NULL,
  `asal` varchar(255) NOT NULL,
  `harga` double NOT NULL,
  `keterangan` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_by` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  `visible` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `inventaris_gedung`
--

CREATE TABLE `inventaris_gedung` (
  `id` int(11) NOT NULL,
  `nama_barang` varchar(255) NOT NULL,
  `kode_barang` varchar(64) NOT NULL,
  `register` varchar(64) NOT NULL,
  `kondisi_bangunan` varchar(255) NOT NULL,
  `kontruksi_bertingkat` varchar(255) NOT NULL,
  `kontruksi_beton` tinyint(1) DEFAULT '0',
  `luas_bangunan` int(11) NOT NULL,
  `letak` varchar(255) NOT NULL,
  `tanggal_dokument` date DEFAULT NULL,
  `no_dokument` varchar(255) DEFAULT NULL,
  `luas` int(11) DEFAULT NULL,
  `status_tanah` varchar(255) DEFAULT NULL,
  `kode_tanah` varchar(255) DEFAULT NULL,
  `asal` varchar(255) NOT NULL,
  `harga` double NOT NULL,
  `keterangan` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_by` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  `visible` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `inventaris_jalan`
--

CREATE TABLE `inventaris_jalan` (
  `id` int(11) NOT NULL,
  `nama_barang` varchar(255) NOT NULL,
  `kode_barang` varchar(64) NOT NULL,
  `register` varchar(64) NOT NULL,
  `kontruksi` varchar(255) NOT NULL,
  `panjang` int(11) NOT NULL,
  `lebar` int(11) NOT NULL,
  `luas` int(11) NOT NULL,
  `letak` text,
  `tanggal_dokument` date NOT NULL,
  `no_dokument` varchar(255) DEFAULT NULL,
  `status_tanah` varchar(255) DEFAULT NULL,
  `kode_tanah` varchar(255) DEFAULT NULL,
  `kondisi` varchar(255) NOT NULL,
  `asal` varchar(255) NOT NULL,
  `harga` double NOT NULL,
  `keterangan` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_by` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  `visible` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `inventaris_kontruksi`
--

CREATE TABLE `inventaris_kontruksi` (
  `id` int(11) NOT NULL,
  `nama_barang` varchar(255) NOT NULL,
  `kondisi_bangunan` varchar(255) NOT NULL,
  `kontruksi_bertingkat` varchar(255) NOT NULL,
  `kontruksi_beton` tinyint(1) DEFAULT '0',
  `luas_bangunan` int(11) NOT NULL,
  `letak` varchar(255) NOT NULL,
  `tanggal_dokument` date DEFAULT NULL,
  `no_dokument` varchar(255) DEFAULT NULL,
  `tanggal` date DEFAULT NULL,
  `status_tanah` varchar(255) DEFAULT NULL,
  `kode_tanah` varchar(255) DEFAULT NULL,
  `asal` varchar(255) NOT NULL,
  `harga` double NOT NULL,
  `keterangan` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_by` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  `visible` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `inventaris_peralatan`
--

CREATE TABLE `inventaris_peralatan` (
  `id` int(11) NOT NULL,
  `nama_barang` varchar(255) NOT NULL,
  `kode_barang` varchar(64) NOT NULL,
  `register` varchar(64) NOT NULL,
  `merk` varchar(255) DEFAULT NULL,
  `ukuran` text,
  `bahan` text,
  `tahun_pengadaan` year(4) NOT NULL,
  `no_pabrik` varchar(255) DEFAULT NULL,
  `no_rangka` varchar(255) DEFAULT NULL,
  `no_mesin` varchar(255) DEFAULT NULL,
  `no_polisi` varchar(255) DEFAULT NULL,
  `no_bpkb` varchar(255) DEFAULT NULL,
  `asal` varchar(255) NOT NULL,
  `harga` double NOT NULL,
  `keterangan` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_by` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  `visible` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `inventaris_tanah`
--

CREATE TABLE `inventaris_tanah` (
  `id` int(11) NOT NULL,
  `nama_barang` varchar(255) NOT NULL,
  `kode_barang` varchar(64) NOT NULL,
  `register` varchar(64) NOT NULL,
  `luas` int(11) NOT NULL,
  `tahun_pengadaan` year(4) NOT NULL,
  `letak` varchar(255) NOT NULL,
  `hak` varchar(255) NOT NULL,
  `no_sertifikat` varchar(255) DEFAULT NULL,
  `tanggal_sertifikat` date DEFAULT NULL,
  `penggunaan` varchar(255) NOT NULL,
  `asal` varchar(255) NOT NULL,
  `harga` double NOT NULL,
  `keterangan` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_by` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  `visible` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `kader_pemberdayaan_masyarakat`
--

CREATE TABLE `kader_pemberdayaan_masyarakat` (
  `id` int(12) UNSIGNED NOT NULL,
  `penduduk_id` int(12) NOT NULL,
  `kursus` text,
  `bidang` text,
  `keterangan` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `kategori`
--

CREATE TABLE `kategori` (
  `id` int(11) NOT NULL,
  `kategori` varchar(100) NOT NULL,
  `tipe` int(11) NOT NULL DEFAULT '1',
  `urut` tinyint(4) NOT NULL,
  `enabled` tinyint(4) NOT NULL,
  `parrent` tinyint(4) NOT NULL DEFAULT '0',
  `slug` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `kelompok`
--

CREATE TABLE `kelompok` (
  `id` int(11) NOT NULL,
  `id_master` int(11) NOT NULL,
  `id_ketua` int(11) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `keterangan` varchar(300) DEFAULT NULL,
  `kode` varchar(16) NOT NULL,
  `tipe` varchar(100) DEFAULT 'kelompok'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `kelompok_anggota`
--

CREATE TABLE `kelompok_anggota` (
  `id` int(11) NOT NULL,
  `id_kelompok` int(11) NOT NULL,
  `id_penduduk` int(11) NOT NULL,
  `no_anggota` varchar(20) DEFAULT NULL,
  `keterangan` text,
  `jabatan` varchar(50) DEFAULT '90',
  `no_sk_jabatan` varchar(50) DEFAULT NULL,
  `tipe` varchar(100) DEFAULT 'kelompok',
  `periode` varchar(255) DEFAULT NULL,
  `nmr_sk_pengangkatan` varchar(255) DEFAULT NULL,
  `tgl_sk_pengangkatan` date DEFAULT NULL,
  `nmr_sk_pemberhentian` varchar(255) DEFAULT NULL,
  `tgl_sk_pemberhentian` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `kelompok_master`
--

CREATE TABLE `kelompok_master` (
  `id` int(11) NOT NULL,
  `kelompok` varchar(50) NOT NULL,
  `deskripsi` varchar(400) NOT NULL,
  `tipe` varchar(100) DEFAULT 'kelompok'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Stand-in structure for view `keluarga_aktif`
-- (See below for the actual view)
--
CREATE TABLE `keluarga_aktif` (
`id` int(11)
,`no_kk` varchar(16)
,`nik_kepala` varchar(200)
,`tgl_daftar` timestamp
,`kelas_sosial` int(11)
,`tgl_cetak_kk` datetime
,`alamat` varchar(200)
,`id_cluster` int(11)
);

-- --------------------------------------------------------

--
-- Table structure for table `keuangan_manual_ref_bidang`
--

CREATE TABLE `keuangan_manual_ref_bidang` (
  `id` int(11) NOT NULL,
  `Kd_Bid` varchar(50) NOT NULL,
  `Nama_Bidang` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `keuangan_manual_ref_kegiatan`
--

CREATE TABLE `keuangan_manual_ref_kegiatan` (
  `id` int(11) NOT NULL,
  `ID_Keg` varchar(100) NOT NULL,
  `Nama_Kegiatan` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `keuangan_manual_ref_rek1`
--

CREATE TABLE `keuangan_manual_ref_rek1` (
  `id` int(11) NOT NULL,
  `Akun` varchar(100) NOT NULL,
  `Nama_Akun` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `keuangan_manual_ref_rek2`
--

CREATE TABLE `keuangan_manual_ref_rek2` (
  `id` int(11) NOT NULL,
  `Akun` varchar(100) NOT NULL,
  `Kelompok` varchar(100) NOT NULL,
  `Nama_Kelompok` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `keuangan_manual_ref_rek3`
--

CREATE TABLE `keuangan_manual_ref_rek3` (
  `id` int(11) NOT NULL,
  `Kelompok` varchar(100) NOT NULL,
  `Jenis` varchar(100) NOT NULL,
  `Nama_Jenis` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `keuangan_manual_rinci`
--

CREATE TABLE `keuangan_manual_rinci` (
  `id` int(11) NOT NULL,
  `Tahun` varchar(100) NOT NULL,
  `Kd_Akun` varchar(100) NOT NULL,
  `Kd_Keg` varchar(100) NOT NULL,
  `Kd_Rincian` varchar(100) NOT NULL,
  `Nilai_Anggaran` varchar(100) NOT NULL,
  `Nilai_Realisasi` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `keuangan_manual_rinci_tpl`
--

CREATE TABLE `keuangan_manual_rinci_tpl` (
  `id` int(11) NOT NULL,
  `Tahun` varchar(100) NOT NULL,
  `Kd_Akun` varchar(100) NOT NULL,
  `Kd_Keg` varchar(100) NOT NULL,
  `Kd_Rincian` varchar(100) NOT NULL,
  `Nilai_Anggaran` varchar(100) NOT NULL,
  `Nilai_Realisasi` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `keuangan_master`
--

CREATE TABLE `keuangan_master` (
  `id` int(11) NOT NULL,
  `versi_database` varchar(50) NOT NULL,
  `tahun_anggaran` varchar(250) NOT NULL,
  `aktif` int(11) NOT NULL DEFAULT '1',
  `tanggal_impor` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `keuangan_ref_bank_desa`
--

CREATE TABLE `keuangan_ref_bank_desa` (
  `id` int(11) NOT NULL,
  `id_keuangan_master` int(11) NOT NULL,
  `Tahun` varchar(50) NOT NULL,
  `Kd_Desa` varchar(50) NOT NULL,
  `Kd_Rincian` varchar(100) NOT NULL,
  `NoRek_Bank` varchar(100) NOT NULL,
  `Nama_Bank` varchar(250) NOT NULL,
  `Kantor_Cabang` varchar(100) DEFAULT NULL,
  `Nama_Pemilik` varchar(100) DEFAULT NULL,
  `Alamat_Pemilik` varchar(100) DEFAULT NULL,
  `No_Identitas` varchar(20) DEFAULT NULL,
  `No_Telepon` varchar(20) DEFAULT NULL,
  `ID_Bank` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `keuangan_ref_bel_operasional`
--

CREATE TABLE `keuangan_ref_bel_operasional` (
  `id` int(11) NOT NULL,
  `id_keuangan_master` int(11) NOT NULL,
  `ID_Keg` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `keuangan_ref_bidang`
--

CREATE TABLE `keuangan_ref_bidang` (
  `id` int(11) NOT NULL,
  `id_keuangan_master` int(11) NOT NULL,
  `Kd_Bid` varchar(50) NOT NULL,
  `Nama_Bidang` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `keuangan_ref_bunga`
--

CREATE TABLE `keuangan_ref_bunga` (
  `id` int(11) NOT NULL,
  `id_keuangan_master` int(11) NOT NULL,
  `Kd_Bunga` varchar(50) NOT NULL,
  `Kd_Admin` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `keuangan_ref_desa`
--

CREATE TABLE `keuangan_ref_desa` (
  `id` int(11) NOT NULL,
  `id_keuangan_master` int(11) NOT NULL,
  `Kd_Kec` varchar(100) NOT NULL,
  `Kd_Desa` varchar(100) NOT NULL,
  `Nama_Desa` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `keuangan_ref_kecamatan`
--

CREATE TABLE `keuangan_ref_kecamatan` (
  `id` int(11) NOT NULL,
  `id_keuangan_master` int(11) NOT NULL,
  `Kd_Kec` varchar(100) NOT NULL,
  `Nama_Kecamatan` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `keuangan_ref_kegiatan`
--

CREATE TABLE `keuangan_ref_kegiatan` (
  `id` int(11) NOT NULL,
  `id_keuangan_master` int(11) NOT NULL,
  `Kd_Bid` varchar(100) DEFAULT NULL,
  `ID_Keg` varchar(100) NOT NULL,
  `Nama_Kegiatan` varchar(250) NOT NULL,
  `Jns_Kegiatan` tinyint(4) DEFAULT NULL,
  `Kd_Sub` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `keuangan_ref_korolari`
--

CREATE TABLE `keuangan_ref_korolari` (
  `id` int(11) NOT NULL,
  `id_keuangan_master` int(11) NOT NULL,
  `Kd_Rincian` varchar(100) NOT NULL,
  `Kd_RekDB` varchar(100) NOT NULL,
  `Kd_RekKD` varchar(250) NOT NULL,
  `Jenis` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `keuangan_ref_neraca_close`
--

CREATE TABLE `keuangan_ref_neraca_close` (
  `id` int(11) NOT NULL,
  `id_keuangan_master` int(11) NOT NULL,
  `Kd_Rincian` varchar(100) NOT NULL,
  `Kelompok` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `keuangan_ref_perangkat`
--

CREATE TABLE `keuangan_ref_perangkat` (
  `id` int(11) NOT NULL,
  `id_keuangan_master` int(11) NOT NULL,
  `Kode` varchar(100) NOT NULL,
  `Nama_Perangkat` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `keuangan_ref_potongan`
--

CREATE TABLE `keuangan_ref_potongan` (
  `id` int(11) NOT NULL,
  `id_keuangan_master` int(11) NOT NULL,
  `Kd_Rincian` varchar(100) NOT NULL,
  `Kd_Potongan` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `keuangan_ref_rek1`
--

CREATE TABLE `keuangan_ref_rek1` (
  `id` int(11) NOT NULL,
  `id_keuangan_master` int(11) NOT NULL,
  `Akun` varchar(100) NOT NULL,
  `Nama_Akun` varchar(100) NOT NULL,
  `NoLap` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `keuangan_ref_rek2`
--

CREATE TABLE `keuangan_ref_rek2` (
  `id` int(11) NOT NULL,
  `id_keuangan_master` int(11) NOT NULL,
  `Akun` varchar(100) NOT NULL,
  `Kelompok` varchar(100) NOT NULL,
  `Nama_Kelompok` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `keuangan_ref_rek3`
--

CREATE TABLE `keuangan_ref_rek3` (
  `id` int(11) NOT NULL,
  `id_keuangan_master` int(11) NOT NULL,
  `Kelompok` varchar(100) NOT NULL,
  `Jenis` varchar(100) NOT NULL,
  `Nama_Jenis` varchar(100) NOT NULL,
  `Formula` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `keuangan_ref_rek4`
--

CREATE TABLE `keuangan_ref_rek4` (
  `id` int(11) NOT NULL,
  `id_keuangan_master` int(11) NOT NULL,
  `Jenis` varchar(100) NOT NULL,
  `Obyek` varchar(100) NOT NULL,
  `Nama_Obyek` varchar(100) NOT NULL,
  `Peraturan` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `keuangan_ref_sbu`
--

CREATE TABLE `keuangan_ref_sbu` (
  `id` int(11) NOT NULL,
  `id_keuangan_master` int(11) NOT NULL,
  `Kd_Rincian` varchar(100) NOT NULL,
  `Kode_SBU` varchar(100) NOT NULL,
  `NoUrut_SBU` varchar(100) NOT NULL,
  `Nama_SBU` varchar(100) NOT NULL,
  `Nilai` varchar(100) NOT NULL,
  `Satuan` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `keuangan_ref_sumber`
--

CREATE TABLE `keuangan_ref_sumber` (
  `id` int(11) NOT NULL,
  `id_keuangan_master` int(11) NOT NULL,
  `Kode` varchar(100) NOT NULL,
  `Nama_Sumber` varchar(100) NOT NULL,
  `Urut` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `keuangan_ta_anggaran`
--

CREATE TABLE `keuangan_ta_anggaran` (
  `id` int(11) NOT NULL,
  `id_keuangan_master` int(11) NOT NULL,
  `KdPosting` varchar(100) NOT NULL,
  `Tahun` varchar(100) NOT NULL,
  `KURincianSD` varchar(100) NOT NULL,
  `KD_Rincian` varchar(100) NOT NULL,
  `RincianSD` varchar(100) NOT NULL,
  `Anggaran` varchar(100) NOT NULL,
  `AnggaranPAK` varchar(100) NOT NULL,
  `AnggaranStlhPAK` varchar(100) NOT NULL,
  `Belanja` varchar(100) NOT NULL,
  `Kd_keg` varchar(100) NOT NULL,
  `SumberDana` varchar(100) NOT NULL,
  `Kd_Desa` varchar(100) NOT NULL,
  `TglPosting` varchar(100) NOT NULL,
  `Kd_SubRinci` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `keuangan_ta_anggaran_log`
--

CREATE TABLE `keuangan_ta_anggaran_log` (
  `id` int(11) NOT NULL,
  `id_keuangan_master` int(11) NOT NULL,
  `KdPosting` varchar(100) NOT NULL,
  `Tahun` varchar(100) NOT NULL,
  `Kd_Desa` varchar(100) NOT NULL,
  `No_Perdes` varchar(100) NOT NULL,
  `TglPosting` varchar(100) NOT NULL,
  `UserID` varchar(50) NOT NULL,
  `Kunci` varchar(100) NOT NULL,
  `No_Perkades` varchar(100) DEFAULT NULL,
  `Petugas` varchar(80) DEFAULT NULL,
  `Tanggal` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `keuangan_ta_anggaran_rinci`
--

CREATE TABLE `keuangan_ta_anggaran_rinci` (
  `id` int(11) NOT NULL,
  `id_keuangan_master` int(11) NOT NULL,
  `KdPosting` varchar(100) NOT NULL,
  `Tahun` varchar(100) NOT NULL,
  `Kd_Desa` varchar(100) NOT NULL,
  `Kd_Keg` varchar(100) NOT NULL,
  `Kd_Rincian` varchar(100) NOT NULL,
  `Kd_SubRinci` varchar(100) NOT NULL,
  `No_Urut` varchar(100) NOT NULL,
  `Uraian` varchar(100) NOT NULL,
  `SumberDana` varchar(100) NOT NULL,
  `JmlSatuan` varchar(100) NOT NULL,
  `HrgSatuan` varchar(100) NOT NULL,
  `Satuan` varchar(100) NOT NULL,
  `Anggaran` varchar(100) NOT NULL,
  `JmlSatuanPAK` varchar(100) NOT NULL,
  `HrgSatuanPAK` varchar(100) NOT NULL,
  `AnggaranStlhPAK` varchar(100) NOT NULL,
  `AnggaranPAK` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `keuangan_ta_bidang`
--

CREATE TABLE `keuangan_ta_bidang` (
  `id` int(11) NOT NULL,
  `id_keuangan_master` int(11) NOT NULL,
  `Tahun` varchar(100) NOT NULL,
  `Kd_Desa` varchar(100) NOT NULL,
  `Kd_Bid` varchar(100) NOT NULL,
  `Nama_Bidang` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `keuangan_ta_desa`
--

CREATE TABLE `keuangan_ta_desa` (
  `id` int(11) NOT NULL,
  `id_keuangan_master` int(11) NOT NULL,
  `Tahun` varchar(100) NOT NULL,
  `Kd_Desa` varchar(100) NOT NULL,
  `Nm_Kades` varchar(100) NOT NULL,
  `Jbt_Kades` varchar(100) NOT NULL,
  `Nm_Sekdes` varchar(100) NOT NULL,
  `NIP_Sekdes` varchar(100) NOT NULL,
  `Jbt_Sekdes` varchar(100) NOT NULL,
  `Nm_Kaur_Keu` varchar(100) NOT NULL,
  `Jbt_Kaur_Keu` varchar(100) NOT NULL,
  `Nm_Bendahara` varchar(100) NOT NULL,
  `Jbt_Bendahara` varchar(100) NOT NULL,
  `No_Perdes` varchar(100) NOT NULL,
  `Tgl_Perdes` varchar(100) NOT NULL,
  `No_Perdes_PB` varchar(100) NOT NULL,
  `Tgl_Perdes_PB` varchar(100) NOT NULL,
  `No_Perdes_PJ` varchar(100) NOT NULL,
  `Tgl_Perdes_PJ` varchar(100) NOT NULL,
  `Alamat` varchar(250) NOT NULL,
  `Ibukota` varchar(100) NOT NULL,
  `Status` varchar(100) NOT NULL,
  `NPWP` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `keuangan_ta_jurnal_umum`
--

CREATE TABLE `keuangan_ta_jurnal_umum` (
  `id` int(11) NOT NULL,
  `id_keuangan_master` int(11) NOT NULL,
  `Tahun` varchar(100) NOT NULL,
  `KdBuku` varchar(100) NOT NULL,
  `Kd_Desa` varchar(100) NOT NULL,
  `Tanggal` varchar(100) NOT NULL,
  `JnsBukti` varchar(100) NOT NULL,
  `NoBukti` varchar(100) NOT NULL,
  `Keterangan` varchar(100) NOT NULL,
  `DK` varchar(100) NOT NULL,
  `Debet` varchar(100) NOT NULL,
  `Kredit` varchar(100) NOT NULL,
  `Jenis` varchar(100) NOT NULL,
  `Posted` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `keuangan_ta_jurnal_umum_rinci`
--

CREATE TABLE `keuangan_ta_jurnal_umum_rinci` (
  `id` int(11) NOT NULL,
  `id_keuangan_master` int(11) NOT NULL,
  `Tahun` varchar(100) NOT NULL,
  `NoBukti` varchar(100) NOT NULL,
  `Kd_Keg` varchar(100) NOT NULL,
  `RincianSD` varchar(100) NOT NULL,
  `NoID` varchar(100) NOT NULL,
  `Kd_Desa` varchar(100) NOT NULL,
  `Akun` varchar(100) NOT NULL,
  `Kd_Rincian` varchar(100) NOT NULL,
  `Sumberdana` varchar(100) NOT NULL,
  `DK` varchar(100) NOT NULL,
  `Debet` varchar(100) NOT NULL,
  `Kredit` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `keuangan_ta_kegiatan`
--

CREATE TABLE `keuangan_ta_kegiatan` (
  `id` int(11) NOT NULL,
  `id_keuangan_master` int(11) NOT NULL,
  `Tahun` varchar(100) NOT NULL,
  `Kd_Desa` varchar(100) NOT NULL,
  `Kd_Bid` varchar(100) DEFAULT NULL,
  `Kd_Keg` varchar(100) NOT NULL,
  `ID_Keg` varchar(100) NOT NULL,
  `Nama_Kegiatan` varchar(100) NOT NULL,
  `Pagu` varchar(100) NOT NULL,
  `Pagu_PAK` varchar(100) NOT NULL,
  `Nm_PPTKD` varchar(100) NOT NULL,
  `NIP_PPTKD` varchar(100) NOT NULL,
  `Lokasi` varchar(100) NOT NULL,
  `Waktu` varchar(100) NOT NULL,
  `Keluaran` varchar(100) NOT NULL,
  `Sumberdana` varchar(100) NOT NULL,
  `Jbt_PPTKD` varchar(100) DEFAULT NULL,
  `Kd_Sub` varchar(30) DEFAULT NULL,
  `Nilai` bigint(20) UNSIGNED DEFAULT NULL,
  `NilaiPAK` bigint(20) UNSIGNED DEFAULT NULL,
  `Satuan` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `keuangan_ta_mutasi`
--

CREATE TABLE `keuangan_ta_mutasi` (
  `id` int(11) NOT NULL,
  `id_keuangan_master` int(11) NOT NULL,
  `Tahun` varchar(100) NOT NULL,
  `Kd_Desa` varchar(100) NOT NULL,
  `No_Bukti` varchar(100) NOT NULL,
  `Tgl_Bukti` varchar(100) NOT NULL,
  `Keterangan` varchar(200) DEFAULT NULL,
  `Kd_Bank` varchar(100) DEFAULT NULL,
  `Kd_Rincian` varchar(100) NOT NULL,
  `Kd_Keg` varchar(100) NOT NULL,
  `Sumberdana` varchar(100) NOT NULL,
  `Kd_Mutasi` varchar(100) NOT NULL,
  `Nilai` varchar(100) NOT NULL,
  `ID_Bank` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `keuangan_ta_pajak`
--

CREATE TABLE `keuangan_ta_pajak` (
  `id` int(11) NOT NULL,
  `id_keuangan_master` int(11) NOT NULL,
  `Tahun` varchar(100) NOT NULL,
  `Kd_Desa` varchar(100) NOT NULL,
  `No_SSP` varchar(100) NOT NULL,
  `Tgl_SSP` varchar(100) NOT NULL,
  `Keterangan` varchar(250) DEFAULT NULL,
  `Nama_WP` varchar(100) NOT NULL,
  `Alamat_WP` varchar(100) NOT NULL,
  `NPWP` varchar(100) NOT NULL,
  `Kd_MAP` varchar(100) NOT NULL,
  `Nm_Penyetor` varchar(100) NOT NULL,
  `Jn_Transaksi` varchar(100) NOT NULL,
  `Kd_Rincian` varchar(100) NOT NULL,
  `Jumlah` varchar(100) NOT NULL,
  `KdBayar` varchar(100) NOT NULL,
  `ID_Bank` varchar(10) DEFAULT NULL,
  `NTPN` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `keuangan_ta_pajak_rinci`
--

CREATE TABLE `keuangan_ta_pajak_rinci` (
  `id` int(11) NOT NULL,
  `id_keuangan_master` int(11) NOT NULL,
  `Tahun` varchar(100) NOT NULL,
  `Kd_Desa` varchar(100) NOT NULL,
  `No_SSP` varchar(100) NOT NULL,
  `No_Bukti` varchar(100) NOT NULL,
  `Kd_Rincian` varchar(100) NOT NULL,
  `Nilai` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `keuangan_ta_pemda`
--

CREATE TABLE `keuangan_ta_pemda` (
  `id` int(11) NOT NULL,
  `id_keuangan_master` int(11) NOT NULL,
  `Tahun` varchar(100) NOT NULL,
  `Kd_Prov` varchar(100) NOT NULL,
  `Kd_Kab` varchar(100) NOT NULL,
  `Nama_Pemda` varchar(100) NOT NULL,
  `Nama_Provinsi` varchar(100) NOT NULL,
  `Ibukota` varchar(100) NOT NULL,
  `Alamat` varchar(100) NOT NULL,
  `Nm_Bupati` varchar(100) NOT NULL,
  `Jbt_Bupati` varchar(100) NOT NULL,
  `Logo` mediumblob,
  `C_Kode` varchar(100) NOT NULL,
  `C_Pemda` varchar(100) NOT NULL,
  `C_Data` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `keuangan_ta_pencairan`
--

CREATE TABLE `keuangan_ta_pencairan` (
  `id` int(11) NOT NULL,
  `id_keuangan_master` int(11) NOT NULL,
  `Tahun` varchar(100) NOT NULL,
  `No_Cek` varchar(100) NOT NULL,
  `No_SPP` varchar(100) NOT NULL,
  `Tgl_Cek` varchar(100) NOT NULL,
  `Kd_Desa` varchar(100) NOT NULL,
  `Keterangan` varchar(250) DEFAULT NULL,
  `Jumlah` varchar(100) NOT NULL,
  `Potongan` varchar(100) NOT NULL,
  `KdBayar` varchar(100) NOT NULL,
  `ID_Bank` varchar(10) DEFAULT NULL,
  `Kunci` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `keuangan_ta_perangkat`
--

CREATE TABLE `keuangan_ta_perangkat` (
  `id` int(11) NOT NULL,
  `id_keuangan_master` int(11) NOT NULL,
  `Tahun` varchar(100) NOT NULL,
  `Kd_Desa` varchar(100) NOT NULL,
  `Kd_Jabatan` varchar(100) NOT NULL,
  `No_ID` varchar(100) NOT NULL,
  `Nama_Perangkat` varchar(100) NOT NULL,
  `Alamat_Perangkat` varchar(100) NOT NULL,
  `Nomor_HP` varchar(100) NOT NULL,
  `Rek_Bank` varchar(100) NOT NULL,
  `Nama_Bank` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `keuangan_ta_rab`
--

CREATE TABLE `keuangan_ta_rab` (
  `id` int(11) NOT NULL,
  `id_keuangan_master` int(11) NOT NULL,
  `Tahun` varchar(100) NOT NULL,
  `Kd_Desa` varchar(100) NOT NULL,
  `Kd_Keg` varchar(100) NOT NULL,
  `Kd_Rincian` varchar(100) NOT NULL,
  `Anggaran` varchar(100) NOT NULL,
  `AnggaranPAK` varchar(100) NOT NULL,
  `AnggaranStlhPAK` varchar(100) NOT NULL,
  `Kd_SubRinci` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `keuangan_ta_rab_rinci`
--

CREATE TABLE `keuangan_ta_rab_rinci` (
  `id` int(11) NOT NULL,
  `id_keuangan_master` int(11) NOT NULL,
  `Tahun` varchar(100) NOT NULL,
  `Kd_Desa` varchar(100) NOT NULL,
  `Kd_Keg` varchar(100) NOT NULL,
  `Kd_Rincian` varchar(100) NOT NULL,
  `Kd_SubRinci` varchar(100) NOT NULL,
  `No_Urut` varchar(100) NOT NULL,
  `SumberDana` varchar(100) NOT NULL,
  `Uraian` varchar(100) NOT NULL,
  `Satuan` varchar(100) NOT NULL,
  `JmlSatuan` varchar(100) NOT NULL,
  `HrgSatuan` varchar(100) NOT NULL,
  `Anggaran` varchar(100) NOT NULL,
  `JmlSatuanPAK` varchar(100) NOT NULL,
  `HrgSatuanPAK` varchar(100) NOT NULL,
  `AnggaranStlhPAK` varchar(100) NOT NULL,
  `AnggaranPAK` varchar(100) NOT NULL,
  `Kode_SBU` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `keuangan_ta_rab_sub`
--

CREATE TABLE `keuangan_ta_rab_sub` (
  `id` int(11) NOT NULL,
  `id_keuangan_master` int(11) NOT NULL,
  `Tahun` varchar(100) NOT NULL,
  `Kd_Desa` varchar(100) NOT NULL,
  `Kd_Keg` varchar(100) NOT NULL,
  `Kd_Rincian` varchar(100) NOT NULL,
  `Kd_SubRinci` varchar(100) NOT NULL,
  `Nama_SubRinci` varchar(100) NOT NULL,
  `Anggaran` varchar(100) NOT NULL,
  `AnggaranPAK` varchar(100) NOT NULL,
  `AnggaranStlhPAK` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `keuangan_ta_rpjm_bidang`
--

CREATE TABLE `keuangan_ta_rpjm_bidang` (
  `id` int(11) NOT NULL,
  `id_keuangan_master` int(11) NOT NULL,
  `Kd_Desa` varchar(100) NOT NULL,
  `Kd_Bid` varchar(100) NOT NULL,
  `Nama_Bidang` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `keuangan_ta_rpjm_kegiatan`
--

CREATE TABLE `keuangan_ta_rpjm_kegiatan` (
  `id` int(11) NOT NULL,
  `id_keuangan_master` int(11) NOT NULL,
  `Kd_Desa` varchar(100) NOT NULL,
  `Kd_Bid` varchar(100) DEFAULT NULL,
  `Kd_Keg` varchar(100) NOT NULL,
  `ID_Keg` varchar(100) NOT NULL,
  `Nama_Kegiatan` varchar(100) NOT NULL,
  `Lokasi` varchar(100) NOT NULL,
  `Keluaran` varchar(100) NOT NULL,
  `Kd_Sas` varchar(100) NOT NULL,
  `Sasaran` varchar(100) NOT NULL,
  `Tahun1` varchar(100) NOT NULL,
  `Tahun2` varchar(100) NOT NULL,
  `Tahun3` varchar(100) NOT NULL,
  `Tahun4` varchar(100) NOT NULL,
  `Tahun5` varchar(100) NOT NULL,
  `Tahun6` varchar(100) NOT NULL,
  `Swakelola` varchar(100) NOT NULL,
  `Kerjasama` varchar(100) NOT NULL,
  `Pihak_Ketiga` varchar(100) NOT NULL,
  `Sumberdana` varchar(100) NOT NULL,
  `Kd_Sub` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `keuangan_ta_rpjm_misi`
--

CREATE TABLE `keuangan_ta_rpjm_misi` (
  `id` int(11) NOT NULL,
  `id_keuangan_master` int(11) NOT NULL,
  `ID_Misi` varchar(100) NOT NULL,
  `Kd_Desa` varchar(100) NOT NULL,
  `ID_Visi` varchar(100) NOT NULL,
  `No_Misi` varchar(100) NOT NULL,
  `Uraian_Misi` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `keuangan_ta_rpjm_pagu_indikatif`
--

CREATE TABLE `keuangan_ta_rpjm_pagu_indikatif` (
  `id` int(11) NOT NULL,
  `id_keuangan_master` int(11) NOT NULL,
  `Kd_Desa` varchar(100) NOT NULL,
  `Kd_Keg` varchar(100) NOT NULL,
  `Kd_Sumber` varchar(100) NOT NULL,
  `Tahun1` varchar(100) NOT NULL,
  `Tahun2` varchar(100) NOT NULL,
  `Tahun3` varchar(100) NOT NULL,
  `Tahun4` varchar(100) NOT NULL,
  `Tahun5` varchar(100) NOT NULL,
  `Tahun6` varchar(100) NOT NULL,
  `Pola` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `keuangan_ta_rpjm_pagu_tahunan`
--

CREATE TABLE `keuangan_ta_rpjm_pagu_tahunan` (
  `id` int(11) NOT NULL,
  `id_keuangan_master` int(11) NOT NULL,
  `Kd_Desa` varchar(100) NOT NULL,
  `Kd_Keg` varchar(100) NOT NULL,
  `Kd_Tahun` varchar(100) NOT NULL,
  `Kd_Sumber` varchar(100) NOT NULL,
  `Biaya` varchar(100) NOT NULL,
  `Volume` varchar(100) NOT NULL,
  `Satuan` varchar(100) NOT NULL,
  `Lokasi_Spesifik` varchar(100) NOT NULL,
  `Jml_Sas_Pria` varchar(100) NOT NULL,
  `Jml_Sas_Wanita` varchar(100) NOT NULL,
  `Jml_Sas_ARTM` varchar(100) NOT NULL,
  `Waktu` varchar(100) NOT NULL,
  `Mulai` varchar(100) NOT NULL,
  `Selesai` varchar(100) NOT NULL,
  `Pola_Kegiatan` varchar(100) NOT NULL,
  `Pelaksana` varchar(100) NOT NULL,
  `No_ID` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `keuangan_ta_rpjm_sasaran`
--

CREATE TABLE `keuangan_ta_rpjm_sasaran` (
  `id` int(11) NOT NULL,
  `id_keuangan_master` int(11) NOT NULL,
  `ID_Sasaran` varchar(100) NOT NULL,
  `Kd_Desa` varchar(100) NOT NULL,
  `ID_Tujuan` varchar(100) NOT NULL,
  `No_Sasaran` varchar(100) NOT NULL,
  `Uraian_Sasaran` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `keuangan_ta_rpjm_tujuan`
--

CREATE TABLE `keuangan_ta_rpjm_tujuan` (
  `id` int(11) NOT NULL,
  `id_keuangan_master` int(11) NOT NULL,
  `ID_Tujuan` varchar(100) NOT NULL,
  `Kd_Desa` varchar(100) NOT NULL,
  `ID_Misi` varchar(100) NOT NULL,
  `No_Tujuan` varchar(100) NOT NULL,
  `Uraian_Tujuan` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `keuangan_ta_rpjm_visi`
--

CREATE TABLE `keuangan_ta_rpjm_visi` (
  `id` int(11) NOT NULL,
  `id_keuangan_master` int(11) NOT NULL,
  `ID_Visi` varchar(100) NOT NULL,
  `Kd_Desa` varchar(100) NOT NULL,
  `No_Visi` varchar(100) NOT NULL,
  `Uraian_Visi` varchar(250) DEFAULT NULL,
  `TahunA` varchar(100) NOT NULL,
  `TahunN` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `keuangan_ta_saldo_awal`
--

CREATE TABLE `keuangan_ta_saldo_awal` (
  `id` int(11) NOT NULL,
  `id_keuangan_master` int(11) NOT NULL,
  `Tahun` varchar(100) NOT NULL,
  `Kd_Desa` varchar(100) NOT NULL,
  `Kd_Rincian` varchar(100) NOT NULL,
  `Jenis` varchar(100) NOT NULL,
  `Anggaran` varchar(100) NOT NULL,
  `Debet` varchar(100) NOT NULL,
  `Kredit` varchar(100) NOT NULL,
  `Tgl_Bukti` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `keuangan_ta_spj`
--

CREATE TABLE `keuangan_ta_spj` (
  `id` int(11) NOT NULL,
  `id_keuangan_master` int(11) NOT NULL,
  `Tahun` varchar(100) NOT NULL,
  `No_SPJ` varchar(100) NOT NULL,
  `Tgl_SPJ` varchar(100) NOT NULL,
  `Kd_Desa` varchar(100) NOT NULL,
  `No_SPP` varchar(100) NOT NULL,
  `Keterangan` varchar(100) NOT NULL,
  `Jumlah` varchar(100) NOT NULL,
  `Potongan` varchar(100) NOT NULL,
  `Status` varchar(100) NOT NULL,
  `Kunci` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `keuangan_ta_spjpot`
--

CREATE TABLE `keuangan_ta_spjpot` (
  `id` int(11) NOT NULL,
  `id_keuangan_master` int(11) NOT NULL,
  `Tahun` varchar(100) NOT NULL,
  `Kd_Desa` varchar(100) NOT NULL,
  `No_SPJ` varchar(100) NOT NULL,
  `Kd_Keg` varchar(100) NOT NULL,
  `No_Bukti` varchar(100) NOT NULL,
  `Kd_Rincian` varchar(100) NOT NULL,
  `Nilai` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `keuangan_ta_spj_bukti`
--

CREATE TABLE `keuangan_ta_spj_bukti` (
  `id` int(11) NOT NULL,
  `id_keuangan_master` int(11) NOT NULL,
  `Tahun` varchar(100) NOT NULL,
  `No_SPJ` varchar(100) NOT NULL,
  `Kd_Keg` varchar(100) NOT NULL,
  `Kd_Rincian` varchar(100) NOT NULL,
  `No_Bukti` varchar(100) NOT NULL,
  `Tgl_Bukti` varchar(100) NOT NULL,
  `Sumberdana` varchar(100) NOT NULL,
  `Kd_Desa` varchar(100) NOT NULL,
  `Nm_Penerima` varchar(100) NOT NULL,
  `Alamat` varchar(100) NOT NULL,
  `Rek_Bank` varchar(100) NOT NULL,
  `Nm_Bank` varchar(100) NOT NULL,
  `NPWP` varchar(100) NOT NULL,
  `Keterangan` varchar(250) DEFAULT NULL,
  `Nilai` varchar(100) NOT NULL,
  `Kd_SubRinci` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `keuangan_ta_spj_rinci`
--

CREATE TABLE `keuangan_ta_spj_rinci` (
  `id` int(11) NOT NULL,
  `id_keuangan_master` int(11) NOT NULL,
  `Tahun` varchar(100) NOT NULL,
  `No_SPJ` varchar(100) NOT NULL,
  `Kd_Keg` varchar(100) NOT NULL,
  `Kd_Rincian` varchar(100) NOT NULL,
  `Sumberdana` varchar(100) NOT NULL,
  `Kd_Desa` varchar(100) NOT NULL,
  `No_SPP` varchar(100) NOT NULL,
  `JmlCair` varchar(100) NOT NULL,
  `Nilai` varchar(100) NOT NULL,
  `Alamat` varchar(100) DEFAULT NULL,
  `Sisa` varchar(100) NOT NULL,
  `Kd_SubRinci` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `keuangan_ta_spj_sisa`
--

CREATE TABLE `keuangan_ta_spj_sisa` (
  `id` int(11) NOT NULL,
  `id_keuangan_master` int(11) NOT NULL,
  `Tahun` varchar(100) NOT NULL,
  `Kd_Desa` varchar(100) NOT NULL,
  `No_Bukti` varchar(100) NOT NULL,
  `Tgl_Bukti` varchar(100) NOT NULL,
  `No_SPJ` varchar(100) NOT NULL,
  `Tgl_SPJ` varchar(100) NOT NULL,
  `No_SPP` varchar(100) NOT NULL,
  `Tgl_SPP` varchar(100) NOT NULL,
  `Kd_Keg` varchar(100) NOT NULL,
  `Keterangan` varchar(100) NOT NULL,
  `Nilai` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `keuangan_ta_spp`
--

CREATE TABLE `keuangan_ta_spp` (
  `id` int(11) NOT NULL,
  `id_keuangan_master` int(11) NOT NULL,
  `Tahun` varchar(100) NOT NULL,
  `No_SPP` varchar(100) NOT NULL,
  `Tgl_SPP` varchar(100) NOT NULL,
  `Jn_SPP` varchar(100) NOT NULL,
  `Kd_Desa` varchar(100) NOT NULL,
  `Keterangan` varchar(250) DEFAULT NULL,
  `Jumlah` varchar(100) NOT NULL,
  `Potongan` varchar(100) NOT NULL,
  `Status` varchar(100) NOT NULL,
  `F10` varchar(10) DEFAULT NULL,
  `F11` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `keuangan_ta_sppbukti`
--

CREATE TABLE `keuangan_ta_sppbukti` (
  `id` int(11) NOT NULL,
  `id_keuangan_master` int(11) NOT NULL,
  `Tahun` varchar(100) NOT NULL,
  `Kd_Desa` varchar(100) NOT NULL,
  `No_SPP` varchar(100) NOT NULL,
  `Kd_Keg` varchar(100) NOT NULL,
  `Kd_Rincian` varchar(100) NOT NULL,
  `Sumberdana` varchar(100) NOT NULL,
  `No_Bukti` varchar(100) NOT NULL,
  `Tgl_Bukti` varchar(100) NOT NULL,
  `Nm_Penerima` varchar(100) NOT NULL,
  `Alamat` varchar(100) NOT NULL,
  `Rek_Bank` varchar(100) NOT NULL,
  `Nm_Bank` varchar(100) NOT NULL,
  `NPWP` varchar(100) NOT NULL,
  `Keterangan` varchar(200) DEFAULT NULL,
  `Nilai` varchar(100) NOT NULL,
  `Kd_SubRinci` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `keuangan_ta_spppot`
--

CREATE TABLE `keuangan_ta_spppot` (
  `id` int(11) NOT NULL,
  `id_keuangan_master` int(11) NOT NULL,
  `Tahun` varchar(100) NOT NULL,
  `Kd_Desa` varchar(100) NOT NULL,
  `No_SPP` varchar(100) NOT NULL,
  `Kd_Keg` varchar(100) NOT NULL,
  `No_Bukti` varchar(100) NOT NULL,
  `Kd_Rincian` varchar(100) NOT NULL,
  `Nilai` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `keuangan_ta_spp_rinci`
--

CREATE TABLE `keuangan_ta_spp_rinci` (
  `id` int(11) NOT NULL,
  `id_keuangan_master` int(11) NOT NULL,
  `Tahun` varchar(100) NOT NULL,
  `Kd_Desa` varchar(100) NOT NULL,
  `No_SPP` varchar(100) NOT NULL,
  `Kd_Keg` varchar(100) NOT NULL,
  `Kd_Rincian` varchar(100) NOT NULL,
  `Sumberdana` varchar(100) NOT NULL,
  `Nilai` varchar(100) NOT NULL,
  `Kd_SubRinci` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `keuangan_ta_sts`
--

CREATE TABLE `keuangan_ta_sts` (
  `id` int(11) NOT NULL,
  `id_keuangan_master` int(11) NOT NULL,
  `Tahun` varchar(100) NOT NULL,
  `No_Bukti` varchar(100) NOT NULL,
  `Tgl_Bukti` varchar(100) NOT NULL,
  `Kd_Desa` varchar(100) NOT NULL,
  `Uraian` varchar(100) NOT NULL,
  `NoRek_Bank` varchar(100) NOT NULL,
  `Nama_Bank` varchar(100) NOT NULL,
  `Jumlah` varchar(100) NOT NULL,
  `Nm_Bendahara` varchar(100) NOT NULL,
  `Jbt_Bendahara` varchar(100) NOT NULL,
  `ID_Bank` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `keuangan_ta_sts_rinci`
--

CREATE TABLE `keuangan_ta_sts_rinci` (
  `id` int(11) NOT NULL,
  `id_keuangan_master` int(11) NOT NULL,
  `Tahun` varchar(100) NOT NULL,
  `Kd_Desa` varchar(100) NOT NULL,
  `No_Bukti` varchar(100) NOT NULL,
  `No_TBP` varchar(100) NOT NULL,
  `Uraian` varchar(100) NOT NULL,
  `Nilai` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `keuangan_ta_tbp`
--

CREATE TABLE `keuangan_ta_tbp` (
  `id` int(11) NOT NULL,
  `id_keuangan_master` int(11) NOT NULL,
  `Tahun` varchar(100) NOT NULL,
  `No_Bukti` varchar(100) NOT NULL,
  `Tgl_Bukti` varchar(100) NOT NULL,
  `Kd_Desa` varchar(100) NOT NULL,
  `Uraian` varchar(250) DEFAULT NULL,
  `Nm_Penyetor` varchar(100) NOT NULL,
  `Alamat_Penyetor` varchar(100) NOT NULL,
  `TTD_Penyetor` varchar(100) NOT NULL,
  `NoRek_Bank` varchar(100) NOT NULL,
  `Nama_Bank` varchar(100) NOT NULL,
  `Jumlah` varchar(100) NOT NULL,
  `Nm_Bendahara` varchar(100) NOT NULL,
  `Jbt_Bendahara` varchar(100) NOT NULL,
  `Status` varchar(100) NOT NULL,
  `KdBayar` varchar(100) NOT NULL,
  `Ref_Bayar` varchar(100) NOT NULL,
  `ID_Bank` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `keuangan_ta_tbp_rinci`
--

CREATE TABLE `keuangan_ta_tbp_rinci` (
  `id` int(11) NOT NULL,
  `id_keuangan_master` int(11) NOT NULL,
  `Tahun` varchar(100) NOT NULL,
  `No_Bukti` varchar(100) NOT NULL,
  `Kd_Desa` varchar(100) NOT NULL,
  `Kd_Keg` varchar(100) NOT NULL,
  `Kd_Rincian` varchar(100) NOT NULL,
  `RincianSD` varchar(100) NOT NULL,
  `SumberDana` varchar(100) NOT NULL,
  `nilai` varchar(100) NOT NULL,
  `Kd_SubRinci` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `keuangan_ta_triwulan`
--

CREATE TABLE `keuangan_ta_triwulan` (
  `id` int(11) NOT NULL,
  `id_keuangan_master` int(11) NOT NULL,
  `KURincianSD` varchar(100) NOT NULL,
  `Tahun` varchar(100) NOT NULL,
  `Sifat` varchar(100) NOT NULL,
  `SumberDana` varchar(100) NOT NULL,
  `Kd_Desa` varchar(100) NOT NULL,
  `Kd_Keg` varchar(100) NOT NULL,
  `Kd_Rincian` varchar(100) NOT NULL,
  `Anggaran` varchar(100) NOT NULL,
  `AnggaranPAK` varchar(100) NOT NULL,
  `Tw1Rinci` varchar(100) DEFAULT NULL,
  `Tw2Rinci` varchar(100) DEFAULT NULL,
  `Tw3Rinci` varchar(100) DEFAULT NULL,
  `Tw4Rinci` varchar(100) DEFAULT NULL,
  `KunciData` varchar(100) NOT NULL,
  `Jan` varchar(100) DEFAULT NULL,
  `Peb` varchar(100) DEFAULT NULL,
  `Mar` varchar(100) DEFAULT NULL,
  `Apr` varchar(100) DEFAULT NULL,
  `Mei` varchar(100) DEFAULT NULL,
  `Jun` varchar(100) DEFAULT NULL,
  `Jul` varchar(100) DEFAULT NULL,
  `Agt` varchar(100) DEFAULT NULL,
  `Sep` varchar(100) DEFAULT NULL,
  `Okt` varchar(100) DEFAULT NULL,
  `Nop` varchar(100) DEFAULT NULL,
  `Des` varchar(100) DEFAULT NULL,
  `Kd_SubRinci` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `keuangan_ta_triwulan_rinci`
--

CREATE TABLE `keuangan_ta_triwulan_rinci` (
  `id` int(11) NOT NULL,
  `id_keuangan_master` int(11) NOT NULL,
  `KdPosting` varchar(100) NOT NULL,
  `KURincianSD` varchar(100) NOT NULL,
  `Tahun` varchar(100) NOT NULL,
  `Sifat` varchar(100) NOT NULL,
  `SumberDana` varchar(100) NOT NULL,
  `Kd_Desa` varchar(100) NOT NULL,
  `Kd_Keg` varchar(100) NOT NULL,
  `Kd_Rincian` varchar(100) NOT NULL,
  `Anggaran` varchar(100) NOT NULL,
  `AnggaranPAK` varchar(100) NOT NULL,
  `Tw1Rinci` varchar(100) DEFAULT NULL,
  `Tw2Rinci` varchar(100) DEFAULT NULL,
  `Tw3Rinci` varchar(100) DEFAULT NULL,
  `Tw4Rinci` varchar(100) DEFAULT NULL,
  `KunciData` varchar(100) NOT NULL,
  `Jan` varchar(100) DEFAULT NULL,
  `Peb` varchar(100) DEFAULT NULL,
  `Mar` varchar(100) DEFAULT NULL,
  `Apr` varchar(100) DEFAULT NULL,
  `Mei` varchar(100) DEFAULT NULL,
  `Jun` varchar(100) DEFAULT NULL,
  `Jul` varchar(100) DEFAULT NULL,
  `Agt` varchar(100) DEFAULT NULL,
  `Sep` varchar(100) DEFAULT NULL,
  `Okt` varchar(100) DEFAULT NULL,
  `Nop` varchar(100) DEFAULT NULL,
  `Des` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `klasifikasi_analisis_keluarga`
--

CREATE TABLE `klasifikasi_analisis_keluarga` (
  `id` int(11) NOT NULL,
  `nama` varchar(20) NOT NULL,
  `jenis` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `klasifikasi_surat`
--

CREATE TABLE `klasifikasi_surat` (
  `id` int(11) NOT NULL,
  `kode` varchar(50) NOT NULL,
  `nama` varchar(250) NOT NULL,
  `uraian` mediumtext NOT NULL,
  `enabled` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `komentar`
--

CREATE TABLE `komentar` (
  `id` int(11) NOT NULL,
  `id_artikel` int(11) NOT NULL,
  `owner` varchar(50) NOT NULL,
  `email` varchar(50) DEFAULT NULL,
  `subjek` tinytext,
  `komentar` text NOT NULL,
  `tgl_upload` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` tinyint(1) DEFAULT NULL,
  `tipe` tinyint(1) DEFAULT NULL,
  `no_hp` varchar(15) DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `is_archived` tinyint(1) DEFAULT '0',
  `permohonan` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `kontak`
--

CREATE TABLE `kontak` (
  `id_kontak` int(11) NOT NULL,
  `id_pend` int(11) DEFAULT NULL,
  `no_hp` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `kontak_grup`
--

CREATE TABLE `kontak_grup` (
  `id_grup` int(11) NOT NULL,
  `nama_grup` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `laporan_sinkronisasi`
--

CREATE TABLE `laporan_sinkronisasi` (
  `id` int(11) NOT NULL,
  `tipe` varchar(50) DEFAULT NULL,
  `judul` varchar(100) NOT NULL,
  `tahun` int(11) NOT NULL,
  `semester` int(11) NOT NULL,
  `nama_file` varchar(100) NOT NULL,
  `kirim` datetime DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `line`
--

CREATE TABLE `line` (
  `id` int(11) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `simbol` varchar(50) DEFAULT NULL,
  `color` varchar(10) NOT NULL DEFAULT 'ff0000',
  `tipe` int(11) DEFAULT '0',
  `parrent` int(11) DEFAULT '1',
  `enabled` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `log_ekspor`
--

CREATE TABLE `log_ekspor` (
  `id` int(11) NOT NULL,
  `tgl_ekspor` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `kode_ekspor` varchar(100) NOT NULL,
  `semua` int(11) NOT NULL DEFAULT '1',
  `dari_tgl` date DEFAULT NULL,
  `total` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `log_hapus_penduduk`
--

CREATE TABLE `log_hapus_penduduk` (
  `id` int(11) NOT NULL,
  `id_pend` int(11) NOT NULL,
  `nik` decimal(16,0) NOT NULL,
  `foto` varchar(100) DEFAULT NULL,
  `deleted_by` varchar(100) DEFAULT NULL,
  `deleted_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `log_keluarga`
--

CREATE TABLE `log_keluarga` (
  `id` int(11) NOT NULL,
  `id_kk` int(11) NOT NULL,
  `kk_sex` tinyint(4) DEFAULT NULL,
  `id_peristiwa` int(11) NOT NULL,
  `tgl_peristiwa` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `id_pend` int(11) DEFAULT NULL,
  `updated_by` int(11) NOT NULL,
  `id_log_penduduk` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `log_penduduk`
--

CREATE TABLE `log_penduduk` (
  `id` int(11) NOT NULL,
  `id_pend` int(11) NOT NULL,
  `kode_peristiwa` int(11) DEFAULT NULL,
  `meninggal_di` varchar(50) DEFAULT NULL,
  `alamat_tujuan` tinytext,
  `tgl_lapor` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `tgl_peristiwa` datetime DEFAULT CURRENT_TIMESTAMP,
  `catatan` text,
  `no_kk` varchar(16) DEFAULT NULL,
  `nama_kk` varchar(100) DEFAULT NULL,
  `ref_pindah` tinyint(4) DEFAULT '1',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_by` int(11) DEFAULT NULL,
  `maksud_tujuan_kedatangan` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `log_perubahan_penduduk`
--

CREATE TABLE `log_perubahan_penduduk` (
  `id` int(11) NOT NULL,
  `id_pend` int(11) NOT NULL,
  `id_cluster` varchar(200) NOT NULL,
  `tanggal` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `log_surat`
--

CREATE TABLE `log_surat` (
  `id` int(11) NOT NULL,
  `id_format_surat` int(11) NOT NULL,
  `id_pend` int(11) DEFAULT NULL,
  `id_pamong` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `tanggal` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `bulan` varchar(2) DEFAULT NULL,
  `tahun` varchar(4) DEFAULT NULL,
  `no_surat` varchar(20) DEFAULT NULL,
  `nama_surat` varchar(100) DEFAULT NULL,
  `lampiran` varchar(100) DEFAULT NULL,
  `nik_non_warga` decimal(16,0) DEFAULT NULL,
  `nama_non_warga` varchar(100) DEFAULT NULL,
  `keterangan` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `lokasi`
--

CREATE TABLE `lokasi` (
  `id` int(11) NOT NULL,
  `desk` text NOT NULL,
  `nama` varchar(50) NOT NULL,
  `enabled` int(11) NOT NULL DEFAULT '1',
  `lat` varchar(30) DEFAULT NULL,
  `lng` varchar(30) DEFAULT NULL,
  `ref_point` int(11) NOT NULL,
  `foto` varchar(100) DEFAULT NULL,
  `id_cluster` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Stand-in structure for view `master_inventaris`
-- (See below for the actual view)
--
CREATE TABLE `master_inventaris` (
`asset` varchar(20)
,`id` int(11)
,`nama_barang` varchar(255)
,`kode_barang` varchar(64)
,`kondisi` varchar(255)
,`keterangan` text
,`asal` varchar(255)
,`tahun_pengadaan` bigint(20) unsigned
);

-- --------------------------------------------------------

--
-- Table structure for table `media_sosial`
--

CREATE TABLE `media_sosial` (
  `id` int(11) NOT NULL,
  `gambar` text NOT NULL,
  `link` text,
  `nama` varchar(100) NOT NULL,
  `tipe` tinyint(1) DEFAULT '1',
  `enabled` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `menu`
--

CREATE TABLE `menu` (
  `id` int(11) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `link` varchar(500) NOT NULL,
  `parrent` int(11) DEFAULT '0',
  `link_tipe` tinyint(1) NOT NULL DEFAULT '0',
  `enabled` tinyint(1) DEFAULT '1',
  `urut` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `migrasi`
--

CREATE TABLE `migrasi` (
  `id` int(11) NOT NULL,
  `versi_database` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `mutasi_cdesa`
--

CREATE TABLE `mutasi_cdesa` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_cdesa_masuk` int(10) UNSIGNED DEFAULT NULL,
  `cdesa_keluar` int(10) UNSIGNED DEFAULT NULL,
  `jenis_mutasi` tinyint(4) DEFAULT NULL,
  `tanggal_mutasi` date DEFAULT NULL,
  `keterangan` text,
  `id_persil` int(11) NOT NULL,
  `no_bidang_persil` tinyint(4) DEFAULT NULL,
  `luas` decimal(7,0) DEFAULT NULL,
  `no_objek_pajak` varchar(30) DEFAULT NULL,
  `path` text,
  `id_peta` int(60) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `mutasi_inventaris_asset`
--

CREATE TABLE `mutasi_inventaris_asset` (
  `id` int(11) NOT NULL,
  `id_inventaris_asset` int(11) DEFAULT NULL,
  `jenis_mutasi` varchar(100) DEFAULT NULL,
  `tahun_mutasi` date NOT NULL,
  `harga_jual` double DEFAULT NULL,
  `sumbangkan` varchar(255) DEFAULT NULL,
  `keterangan` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_by` int(11) NOT NULL,
  `visible` int(11) NOT NULL DEFAULT '1',
  `status_mutasi` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `mutasi_inventaris_gedung`
--

CREATE TABLE `mutasi_inventaris_gedung` (
  `id` int(11) NOT NULL,
  `id_inventaris_gedung` int(11) DEFAULT NULL,
  `jenis_mutasi` varchar(100) DEFAULT NULL,
  `tahun_mutasi` date NOT NULL,
  `harga_jual` double DEFAULT NULL,
  `sumbangkan` varchar(255) DEFAULT NULL,
  `keterangan` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_by` int(11) NOT NULL,
  `visible` int(11) NOT NULL DEFAULT '1',
  `status_mutasi` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `mutasi_inventaris_jalan`
--

CREATE TABLE `mutasi_inventaris_jalan` (
  `id` int(11) NOT NULL,
  `id_inventaris_jalan` int(11) DEFAULT NULL,
  `jenis_mutasi` varchar(100) DEFAULT NULL,
  `tahun_mutasi` date NOT NULL,
  `harga_jual` double DEFAULT NULL,
  `sumbangkan` varchar(255) DEFAULT NULL,
  `keterangan` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_by` int(11) NOT NULL,
  `visible` int(11) NOT NULL DEFAULT '1',
  `status_mutasi` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `mutasi_inventaris_peralatan`
--

CREATE TABLE `mutasi_inventaris_peralatan` (
  `id` int(11) NOT NULL,
  `id_inventaris_peralatan` int(11) DEFAULT NULL,
  `jenis_mutasi` varchar(100) DEFAULT NULL,
  `tahun_mutasi` date NOT NULL,
  `harga_jual` double DEFAULT NULL,
  `sumbangkan` varchar(255) DEFAULT NULL,
  `keterangan` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_by` int(11) NOT NULL,
  `visible` int(11) NOT NULL DEFAULT '1',
  `status_mutasi` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `mutasi_inventaris_tanah`
--

CREATE TABLE `mutasi_inventaris_tanah` (
  `id` int(11) NOT NULL,
  `id_inventaris_tanah` int(11) DEFAULT NULL,
  `jenis_mutasi` varchar(100) DEFAULT NULL,
  `tahun_mutasi` date NOT NULL,
  `harga_jual` double DEFAULT NULL,
  `sumbangkan` varchar(255) DEFAULT NULL,
  `keterangan` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_by` int(11) NOT NULL,
  `visible` int(11) NOT NULL DEFAULT '1',
  `status_mutasi` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `notifikasi`
--

CREATE TABLE `notifikasi` (
  `id` int(11) NOT NULL,
  `kode` varchar(100) NOT NULL,
  `judul` varchar(100) NOT NULL,
  `jenis` varchar(50) NOT NULL,
  `isi` text NOT NULL,
  `server` varchar(20) NOT NULL,
  `tgl_berikutnya` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_by` int(11) NOT NULL,
  `frekuensi` smallint(6) NOT NULL,
  `aksi` varchar(100) NOT NULL,
  `aktif` tinyint(4) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `outbox`
--

CREATE TABLE `outbox` (
  `UpdatedInDB` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `InsertIntoDB` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `SendingDateTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `SendBefore` time NOT NULL DEFAULT '23:59:59',
  `SendAfter` time NOT NULL DEFAULT '00:00:00',
  `Text` text,
  `DestinationNumber` varchar(20) NOT NULL DEFAULT '',
  `Coding` enum('Default_No_Compression','Unicode_No_Compression','8bit','Default_Compression','Unicode_Compression') NOT NULL DEFAULT 'Default_No_Compression',
  `UDH` text,
  `Class` int(11) DEFAULT '-1',
  `TextDecoded` text NOT NULL,
  `ID` int(10) UNSIGNED NOT NULL,
  `MultiPart` enum('false','true') DEFAULT 'false',
  `RelativeValidity` int(11) DEFAULT '-1',
  `SenderID` varchar(255) DEFAULT NULL,
  `SendingTimeOut` timestamp NULL DEFAULT NULL,
  `DeliveryReport` enum('default','yes','no') DEFAULT 'default',
  `CreatorID` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `pelapak`
--

CREATE TABLE `pelapak` (
  `id` int(11) NOT NULL,
  `id_pend` int(11) DEFAULT NULL,
  `telepon` varchar(20) DEFAULT NULL,
  `lat` varchar(20) DEFAULT NULL,
  `lng` varchar(20) DEFAULT NULL,
  `zoom` tinyint(4) NOT NULL DEFAULT '10',
  `status` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `pembangunan`
--

CREATE TABLE `pembangunan` (
  `id` int(11) NOT NULL,
  `id_lokasi` int(11) DEFAULT NULL,
  `sumber_dana` varchar(255) DEFAULT NULL,
  `judul` varchar(255) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `keterangan` varchar(255) DEFAULT NULL,
  `lokasi` varchar(225) DEFAULT NULL,
  `lat` varchar(225) DEFAULT NULL,
  `lng` varchar(255) DEFAULT NULL,
  `volume` varchar(100) DEFAULT NULL,
  `tahun_anggaran` year(4) DEFAULT NULL,
  `pelaksana_kegiatan` varchar(255) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `foto` varchar(255) DEFAULT NULL,
  `anggaran` int(11) NOT NULL DEFAULT '0',
  `sumber_biaya_pemerintah` int(11) DEFAULT '0',
  `sumber_biaya_provinsi` int(11) DEFAULT '0',
  `sumber_biaya_kab_kota` int(11) DEFAULT '0',
  `sumber_biaya_swadaya` int(11) DEFAULT '0',
  `sumber_biaya_jumlah` int(11) DEFAULT '0',
  `manfaat` varchar(100) DEFAULT NULL,
  `waktu` int(11) DEFAULT '0',
  `sifat_proyek` varchar(100) DEFAULT 'BARU'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `pembangunan_ref_dokumentasi`
--

CREATE TABLE `pembangunan_ref_dokumentasi` (
  `id` int(11) NOT NULL,
  `id_pembangunan` int(11) NOT NULL,
  `gambar` varchar(255) DEFAULT NULL,
  `persentase` varchar(255) DEFAULT NULL,
  `keterangan` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `pendapat`
--

CREATE TABLE `pendapat` (
  `id` int(11) NOT NULL,
  `pengguna` text NOT NULL,
  `tanggal` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `pilihan` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Stand-in structure for view `penduduk_hidup`
-- (See below for the actual view)
--
CREATE TABLE `penduduk_hidup` (
`id` int(11)
,`nama` varchar(100)
,`nik` varchar(16)
,`id_kk` int(11)
,`kk_level` tinyint(2)
,`id_rtm` varchar(30)
,`rtm_level` int(11)
,`sex` tinyint(3) unsigned
,`tempatlahir` varchar(100)
,`tanggallahir` date
,`agama_id` int(11)
,`pendidikan_kk_id` int(11)
,`pendidikan_sedang_id` int(11)
,`pekerjaan_id` int(11)
,`status_kawin` tinyint(4)
,`warganegara_id` tinyint(4)
,`dokumen_pasport` varchar(45)
,`dokumen_kitas` varchar(45)
,`ayah_nik` varchar(16)
,`ibu_nik` varchar(16)
,`nama_ayah` varchar(100)
,`nama_ibu` varchar(100)
,`foto` varchar(100)
,`golongan_darah_id` int(11)
,`id_cluster` int(11)
,`status` int(10) unsigned
,`alamat_sebelumnya` varchar(200)
,`alamat_sekarang` varchar(200)
,`status_dasar` tinyint(4)
,`hamil` int(11)
,`cacat_id` int(11)
,`sakit_menahun_id` int(11)
,`akta_lahir` varchar(40)
,`akta_perkawinan` varchar(40)
,`tanggalperkawinan` date
,`akta_perceraian` varchar(40)
,`tanggalperceraian` date
,`cara_kb_id` tinyint(4)
,`telepon` varchar(20)
,`tanggal_akhir_paspor` date
,`no_kk_sebelumnya` varchar(30)
,`ktp_el` tinyint(4)
,`status_rekam` tinyint(4)
,`waktu_lahir` varchar(5)
,`tempat_dilahirkan` tinyint(4)
,`jenis_kelahiran` tinyint(4)
,`kelahiran_anak_ke` tinyint(4)
,`penolong_kelahiran` tinyint(4)
,`berat_lahir` smallint(6)
,`panjang_lahir` varchar(10)
,`tag_id_card` varchar(17)
,`created_at` timestamp
,`created_by` int(11)
,`updated_at` timestamp
,`updated_by` int(11)
,`id_asuransi` tinyint(4)
,`no_asuransi` char(100)
,`email` varchar(50)
,`bahasa_id` int(11)
,`ket` tinytext
,`negara_asal` varchar(50)
,`tempat_cetak_ktp` varchar(50)
,`tanggal_cetak_ktp` date
,`suku` varchar(150)
,`bpjs_ketenagakerjaan` char(100)
);

-- --------------------------------------------------------

--
-- Table structure for table `permohonan_surat`
--

CREATE TABLE `permohonan_surat` (
  `id` int(11) NOT NULL,
  `id_pemohon` int(11) NOT NULL,
  `id_surat` int(11) NOT NULL,
  `isian_form` text NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `keterangan` text,
  `no_hp_aktif` varchar(50) NOT NULL,
  `syarat` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `no_antrian` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `persil`
--

CREATE TABLE `persil` (
  `id` int(10) UNSIGNED NOT NULL,
  `nomor` varchar(20) NOT NULL,
  `nomor_urut_bidang` tinyint(4) NOT NULL DEFAULT '1',
  `kelas` int(11) NOT NULL,
  `luas_persil` decimal(7,0) DEFAULT NULL,
  `id_wilayah` int(11) DEFAULT NULL,
  `lokasi` text,
  `path` text,
  `cdesa_awal` int(10) UNSIGNED DEFAULT NULL,
  `id_peta` int(60) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `pertanyaan`
--

CREATE TABLE `pertanyaan` (
  `1` int(11) DEFAULT NULL,
  `Pendapatan perkapita perbulan` varchar(87) DEFAULT NULL,
  `36` int(11) DEFAULT NULL,
  `15` int(11) DEFAULT NULL,
  `24` int(11) DEFAULT NULL,
  `23` int(11) DEFAULT NULL,
  `26` int(11) DEFAULT NULL,
  `28` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `point`
--

CREATE TABLE `point` (
  `id` int(11) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `simbol` varchar(50) DEFAULT NULL,
  `tipe` int(11) DEFAULT '0',
  `parrent` int(11) NOT NULL DEFAULT '1',
  `enabled` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `polygon`
--

CREATE TABLE `polygon` (
  `id` int(11) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `simbol` varchar(50) DEFAULT NULL,
  `color` varchar(10) NOT NULL DEFAULT 'ff0000',
  `tipe` int(11) DEFAULT '0',
  `parrent` int(11) DEFAULT '1',
  `enabled` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `produk`
--

CREATE TABLE `produk` (
  `id` int(11) NOT NULL,
  `id_pelapak` int(11) DEFAULT NULL,
  `id_produk_kategori` int(11) DEFAULT NULL,
  `nama` varchar(255) DEFAULT NULL,
  `harga` int(11) DEFAULT NULL,
  `satuan` varchar(20) DEFAULT NULL,
  `tipe_potongan` tinyint(1) DEFAULT '1',
  `potongan` int(11) DEFAULT '0',
  `deskripsi` text,
  `foto` varchar(225) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `produk_kategori`
--

CREATE TABLE `produk_kategori` (
  `id` int(11) NOT NULL,
  `kategori` varchar(50) DEFAULT NULL,
  `slug` varchar(100) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `program`
--

CREATE TABLE `program` (
  `id` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `sasaran` tinyint(4) DEFAULT NULL,
  `ndesc` varchar(500) DEFAULT NULL,
  `sdate` date NOT NULL,
  `edate` date NOT NULL,
  `userid` mediumint(9) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `asaldana` char(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `program_peserta`
--

CREATE TABLE `program_peserta` (
  `id` int(11) NOT NULL,
  `peserta` varchar(30) NOT NULL,
  `program_id` int(11) NOT NULL,
  `no_id_kartu` varchar(30) DEFAULT NULL,
  `kartu_nik` varchar(30) NOT NULL,
  `kartu_nama` varchar(100) NOT NULL,
  `kartu_tempat_lahir` varchar(100) NOT NULL DEFAULT '',
  `kartu_tanggal_lahir` date NOT NULL,
  `kartu_alamat` varchar(200) NOT NULL DEFAULT '',
  `kartu_peserta` varchar(100) DEFAULT NULL,
  `kartu_id_pend` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ref_asal_tanah_kas`
--

CREATE TABLE `ref_asal_tanah_kas` (
  `id` int(11) NOT NULL,
  `nama` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ref_dokumen`
--

CREATE TABLE `ref_dokumen` (
  `id` int(10) UNSIGNED NOT NULL,
  `nama` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ref_penduduk_bahasa`
--

CREATE TABLE `ref_penduduk_bahasa` (
  `id` int(11) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `inisial` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ref_penduduk_bidang`
--

CREATE TABLE `ref_penduduk_bidang` (
  `id` int(12) UNSIGNED NOT NULL,
  `nama` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ref_penduduk_kursus`
--

CREATE TABLE `ref_penduduk_kursus` (
  `id` int(12) UNSIGNED NOT NULL,
  `nama` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ref_penduduk_suku`
--

CREATE TABLE `ref_penduduk_suku` (
  `id` int(65) UNSIGNED NOT NULL,
  `suku` varchar(100) NOT NULL,
  `deskripsi` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ref_peristiwa`
--

CREATE TABLE `ref_peristiwa` (
  `id` int(11) NOT NULL,
  `nama` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ref_persil_kelas`
--

CREATE TABLE `ref_persil_kelas` (
  `id` int(10) UNSIGNED NOT NULL,
  `tipe` varchar(20) NOT NULL,
  `kode` varchar(20) NOT NULL,
  `ndesc` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ref_persil_mutasi`
--

CREATE TABLE `ref_persil_mutasi` (
  `id` tinyint(3) UNSIGNED NOT NULL,
  `nama` varchar(20) NOT NULL,
  `ndesc` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ref_peruntukan_tanah_kas`
--

CREATE TABLE `ref_peruntukan_tanah_kas` (
  `id` int(11) NOT NULL,
  `nama` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ref_pindah`
--

CREATE TABLE `ref_pindah` (
  `id` tinyint(4) NOT NULL,
  `nama` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ref_sinkronisasi`
--

CREATE TABLE `ref_sinkronisasi` (
  `tabel` varchar(100) NOT NULL,
  `server` varchar(255) DEFAULT NULL,
  `jenis_update` tinyint(4) DEFAULT NULL,
  `tabel_hapus` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ref_status_covid`
--

CREATE TABLE `ref_status_covid` (
  `id` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ref_syarat_surat`
--

CREATE TABLE `ref_syarat_surat` (
  `ref_syarat_id` int(10) UNSIGNED NOT NULL,
  `ref_syarat_nama` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Stand-in structure for view `rekap_mutasi_inventaris`
-- (See below for the actual view)
--
CREATE TABLE `rekap_mutasi_inventaris` (
`asset` varchar(20)
,`id_inventaris_asset` int(11)
,`status_mutasi` varchar(50)
,`jenis_mutasi` varchar(100)
,`tahun_mutasi` date
,`keterangan` text
);

-- --------------------------------------------------------

--
-- Table structure for table `sentitems`
--

CREATE TABLE `sentitems` (
  `UpdatedInDB` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `InsertIntoDB` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `SendingDateTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `DeliveryDateTime` timestamp NULL DEFAULT NULL,
  `Text` text NOT NULL,
  `DestinationNumber` varchar(20) NOT NULL DEFAULT '',
  `Coding` enum('Default_No_Compression','Unicode_No_Compression','8bit','Default_Compression','Unicode_Compression') NOT NULL DEFAULT 'Default_No_Compression',
  `UDH` text NOT NULL,
  `SMSCNumber` varchar(20) NOT NULL DEFAULT '',
  `Class` int(11) NOT NULL DEFAULT '-1',
  `TextDecoded` text NOT NULL,
  `ID` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `SenderID` varchar(255) NOT NULL,
  `SequencePosition` int(11) NOT NULL DEFAULT '1',
  `Status` enum('SendingOK','SendingOKNoReport','SendingError','DeliveryOK','DeliveryFailed','DeliveryPending','DeliveryUnknown','Error') NOT NULL DEFAULT 'SendingOK',
  `StatusError` int(11) NOT NULL DEFAULT '-1',
  `TPMR` int(11) NOT NULL DEFAULT '-1',
  `RelativeValidity` int(11) NOT NULL DEFAULT '-1',
  `CreatorID` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `setting_aplikasi`
--

CREATE TABLE `setting_aplikasi` (
  `id` int(11) NOT NULL,
  `key` varchar(50) DEFAULT NULL,
  `value` text,
  `keterangan` varchar(200) DEFAULT NULL,
  `jenis` varchar(30) DEFAULT NULL,
  `kategori` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `setting_aplikasi_options`
--

CREATE TABLE `setting_aplikasi_options` (
  `id` int(11) NOT NULL,
  `id_setting` int(11) NOT NULL,
  `value` varchar(512) NOT NULL,
  `kode` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `setting_modul`
--

CREATE TABLE `setting_modul` (
  `id` int(11) NOT NULL,
  `modul` varchar(50) NOT NULL,
  `url` varchar(50) NOT NULL,
  `aktif` tinyint(1) NOT NULL DEFAULT '0',
  `ikon` varchar(50) DEFAULT '',
  `urut` int(4) DEFAULT NULL,
  `level` tinyint(1) NOT NULL DEFAULT '2',
  `hidden` tinyint(1) NOT NULL DEFAULT '0',
  `ikon_kecil` varchar(50) DEFAULT '',
  `parent` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `setting_sms`
--

CREATE TABLE `setting_sms` (
  `autoreply_text` varchar(160) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `statistics`
--

CREATE TABLE `statistics` (
  `id` int(11) NOT NULL,
  `url_id` int(11) NOT NULL,
  `created` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `suplemen`
--

CREATE TABLE `suplemen` (
  `id` int(11) NOT NULL,
  `nama` varchar(100) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `sasaran` tinyint(4) DEFAULT NULL,
  `keterangan` varchar(300) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `suplemen_terdata`
--

CREATE TABLE `suplemen_terdata` (
  `id` int(11) NOT NULL,
  `id_suplemen` int(11) DEFAULT NULL,
  `id_terdata` varchar(20) DEFAULT NULL,
  `sasaran` tinyint(4) DEFAULT NULL,
  `keterangan` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `surat_keluar`
--

CREATE TABLE `surat_keluar` (
  `id` int(11) NOT NULL,
  `nomor_urut` smallint(6) DEFAULT NULL,
  `nomor_surat` varchar(35) DEFAULT NULL,
  `kode_surat` varchar(10) DEFAULT NULL,
  `tanggal_surat` date NOT NULL,
  `tanggal_catat` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `tujuan` varchar(100) DEFAULT NULL,
  `isi_singkat` varchar(200) DEFAULT NULL,
  `berkas_scan` varchar(100) DEFAULT NULL,
  `ekspedisi` tinyint(1) DEFAULT '0',
  `tanggal_pengiriman` date DEFAULT NULL,
  `tanda_terima` varchar(200) DEFAULT NULL,
  `keterangan` varchar(500) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `surat_masuk`
--

CREATE TABLE `surat_masuk` (
  `id` int(11) NOT NULL,
  `nomor_urut` smallint(6) DEFAULT NULL,
  `tanggal_penerimaan` date NOT NULL,
  `nomor_surat` varchar(35) DEFAULT NULL,
  `kode_surat` varchar(10) DEFAULT NULL,
  `tanggal_surat` date NOT NULL,
  `pengirim` varchar(100) DEFAULT NULL,
  `isi_singkat` varchar(200) DEFAULT NULL,
  `isi_disposisi` varchar(200) DEFAULT NULL,
  `berkas_scan` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `syarat_surat`
--

CREATE TABLE `syarat_surat` (
  `id` int(11) NOT NULL,
  `surat_format_id` int(11) NOT NULL,
  `ref_syarat_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sys_traffic`
--

CREATE TABLE `sys_traffic` (
  `Tanggal` date NOT NULL,
  `ipAddress` text NOT NULL,
  `Jumlah` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tanah_desa`
--

CREATE TABLE `tanah_desa` (
  `id` int(11) NOT NULL,
  `id_penduduk` int(10) NOT NULL,
  `nik` decimal(16,0) DEFAULT NULL,
  `jenis_pemilik` text,
  `nama_pemilik_asal` varchar(200) NOT NULL,
  `luas` int(10) NOT NULL,
  `hak_milik` int(11) DEFAULT NULL,
  `hak_guna_bangunan` int(11) DEFAULT NULL,
  `hak_pakai` int(11) DEFAULT NULL,
  `hak_guna_usaha` int(11) DEFAULT NULL,
  `hak_pengelolaan` int(11) DEFAULT NULL,
  `hak_milik_adat` int(11) DEFAULT NULL,
  `hak_verponding` int(11) DEFAULT NULL,
  `tanah_negara` int(11) DEFAULT NULL,
  `perumahan` int(11) DEFAULT NULL,
  `perdagangan_jasa` int(11) DEFAULT NULL,
  `perkantoran` int(11) DEFAULT NULL,
  `industri` int(11) DEFAULT NULL,
  `fasilitas_umum` int(11) DEFAULT NULL,
  `sawah` int(11) DEFAULT NULL,
  `tegalan` int(11) DEFAULT NULL,
  `perkebunan` int(11) DEFAULT NULL,
  `peternakan_perikanan` int(11) DEFAULT NULL,
  `hutan_belukar` int(11) DEFAULT NULL,
  `hutan_lebat_lindung` int(11) DEFAULT NULL,
  `tanah_kosong` int(11) DEFAULT NULL,
  `lain` int(11) DEFAULT NULL,
  `mutasi` text NOT NULL,
  `keterangan` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(10) NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_by` int(10) NOT NULL,
  `visible` tinyint(3) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tanah_kas_desa`
--

CREATE TABLE `tanah_kas_desa` (
  `id` int(11) NOT NULL,
  `nama_pemilik_asal` varchar(200) NOT NULL,
  `letter_c` text NOT NULL,
  `kelas` text NOT NULL,
  `luas` int(10) NOT NULL,
  `asli_milik_desa` int(11) DEFAULT NULL,
  `pemerintah` int(11) DEFAULT NULL,
  `provinsi` int(11) DEFAULT NULL,
  `kabupaten_kota` int(11) DEFAULT NULL,
  `lain_lain` int(11) DEFAULT NULL,
  `sawah` int(11) DEFAULT NULL,
  `tegal` int(11) DEFAULT NULL,
  `kebun` int(11) DEFAULT NULL,
  `tambak_kolam` int(11) DEFAULT NULL,
  `tanah_kering_darat` int(11) DEFAULT NULL,
  `ada_patok` int(11) DEFAULT NULL,
  `tidak_ada_patok` int(11) DEFAULT NULL,
  `ada_papan_nama` int(11) DEFAULT NULL,
  `tidak_ada_papan_nama` int(11) DEFAULT NULL,
  `tanggal_perolehan` date DEFAULT NULL,
  `lokasi` text NOT NULL,
  `peruntukan` text NOT NULL,
  `mutasi` text NOT NULL,
  `keterangan` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(10) NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_by` int(10) NOT NULL,
  `visible` tinyint(2) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `teks_berjalan`
--

CREATE TABLE `teks_berjalan` (
  `id` int(11) NOT NULL,
  `teks` text,
  `urut` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_by` int(11) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  `tautan` varchar(150) DEFAULT NULL,
  `judul_tautan` varchar(150) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tweb_aset`
--

CREATE TABLE `tweb_aset` (
  `id_aset` int(11) NOT NULL,
  `golongan` varchar(11) NOT NULL,
  `bidang` varchar(11) NOT NULL,
  `kelompok` varchar(11) NOT NULL,
  `sub_kelompok` varchar(11) NOT NULL,
  `sub_sub_kelompok` varchar(11) NOT NULL,
  `nama` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tweb_cacat`
--

CREATE TABLE `tweb_cacat` (
  `id` int(10) UNSIGNED NOT NULL,
  `nama` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tweb_cara_kb`
--

CREATE TABLE `tweb_cara_kb` (
  `id` tinyint(4) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `sex` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `tweb_desa_pamong`
--

CREATE TABLE `tweb_desa_pamong` (
  `pamong_id` int(11) NOT NULL,
  `pamong_nama` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pamong_nip` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pamong_nik` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `jabatan` varchar(50) COLLATE utf8_unicode_ci DEFAULT '0',
  `pamong_status` tinyint(1) DEFAULT '1',
  `pamong_tgl_terdaftar` date DEFAULT NULL,
  `pamong_ttd` tinyint(1) DEFAULT NULL,
  `foto` text COLLATE utf8_unicode_ci,
  `id_pend` int(11) DEFAULT NULL,
  `pamong_tempatlahir` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pamong_tanggallahir` date DEFAULT NULL,
  `pamong_sex` tinyint(4) DEFAULT NULL,
  `pamong_pendidikan` int(11) DEFAULT NULL,
  `pamong_agama` int(11) DEFAULT NULL,
  `pamong_nosk` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pamong_tglsk` date DEFAULT NULL,
  `pamong_masajab` varchar(120) COLLATE utf8_unicode_ci DEFAULT NULL,
  `urut` int(11) DEFAULT NULL,
  `pamong_niap` varchar(25) COLLATE utf8_unicode_ci DEFAULT '0',
  `pamong_pangkat` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pamong_nohenti` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pamong_tglhenti` date DEFAULT NULL,
  `pamong_ub` tinyint(1) NOT NULL DEFAULT '0',
  `atasan` int(11) DEFAULT NULL,
  `bagan_tingkat` tinyint(4) DEFAULT NULL,
  `bagan_offset` int(11) DEFAULT NULL,
  `bagan_layout` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `bagan_warna` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tweb_golongan_darah`
--

CREATE TABLE `tweb_golongan_darah` (
  `id` int(11) NOT NULL,
  `nama` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tweb_keluarga`
--

CREATE TABLE `tweb_keluarga` (
  `id` int(11) NOT NULL,
  `no_kk` varchar(16) DEFAULT NULL,
  `nik_kepala` varchar(200) DEFAULT NULL,
  `tgl_daftar` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `kelas_sosial` int(11) DEFAULT NULL,
  `tgl_cetak_kk` datetime DEFAULT NULL,
  `alamat` varchar(200) DEFAULT NULL,
  `id_cluster` int(11) NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `tweb_keluarga_sejahtera`
--

CREATE TABLE `tweb_keluarga_sejahtera` (
  `id` int(11) NOT NULL DEFAULT '0',
  `nama` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tweb_penduduk`
--

CREATE TABLE `tweb_penduduk` (
  `id` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `nik` varchar(16) DEFAULT NULL,
  `id_kk` int(11) DEFAULT '0',
  `kk_level` tinyint(2) DEFAULT NULL,
  `id_rtm` varchar(30) DEFAULT NULL,
  `rtm_level` int(11) DEFAULT NULL,
  `sex` tinyint(3) UNSIGNED DEFAULT NULL,
  `tempatlahir` varchar(100) DEFAULT NULL,
  `tanggallahir` date DEFAULT NULL,
  `agama_id` int(11) DEFAULT NULL,
  `pendidikan_kk_id` int(11) DEFAULT NULL,
  `pendidikan_sedang_id` int(11) DEFAULT NULL,
  `pekerjaan_id` int(11) DEFAULT NULL,
  `status_kawin` tinyint(4) DEFAULT NULL,
  `warganegara_id` tinyint(4) NOT NULL DEFAULT '1',
  `dokumen_pasport` varchar(45) DEFAULT NULL,
  `dokumen_kitas` varchar(45) DEFAULT NULL,
  `ayah_nik` varchar(16) DEFAULT NULL,
  `ibu_nik` varchar(16) DEFAULT NULL,
  `nama_ayah` varchar(100) DEFAULT NULL,
  `nama_ibu` varchar(100) DEFAULT NULL,
  `foto` varchar(100) DEFAULT NULL,
  `golongan_darah_id` int(11) DEFAULT NULL,
  `id_cluster` int(11) NOT NULL,
  `status` int(10) UNSIGNED DEFAULT NULL,
  `alamat_sebelumnya` varchar(200) DEFAULT NULL,
  `alamat_sekarang` varchar(200) DEFAULT NULL,
  `status_dasar` tinyint(4) NOT NULL DEFAULT '1',
  `hamil` int(11) DEFAULT NULL,
  `cacat_id` int(11) DEFAULT NULL,
  `sakit_menahun_id` int(11) DEFAULT NULL,
  `akta_lahir` varchar(40) DEFAULT NULL,
  `akta_perkawinan` varchar(40) DEFAULT NULL,
  `tanggalperkawinan` date DEFAULT NULL,
  `akta_perceraian` varchar(40) DEFAULT NULL,
  `tanggalperceraian` date DEFAULT NULL,
  `cara_kb_id` tinyint(4) DEFAULT NULL,
  `telepon` varchar(20) DEFAULT NULL,
  `tanggal_akhir_paspor` date DEFAULT NULL,
  `no_kk_sebelumnya` varchar(30) DEFAULT NULL,
  `ktp_el` tinyint(4) DEFAULT NULL,
  `status_rekam` tinyint(4) DEFAULT NULL,
  `waktu_lahir` varchar(5) DEFAULT NULL,
  `tempat_dilahirkan` tinyint(4) DEFAULT NULL,
  `jenis_kelahiran` tinyint(4) DEFAULT NULL,
  `kelahiran_anak_ke` tinyint(4) DEFAULT NULL,
  `penolong_kelahiran` tinyint(4) DEFAULT NULL,
  `berat_lahir` smallint(6) DEFAULT NULL,
  `panjang_lahir` varchar(10) DEFAULT NULL,
  `tag_id_card` varchar(17) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_by` int(11) DEFAULT NULL,
  `id_asuransi` tinyint(4) DEFAULT NULL,
  `no_asuransi` char(100) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `bahasa_id` int(11) DEFAULT NULL,
  `ket` tinytext,
  `negara_asal` varchar(50) DEFAULT NULL,
  `tempat_cetak_ktp` varchar(50) DEFAULT NULL,
  `tanggal_cetak_ktp` date DEFAULT NULL,
  `suku` varchar(150) DEFAULT NULL,
  `bpjs_ketenagakerjaan` char(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `tweb_penduduk_agama`
--

CREATE TABLE `tweb_penduduk_agama` (
  `id` int(10) UNSIGNED NOT NULL,
  `nama` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `tweb_penduduk_asuransi`
--

CREATE TABLE `tweb_penduduk_asuransi` (
  `id` tinyint(4) NOT NULL,
  `nama` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tweb_penduduk_hubungan`
--

CREATE TABLE `tweb_penduduk_hubungan` (
  `id` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `tweb_penduduk_kawin`
--

CREATE TABLE `tweb_penduduk_kawin` (
  `id` int(10) UNSIGNED NOT NULL,
  `nama` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `tweb_penduduk_mandiri`
--

CREATE TABLE `tweb_penduduk_mandiri` (
  `pin` char(32) NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `tanggal_buat` datetime DEFAULT NULL,
  `id_pend` int(11) NOT NULL,
  `ganti_pin` tinyint(1) NOT NULL DEFAULT '1',
  `email_verified_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `remember_token` varchar(100) DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tweb_penduduk_map`
--

CREATE TABLE `tweb_penduduk_map` (
  `id` int(11) NOT NULL,
  `lat` varchar(24) DEFAULT NULL,
  `lng` varchar(24) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tweb_penduduk_pekerjaan`
--

CREATE TABLE `tweb_penduduk_pekerjaan` (
  `id` int(10) UNSIGNED NOT NULL,
  `nama` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `tweb_penduduk_pendidikan`
--

CREATE TABLE `tweb_penduduk_pendidikan` (
  `id` tinyint(4) NOT NULL,
  `nama` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `tweb_penduduk_pendidikan_kk`
--

CREATE TABLE `tweb_penduduk_pendidikan_kk` (
  `id` int(10) UNSIGNED NOT NULL,
  `nama` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `tweb_penduduk_sex`
--

CREATE TABLE `tweb_penduduk_sex` (
  `id` int(10) UNSIGNED NOT NULL,
  `nama` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `tweb_penduduk_status`
--

CREATE TABLE `tweb_penduduk_status` (
  `id` int(10) UNSIGNED NOT NULL,
  `nama` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tweb_penduduk_umur`
--

CREATE TABLE `tweb_penduduk_umur` (
  `id` int(11) NOT NULL,
  `nama` varchar(25) DEFAULT NULL,
  `dari` int(11) DEFAULT NULL,
  `sampai` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tweb_penduduk_warganegara`
--

CREATE TABLE `tweb_penduduk_warganegara` (
  `id` int(10) UNSIGNED NOT NULL,
  `nama` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tweb_rtm`
--

CREATE TABLE `tweb_rtm` (
  `id` int(11) NOT NULL,
  `nik_kepala` int(11) NOT NULL,
  `no_kk` varchar(30) NOT NULL,
  `tgl_daftar` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `kelas_sosial` int(11) DEFAULT NULL,
  `bdt` varchar(16) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tweb_rtm_hubungan`
--

CREATE TABLE `tweb_rtm_hubungan` (
  `id` tinyint(4) NOT NULL,
  `nama` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tweb_sakit_menahun`
--

CREATE TABLE `tweb_sakit_menahun` (
  `id` int(11) NOT NULL,
  `nama` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tweb_status_dasar`
--

CREATE TABLE `tweb_status_dasar` (
  `id` int(10) UNSIGNED NOT NULL,
  `nama` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tweb_status_ktp`
--

CREATE TABLE `tweb_status_ktp` (
  `id` tinyint(4) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `ktp_el` tinyint(4) NOT NULL,
  `status_rekam` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `tweb_surat_atribut`
--

CREATE TABLE `tweb_surat_atribut` (
  `id` int(11) NOT NULL,
  `id_surat` int(11) NOT NULL,
  `id_tipe` tinyint(4) NOT NULL,
  `nama` varchar(40) NOT NULL,
  `long` tinyint(4) NOT NULL,
  `kode` tinyint(4) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tweb_surat_format`
--

CREATE TABLE `tweb_surat_format` (
  `id` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `url_surat` varchar(100) NOT NULL,
  `kode_surat` varchar(10) DEFAULT NULL,
  `lampiran` varchar(100) DEFAULT NULL,
  `kunci` tinyint(1) NOT NULL DEFAULT '0',
  `favorit` tinyint(1) NOT NULL DEFAULT '0',
  `jenis` tinyint(4) NOT NULL DEFAULT '2',
  `mandiri` tinyint(1) DEFAULT '0',
  `masa_berlaku` int(11) DEFAULT '1',
  `satuan_masa_berlaku` varchar(15) DEFAULT 'M',
  `qr_code` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tweb_wil_clusterdesa`
--

CREATE TABLE `tweb_wil_clusterdesa` (
  `id` int(11) NOT NULL,
  `rt` varchar(10) NOT NULL DEFAULT '0',
  `rw` varchar(10) NOT NULL DEFAULT '0',
  `dusun` varchar(50) NOT NULL DEFAULT '0',
  `id_kepala` int(11) DEFAULT NULL,
  `lat` varchar(20) DEFAULT NULL,
  `lng` varchar(20) DEFAULT NULL,
  `zoom` int(11) DEFAULT NULL,
  `path` text,
  `map_tipe` varchar(20) DEFAULT NULL,
  `warna` varchar(10) DEFAULT NULL,
  `urut` int(11) DEFAULT NULL,
  `urut_cetak` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `urls`
--

CREATE TABLE `urls` (
  `id` int(11) NOT NULL,
  `url` varchar(255) NOT NULL,
  `alias` varchar(100) NOT NULL,
  `created` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` mediumint(8) UNSIGNED NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `id_grup` int(11) NOT NULL,
  `email` varchar(100) NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `active` tinyint(3) UNSIGNED DEFAULT '0',
  `nama` varchar(50) DEFAULT NULL,
  `company` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `foto` varchar(100) DEFAULT 'kuser.png',
  `session` varchar(40) NOT NULL,
  `nik` varchar(16) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `user_grup`
--

CREATE TABLE `user_grup` (
  `id` int(5) NOT NULL,
  `nama` varchar(20) NOT NULL,
  `jenis` tinyint(2) NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `widget`
--

CREATE TABLE `widget` (
  `id` int(11) NOT NULL,
  `isi` text,
  `enabled` int(11) DEFAULT NULL,
  `judul` varchar(100) DEFAULT NULL,
  `jenis_widget` tinyint(4) NOT NULL DEFAULT '3',
  `urut` int(11) DEFAULT NULL,
  `form_admin` varchar(100) DEFAULT NULL,
  `setting` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure for view `daftar_anggota_grup`
--
DROP TABLE IF EXISTS `daftar_anggota_grup`;

CREATE ALGORITHM=UNDEFINED DEFINER=`admin`@`localhost` SQL SECURITY DEFINER VIEW `daftar_anggota_grup`  AS  select `a`.`id_grup_kontak` AS `id_grup_kontak`,`a`.`id_grup` AS `id_grup`,`c`.`nama_grup` AS `nama_grup`,`b`.`id_kontak` AS `id_kontak`,`b`.`nama` AS `nama`,`b`.`no_hp` AS `no_hp`,`b`.`sex` AS `sex`,`b`.`alamat_sekarang` AS `alamat_sekarang` from ((`anggota_grup_kontak` `a` left join `daftar_kontak` `b` on((`a`.`id_kontak` = `b`.`id_kontak`))) left join `kontak_grup` `c` on((`a`.`id_grup` = `c`.`id_grup`))) ;

-- --------------------------------------------------------

--
-- Structure for view `daftar_grup`
--
DROP TABLE IF EXISTS `daftar_grup`;

CREATE ALGORITHM=UNDEFINED DEFINER=`admin`@`localhost` SQL SECURITY DEFINER VIEW `daftar_grup`  AS  select `a`.`id_grup` AS `id_grup`,`a`.`nama_grup` AS `nama_grup`,(select count(`anggota_grup_kontak`.`id_kontak`) from `anggota_grup_kontak` where (`a`.`id_grup` = `anggota_grup_kontak`.`id_grup`)) AS `jumlah_anggota` from `kontak_grup` `a` ;

-- --------------------------------------------------------

--
-- Structure for view `daftar_kontak`
--
DROP TABLE IF EXISTS `daftar_kontak`;

CREATE ALGORITHM=UNDEFINED DEFINER=`admin`@`localhost` SQL SECURITY DEFINER VIEW `daftar_kontak`  AS  select `a`.`id_kontak` AS `id_kontak`,`a`.`id_pend` AS `id_pend`,`b`.`nama` AS `nama`,`a`.`no_hp` AS `no_hp`,(case when (`b`.`sex` = '1') then 'Laki-laki' else 'Perempuan' end) AS `sex`,`b`.`alamat_sekarang` AS `alamat_sekarang` from (`kontak` `a` left join `tweb_penduduk` `b` on((`a`.`id_pend` = `b`.`id`))) ;

-- --------------------------------------------------------

--
-- Structure for view `dokumen_hidup`
--
DROP TABLE IF EXISTS `dokumen_hidup`;

CREATE ALGORITHM=UNDEFINED DEFINER=`admin`@`localhost` SQL SECURITY DEFINER VIEW `dokumen_hidup`  AS  select `dokumen`.`id` AS `id`,`dokumen`.`satuan` AS `satuan`,`dokumen`.`nama` AS `nama`,`dokumen`.`enabled` AS `enabled`,`dokumen`.`tgl_upload` AS `tgl_upload`,`dokumen`.`id_pend` AS `id_pend`,`dokumen`.`kategori` AS `kategori`,`dokumen`.`attr` AS `attr`,`dokumen`.`tahun` AS `tahun`,`dokumen`.`kategori_info_publik` AS `kategori_info_publik`,`dokumen`.`updated_at` AS `updated_at`,`dokumen`.`deleted` AS `deleted`,`dokumen`.`id_syarat` AS `id_syarat`,`dokumen`.`id_parent` AS `id_parent`,`dokumen`.`created_at` AS `created_at`,`dokumen`.`created_by` AS `created_by`,`dokumen`.`updated_by` AS `updated_by`,`dokumen`.`dok_warga` AS `dok_warga` from `dokumen` where (`dokumen`.`deleted` <> 1) ;

-- --------------------------------------------------------

--
-- Structure for view `keluarga_aktif`
--
DROP TABLE IF EXISTS `keluarga_aktif`;

CREATE ALGORITHM=UNDEFINED DEFINER=`admin`@`localhost` SQL SECURITY DEFINER VIEW `keluarga_aktif`  AS  select `k`.`id` AS `id`,`k`.`no_kk` AS `no_kk`,`k`.`nik_kepala` AS `nik_kepala`,`k`.`tgl_daftar` AS `tgl_daftar`,`k`.`kelas_sosial` AS `kelas_sosial`,`k`.`tgl_cetak_kk` AS `tgl_cetak_kk`,`k`.`alamat` AS `alamat`,`k`.`id_cluster` AS `id_cluster` from (`tweb_keluarga` `k` left join `tweb_penduduk` `p` on((`k`.`nik_kepala` = `p`.`id`))) where (`p`.`status_dasar` = 1) ;

-- --------------------------------------------------------

--
-- Structure for view `master_inventaris`
--
DROP TABLE IF EXISTS `master_inventaris`;

CREATE ALGORITHM=UNDEFINED DEFINER=`admin`@`localhost` SQL SECURITY DEFINER VIEW `master_inventaris`  AS  select 'inventaris_asset' AS `asset`,`inventaris_asset`.`id` AS `id`,`inventaris_asset`.`nama_barang` AS `nama_barang`,`inventaris_asset`.`kode_barang` AS `kode_barang`,'Baik' AS `kondisi`,`inventaris_asset`.`keterangan` AS `keterangan`,`inventaris_asset`.`asal` AS `asal`,`inventaris_asset`.`tahun_pengadaan` AS `tahun_pengadaan` from `inventaris_asset` where (`inventaris_asset`.`visible` = 1) union all select 'inventaris_gedung' AS `asset`,`inventaris_gedung`.`id` AS `id`,`inventaris_gedung`.`nama_barang` AS `nama_barang`,`inventaris_gedung`.`kode_barang` AS `kode_barang`,`inventaris_gedung`.`kondisi_bangunan` AS `kondisi_bangunan`,`inventaris_gedung`.`keterangan` AS `keterangan`,`inventaris_gedung`.`asal` AS `asal`,year(`inventaris_gedung`.`tanggal_dokument`) AS `tahun_pengadaan` from `inventaris_gedung` where (`inventaris_gedung`.`visible` = 1) union all select 'inventaris_jalan' AS `asset`,`inventaris_jalan`.`id` AS `id`,`inventaris_jalan`.`nama_barang` AS `nama_barang`,`inventaris_jalan`.`kode_barang` AS `kode_barang`,`inventaris_jalan`.`kondisi` AS `kondisi`,`inventaris_jalan`.`keterangan` AS `keterangan`,`inventaris_jalan`.`asal` AS `asal`,year(`inventaris_jalan`.`tanggal_dokument`) AS `tahun_pengadaan` from `inventaris_jalan` where (`inventaris_jalan`.`visible` = 1) union all select 'inventaris_peralatan' AS `asset`,`inventaris_peralatan`.`id` AS `id`,`inventaris_peralatan`.`nama_barang` AS `nama_barang`,`inventaris_peralatan`.`kode_barang` AS `kode_barang`,'Baik' AS `Baik`,`inventaris_peralatan`.`keterangan` AS `keterangan`,`inventaris_peralatan`.`asal` AS `asal`,`inventaris_peralatan`.`tahun_pengadaan` AS `tahun_pengadaan` from `inventaris_peralatan` where (`inventaris_peralatan`.`visible` = 1) ;

-- --------------------------------------------------------

--
-- Structure for view `penduduk_hidup`
--
DROP TABLE IF EXISTS `penduduk_hidup`;

CREATE ALGORITHM=UNDEFINED DEFINER=`admin`@`localhost` SQL SECURITY DEFINER VIEW `penduduk_hidup`  AS  select `tweb_penduduk`.`id` AS `id`,`tweb_penduduk`.`nama` AS `nama`,`tweb_penduduk`.`nik` AS `nik`,`tweb_penduduk`.`id_kk` AS `id_kk`,`tweb_penduduk`.`kk_level` AS `kk_level`,`tweb_penduduk`.`id_rtm` AS `id_rtm`,`tweb_penduduk`.`rtm_level` AS `rtm_level`,`tweb_penduduk`.`sex` AS `sex`,`tweb_penduduk`.`tempatlahir` AS `tempatlahir`,`tweb_penduduk`.`tanggallahir` AS `tanggallahir`,`tweb_penduduk`.`agama_id` AS `agama_id`,`tweb_penduduk`.`pendidikan_kk_id` AS `pendidikan_kk_id`,`tweb_penduduk`.`pendidikan_sedang_id` AS `pendidikan_sedang_id`,`tweb_penduduk`.`pekerjaan_id` AS `pekerjaan_id`,`tweb_penduduk`.`status_kawin` AS `status_kawin`,`tweb_penduduk`.`warganegara_id` AS `warganegara_id`,`tweb_penduduk`.`dokumen_pasport` AS `dokumen_pasport`,`tweb_penduduk`.`dokumen_kitas` AS `dokumen_kitas`,`tweb_penduduk`.`ayah_nik` AS `ayah_nik`,`tweb_penduduk`.`ibu_nik` AS `ibu_nik`,`tweb_penduduk`.`nama_ayah` AS `nama_ayah`,`tweb_penduduk`.`nama_ibu` AS `nama_ibu`,`tweb_penduduk`.`foto` AS `foto`,`tweb_penduduk`.`golongan_darah_id` AS `golongan_darah_id`,`tweb_penduduk`.`id_cluster` AS `id_cluster`,`tweb_penduduk`.`status` AS `status`,`tweb_penduduk`.`alamat_sebelumnya` AS `alamat_sebelumnya`,`tweb_penduduk`.`alamat_sekarang` AS `alamat_sekarang`,`tweb_penduduk`.`status_dasar` AS `status_dasar`,`tweb_penduduk`.`hamil` AS `hamil`,`tweb_penduduk`.`cacat_id` AS `cacat_id`,`tweb_penduduk`.`sakit_menahun_id` AS `sakit_menahun_id`,`tweb_penduduk`.`akta_lahir` AS `akta_lahir`,`tweb_penduduk`.`akta_perkawinan` AS `akta_perkawinan`,`tweb_penduduk`.`tanggalperkawinan` AS `tanggalperkawinan`,`tweb_penduduk`.`akta_perceraian` AS `akta_perceraian`,`tweb_penduduk`.`tanggalperceraian` AS `tanggalperceraian`,`tweb_penduduk`.`cara_kb_id` AS `cara_kb_id`,`tweb_penduduk`.`telepon` AS `telepon`,`tweb_penduduk`.`tanggal_akhir_paspor` AS `tanggal_akhir_paspor`,`tweb_penduduk`.`no_kk_sebelumnya` AS `no_kk_sebelumnya`,`tweb_penduduk`.`ktp_el` AS `ktp_el`,`tweb_penduduk`.`status_rekam` AS `status_rekam`,`tweb_penduduk`.`waktu_lahir` AS `waktu_lahir`,`tweb_penduduk`.`tempat_dilahirkan` AS `tempat_dilahirkan`,`tweb_penduduk`.`jenis_kelahiran` AS `jenis_kelahiran`,`tweb_penduduk`.`kelahiran_anak_ke` AS `kelahiran_anak_ke`,`tweb_penduduk`.`penolong_kelahiran` AS `penolong_kelahiran`,`tweb_penduduk`.`berat_lahir` AS `berat_lahir`,`tweb_penduduk`.`panjang_lahir` AS `panjang_lahir`,`tweb_penduduk`.`tag_id_card` AS `tag_id_card`,`tweb_penduduk`.`created_at` AS `created_at`,`tweb_penduduk`.`created_by` AS `created_by`,`tweb_penduduk`.`updated_at` AS `updated_at`,`tweb_penduduk`.`updated_by` AS `updated_by`,`tweb_penduduk`.`id_asuransi` AS `id_asuransi`,`tweb_penduduk`.`no_asuransi` AS `no_asuransi`,`tweb_penduduk`.`email` AS `email`,`tweb_penduduk`.`bahasa_id` AS `bahasa_id`,`tweb_penduduk`.`ket` AS `ket`,`tweb_penduduk`.`negara_asal` AS `negara_asal`,`tweb_penduduk`.`tempat_cetak_ktp` AS `tempat_cetak_ktp`,`tweb_penduduk`.`tanggal_cetak_ktp` AS `tanggal_cetak_ktp`,`tweb_penduduk`.`suku` AS `suku`,`tweb_penduduk`.`bpjs_ketenagakerjaan` AS `bpjs_ketenagakerjaan` from `tweb_penduduk` where (`tweb_penduduk`.`status_dasar` = 1) ;

-- --------------------------------------------------------

--
-- Structure for view `rekap_mutasi_inventaris`
--
DROP TABLE IF EXISTS `rekap_mutasi_inventaris`;

CREATE ALGORITHM=UNDEFINED DEFINER=`ikanpari`@`%` SQL SECURITY DEFINER VIEW `rekap_mutasi_inventaris`  AS  select 'inventaris_asset' AS `asset`,`mutasi_inventaris_asset`.`id_inventaris_asset` AS `id_inventaris_asset`,`mutasi_inventaris_asset`.`status_mutasi` AS `status_mutasi`,`mutasi_inventaris_asset`.`jenis_mutasi` AS `jenis_mutasi`,`mutasi_inventaris_asset`.`tahun_mutasi` AS `tahun_mutasi`,`mutasi_inventaris_asset`.`keterangan` AS `keterangan` from `mutasi_inventaris_asset` where (`mutasi_inventaris_asset`.`visible` = 1) union all select 'inventaris_gedung' AS `inventaris_gedung`,`mutasi_inventaris_gedung`.`id_inventaris_gedung` AS `id_inventaris_gedung`,`mutasi_inventaris_gedung`.`status_mutasi` AS `status_mutasi`,`mutasi_inventaris_gedung`.`jenis_mutasi` AS `jenis_mutasi`,`mutasi_inventaris_gedung`.`tahun_mutasi` AS `tahun_mutasi`,`mutasi_inventaris_gedung`.`keterangan` AS `keterangan` from `mutasi_inventaris_gedung` where (`mutasi_inventaris_gedung`.`visible` = 1) union all select 'inventaris_jalan' AS `inventaris_jalan`,`mutasi_inventaris_jalan`.`id_inventaris_jalan` AS `id_inventaris_jalan`,`mutasi_inventaris_jalan`.`status_mutasi` AS `status_mutasi`,`mutasi_inventaris_jalan`.`jenis_mutasi` AS `jenis_mutasi`,`mutasi_inventaris_jalan`.`tahun_mutasi` AS `tahun_mutasi`,`mutasi_inventaris_jalan`.`keterangan` AS `keterangan` from `mutasi_inventaris_jalan` where (`mutasi_inventaris_jalan`.`visible` = 1) union all select 'inventaris_peralatan' AS `inventaris_peralatan`,`mutasi_inventaris_peralatan`.`id_inventaris_peralatan` AS `id_inventaris_peralatan`,`mutasi_inventaris_peralatan`.`status_mutasi` AS `status_mutasi`,`mutasi_inventaris_peralatan`.`jenis_mutasi` AS `jenis_mutasi`,`mutasi_inventaris_peralatan`.`tahun_mutasi` AS `tahun_mutasi`,`mutasi_inventaris_peralatan`.`keterangan` AS `keterangan` from `mutasi_inventaris_peralatan` where (`mutasi_inventaris_peralatan`.`visible` = 1) ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `agenda`
--
ALTER TABLE `agenda`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_artikel_fk` (`id_artikel`);

--
-- Indexes for table `analisis_indikator`
--
ALTER TABLE `analisis_indikator`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_master` (`id_master`,`id_tipe`),
  ADD KEY `id_tipe` (`id_tipe`),
  ADD KEY `id_kategori` (`id_kategori`);

--
-- Indexes for table `analisis_kategori_indikator`
--
ALTER TABLE `analisis_kategori_indikator`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_master` (`id_master`);

--
-- Indexes for table `analisis_klasifikasi`
--
ALTER TABLE `analisis_klasifikasi`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_master` (`id_master`);

--
-- Indexes for table `analisis_master`
--
ALTER TABLE `analisis_master`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `analisis_parameter`
--
ALTER TABLE `analisis_parameter`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_indikator` (`id_indikator`);

--
-- Indexes for table `analisis_partisipasi`
--
ALTER TABLE `analisis_partisipasi`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_subjek` (`id_subjek`,`id_master`,`id_periode`,`id_klassifikasi`),
  ADD KEY `id_master` (`id_master`),
  ADD KEY `id_periode` (`id_periode`),
  ADD KEY `id_klassifikasi` (`id_klassifikasi`);

--
-- Indexes for table `analisis_periode`
--
ALTER TABLE `analisis_periode`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_master` (`id_master`),
  ADD KEY `id_state` (`id_state`);

--
-- Indexes for table `analisis_ref_state`
--
ALTER TABLE `analisis_ref_state`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `analisis_ref_subjek`
--
ALTER TABLE `analisis_ref_subjek`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `analisis_respon`
--
ALTER TABLE `analisis_respon`
  ADD KEY `id_parameter` (`id_parameter`,`id_subjek`),
  ADD KEY `id_periode` (`id_periode`),
  ADD KEY `id_indikator` (`id_indikator`);

--
-- Indexes for table `analisis_respon_hasil`
--
ALTER TABLE `analisis_respon_hasil`
  ADD UNIQUE KEY `id_master` (`id_master`,`id_periode`,`id_subjek`);

--
-- Indexes for table `analisis_tipe_indikator`
--
ALTER TABLE `analisis_tipe_indikator`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `anggota_grup_kontak`
--
ALTER TABLE `anggota_grup_kontak`
  ADD PRIMARY KEY (`id_grup_kontak`),
  ADD KEY `anggota_grup_kontak_ke_kontak` (`id_kontak`),
  ADD KEY `anggota_grup_kontak_ke_kontak_grup` (`id_grup`);

--
-- Indexes for table `anjungan`
--
ALTER TABLE `anjungan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `area`
--
ALTER TABLE `area`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `artikel`
--
ALTER TABLE `artikel`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `captcha_codes`
--
ALTER TABLE `captcha_codes`
  ADD PRIMARY KEY (`id`,`namespace`),
  ADD KEY `created` (`created`);

--
-- Indexes for table `cdesa`
--
ALTER TABLE `cdesa`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nomor` (`nomor`);

--
-- Indexes for table `cdesa_penduduk`
--
ALTER TABLE `cdesa_penduduk`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_cdesa` (`id_cdesa`);

--
-- Indexes for table `config`
--
ALTER TABLE `config`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `covid19_pantau`
--
ALTER TABLE `covid19_pantau`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_pantau_pemudik` (`id_pemudik`);

--
-- Indexes for table `covid19_pemudik`
--
ALTER TABLE `covid19_pemudik`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_pemudik_penduduk` (`id_terdata`);

--
-- Indexes for table `disposisi_surat_masuk`
--
ALTER TABLE `disposisi_surat_masuk`
  ADD PRIMARY KEY (`id_disposisi`),
  ADD KEY `id_surat_fk` (`id_surat_masuk`),
  ADD KEY `desa_pamong_fk` (`id_desa_pamong`);

--
-- Indexes for table `dokumen`
--
ALTER TABLE `dokumen`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gambar_gallery`
--
ALTER TABLE `gambar_gallery`
  ADD PRIMARY KEY (`id`),
  ADD KEY `parrent` (`parrent`);

--
-- Indexes for table `garis`
--
ALTER TABLE `garis`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gis_simbol`
--
ALTER TABLE `gis_simbol`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `simbol` (`simbol`),
  ADD UNIQUE KEY `simbol_2` (`simbol`),
  ADD UNIQUE KEY `simbol_3` (`simbol`),
  ADD UNIQUE KEY `simbol_4` (`simbol`),
  ADD UNIQUE KEY `simbol_5` (`simbol`),
  ADD UNIQUE KEY `simbol_6` (`simbol`);

--
-- Indexes for table `grup_akses`
--
ALTER TABLE `grup_akses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_grup` (`id_grup`),
  ADD KEY `id_modul` (`id_modul`);

--
-- Indexes for table `inbox`
--
ALTER TABLE `inbox`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `inventaris_asset`
--
ALTER TABLE `inventaris_asset`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `inventaris_gedung`
--
ALTER TABLE `inventaris_gedung`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `inventaris_jalan`
--
ALTER TABLE `inventaris_jalan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `inventaris_kontruksi`
--
ALTER TABLE `inventaris_kontruksi`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `inventaris_peralatan`
--
ALTER TABLE `inventaris_peralatan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `inventaris_tanah`
--
ALTER TABLE `inventaris_tanah`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kader_pemberdayaan_masyarakat`
--
ALTER TABLE `kader_pemberdayaan_masyarakat`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kelompok`
--
ALTER TABLE `kelompok`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `kode` (`kode`),
  ADD UNIQUE KEY `slug` (`slug`),
  ADD KEY `id_ketua` (`id_ketua`),
  ADD KEY `id_master` (`id_master`);

--
-- Indexes for table `kelompok_anggota`
--
ALTER TABLE `kelompok_anggota`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_kelompok` (`id_kelompok`,`id_penduduk`);

--
-- Indexes for table `kelompok_master`
--
ALTER TABLE `kelompok_master`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `keuangan_manual_ref_bidang`
--
ALTER TABLE `keuangan_manual_ref_bidang`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `keuangan_manual_ref_kegiatan`
--
ALTER TABLE `keuangan_manual_ref_kegiatan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `keuangan_manual_ref_rek1`
--
ALTER TABLE `keuangan_manual_ref_rek1`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `keuangan_manual_ref_rek2`
--
ALTER TABLE `keuangan_manual_ref_rek2`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `keuangan_manual_ref_rek3`
--
ALTER TABLE `keuangan_manual_ref_rek3`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `keuangan_manual_rinci`
--
ALTER TABLE `keuangan_manual_rinci`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `keuangan_manual_rinci_tpl`
--
ALTER TABLE `keuangan_manual_rinci_tpl`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `keuangan_master`
--
ALTER TABLE `keuangan_master`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `keuangan_ref_bank_desa`
--
ALTER TABLE `keuangan_ref_bank_desa`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_keuangan_ref_bank_desa_master_fk` (`id_keuangan_master`);

--
-- Indexes for table `keuangan_ref_bel_operasional`
--
ALTER TABLE `keuangan_ref_bel_operasional`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_keuangan_ref_bel_operasional_master_fk` (`id_keuangan_master`);

--
-- Indexes for table `keuangan_ref_bidang`
--
ALTER TABLE `keuangan_ref_bidang`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_keuangan_ref_bidang_master_fk` (`id_keuangan_master`);

--
-- Indexes for table `keuangan_ref_bunga`
--
ALTER TABLE `keuangan_ref_bunga`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_keuangan_ref_bunga_master_fk` (`id_keuangan_master`);

--
-- Indexes for table `keuangan_ref_desa`
--
ALTER TABLE `keuangan_ref_desa`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_keuangan_ref_desa_master_fk` (`id_keuangan_master`);

--
-- Indexes for table `keuangan_ref_kecamatan`
--
ALTER TABLE `keuangan_ref_kecamatan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_keuangan_ref_kecamatan_master_fk` (`id_keuangan_master`);

--
-- Indexes for table `keuangan_ref_kegiatan`
--
ALTER TABLE `keuangan_ref_kegiatan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_keuangan_ref_kegiatan_master_fk` (`id_keuangan_master`);

--
-- Indexes for table `keuangan_ref_korolari`
--
ALTER TABLE `keuangan_ref_korolari`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_keuangan_ref_korolari_master_fk` (`id_keuangan_master`);

--
-- Indexes for table `keuangan_ref_neraca_close`
--
ALTER TABLE `keuangan_ref_neraca_close`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_keuangan_ref_neraca_close_master_fk` (`id_keuangan_master`);

--
-- Indexes for table `keuangan_ref_perangkat`
--
ALTER TABLE `keuangan_ref_perangkat`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_keuangan_ref_perangkat_master_fk` (`id_keuangan_master`);

--
-- Indexes for table `keuangan_ref_potongan`
--
ALTER TABLE `keuangan_ref_potongan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_keuangan_ref_potongan_master_fk` (`id_keuangan_master`);

--
-- Indexes for table `keuangan_ref_rek1`
--
ALTER TABLE `keuangan_ref_rek1`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_keuangan_ref_rek1_master_fk` (`id_keuangan_master`);

--
-- Indexes for table `keuangan_ref_rek2`
--
ALTER TABLE `keuangan_ref_rek2`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_keuangan_ref_rek2_master_fk` (`id_keuangan_master`);

--
-- Indexes for table `keuangan_ref_rek3`
--
ALTER TABLE `keuangan_ref_rek3`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_keuangan_ref_rek3_master_fk` (`id_keuangan_master`);

--
-- Indexes for table `keuangan_ref_rek4`
--
ALTER TABLE `keuangan_ref_rek4`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_keuangan_ref_rek4_master_fk` (`id_keuangan_master`);

--
-- Indexes for table `keuangan_ref_sbu`
--
ALTER TABLE `keuangan_ref_sbu`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_keuangan_ref_sbu_master_fk` (`id_keuangan_master`);

--
-- Indexes for table `keuangan_ref_sumber`
--
ALTER TABLE `keuangan_ref_sumber`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_keuangan_ref_sumber_master_fk` (`id_keuangan_master`);

--
-- Indexes for table `keuangan_ta_anggaran`
--
ALTER TABLE `keuangan_ta_anggaran`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_keuangan_ta_anggaran_master_fk` (`id_keuangan_master`);

--
-- Indexes for table `keuangan_ta_anggaran_log`
--
ALTER TABLE `keuangan_ta_anggaran_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_keuangan_ta_anggaran_log_master_fk` (`id_keuangan_master`);

--
-- Indexes for table `keuangan_ta_anggaran_rinci`
--
ALTER TABLE `keuangan_ta_anggaran_rinci`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_keuangan_ta_anggaran_rinci_master_fk` (`id_keuangan_master`);

--
-- Indexes for table `keuangan_ta_bidang`
--
ALTER TABLE `keuangan_ta_bidang`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_keuangan_ta_bidang_master_fk` (`id_keuangan_master`);

--
-- Indexes for table `keuangan_ta_desa`
--
ALTER TABLE `keuangan_ta_desa`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_keuangan_ta_desa_master_fk` (`id_keuangan_master`);

--
-- Indexes for table `keuangan_ta_jurnal_umum`
--
ALTER TABLE `keuangan_ta_jurnal_umum`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_keuangan_ta_jurnal_umum_master_fk` (`id_keuangan_master`);

--
-- Indexes for table `keuangan_ta_jurnal_umum_rinci`
--
ALTER TABLE `keuangan_ta_jurnal_umum_rinci`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_keuangan_ta_jurnal_umum_rinci_master_fk` (`id_keuangan_master`);

--
-- Indexes for table `keuangan_ta_kegiatan`
--
ALTER TABLE `keuangan_ta_kegiatan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_keuangan_ta_kegiatan_master_fk` (`id_keuangan_master`);

--
-- Indexes for table `keuangan_ta_mutasi`
--
ALTER TABLE `keuangan_ta_mutasi`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_keuangan_ta_mutasi_master_fk` (`id_keuangan_master`);

--
-- Indexes for table `keuangan_ta_pajak`
--
ALTER TABLE `keuangan_ta_pajak`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_keuangan_ta_pajak_master_fk` (`id_keuangan_master`);

--
-- Indexes for table `keuangan_ta_pajak_rinci`
--
ALTER TABLE `keuangan_ta_pajak_rinci`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_keuangan_ta_pajak_rinci_master_fk` (`id_keuangan_master`);

--
-- Indexes for table `keuangan_ta_pemda`
--
ALTER TABLE `keuangan_ta_pemda`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_keuangan_ta_pemda_master_fk` (`id_keuangan_master`);

--
-- Indexes for table `keuangan_ta_pencairan`
--
ALTER TABLE `keuangan_ta_pencairan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_keuangan_ta_pencairan_master_fk` (`id_keuangan_master`);

--
-- Indexes for table `keuangan_ta_perangkat`
--
ALTER TABLE `keuangan_ta_perangkat`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_keuangan_ta_perangkat_master_fk` (`id_keuangan_master`);

--
-- Indexes for table `keuangan_ta_rab`
--
ALTER TABLE `keuangan_ta_rab`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_keuangan_ta_rab_master_fk` (`id_keuangan_master`);

--
-- Indexes for table `keuangan_ta_rab_rinci`
--
ALTER TABLE `keuangan_ta_rab_rinci`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_keuangan_ta_rab_rinci_master_fk` (`id_keuangan_master`);

--
-- Indexes for table `keuangan_ta_rab_sub`
--
ALTER TABLE `keuangan_ta_rab_sub`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_keuangan_ta_rab_sub_master_fk` (`id_keuangan_master`);

--
-- Indexes for table `keuangan_ta_rpjm_bidang`
--
ALTER TABLE `keuangan_ta_rpjm_bidang`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_keuangan_ta_rpjm_bidang_master_fk` (`id_keuangan_master`);

--
-- Indexes for table `keuangan_ta_rpjm_kegiatan`
--
ALTER TABLE `keuangan_ta_rpjm_kegiatan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_keuangan_ta_rpjm_kegiatan_master_fk` (`id_keuangan_master`);

--
-- Indexes for table `keuangan_ta_rpjm_misi`
--
ALTER TABLE `keuangan_ta_rpjm_misi`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_keuangan_ta_rpjm_misi_master_fk` (`id_keuangan_master`);

--
-- Indexes for table `keuangan_ta_rpjm_pagu_indikatif`
--
ALTER TABLE `keuangan_ta_rpjm_pagu_indikatif`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_keuangan_ta_rpjm_pagu_indikatif_master_fk` (`id_keuangan_master`);

--
-- Indexes for table `keuangan_ta_rpjm_pagu_tahunan`
--
ALTER TABLE `keuangan_ta_rpjm_pagu_tahunan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_keuangan_ta_rpjm_pagu_tahunan_master_fk` (`id_keuangan_master`);

--
-- Indexes for table `keuangan_ta_rpjm_sasaran`
--
ALTER TABLE `keuangan_ta_rpjm_sasaran`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_keuangan_ta_rpjm_sasaran_master_fk` (`id_keuangan_master`);

--
-- Indexes for table `keuangan_ta_rpjm_tujuan`
--
ALTER TABLE `keuangan_ta_rpjm_tujuan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_keuangan_ta_rpjm_tujuan_master_fk` (`id_keuangan_master`);

--
-- Indexes for table `keuangan_ta_rpjm_visi`
--
ALTER TABLE `keuangan_ta_rpjm_visi`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_keuangan_ta_rpjm_visi_master_fk` (`id_keuangan_master`);

--
-- Indexes for table `keuangan_ta_saldo_awal`
--
ALTER TABLE `keuangan_ta_saldo_awal`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_keuangan_ta_saldo_awal_master_fk` (`id_keuangan_master`);

--
-- Indexes for table `keuangan_ta_spj`
--
ALTER TABLE `keuangan_ta_spj`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_keuangan_ta_spj_master_fk` (`id_keuangan_master`);

--
-- Indexes for table `keuangan_ta_spjpot`
--
ALTER TABLE `keuangan_ta_spjpot`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_keuangan_ta_spjpot_master_fk` (`id_keuangan_master`);

--
-- Indexes for table `keuangan_ta_spj_bukti`
--
ALTER TABLE `keuangan_ta_spj_bukti`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_keuangan_ta_spj_bukti_master_fk` (`id_keuangan_master`);

--
-- Indexes for table `keuangan_ta_spj_rinci`
--
ALTER TABLE `keuangan_ta_spj_rinci`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_keuangan_ta_spj_rinci_master_fk` (`id_keuangan_master`);

--
-- Indexes for table `keuangan_ta_spj_sisa`
--
ALTER TABLE `keuangan_ta_spj_sisa`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_keuangan_ta_spj_sisa_master_fk` (`id_keuangan_master`);

--
-- Indexes for table `keuangan_ta_spp`
--
ALTER TABLE `keuangan_ta_spp`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_keuangan_ta_spp_master_fk` (`id_keuangan_master`);

--
-- Indexes for table `keuangan_ta_sppbukti`
--
ALTER TABLE `keuangan_ta_sppbukti`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_keuangan_ta_sppbukti_master_fk` (`id_keuangan_master`);

--
-- Indexes for table `keuangan_ta_spppot`
--
ALTER TABLE `keuangan_ta_spppot`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_keuangan_ta_spppot_master_fk` (`id_keuangan_master`);

--
-- Indexes for table `keuangan_ta_spp_rinci`
--
ALTER TABLE `keuangan_ta_spp_rinci`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_keuangan_ta_spp_rinci_master_fk` (`id_keuangan_master`);

--
-- Indexes for table `keuangan_ta_sts`
--
ALTER TABLE `keuangan_ta_sts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_keuangan_ta_sts_master_fk` (`id_keuangan_master`);

--
-- Indexes for table `keuangan_ta_sts_rinci`
--
ALTER TABLE `keuangan_ta_sts_rinci`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_keuangan_ta_sts_rinci_master_fk` (`id_keuangan_master`);

--
-- Indexes for table `keuangan_ta_tbp`
--
ALTER TABLE `keuangan_ta_tbp`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_keuangan_ta_tbp_master_fk` (`id_keuangan_master`);

--
-- Indexes for table `keuangan_ta_tbp_rinci`
--
ALTER TABLE `keuangan_ta_tbp_rinci`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_keuangan_ta_tbp_rinci_master_fk` (`id_keuangan_master`);

--
-- Indexes for table `keuangan_ta_triwulan`
--
ALTER TABLE `keuangan_ta_triwulan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_keuangan_ta_triwulan_master_fk` (`id_keuangan_master`);

--
-- Indexes for table `keuangan_ta_triwulan_rinci`
--
ALTER TABLE `keuangan_ta_triwulan_rinci`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_keuangan_ta_triwulan_rinci_master_fk` (`id_keuangan_master`);

--
-- Indexes for table `klasifikasi_analisis_keluarga`
--
ALTER TABLE `klasifikasi_analisis_keluarga`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `klasifikasi_surat`
--
ALTER TABLE `klasifikasi_surat`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `komentar`
--
ALTER TABLE `komentar`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kontak`
--
ALTER TABLE `kontak`
  ADD PRIMARY KEY (`id_kontak`),
  ADD KEY `kontak_ke_tweb_penduduk` (`id_pend`);

--
-- Indexes for table `kontak_grup`
--
ALTER TABLE `kontak_grup`
  ADD PRIMARY KEY (`id_grup`);

--
-- Indexes for table `laporan_sinkronisasi`
--
ALTER TABLE `laporan_sinkronisasi`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `line`
--
ALTER TABLE `line`
  ADD PRIMARY KEY (`id`),
  ADD KEY `parrent` (`parrent`);

--
-- Indexes for table `log_ekspor`
--
ALTER TABLE `log_ekspor`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `log_hapus_penduduk`
--
ALTER TABLE `log_hapus_penduduk`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `log_keluarga`
--
ALTER TABLE `log_keluarga`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_kk` (`id_kk`,`id_peristiwa`,`tgl_peristiwa`,`id_pend`),
  ADD KEY `log_penduduk_fk` (`id_log_penduduk`);

--
-- Indexes for table `log_penduduk`
--
ALTER TABLE `log_penduduk`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_pend` (`id_pend`,`kode_peristiwa`,`tgl_peristiwa`),
  ADD KEY `id_ref_pindah` (`ref_pindah`);

--
-- Indexes for table `log_perubahan_penduduk`
--
ALTER TABLE `log_perubahan_penduduk`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `log_surat`
--
ALTER TABLE `log_surat`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `lokasi`
--
ALTER TABLE `lokasi`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ref_point` (`ref_point`);

--
-- Indexes for table `media_sosial`
--
ALTER TABLE `media_sosial`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrasi`
--
ALTER TABLE `migrasi`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mutasi_cdesa`
--
ALTER TABLE `mutasi_cdesa`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cdesa_mutasi_fk` (`id_cdesa_masuk`);

--
-- Indexes for table `mutasi_inventaris_asset`
--
ALTER TABLE `mutasi_inventaris_asset`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_mutasi_inventaris_asset` (`id_inventaris_asset`);

--
-- Indexes for table `mutasi_inventaris_gedung`
--
ALTER TABLE `mutasi_inventaris_gedung`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_mutasi_inventaris_gedung` (`id_inventaris_gedung`);

--
-- Indexes for table `mutasi_inventaris_jalan`
--
ALTER TABLE `mutasi_inventaris_jalan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_mutasi_inventaris_jalan` (`id_inventaris_jalan`);

--
-- Indexes for table `mutasi_inventaris_peralatan`
--
ALTER TABLE `mutasi_inventaris_peralatan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_mutasi_inventaris_peralatan` (`id_inventaris_peralatan`);

--
-- Indexes for table `mutasi_inventaris_tanah`
--
ALTER TABLE `mutasi_inventaris_tanah`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_mutasi_inventaris_tanah` (`id_inventaris_tanah`);

--
-- Indexes for table `notifikasi`
--
ALTER TABLE `notifikasi`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `kode` (`kode`);

--
-- Indexes for table `outbox`
--
ALTER TABLE `outbox`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `outbox_date` (`SendingDateTime`,`SendingTimeOut`),
  ADD KEY `outbox_sender` (`SenderID`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `pelapak`
--
ALTER TABLE `pelapak`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pembangunan`
--
ALTER TABLE `pembangunan`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`),
  ADD KEY `id_lokasi` (`id_lokasi`);

--
-- Indexes for table `pembangunan_ref_dokumentasi`
--
ALTER TABLE `pembangunan_ref_dokumentasi`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_pembangunan` (`id_pembangunan`);

--
-- Indexes for table `pendapat`
--
ALTER TABLE `pendapat`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `permohonan_surat`
--
ALTER TABLE `permohonan_surat`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `persil`
--
ALTER TABLE `persil`
  ADD PRIMARY KEY (`id`),
  ADD KEY `nomor_nomor_urut_bidang` (`nomor`,`nomor_urut_bidang`);

--
-- Indexes for table `point`
--
ALTER TABLE `point`
  ADD PRIMARY KEY (`id`),
  ADD KEY `parrent` (`parrent`);

--
-- Indexes for table `polygon`
--
ALTER TABLE `polygon`
  ADD PRIMARY KEY (`id`),
  ADD KEY `parrent` (`parrent`);

--
-- Indexes for table `produk`
--
ALTER TABLE `produk`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `produk_kategori`
--
ALTER TABLE `produk_kategori`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `program`
--
ALTER TABLE `program`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `program_peserta`
--
ALTER TABLE `program_peserta`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ref_asal_tanah_kas`
--
ALTER TABLE `ref_asal_tanah_kas`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ref_dokumen`
--
ALTER TABLE `ref_dokumen`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ref_penduduk_bahasa`
--
ALTER TABLE `ref_penduduk_bahasa`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ref_penduduk_bidang`
--
ALTER TABLE `ref_penduduk_bidang`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ref_penduduk_kursus`
--
ALTER TABLE `ref_penduduk_kursus`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ref_penduduk_suku`
--
ALTER TABLE `ref_penduduk_suku`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ref_peristiwa`
--
ALTER TABLE `ref_peristiwa`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ref_persil_kelas`
--
ALTER TABLE `ref_persil_kelas`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ref_persil_mutasi`
--
ALTER TABLE `ref_persil_mutasi`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ref_peruntukan_tanah_kas`
--
ALTER TABLE `ref_peruntukan_tanah_kas`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ref_pindah`
--
ALTER TABLE `ref_pindah`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ref_sinkronisasi`
--
ALTER TABLE `ref_sinkronisasi`
  ADD PRIMARY KEY (`tabel`);

--
-- Indexes for table `ref_status_covid`
--
ALTER TABLE `ref_status_covid`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ref_syarat_surat`
--
ALTER TABLE `ref_syarat_surat`
  ADD PRIMARY KEY (`ref_syarat_id`);

--
-- Indexes for table `sentitems`
--
ALTER TABLE `sentitems`
  ADD PRIMARY KEY (`ID`,`SequencePosition`),
  ADD KEY `sentitems_date` (`DeliveryDateTime`),
  ADD KEY `sentitems_tpmr` (`TPMR`),
  ADD KEY `sentitems_dest` (`DestinationNumber`),
  ADD KEY `sentitems_sender` (`SenderID`);

--
-- Indexes for table `setting_aplikasi`
--
ALTER TABLE `setting_aplikasi`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `key` (`key`);

--
-- Indexes for table `setting_aplikasi_options`
--
ALTER TABLE `setting_aplikasi_options`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_setting_fk` (`id_setting`);

--
-- Indexes for table `setting_modul`
--
ALTER TABLE `setting_modul`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `statistics`
--
ALTER TABLE `statistics`
  ADD PRIMARY KEY (`id`),
  ADD KEY `url_id` (`url_id`);

--
-- Indexes for table `suplemen`
--
ALTER TABLE `suplemen`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`);

--
-- Indexes for table `suplemen_terdata`
--
ALTER TABLE `suplemen_terdata`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_suplemen` (`id_suplemen`);

--
-- Indexes for table `surat_keluar`
--
ALTER TABLE `surat_keluar`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `surat_masuk`
--
ALTER TABLE `surat_masuk`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `syarat_surat`
--
ALTER TABLE `syarat_surat`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_surat_format` (`surat_format_id`);

--
-- Indexes for table `sys_traffic`
--
ALTER TABLE `sys_traffic`
  ADD PRIMARY KEY (`Tanggal`);

--
-- Indexes for table `tanah_desa`
--
ALTER TABLE `tanah_desa`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_penduduk` (`id_penduduk`);

--
-- Indexes for table `tanah_kas_desa`
--
ALTER TABLE `tanah_kas_desa`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `teks_berjalan`
--
ALTER TABLE `teks_berjalan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tweb_aset`
--
ALTER TABLE `tweb_aset`
  ADD PRIMARY KEY (`id_aset`);

--
-- Indexes for table `tweb_cacat`
--
ALTER TABLE `tweb_cacat`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tweb_cara_kb`
--
ALTER TABLE `tweb_cara_kb`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tweb_desa_pamong`
--
ALTER TABLE `tweb_desa_pamong`
  ADD PRIMARY KEY (`pamong_id`);

--
-- Indexes for table `tweb_golongan_darah`
--
ALTER TABLE `tweb_golongan_darah`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tweb_keluarga`
--
ALTER TABLE `tweb_keluarga`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `no_kk` (`no_kk`),
  ADD KEY `nik_kepala` (`nik_kepala`);

--
-- Indexes for table `tweb_keluarga_sejahtera`
--
ALTER TABLE `tweb_keluarga_sejahtera`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tweb_penduduk`
--
ALTER TABLE `tweb_penduduk`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `tag_id_card` (`tag_id_card`),
  ADD UNIQUE KEY `nik` (`nik`),
  ADD KEY `id_rtm` (`id_rtm`);

--
-- Indexes for table `tweb_penduduk_agama`
--
ALTER TABLE `tweb_penduduk_agama`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tweb_penduduk_asuransi`
--
ALTER TABLE `tweb_penduduk_asuransi`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tweb_penduduk_hubungan`
--
ALTER TABLE `tweb_penduduk_hubungan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tweb_penduduk_kawin`
--
ALTER TABLE `tweb_penduduk_kawin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tweb_penduduk_mandiri`
--
ALTER TABLE `tweb_penduduk_mandiri`
  ADD PRIMARY KEY (`id_pend`);

--
-- Indexes for table `tweb_penduduk_pekerjaan`
--
ALTER TABLE `tweb_penduduk_pekerjaan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tweb_penduduk_pendidikan`
--
ALTER TABLE `tweb_penduduk_pendidikan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tweb_penduduk_pendidikan_kk`
--
ALTER TABLE `tweb_penduduk_pendidikan_kk`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tweb_penduduk_sex`
--
ALTER TABLE `tweb_penduduk_sex`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tweb_penduduk_status`
--
ALTER TABLE `tweb_penduduk_status`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tweb_penduduk_umur`
--
ALTER TABLE `tweb_penduduk_umur`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tweb_penduduk_warganegara`
--
ALTER TABLE `tweb_penduduk_warganegara`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tweb_rtm`
--
ALTER TABLE `tweb_rtm`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `no_kk` (`no_kk`),
  ADD UNIQUE KEY `no_kk_2` (`no_kk`);

--
-- Indexes for table `tweb_rtm_hubungan`
--
ALTER TABLE `tweb_rtm_hubungan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tweb_sakit_menahun`
--
ALTER TABLE `tweb_sakit_menahun`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tweb_status_dasar`
--
ALTER TABLE `tweb_status_dasar`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tweb_status_ktp`
--
ALTER TABLE `tweb_status_ktp`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tweb_surat_atribut`
--
ALTER TABLE `tweb_surat_atribut`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tweb_surat_format`
--
ALTER TABLE `tweb_surat_format`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `url_surat` (`url_surat`);

--
-- Indexes for table `tweb_wil_clusterdesa`
--
ALTER TABLE `tweb_wil_clusterdesa`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `rt` (`rt`,`rw`,`dusun`),
  ADD KEY `id_kepala` (`id_kepala`);

--
-- Indexes for table `urls`
--
ALTER TABLE `urls`
  ADD PRIMARY KEY (`id`),
  ADD KEY `alias` (`alias`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_grup`
--
ALTER TABLE `user_grup`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `widget`
--
ALTER TABLE `widget`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `agenda`
--
ALTER TABLE `agenda`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `analisis_indikator`
--
ALTER TABLE `analisis_indikator`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=111;
--
-- AUTO_INCREMENT for table `analisis_kategori_indikator`
--
ALTER TABLE `analisis_kategori_indikator`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
--
-- AUTO_INCREMENT for table `analisis_klasifikasi`
--
ALTER TABLE `analisis_klasifikasi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `analisis_master`
--
ALTER TABLE `analisis_master`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `analisis_parameter`
--
ALTER TABLE `analisis_parameter`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1052;
--
-- AUTO_INCREMENT for table `analisis_partisipasi`
--
ALTER TABLE `analisis_partisipasi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `analisis_periode`
--
ALTER TABLE `analisis_periode`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `analisis_ref_state`
--
ALTER TABLE `analisis_ref_state`
  MODIFY `id` tinyint(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `analisis_ref_subjek`
--
ALTER TABLE `analisis_ref_subjek`
  MODIFY `id` tinyint(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `analisis_tipe_indikator`
--
ALTER TABLE `analisis_tipe_indikator`
  MODIFY `id` tinyint(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `anggota_grup_kontak`
--
ALTER TABLE `anggota_grup_kontak`
  MODIFY `id_grup_kontak` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `anjungan`
--
ALTER TABLE `anjungan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `area`
--
ALTER TABLE `area`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `artikel`
--
ALTER TABLE `artikel`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=109;
--
-- AUTO_INCREMENT for table `cdesa`
--
ALTER TABLE `cdesa`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `cdesa_penduduk`
--
ALTER TABLE `cdesa_penduduk`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `config`
--
ALTER TABLE `config`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `covid19_pantau`
--
ALTER TABLE `covid19_pantau`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `covid19_pemudik`
--
ALTER TABLE `covid19_pemudik`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `disposisi_surat_masuk`
--
ALTER TABLE `disposisi_surat_masuk`
  MODIFY `id_disposisi` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `dokumen`
--
ALTER TABLE `dokumen`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;
--
-- AUTO_INCREMENT for table `gambar_gallery`
--
ALTER TABLE `gambar_gallery`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;
--
-- AUTO_INCREMENT for table `garis`
--
ALTER TABLE `garis`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `gis_simbol`
--
ALTER TABLE `gis_simbol`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=639;
--
-- AUTO_INCREMENT for table `grup_akses`
--
ALTER TABLE `grup_akses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1204;
--
-- AUTO_INCREMENT for table `inbox`
--
ALTER TABLE `inbox`
  MODIFY `ID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `inventaris_asset`
--
ALTER TABLE `inventaris_asset`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `inventaris_gedung`
--
ALTER TABLE `inventaris_gedung`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `inventaris_jalan`
--
ALTER TABLE `inventaris_jalan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `inventaris_kontruksi`
--
ALTER TABLE `inventaris_kontruksi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `inventaris_peralatan`
--
ALTER TABLE `inventaris_peralatan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `inventaris_tanah`
--
ALTER TABLE `inventaris_tanah`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `kader_pemberdayaan_masyarakat`
--
ALTER TABLE `kader_pemberdayaan_masyarakat`
  MODIFY `id` int(12) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `kategori`
--
ALTER TABLE `kategori`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;
--
-- AUTO_INCREMENT for table `kelompok`
--
ALTER TABLE `kelompok`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `kelompok_anggota`
--
ALTER TABLE `kelompok_anggota`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `kelompok_master`
--
ALTER TABLE `kelompok_master`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `keuangan_manual_ref_bidang`
--
ALTER TABLE `keuangan_manual_ref_bidang`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `keuangan_manual_ref_kegiatan`
--
ALTER TABLE `keuangan_manual_ref_kegiatan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=240;
--
-- AUTO_INCREMENT for table `keuangan_manual_ref_rek1`
--
ALTER TABLE `keuangan_manual_ref_rek1`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `keuangan_manual_ref_rek2`
--
ALTER TABLE `keuangan_manual_ref_rek2`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
--
-- AUTO_INCREMENT for table `keuangan_manual_ref_rek3`
--
ALTER TABLE `keuangan_manual_ref_rek3`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=74;
--
-- AUTO_INCREMENT for table `keuangan_manual_rinci`
--
ALTER TABLE `keuangan_manual_rinci`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;
--
-- AUTO_INCREMENT for table `keuangan_manual_rinci_tpl`
--
ALTER TABLE `keuangan_manual_rinci_tpl`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;
--
-- AUTO_INCREMENT for table `keuangan_master`
--
ALTER TABLE `keuangan_master`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `keuangan_ref_bank_desa`
--
ALTER TABLE `keuangan_ref_bank_desa`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `keuangan_ref_bel_operasional`
--
ALTER TABLE `keuangan_ref_bel_operasional`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `keuangan_ref_bidang`
--
ALTER TABLE `keuangan_ref_bidang`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `keuangan_ref_bunga`
--
ALTER TABLE `keuangan_ref_bunga`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `keuangan_ref_desa`
--
ALTER TABLE `keuangan_ref_desa`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `keuangan_ref_kecamatan`
--
ALTER TABLE `keuangan_ref_kecamatan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `keuangan_ref_kegiatan`
--
ALTER TABLE `keuangan_ref_kegiatan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `keuangan_ref_korolari`
--
ALTER TABLE `keuangan_ref_korolari`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `keuangan_ref_neraca_close`
--
ALTER TABLE `keuangan_ref_neraca_close`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `keuangan_ref_perangkat`
--
ALTER TABLE `keuangan_ref_perangkat`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `keuangan_ref_potongan`
--
ALTER TABLE `keuangan_ref_potongan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `keuangan_ref_rek1`
--
ALTER TABLE `keuangan_ref_rek1`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `keuangan_ref_rek2`
--
ALTER TABLE `keuangan_ref_rek2`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `keuangan_ref_rek3`
--
ALTER TABLE `keuangan_ref_rek3`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `keuangan_ref_rek4`
--
ALTER TABLE `keuangan_ref_rek4`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `keuangan_ref_sbu`
--
ALTER TABLE `keuangan_ref_sbu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `keuangan_ref_sumber`
--
ALTER TABLE `keuangan_ref_sumber`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `keuangan_ta_anggaran`
--
ALTER TABLE `keuangan_ta_anggaran`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `keuangan_ta_anggaran_log`
--
ALTER TABLE `keuangan_ta_anggaran_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `keuangan_ta_anggaran_rinci`
--
ALTER TABLE `keuangan_ta_anggaran_rinci`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `keuangan_ta_bidang`
--
ALTER TABLE `keuangan_ta_bidang`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `keuangan_ta_desa`
--
ALTER TABLE `keuangan_ta_desa`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `keuangan_ta_jurnal_umum`
--
ALTER TABLE `keuangan_ta_jurnal_umum`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `keuangan_ta_jurnal_umum_rinci`
--
ALTER TABLE `keuangan_ta_jurnal_umum_rinci`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `keuangan_ta_kegiatan`
--
ALTER TABLE `keuangan_ta_kegiatan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `keuangan_ta_mutasi`
--
ALTER TABLE `keuangan_ta_mutasi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `keuangan_ta_pajak`
--
ALTER TABLE `keuangan_ta_pajak`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `keuangan_ta_pajak_rinci`
--
ALTER TABLE `keuangan_ta_pajak_rinci`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `keuangan_ta_pemda`
--
ALTER TABLE `keuangan_ta_pemda`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `keuangan_ta_pencairan`
--
ALTER TABLE `keuangan_ta_pencairan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `keuangan_ta_perangkat`
--
ALTER TABLE `keuangan_ta_perangkat`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `keuangan_ta_rab`
--
ALTER TABLE `keuangan_ta_rab`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `keuangan_ta_rab_rinci`
--
ALTER TABLE `keuangan_ta_rab_rinci`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `keuangan_ta_rab_sub`
--
ALTER TABLE `keuangan_ta_rab_sub`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `keuangan_ta_rpjm_bidang`
--
ALTER TABLE `keuangan_ta_rpjm_bidang`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `keuangan_ta_rpjm_kegiatan`
--
ALTER TABLE `keuangan_ta_rpjm_kegiatan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `keuangan_ta_rpjm_misi`
--
ALTER TABLE `keuangan_ta_rpjm_misi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `keuangan_ta_rpjm_pagu_indikatif`
--
ALTER TABLE `keuangan_ta_rpjm_pagu_indikatif`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `keuangan_ta_rpjm_pagu_tahunan`
--
ALTER TABLE `keuangan_ta_rpjm_pagu_tahunan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `keuangan_ta_rpjm_sasaran`
--
ALTER TABLE `keuangan_ta_rpjm_sasaran`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `keuangan_ta_rpjm_tujuan`
--
ALTER TABLE `keuangan_ta_rpjm_tujuan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `keuangan_ta_rpjm_visi`
--
ALTER TABLE `keuangan_ta_rpjm_visi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `keuangan_ta_saldo_awal`
--
ALTER TABLE `keuangan_ta_saldo_awal`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `keuangan_ta_spj`
--
ALTER TABLE `keuangan_ta_spj`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `keuangan_ta_spjpot`
--
ALTER TABLE `keuangan_ta_spjpot`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `keuangan_ta_spj_bukti`
--
ALTER TABLE `keuangan_ta_spj_bukti`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `keuangan_ta_spj_rinci`
--
ALTER TABLE `keuangan_ta_spj_rinci`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `keuangan_ta_spj_sisa`
--
ALTER TABLE `keuangan_ta_spj_sisa`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `keuangan_ta_spp`
--
ALTER TABLE `keuangan_ta_spp`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `keuangan_ta_sppbukti`
--
ALTER TABLE `keuangan_ta_sppbukti`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `keuangan_ta_spppot`
--
ALTER TABLE `keuangan_ta_spppot`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `keuangan_ta_spp_rinci`
--
ALTER TABLE `keuangan_ta_spp_rinci`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `keuangan_ta_sts`
--
ALTER TABLE `keuangan_ta_sts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `keuangan_ta_sts_rinci`
--
ALTER TABLE `keuangan_ta_sts_rinci`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `keuangan_ta_tbp`
--
ALTER TABLE `keuangan_ta_tbp`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `keuangan_ta_tbp_rinci`
--
ALTER TABLE `keuangan_ta_tbp_rinci`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `keuangan_ta_triwulan`
--
ALTER TABLE `keuangan_ta_triwulan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `keuangan_ta_triwulan_rinci`
--
ALTER TABLE `keuangan_ta_triwulan_rinci`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `klasifikasi_analisis_keluarga`
--
ALTER TABLE `klasifikasi_analisis_keluarga`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `klasifikasi_surat`
--
ALTER TABLE `klasifikasi_surat`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2335;
--
-- AUTO_INCREMENT for table `komentar`
--
ALTER TABLE `komentar`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `kontak`
--
ALTER TABLE `kontak`
  MODIFY `id_kontak` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `kontak_grup`
--
ALTER TABLE `kontak_grup`
  MODIFY `id_grup` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `laporan_sinkronisasi`
--
ALTER TABLE `laporan_sinkronisasi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `line`
--
ALTER TABLE `line`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `log_ekspor`
--
ALTER TABLE `log_ekspor`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `log_hapus_penduduk`
--
ALTER TABLE `log_hapus_penduduk`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `log_keluarga`
--
ALTER TABLE `log_keluarga`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `log_penduduk`
--
ALTER TABLE `log_penduduk`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9471;
--
-- AUTO_INCREMENT for table `log_perubahan_penduduk`
--
ALTER TABLE `log_perubahan_penduduk`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `log_surat`
--
ALTER TABLE `log_surat`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
--
-- AUTO_INCREMENT for table `lokasi`
--
ALTER TABLE `lokasi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `media_sosial`
--
ALTER TABLE `media_sosial`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `menu`
--
ALTER TABLE `menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=141;
--
-- AUTO_INCREMENT for table `migrasi`
--
ALTER TABLE `migrasi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;
--
-- AUTO_INCREMENT for table `mutasi_cdesa`
--
ALTER TABLE `mutasi_cdesa`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mutasi_inventaris_asset`
--
ALTER TABLE `mutasi_inventaris_asset`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mutasi_inventaris_gedung`
--
ALTER TABLE `mutasi_inventaris_gedung`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mutasi_inventaris_jalan`
--
ALTER TABLE `mutasi_inventaris_jalan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mutasi_inventaris_peralatan`
--
ALTER TABLE `mutasi_inventaris_peralatan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mutasi_inventaris_tanah`
--
ALTER TABLE `mutasi_inventaris_tanah`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `notifikasi`
--
ALTER TABLE `notifikasi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `outbox`
--
ALTER TABLE `outbox`
  MODIFY `ID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `pelapak`
--
ALTER TABLE `pelapak`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `pembangunan`
--
ALTER TABLE `pembangunan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `pembangunan_ref_dokumentasi`
--
ALTER TABLE `pembangunan_ref_dokumentasi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `pendapat`
--
ALTER TABLE `pendapat`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `permohonan_surat`
--
ALTER TABLE `permohonan_surat`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `persil`
--
ALTER TABLE `persil`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `point`
--
ALTER TABLE `point`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `polygon`
--
ALTER TABLE `polygon`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `produk`
--
ALTER TABLE `produk`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `produk_kategori`
--
ALTER TABLE `produk_kategori`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `program`
--
ALTER TABLE `program`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `program_peserta`
--
ALTER TABLE `program_peserta`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `ref_asal_tanah_kas`
--
ALTER TABLE `ref_asal_tanah_kas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `ref_dokumen`
--
ALTER TABLE `ref_dokumen`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `ref_penduduk_bahasa`
--
ALTER TABLE `ref_penduduk_bahasa`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `ref_penduduk_bidang`
--
ALTER TABLE `ref_penduduk_bidang`
  MODIFY `id` int(12) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;
--
-- AUTO_INCREMENT for table `ref_penduduk_kursus`
--
ALTER TABLE `ref_penduduk_kursus`
  MODIFY `id` int(12) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;
--
-- AUTO_INCREMENT for table `ref_penduduk_suku`
--
ALTER TABLE `ref_penduduk_suku`
  MODIFY `id` int(65) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=164;
--
-- AUTO_INCREMENT for table `ref_peristiwa`
--
ALTER TABLE `ref_peristiwa`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `ref_persil_kelas`
--
ALTER TABLE `ref_persil_kelas`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `ref_persil_mutasi`
--
ALTER TABLE `ref_persil_mutasi`
  MODIFY `id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `ref_peruntukan_tanah_kas`
--
ALTER TABLE `ref_peruntukan_tanah_kas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `ref_status_covid`
--
ALTER TABLE `ref_status_covid`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `ref_syarat_surat`
--
ALTER TABLE `ref_syarat_surat`
  MODIFY `ref_syarat_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `setting_aplikasi`
--
ALTER TABLE `setting_aplikasi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=206;
--
-- AUTO_INCREMENT for table `setting_aplikasi_options`
--
ALTER TABLE `setting_aplikasi_options`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
--
-- AUTO_INCREMENT for table `setting_modul`
--
ALTER TABLE `setting_modul`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=333;
--
-- AUTO_INCREMENT for table `statistics`
--
ALTER TABLE `statistics`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `suplemen`
--
ALTER TABLE `suplemen`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `suplemen_terdata`
--
ALTER TABLE `suplemen_terdata`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `surat_keluar`
--
ALTER TABLE `surat_keluar`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `surat_masuk`
--
ALTER TABLE `surat_masuk`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `syarat_surat`
--
ALTER TABLE `syarat_surat`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;
--
-- AUTO_INCREMENT for table `tanah_desa`
--
ALTER TABLE `tanah_desa`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tanah_kas_desa`
--
ALTER TABLE `tanah_kas_desa`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `teks_berjalan`
--
ALTER TABLE `teks_berjalan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `tweb_cacat`
--
ALTER TABLE `tweb_cacat`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `tweb_cara_kb`
--
ALTER TABLE `tweb_cara_kb`
  MODIFY `id` tinyint(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=100;
--
-- AUTO_INCREMENT for table `tweb_desa_pamong`
--
ALTER TABLE `tweb_desa_pamong`
  MODIFY `pamong_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;
--
-- AUTO_INCREMENT for table `tweb_golongan_darah`
--
ALTER TABLE `tweb_golongan_darah`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT for table `tweb_keluarga`
--
ALTER TABLE `tweb_keluarga`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3335;
--
-- AUTO_INCREMENT for table `tweb_penduduk`
--
ALTER TABLE `tweb_penduduk`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9441;
--
-- AUTO_INCREMENT for table `tweb_penduduk_agama`
--
ALTER TABLE `tweb_penduduk_agama`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `tweb_penduduk_asuransi`
--
ALTER TABLE `tweb_penduduk_asuransi`
  MODIFY `id` tinyint(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=100;
--
-- AUTO_INCREMENT for table `tweb_penduduk_hubungan`
--
ALTER TABLE `tweb_penduduk_hubungan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `tweb_penduduk_kawin`
--
ALTER TABLE `tweb_penduduk_kawin`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `tweb_penduduk_pekerjaan`
--
ALTER TABLE `tweb_penduduk_pekerjaan`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=90;
--
-- AUTO_INCREMENT for table `tweb_penduduk_pendidikan`
--
ALTER TABLE `tweb_penduduk_pendidikan`
  MODIFY `id` tinyint(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
--
-- AUTO_INCREMENT for table `tweb_penduduk_pendidikan_kk`
--
ALTER TABLE `tweb_penduduk_pendidikan_kk`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `tweb_penduduk_sex`
--
ALTER TABLE `tweb_penduduk_sex`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `tweb_penduduk_status`
--
ALTER TABLE `tweb_penduduk_status`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `tweb_penduduk_umur`
--
ALTER TABLE `tweb_penduduk_umur`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;
--
-- AUTO_INCREMENT for table `tweb_penduduk_warganegara`
--
ALTER TABLE `tweb_penduduk_warganegara`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `tweb_rtm`
--
ALTER TABLE `tweb_rtm`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tweb_rtm_hubungan`
--
ALTER TABLE `tweb_rtm_hubungan`
  MODIFY `id` tinyint(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `tweb_sakit_menahun`
--
ALTER TABLE `tweb_sakit_menahun`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT for table `tweb_status_dasar`
--
ALTER TABLE `tweb_status_dasar`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `tweb_status_ktp`
--
ALTER TABLE `tweb_status_ktp`
  MODIFY `id` tinyint(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `tweb_surat_atribut`
--
ALTER TABLE `tweb_surat_atribut`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tweb_surat_format`
--
ALTER TABLE `tweb_surat_format`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=179;
--
-- AUTO_INCREMENT for table `tweb_wil_clusterdesa`
--
ALTER TABLE `tweb_wil_clusterdesa`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=575;
--
-- AUTO_INCREMENT for table `urls`
--
ALTER TABLE `urls`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `user_grup`
--
ALTER TABLE `user_grup`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `widget`
--
ALTER TABLE `widget`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `agenda`
--
ALTER TABLE `agenda`
  ADD CONSTRAINT `id_artikel_fk` FOREIGN KEY (`id_artikel`) REFERENCES `artikel` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `anggota_grup_kontak`
--
ALTER TABLE `anggota_grup_kontak`
  ADD CONSTRAINT `anggota_grup_kontak_ke_kontak` FOREIGN KEY (`id_kontak`) REFERENCES `kontak` (`id_kontak`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `anggota_grup_kontak_ke_kontak_grup` FOREIGN KEY (`id_grup`) REFERENCES `kontak_grup` (`id_grup`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `cdesa_penduduk`
--
ALTER TABLE `cdesa_penduduk`
  ADD CONSTRAINT `cdesa_penduduk_fk` FOREIGN KEY (`id_cdesa`) REFERENCES `cdesa` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `covid19_pantau`
--
ALTER TABLE `covid19_pantau`
  ADD CONSTRAINT `fk_pantau_pemudik` FOREIGN KEY (`id_pemudik`) REFERENCES `covid19_pemudik` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `covid19_pemudik`
--
ALTER TABLE `covid19_pemudik`
  ADD CONSTRAINT `fk_pemudik_penduduk` FOREIGN KEY (`id_terdata`) REFERENCES `tweb_penduduk` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `disposisi_surat_masuk`
--
ALTER TABLE `disposisi_surat_masuk`
  ADD CONSTRAINT `desa_pamong_fk` FOREIGN KEY (`id_desa_pamong`) REFERENCES `tweb_desa_pamong` (`pamong_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `id_surat_fk` FOREIGN KEY (`id_surat_masuk`) REFERENCES `surat_masuk` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `grup_akses`
--
ALTER TABLE `grup_akses`
  ADD CONSTRAINT `fk_id_grup` FOREIGN KEY (`id_grup`) REFERENCES `user_grup` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_id_modul` FOREIGN KEY (`id_modul`) REFERENCES `setting_modul` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `kelompok_anggota`
--
ALTER TABLE `kelompok_anggota`
  ADD CONSTRAINT `kelompok_anggota_fk` FOREIGN KEY (`id_kelompok`) REFERENCES `kelompok` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `keuangan_ref_bank_desa`
--
ALTER TABLE `keuangan_ref_bank_desa`
  ADD CONSTRAINT `id_keuangan_ref_bank_desa_master_fk` FOREIGN KEY (`id_keuangan_master`) REFERENCES `keuangan_master` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `keuangan_ref_bel_operasional`
--
ALTER TABLE `keuangan_ref_bel_operasional`
  ADD CONSTRAINT `id_keuangan_ref_bel_operasional_master_fk` FOREIGN KEY (`id_keuangan_master`) REFERENCES `keuangan_master` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `keuangan_ref_bidang`
--
ALTER TABLE `keuangan_ref_bidang`
  ADD CONSTRAINT `id_keuangan_ref_bidang_master_fk` FOREIGN KEY (`id_keuangan_master`) REFERENCES `keuangan_master` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `keuangan_ref_bunga`
--
ALTER TABLE `keuangan_ref_bunga`
  ADD CONSTRAINT `id_keuangan_ref_bunga_master_fk` FOREIGN KEY (`id_keuangan_master`) REFERENCES `keuangan_master` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `keuangan_ref_desa`
--
ALTER TABLE `keuangan_ref_desa`
  ADD CONSTRAINT `id_keuangan_ref_desa_master_fk` FOREIGN KEY (`id_keuangan_master`) REFERENCES `keuangan_master` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `keuangan_ref_kecamatan`
--
ALTER TABLE `keuangan_ref_kecamatan`
  ADD CONSTRAINT `id_keuangan_ref_kecamatan_master_fk` FOREIGN KEY (`id_keuangan_master`) REFERENCES `keuangan_master` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `keuangan_ref_kegiatan`
--
ALTER TABLE `keuangan_ref_kegiatan`
  ADD CONSTRAINT `id_keuangan_ref_kegiatan_master_fk` FOREIGN KEY (`id_keuangan_master`) REFERENCES `keuangan_master` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `keuangan_ref_korolari`
--
ALTER TABLE `keuangan_ref_korolari`
  ADD CONSTRAINT `id_keuangan_ref_korolari_master_fk` FOREIGN KEY (`id_keuangan_master`) REFERENCES `keuangan_master` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `keuangan_ref_neraca_close`
--
ALTER TABLE `keuangan_ref_neraca_close`
  ADD CONSTRAINT `id_keuangan_ref_neraca_close_master_fk` FOREIGN KEY (`id_keuangan_master`) REFERENCES `keuangan_master` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `keuangan_ref_perangkat`
--
ALTER TABLE `keuangan_ref_perangkat`
  ADD CONSTRAINT `id_keuangan_ref_perangkat_master_fk` FOREIGN KEY (`id_keuangan_master`) REFERENCES `keuangan_master` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `keuangan_ref_potongan`
--
ALTER TABLE `keuangan_ref_potongan`
  ADD CONSTRAINT `id_keuangan_ref_potongan_master_fk` FOREIGN KEY (`id_keuangan_master`) REFERENCES `keuangan_master` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `keuangan_ref_rek1`
--
ALTER TABLE `keuangan_ref_rek1`
  ADD CONSTRAINT `id_keuangan_ref_rek1_master_fk` FOREIGN KEY (`id_keuangan_master`) REFERENCES `keuangan_master` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `keuangan_ref_rek2`
--
ALTER TABLE `keuangan_ref_rek2`
  ADD CONSTRAINT `id_keuangan_ref_rek2_master_fk` FOREIGN KEY (`id_keuangan_master`) REFERENCES `keuangan_master` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `keuangan_ref_rek3`
--
ALTER TABLE `keuangan_ref_rek3`
  ADD CONSTRAINT `id_keuangan_ref_rek3_master_fk` FOREIGN KEY (`id_keuangan_master`) REFERENCES `keuangan_master` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `keuangan_ref_rek4`
--
ALTER TABLE `keuangan_ref_rek4`
  ADD CONSTRAINT `id_keuangan_ref_rek4_master_fk` FOREIGN KEY (`id_keuangan_master`) REFERENCES `keuangan_master` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `keuangan_ref_sbu`
--
ALTER TABLE `keuangan_ref_sbu`
  ADD CONSTRAINT `id_keuangan_ref_sbu_master_fk` FOREIGN KEY (`id_keuangan_master`) REFERENCES `keuangan_master` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `keuangan_ref_sumber`
--
ALTER TABLE `keuangan_ref_sumber`
  ADD CONSTRAINT `id_keuangan_ref_sumber_master_fk` FOREIGN KEY (`id_keuangan_master`) REFERENCES `keuangan_master` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `keuangan_ta_anggaran`
--
ALTER TABLE `keuangan_ta_anggaran`
  ADD CONSTRAINT `id_keuangan_ta_anggaran_master_fk` FOREIGN KEY (`id_keuangan_master`) REFERENCES `keuangan_master` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `keuangan_ta_anggaran_log`
--
ALTER TABLE `keuangan_ta_anggaran_log`
  ADD CONSTRAINT `id_keuangan_ta_anggaran_log_master_fk` FOREIGN KEY (`id_keuangan_master`) REFERENCES `keuangan_master` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `keuangan_ta_anggaran_rinci`
--
ALTER TABLE `keuangan_ta_anggaran_rinci`
  ADD CONSTRAINT `id_keuangan_ta_anggaran_rinci_master_fk` FOREIGN KEY (`id_keuangan_master`) REFERENCES `keuangan_master` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `keuangan_ta_bidang`
--
ALTER TABLE `keuangan_ta_bidang`
  ADD CONSTRAINT `id_keuangan_ta_bidang_master_fk` FOREIGN KEY (`id_keuangan_master`) REFERENCES `keuangan_master` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `keuangan_ta_desa`
--
ALTER TABLE `keuangan_ta_desa`
  ADD CONSTRAINT `id_keuangan_ta_desa_master_fk` FOREIGN KEY (`id_keuangan_master`) REFERENCES `keuangan_master` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `keuangan_ta_jurnal_umum`
--
ALTER TABLE `keuangan_ta_jurnal_umum`
  ADD CONSTRAINT `id_keuangan_ta_jurnal_umum_master_fk` FOREIGN KEY (`id_keuangan_master`) REFERENCES `keuangan_master` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `keuangan_ta_jurnal_umum_rinci`
--
ALTER TABLE `keuangan_ta_jurnal_umum_rinci`
  ADD CONSTRAINT `id_keuangan_ta_jurnal_umum_rinci_master_fk` FOREIGN KEY (`id_keuangan_master`) REFERENCES `keuangan_master` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `keuangan_ta_kegiatan`
--
ALTER TABLE `keuangan_ta_kegiatan`
  ADD CONSTRAINT `id_keuangan_ta_kegiatan_master_fk` FOREIGN KEY (`id_keuangan_master`) REFERENCES `keuangan_master` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `keuangan_ta_mutasi`
--
ALTER TABLE `keuangan_ta_mutasi`
  ADD CONSTRAINT `id_keuangan_ta_mutasi_master_fk` FOREIGN KEY (`id_keuangan_master`) REFERENCES `keuangan_master` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `keuangan_ta_pajak`
--
ALTER TABLE `keuangan_ta_pajak`
  ADD CONSTRAINT `id_keuangan_ta_pajak_master_fk` FOREIGN KEY (`id_keuangan_master`) REFERENCES `keuangan_master` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `keuangan_ta_pajak_rinci`
--
ALTER TABLE `keuangan_ta_pajak_rinci`
  ADD CONSTRAINT `id_keuangan_ta_pajak_rinci_master_fk` FOREIGN KEY (`id_keuangan_master`) REFERENCES `keuangan_master` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `keuangan_ta_pemda`
--
ALTER TABLE `keuangan_ta_pemda`
  ADD CONSTRAINT `id_keuangan_ta_pemda_master_fk` FOREIGN KEY (`id_keuangan_master`) REFERENCES `keuangan_master` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `keuangan_ta_pencairan`
--
ALTER TABLE `keuangan_ta_pencairan`
  ADD CONSTRAINT `id_keuangan_ta_pencairan_master_fk` FOREIGN KEY (`id_keuangan_master`) REFERENCES `keuangan_master` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `keuangan_ta_perangkat`
--
ALTER TABLE `keuangan_ta_perangkat`
  ADD CONSTRAINT `id_keuangan_ta_perangkat_master_fk` FOREIGN KEY (`id_keuangan_master`) REFERENCES `keuangan_master` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `keuangan_ta_rab`
--
ALTER TABLE `keuangan_ta_rab`
  ADD CONSTRAINT `id_keuangan_ta_rab_master_fk` FOREIGN KEY (`id_keuangan_master`) REFERENCES `keuangan_master` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `keuangan_ta_rab_rinci`
--
ALTER TABLE `keuangan_ta_rab_rinci`
  ADD CONSTRAINT `id_keuangan_ta_rab_rinci_master_fk` FOREIGN KEY (`id_keuangan_master`) REFERENCES `keuangan_master` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `keuangan_ta_rab_sub`
--
ALTER TABLE `keuangan_ta_rab_sub`
  ADD CONSTRAINT `id_keuangan_ta_rab_sub_master_fk` FOREIGN KEY (`id_keuangan_master`) REFERENCES `keuangan_master` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `keuangan_ta_rpjm_bidang`
--
ALTER TABLE `keuangan_ta_rpjm_bidang`
  ADD CONSTRAINT `id_keuangan_ta_rpjm_bidang_master_fk` FOREIGN KEY (`id_keuangan_master`) REFERENCES `keuangan_master` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `keuangan_ta_rpjm_kegiatan`
--
ALTER TABLE `keuangan_ta_rpjm_kegiatan`
  ADD CONSTRAINT `id_keuangan_ta_rpjm_kegiatan_master_fk` FOREIGN KEY (`id_keuangan_master`) REFERENCES `keuangan_master` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `keuangan_ta_rpjm_misi`
--
ALTER TABLE `keuangan_ta_rpjm_misi`
  ADD CONSTRAINT `id_keuangan_ta_rpjm_misi_master_fk` FOREIGN KEY (`id_keuangan_master`) REFERENCES `keuangan_master` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `keuangan_ta_rpjm_pagu_indikatif`
--
ALTER TABLE `keuangan_ta_rpjm_pagu_indikatif`
  ADD CONSTRAINT `id_keuangan_ta_rpjm_pagu_indikatif_master_fk` FOREIGN KEY (`id_keuangan_master`) REFERENCES `keuangan_master` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `keuangan_ta_rpjm_pagu_tahunan`
--
ALTER TABLE `keuangan_ta_rpjm_pagu_tahunan`
  ADD CONSTRAINT `id_keuangan_ta_rpjm_pagu_tahunan_master_fk` FOREIGN KEY (`id_keuangan_master`) REFERENCES `keuangan_master` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `keuangan_ta_rpjm_sasaran`
--
ALTER TABLE `keuangan_ta_rpjm_sasaran`
  ADD CONSTRAINT `id_keuangan_ta_rpjm_sasaran_master_fk` FOREIGN KEY (`id_keuangan_master`) REFERENCES `keuangan_master` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `keuangan_ta_rpjm_tujuan`
--
ALTER TABLE `keuangan_ta_rpjm_tujuan`
  ADD CONSTRAINT `id_keuangan_ta_rpjm_tujuan_master_fk` FOREIGN KEY (`id_keuangan_master`) REFERENCES `keuangan_master` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `keuangan_ta_rpjm_visi`
--
ALTER TABLE `keuangan_ta_rpjm_visi`
  ADD CONSTRAINT `id_keuangan_ta_rpjm_visi_master_fk` FOREIGN KEY (`id_keuangan_master`) REFERENCES `keuangan_master` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `keuangan_ta_saldo_awal`
--
ALTER TABLE `keuangan_ta_saldo_awal`
  ADD CONSTRAINT `id_keuangan_ta_saldo_awal_master_fk` FOREIGN KEY (`id_keuangan_master`) REFERENCES `keuangan_master` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `keuangan_ta_spj`
--
ALTER TABLE `keuangan_ta_spj`
  ADD CONSTRAINT `id_keuangan_ta_spj_master_fk` FOREIGN KEY (`id_keuangan_master`) REFERENCES `keuangan_master` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `keuangan_ta_spjpot`
--
ALTER TABLE `keuangan_ta_spjpot`
  ADD CONSTRAINT `id_keuangan_ta_spjpot_master_fk` FOREIGN KEY (`id_keuangan_master`) REFERENCES `keuangan_master` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `keuangan_ta_spj_bukti`
--
ALTER TABLE `keuangan_ta_spj_bukti`
  ADD CONSTRAINT `id_keuangan_ta_spj_bukti_master_fk` FOREIGN KEY (`id_keuangan_master`) REFERENCES `keuangan_master` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `keuangan_ta_spj_rinci`
--
ALTER TABLE `keuangan_ta_spj_rinci`
  ADD CONSTRAINT `id_keuangan_ta_spj_rinci_master_fk` FOREIGN KEY (`id_keuangan_master`) REFERENCES `keuangan_master` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `keuangan_ta_spj_sisa`
--
ALTER TABLE `keuangan_ta_spj_sisa`
  ADD CONSTRAINT `id_keuangan_ta_spj_sisa_master_fk` FOREIGN KEY (`id_keuangan_master`) REFERENCES `keuangan_master` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `keuangan_ta_spp`
--
ALTER TABLE `keuangan_ta_spp`
  ADD CONSTRAINT `id_keuangan_ta_spp_master_fk` FOREIGN KEY (`id_keuangan_master`) REFERENCES `keuangan_master` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `keuangan_ta_sppbukti`
--
ALTER TABLE `keuangan_ta_sppbukti`
  ADD CONSTRAINT `id_keuangan_ta_sppbukti_master_fk` FOREIGN KEY (`id_keuangan_master`) REFERENCES `keuangan_master` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `keuangan_ta_spppot`
--
ALTER TABLE `keuangan_ta_spppot`
  ADD CONSTRAINT `id_keuangan_ta_spppot_master_fk` FOREIGN KEY (`id_keuangan_master`) REFERENCES `keuangan_master` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `keuangan_ta_spp_rinci`
--
ALTER TABLE `keuangan_ta_spp_rinci`
  ADD CONSTRAINT `id_keuangan_ta_spp_rinci_master_fk` FOREIGN KEY (`id_keuangan_master`) REFERENCES `keuangan_master` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `keuangan_ta_sts`
--
ALTER TABLE `keuangan_ta_sts`
  ADD CONSTRAINT `id_keuangan_ta_sts_master_fk` FOREIGN KEY (`id_keuangan_master`) REFERENCES `keuangan_master` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `keuangan_ta_sts_rinci`
--
ALTER TABLE `keuangan_ta_sts_rinci`
  ADD CONSTRAINT `id_keuangan_ta_sts_rinci_master_fk` FOREIGN KEY (`id_keuangan_master`) REFERENCES `keuangan_master` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `keuangan_ta_tbp`
--
ALTER TABLE `keuangan_ta_tbp`
  ADD CONSTRAINT `id_keuangan_ta_tbp_master_fk` FOREIGN KEY (`id_keuangan_master`) REFERENCES `keuangan_master` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `keuangan_ta_tbp_rinci`
--
ALTER TABLE `keuangan_ta_tbp_rinci`
  ADD CONSTRAINT `id_keuangan_ta_tbp_rinci_master_fk` FOREIGN KEY (`id_keuangan_master`) REFERENCES `keuangan_master` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `keuangan_ta_triwulan`
--
ALTER TABLE `keuangan_ta_triwulan`
  ADD CONSTRAINT `id_keuangan_ta_triwulan_master_fk` FOREIGN KEY (`id_keuangan_master`) REFERENCES `keuangan_master` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `keuangan_ta_triwulan_rinci`
--
ALTER TABLE `keuangan_ta_triwulan_rinci`
  ADD CONSTRAINT `id_keuangan_ta_triwulan_rinci_master_fk` FOREIGN KEY (`id_keuangan_master`) REFERENCES `keuangan_master` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `kontak`
--
ALTER TABLE `kontak`
  ADD CONSTRAINT `kontak_ke_tweb_penduduk` FOREIGN KEY (`id_pend`) REFERENCES `tweb_penduduk` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `log_keluarga`
--
ALTER TABLE `log_keluarga`
  ADD CONSTRAINT `log_penduduk_fk` FOREIGN KEY (`id_log_penduduk`) REFERENCES `log_penduduk` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `log_penduduk`
--
ALTER TABLE `log_penduduk`
  ADD CONSTRAINT `id_ref_pindah` FOREIGN KEY (`ref_pindah`) REFERENCES `ref_pindah` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `mutasi_cdesa`
--
ALTER TABLE `mutasi_cdesa`
  ADD CONSTRAINT `cdesa_mutasi_fk` FOREIGN KEY (`id_cdesa_masuk`) REFERENCES `cdesa` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `mutasi_inventaris_asset`
--
ALTER TABLE `mutasi_inventaris_asset`
  ADD CONSTRAINT `FK_mutasi_inventaris_asset` FOREIGN KEY (`id_inventaris_asset`) REFERENCES `inventaris_asset` (`id`);

--
-- Constraints for table `mutasi_inventaris_gedung`
--
ALTER TABLE `mutasi_inventaris_gedung`
  ADD CONSTRAINT `FK_mutasi_inventaris_gedung` FOREIGN KEY (`id_inventaris_gedung`) REFERENCES `inventaris_gedung` (`id`);

--
-- Constraints for table `mutasi_inventaris_jalan`
--
ALTER TABLE `mutasi_inventaris_jalan`
  ADD CONSTRAINT `FK_mutasi_inventaris_jalan` FOREIGN KEY (`id_inventaris_jalan`) REFERENCES `inventaris_jalan` (`id`);

--
-- Constraints for table `mutasi_inventaris_peralatan`
--
ALTER TABLE `mutasi_inventaris_peralatan`
  ADD CONSTRAINT `FK_mutasi_inventaris_peralatan` FOREIGN KEY (`id_inventaris_peralatan`) REFERENCES `inventaris_peralatan` (`id`);

--
-- Constraints for table `mutasi_inventaris_tanah`
--
ALTER TABLE `mutasi_inventaris_tanah`
  ADD CONSTRAINT `FK_mutasi_inventaris_tanah` FOREIGN KEY (`id_inventaris_tanah`) REFERENCES `inventaris_tanah` (`id`);

--
-- Constraints for table `setting_aplikasi_options`
--
ALTER TABLE `setting_aplikasi_options`
  ADD CONSTRAINT `id_setting_fk` FOREIGN KEY (`id_setting`) REFERENCES `setting_aplikasi` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `suplemen_terdata`
--
ALTER TABLE `suplemen_terdata`
  ADD CONSTRAINT `suplemen_terdata_ibfk_1` FOREIGN KEY (`id_suplemen`) REFERENCES `suplemen` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `syarat_surat`
--
ALTER TABLE `syarat_surat`
  ADD CONSTRAINT `id_surat_format` FOREIGN KEY (`surat_format_id`) REFERENCES `tweb_surat_format` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tweb_penduduk_mandiri`
--
ALTER TABLE `tweb_penduduk_mandiri`
  ADD CONSTRAINT `id_pend_fk` FOREIGN KEY (`id_pend`) REFERENCES `tweb_penduduk` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
