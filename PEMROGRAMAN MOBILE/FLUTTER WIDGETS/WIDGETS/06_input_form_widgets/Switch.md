# Dokumentasi Widget: Switch

## 1. Penjelasan Singkat & Fungsi
Widget `Switch` merupakan sakelar sakelar (*toggle*) yang memungkinkan pengaktifan atau penonaktifan status boolean secara langsung dengan animasi geser.

## 2. Tabel Atribut & Penggunaannya

| Atribut | Tipe Data | Fungsi & Penggunaan |
| :--- | :--- | :--- |
| `value` | `bool` | Status nilai sakelar (true/aktif atau false/nonaktif). |
| `onChanged` | `ValueChanged<bool>` | Callback fungsi saat sakelar digeser/ditekan. |
| `activeColor` | `Color` | Warna penanda tombol sakelar saat posisi aktif. |
| `activeTrackColor` | `Color` | Warna jalur lintasan sakelar saat posisi aktif. |

## 3. Contoh Kode Flutter

### 3.1 Contoh Kode Dasar (Basic Usage)

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const SwitchDemoApp());
}

class SwitchDemoApp extends StatelessWidget {
  const SwitchDemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Demo Switch')),
        body: Center(
          child: Switch(
            value: true,
            onChanged: (val) {},
          ),
        ),
      ),
    );
  }
}
```

### 3.2 Contoh Kode Studi Kasus UI (Toggle Switch Pengaktifan Mode Gelap (Dark Mode))

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const DarkModeSwitchApp());
}

class DarkModeSwitchApp extends StatefulWidget {
  const DarkModeSwitchApp({super.key});

  @override
  State<DarkModeSwitchApp> createState() => _DarkModeSwitchAppState();
}

class _DarkModeSwitchAppState extends State<DarkModeSwitchApp> {
  bool _isDark = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: _isDark ? ThemeData.dark() : ThemeData.light(),
      home: Scaffold(
        appBar: AppBar(title: const Text('Pengaturan Tampilan')),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Aktifkan Mode Gelap', style: TextStyle(fontSize: 16)),
              Switch(
                value: _isDark,
                onChanged: (val) => setState(() => _isDark = val),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
```
