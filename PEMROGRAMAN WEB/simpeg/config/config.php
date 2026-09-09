<?php

$host = "simpeg_db";
$dbname = "simpeg";
$username = "simpeg";
$password = "secret";

try {
    $pdo = new PDO(
        "mysql:host=$host; dbname=$dbname; charset=utf8mb4",
        $username,
        $password
    );
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
} catch (PDOException $e) {
    die("Error ke koneksi server : " . $e->getMessage());
}