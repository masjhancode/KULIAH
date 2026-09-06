# Dokumentasi Widget: CupertinoSwitch

## 1. Penjelasan Singkat & Fungsi
Widget `CupertinoSwitch` adalah kontrol sakelar toggle bergaya iOS khas dengan warna hijau aktif (iOS Green).

## 2. Tabel Atribut & Penggunaannya

| Atribut | Tipe Data | Fungsi & Penggunaan |
| :--- | :--- | :--- |
| `value` | `bool` | Status nilai boolean (true/false) (wajib). |
| `onChanged` | `ValueChanged<bool>?` | Callback perubahan status. |
| `activeColor` | `Color?` | Warna saat status aktif (default: CupertinoColors.activeGreen). |
| `trackColor` | `Color?` | Warna trek saat status nonaktif. |

## 3. Contoh Kode Flutter

### 3.1 Contoh Kode Dasar (Basic Usage)

```dart
import 'package:flutter/cupertino.dart';

void main() {
  runApp(const CupertinoSwitchDemoApp());
}

class CupertinoSwitchDemoApp extends StatefulWidget {
  const CupertinoSwitchDemoApp({super.key});

  @override
  State<CupertinoSwitchDemoApp> createState() => _CupertinoSwitchDemoAppState();
}

class _CupertinoSwitchDemoAppState extends State<CupertinoSwitchDemoApp> {
  bool _switchVal = true;

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      home: CupertinoPageScaffold(
        child: Center(
          child: CupertinoSwitch(
            value: _switchVal,
            onChanged: (val) => setState(() => _switchVal = val),
          ),
        ),
      ),
    );
  }
}
```

### 3.2 Contoh Kode Studi Kasus UI (Toggle Pengaturan Notifikasi Pengingat Jadwal Kuliah di iOS)

```dart
import 'package:flutter/cupertino.dart';

void main() {
  runApp(const NotifSwitchIosApp());
}

class NotifSwitchIosApp extends StatefulWidget {
  const NotifSwitchIosApp({super.key});

  @override
  State<NotifSwitchIosApp> createState() => _NotifSwitchIosAppState();
}

class _NotifSwitchIosAppState extends State<NotifSwitchIosApp> {
  bool _enabled = true;

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      debugShowCheckedModeBanner: false,
      home: CupertinoPageScaffold(
        navigationBar: const CupertinoNavigationBar(middle: Text('Pengaturan Notifikasi')),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Pengingat Jadwal Kuliah H-1', style: TextStyle(fontSize: 16)),
                CupertinoSwitch(
                  value: _enabled,
                  onChanged: (val) => setState(() => _enabled = val),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
```
