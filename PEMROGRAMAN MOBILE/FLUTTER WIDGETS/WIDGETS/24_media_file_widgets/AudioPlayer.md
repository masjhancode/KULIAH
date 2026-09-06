# Dokumentasi Widget: AudioPlayer

## 1. Deskripsi & Fungsi Modul

Widget `AudioPlayer` (menggunakan paket `audioplayers` atau `just_audio`) merupakan modul pemutar konten suara (*audio playback*) pada Flutter. Dalam Sistem Informasi Akademik (SIAKAD), komponen ini digunakan pada modul Laboratorium Bahasa (Tes Listening EPT/TOEFL Kampus), rekaman podcast akademik, serta narasi audio panduan penggunaan aplikasi untuk civitas akademika disabilitas netra.

## 2. Tabel Atribut & Penggunaannya

| Atribut / Method | Tipe Data / Return | Fungsi & Penggunaan |
| :--- | :--- | :--- |
| `play()` | `Future<void>` | Memulai pemutaran audio dari sumber berkas atau URL. |
| `pause()` | `Future<void>` | Menghentikan sementara pemutaran audio. |
| `seek()` | `Future<void>` | Melompati durasi pemutaran audio ke detik tertentu. |
| `onPositionChanged` | `Stream<Duration>` | Stream data posisi waktu detik pemutaran audio secara *real-time*. |

---

## 3. Contoh Kode Flutter

### 3.1 Contoh Kode Dasar (Basic Usage)

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const BasicAudioPlayerApp());
}

class BasicAudioPlayerApp extends StatelessWidget {
  const BasicAudioPlayerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Basic AudioPlayer')),
        body: const Center(
          child: Text('Placeholder: AudioPlayer().play(AssetSource("sound.mp3"))'),
        ),
      ),
    );
  }
}
```

### 3.2 Contoh Kode Studi Kasus UI (Modul Listening EPT Lab Bahasa SIAKAD)

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const SiakadAudioLabApp());
}

class SiakadAudioLabApp extends StatelessWidget {
  const SiakadAudioLabApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lab Bahasa SIAKAD',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.indigo,
      ),
      home: const AudioLabScreen(),
    );
  }
}

class AudioLabScreen extends StatefulWidget {
  const AudioLabScreen({super.key});

  @override
  State<AudioLabScreen> createState() => _AudioLabScreenState();
}

class _AudioLabScreenState extends State<AudioLabScreen> {
  bool _isPlaying = false;
  double _sliderValue = 15.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('UJIAN LISTENING EPT KAMPUS'),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    const Icon(Icons.graphic_eq, size: 64, color: Colors.indigo),
                    const SizedBox(height: 12),
                    const Text('Section 1: Listening Comprehension', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                    const Text('Soal Nomor 1 s.d. 10 (Audio Part A)'),
                    const SizedBox(height: 16),
                    Slider(
                      value: _sliderValue,
                      min: 0,
                      max: 60,
                      activeColor: Colors.indigo,
                      onChanged: (val) {
                        setState(() => _sliderValue = val);
                      },
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('00:${_sliderValue.toInt().toString().padLeft(2, '0')}'),
                        const Text('01:00'),
                      ],
                    ),
                    const SizedBox(height: 16),
                    IconButton(
                      iconSize: 48,
                      icon: Icon(_isPlaying ? Icons.pause_circle : Icons.play_circle, color: Colors.indigo),
                      onPressed: () {
                        setState(() => _isPlaying = !_isPlaying);
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
```
