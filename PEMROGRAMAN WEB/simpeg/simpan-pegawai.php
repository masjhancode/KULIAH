<?php
session_start();
require_once 'config/config.php';

$nama = $_POST['namalengkap'];
$jabatan = $_POST['jabatan'];
$gaji = $_POST['gaji'];
$tanggalbergabung = $_POST['tanggal_bergabung'];

$stmt = $pdo->prepare("INSERT INTO pegawai (nama, jabatan, gaji, tanggal_bergabung) 
VALUES (:nama, :jabatan, :gaji, :tanggalbergabung)");

$stmt->execute([
    ':nama' => $nama,
    ':jabatan' => $jabatan,
    ':gaji' => $gaji,
    ':tanggalbergabung' => $tanggalbergabung
]);

$_SESSION['flash_message'] = "Data pegawai berhasil disimpan.";
$_SESSION['flash_message_type'] = "success";

header("Location: index.php");
exit;