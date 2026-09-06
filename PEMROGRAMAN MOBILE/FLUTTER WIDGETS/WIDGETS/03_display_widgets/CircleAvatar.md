# Dokumentasi Widget: CircleAvatar

## 1. Penjelasan Singkat & Fungsi
Widget `CircleAvatar` merupakan lingkaran khusus perender foto profil pengguna (*profile picture*) atau inisial nama.

## 2. Tabel Atribut & Penggunaannya

| Atribut | Tipe Data | Fungsi & Penggunaan |
| :--- | :--- | :--- |
| `radius` | `double` | Ukuran jari-jari lingkaran avatar. |
| `backgroundImage` | `ImageProvider` | Objek gambar foto profil. |
| `child` | `Widget` | Widget teks inisial nama jika foto tidak tersedia. |
| `backgroundColor` | `Color` | Warna latar lingkaran. |

## 3. Contoh Kode Flutter

### 3.1 Contoh Kode Dasar (Basic Usage)

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const CircleAvatarDemoApp());
}

class CircleAvatarDemoApp extends StatelessWidget {
  const CircleAvatarDemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Demo CircleAvatar')),
        body: const Center(
          child: CircleAvatar(
            radius: 30,
            child: Text('AF'),
          ),
        ),
      ),
    );
  }
}
```

### 3.2 Contoh Kode Studi Kasus UI (Foto Profil Mahasiswa dengan Indikator Online)

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const ProfileAvatarApp());
}

class ProfileAvatarApp extends StatelessWidget {
  const ProfileAvatarApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text('Profil Saya'), backgroundColor: Colors.indigo),
        body: const Center(
          child: Stack(
            children: [
              CircleAvatar(
                radius: 48,
                backgroundColor: Colors.indigo,
                child: Icon(Icons.person, size: 50, color: Colors.white),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: CircleAvatar(
                  radius: 12,
                  backgroundColor: Colors.green,
                  child: Icon(Icons.check, size: 12, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
```
