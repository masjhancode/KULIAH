# Dokumentasi Widget: SwitchListTile

## 1. Penjelasan Singkat & Fungsi
Widget `SwitchListTile` menggabungkan `Switch` dengan `ListTile` untuk kemudahan implementasi opsi pengaturan berlabel lengkap dengan ikon sekunder.

## 2. Tabel Atribut & Penggunaannya

| Atribut | Tipe Data | Fungsi & Penggunaan |
| :--- | :--- | :--- |
| `value` | `bool` | Status sakelar (true/false). |
| `onChanged` | `ValueChanged<bool>` | Callback respon sentuhan baris. |
| `title` | `Widget` | Widget judul pengaturan. |
| `subtitle` | `Widget` | Widget deskripsi sekunder. |
| `secondary` | `Widget` | Widget ikon di sebelah kiri baris. |

## 3. Contoh Kode Flutter

### 3.1 Contoh Kode Dasar (Basic Usage)

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const SwitchListTileDemoApp());
}

class SwitchListTileDemoApp extends StatelessWidget {
  const SwitchListTileDemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Demo SwitchListTile')),
        body: SwitchListTile(
          title: const Text('Notifikasi Push'),
          value: true,
          onChanged: (v) {},
        ),
      ),
    );
  }
}
```

### 3.2 Contoh Kode Studi Kasus UI (Pengaturan Autentikasi Biometrik Sidik Jari SIAKAD)

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const BiometricSwitchApp());
}

class BiometricSwitchApp extends StatefulWidget {
  const BiometricSwitchApp({super.key});

  @override
  State<BiometricSwitchApp> createState() => _BiometricSwitchAppState();
}

class _BiometricSwitchAppState extends State<BiometricSwitchApp> {
  bool _useBiometric = true;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text('Keamanan Akun'), backgroundColor: Colors.indigo),
        body: ListView(
          children: [
            SwitchListTile(
              activeColor: Colors.indigo,
              secondary: const Icon(Icons.fingerprint, color: Colors.indigo),
              title: const Text('Login Biometrik / FaceID'),
              subtitle: const Text('Gunakan sidik jari untuk masuk tanpa menginputkan password.'),
              value: _useBiometric,
              onChanged: (val) => setState(() => _useBiometric = val),
            ),
          ],
        ),
      ),
    );
  }
}
```
