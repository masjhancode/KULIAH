# Dokumentasi Widget: CupertinoTextField

## 1. Penjelasan Singkat & Fungsi
Widget `CupertinoTextField` menyediakan bidang input teks gaya iOS dengan sudut tumpul rounded border, placeholder, dan ikon `prefix`/`suffix`.

## 2. Tabel Atribut & Penggunaannya

| Atribut | Tipe Data | Fungsi & Penggunaan |
| :--- | :--- | :--- |
| `placeholder` | `String?` | Teks petunjuk saat bidang kosong. |
| `controller` | `TextEditingController?` | Pengontrol data teks input. |
| `obscureText` | `bool` | Menyamarkan sandi teks (password). |
| `prefix` | `Widget?` | Widget ikon di sisi kiri input. |
| `suffix` | `Widget?` | Widget aksi di sisi kanan input. |

## 3. Contoh Kode Flutter

### 3.1 Contoh Kode Dasar (Basic Usage)

```dart
import 'package:flutter/cupertino.dart';

void main() {
  runApp(const CupertinoTextFieldDemoApp());
}

class CupertinoTextFieldDemoApp extends StatelessWidget {
  const CupertinoTextFieldDemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const CupertinoApp(
      home: CupertinoPageScaffold(
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: CupertinoTextField(
              placeholder: 'Masukkan Nama Lengkap',
              prefix: Padding(
                padding: EdgeInsets.only(left: 8.0),
                child: Icon(CupertinoIcons.person),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
```

### 3.2 Contoh Kode Studi Kasus UI (Input Form Otentikasi Login NIM Mahasiswa iOS Edition)

```dart
import 'package:flutter/cupertino.dart';

void main() {
  runApp(const LoginIosFieldApp());
}

class LoginIosFieldApp extends StatelessWidget {
  const LoginIosFieldApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const CupertinoApp(
      debugShowCheckedModeBanner: false,
      home: CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(middle: Text('Login SIAKAD iOS')),
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CupertinoTextField(
                placeholder: 'NIM Mahasiswa',
                prefix: Padding(padding: EdgeInsets.all(8.0), child: Icon(CupertinoIcons.person_solid)),
              ),
              SizedBox(height: 12),
              CupertinoTextField(
                placeholder: 'Kata Sandi',
                obscureText: true,
                prefix: Padding(padding: EdgeInsets.all(8.0), child: Icon(CupertinoIcons.lock_fill)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
```
