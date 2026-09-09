<?php

include_once 'config/config.php';

?>
<!DOCTYPE html>
<html lang="id">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Data Pegawai</title>

    <link rel="stylesheet" href="assets/css/style.css">
</head>

<body>

    <div class="container">

        <h2>Form Data Pegawai</h2>

        <form action="simpan-pegawai.php" method="post">

            <label for="namaLengkap">Nama Lengkap</label>
            <input type="text" id="namaLengkap" name="namalengkap" placeholder="Masukkan nama lengkap" required>

            <label for="jabatan">Jabatan</label>
            <input type="text" id="jabatan" name="jabatan" placeholder="Masukkan jabatan" required>

            <label for="gaji">Gaji</label>
            <input type="number" id="gaji" name="gaji" placeholder="Masukkan gaji" required>

            <label for="tanggal_bergabung">Tanggal Bergabung</label>
            <input type="date" id="tanggal_bergabung" name="tanggal_bergabung" required>

            <button type="submit" name="simpan">
                Simpan
            </button>

        </form>


        <h2>Data Pegawai</h2>

        <div class="table-container">

            <table>
                <thead>
                    <tr>
                        <th>No</th>
                        <th>Nama Lengkap</th>
                        <th>Jabatan</th>
                        <th>Gaji</th>
                        <th>Tanggal Bergabung</th>
                        <th>Aksi</th>
                    </tr>
                </thead>

                <tbody>

                    <?php
                    // Contoh data
                    $pegawai = [
                        [
                            "nama" => "Budi Santoso",
                            "jabatan" => "Manager",
                            "gaji" => 7500000,
                            "tanggal" => "2026-01-10"
                        ],
                        [
                            "nama" => "Andi Saputra",
                            "jabatan" => "Programmer",
                            "gaji" => 6000000,
                            "tanggal" => "2026-02-15"
                        ]
                    ];

                    $no = 1;

                    foreach ($pegawai as $p) {
                    ?>

                    <tr>
                        <td><?= $no++; ?></td>
                        <td><?= $p["nama"]; ?></td>
                        <td><?= $p["jabatan"]; ?></td>
                        <td>Rp <?= number_format($p["gaji"], 0, ',', '.'); ?></td>
                        <td><?= $p["tanggal"]; ?></td>
                        <td>
                            <a href="#" class="btn-edit">Edit</a>
                            <a href="#" class="btn-hapus">Hapus</a>
                        </td>
                    </tr>

                    <?php } ?>

                </tbody>
            </table>

        </div>

    </div>

</body>

</html>