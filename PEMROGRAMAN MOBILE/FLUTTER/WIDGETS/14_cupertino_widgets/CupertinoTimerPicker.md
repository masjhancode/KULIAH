# Dokumentasi Widget: CupertinoTimerPicker

## 1. Penjelasan Singkat & Fungsi
Widget `CupertinoTimerPicker` memfasilitasi pemilih durasi jam, menit, dan detik bergaya roda putar iOS.

## 2. Tabel Atribut & Penggunaannya

| Atribut | Tipe Data | Fungsi & Penggunaan |
| :--- | :--- | :--- |
| `mode` | `CupertinoTimerPickerMode` | Modus format durasi (hm, ms, hms) (default: hms). |
| `onTimerDurationChanged` | `ValueChanged<Duration>` | Callback perubahan waktu durasi (wajib). |
| `initialTimerDuration` | `Duration` | Durasi waktu awal (default: Duration.zero). |

## 3. Contoh Kode Flutter

### 3.1 Contoh Kode Dasar (Basic Usage)

```dart
import 'package:flutter/cupertino.dart';

void main() {
  runApp(const CupertinoTimerPickerDemoApp());
}

class CupertinoTimerPickerDemoApp extends StatefulWidget {
  const CupertinoTimerPickerDemoApp({super.key});

  @override
  State<CupertinoTimerPickerDemoApp> createState() => _CupertinoTimerPickerDemoAppState();
}

class _CupertinoTimerPickerDemoAppState extends State<CupertinoTimerPickerDemoApp> {
  Duration _duration = Duration.zero;

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      home: CupertinoPageScaffold(
        child: Center(
          child: SizedBox(
            height: 200,
            child: CupertinoTimerPicker(
              onTimerDurationChanged: (d) => setState(() => _duration = d),
            ),
          ),
        ),
      ),
    );
  }
}
```

### 3.2 Contoh Kode Studi Kasus UI (Pemilih Durasi Alokasi Waktu Ujian Online Mahasiswa)

```dart
import 'package:flutter/cupertino.dart';

void main() {
  runApp(const ExamTimerIosPickerApp());
}

class ExamTimerIosPickerApp extends StatefulWidget {
  const ExamTimerIosPickerApp({super.key});

  @override
  State<ExamTimerIosPickerApp> createState() => _ExamTimerIosPickerAppState();
}

class _ExamTimerIosPickerAppState extends State<ExamTimerIosPickerApp> {
  Duration _examDuration = const Duration(hours: 1, minutes: 30);

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      debugShowCheckedModeBanner: false,
      home: CupertinoPageScaffold(
        navigationBar: const CupertinoNavigationBar(middle: Text('Set Alokasi Ujian')),
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text('Durasi Ujian: ${_examDuration.inMinutes} Menit', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              ),
              SizedBox(
                height: 200,
                child: CupertinoTimerPicker(
                  mode: CupertinoTimerPickerMode.hm,
                  initialTimerDuration: _examDuration,
                  onTimerDurationChanged: (d) => setState(() => _examDuration = d),
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
