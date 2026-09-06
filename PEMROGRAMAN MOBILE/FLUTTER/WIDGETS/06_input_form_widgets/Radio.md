# Dokumentasi Widget: Radio

## 1. Penjelasan Singkat & Fungsi
Widget `Radio` merupakan tombol pilihan eksklusif, di mana pengguna hanya dapat memilih satu opsi dari beberapa pilihan dalam satu kelompok (*groupValue*).

## 2. Tabel Atribut & Penggunaannya

| Atribut | Tipe Data | Fungsi & Penggunaan |
| :--- | :--- | :--- |
| `value` | `T` | Nilai unik yang diwakili oleh opsi tombol radio ini. |
| `groupValue` | `T` | Nilai kelompok terpilih saat ini. |
| `onChanged` | `ValueChanged<T?>` | Callback fungsi saat opsi ditekan. |
| `activeColor` | `Color` | Warna penanda radio saat dalam posisi aktif terpilih. |

## 3. Contoh Kode Flutter

### 3.1 Contoh Kode Dasar (Basic Usage)

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const RadioDemoApp());
}

class RadioDemoApp extends StatelessWidget {
  const RadioDemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Demo Radio')),
        body: Row(
          children: [
            Radio<int>(value: 1, groupValue: 1, onChanged: (v) {}),
            const Text('Pilihan A'),
          ],
        ),
      ),
    );
  }
}
```

### 3.2 Contoh Kode Studi Kasus UI (Pilihan Metode Pembayaran SPP Mahasiswa)

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const PaymentRadioApp());
}

class PaymentRadioApp extends StatefulWidget {
  const PaymentRadioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text('Metode Pembayaran SPP'), backgroundColor: Colors.indigo),
        body: const PaymentRadioWidget(),
      ),
    );
  }
}

class PaymentRadioWidget extends StatefulWidget {
  const PaymentRadioWidget({super.key});

  @override
  State<PaymentRadioWidget> createState() => _PaymentRadioWidgetState();
}

class _PaymentRadioWidgetState extends State<PaymentRadioWidget> {
  String _method = 'va';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Radio<String>(
              value: 'va',
              groupValue: _method,
              activeColor: Colors.indigo,
              onChanged: (val) => setState(() => _method = val!),
            ),
            const Text('Virtual Account Bank Mandiri / BNI'),
          ],
        ),
        Row(
          children: [
            Radio<String>(
              value: 'qris',
              groupValue: _method,
              activeColor: Colors.indigo,
              onChanged: (val) => setState(() => _method = val!),
            ),
            const Text('QRIS Instant Payment'),
          ],
        ),
      ],
    );
  }
}
```
