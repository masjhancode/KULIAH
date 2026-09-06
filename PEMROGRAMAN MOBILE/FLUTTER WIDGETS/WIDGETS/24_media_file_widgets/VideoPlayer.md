# Dokumentasi Widget: VideoPlayer

## 1. Deskripsi & Fungsi Modul

Widget `VideoPlayer` (menggunakan paket `video_player` atau `chewie`) merupakan komponen penyaji tayangan video streaming pada Flutter. Dalam Sistem Informasi Akademik (SIAKAD), widget ini digunakan untuk memutar video rekaman sesi perkuliahan online, modul praktikum video laboratorium, serta tayangan Orientasi Kehidupan Kampus (PKKMB).

## 2. Tabel Atribut & Penggunaannya

| Atribut / Method | Tipe Data / Return | Fungsi & Penggunaan |
| :--- | :--- | :--- |
| `controller` | `VideoPlayerController` | **(WAJIB)** Pengontrol status pemutaran video (play, pause, seek, duration). |
| `aspectRatio` | `double` | Rasio lebar berbanding tinggi bingkai layar video (misal `16 / 9`). |
| `play()` | `Future<void>` | Metode untuk memulai pemutaran tayangan video. |
| `pause()` | `Future<void>` | Metode untuk menghentikan sementara tayangan video. |

---

## 3. Contoh Kode Flutter

### 3.1 Contoh Kode Dasar (Basic Usage)

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const BasicVideoPlayerApp());
}

class BasicVideoPlayerApp extends StatelessWidget {
  const BasicVideoPlayerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Basic VideoPlayer')),
        body: const Center(
          child: Text('Placeholder: VideoPlayer(controller: _controller)'),
        ),
      ),
    );
  }
}
```

### 3.2 Contoh Kode Studi Kasus UI (Pemutar Video Asinkron LMS Perkuliahan SIAKAD)

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const SiakadLmsVideoApp());
}

class SiakadLmsVideoApp extends StatelessWidget {
  const SiakadLmsVideoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Video LMS SIAKAD',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.indigo,
      ),
      home: const VideoLmsScreen(),
    );
  }
}

class VideoLmsScreen extends StatefulWidget {
  const VideoLmsScreen({super.key});

  @override
  State<VideoLmsScreen> createState() => _VideoLmsScreenState();
}

class _VideoLmsScreenState extends State<VideoLmsScreen> {
  bool _isPlaying = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('REKAMAN PERKULIAHAN ONLINE'),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      body: ListView(
        children: [
          Container(
            height: 220,
            color: Colors.black,
            child: Stack(
              alignment: Alignment.center,
              children: [
                const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.video_library, size: 60, color: Colors.white54),
                    SizedBox(height: 8),
                    Text('Modul 4: Architecture Pattern Flutter', style: TextStyle(color: Colors.white)),
                  ],
                ),
                IconButton(
                  iconSize: 64,
                  icon: Icon(_isPlaying ? Icons.pause_circle_filled : Icons.play_circle_fill, color: Colors.amber),
                  onPressed: () {
                    setState(() {
                      _isPlaying = !_isPlaying;
                    });
                  },
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Pertemuan 4 - Clean Architecture di SIAKAD', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                const SizedBox(height: 4),
                const Text('Dosen: Dr. Eng. Ir. Hendra, M.T. | Durasi: 45 Menit'),
                const Divider(height: 24),
                const Text('Deskripsi Materi:', style: TextStyle(fontWeight: FontWeight.bold)),
                const Text('Dalam sesi video ini dibahas mengenai pemisahan layer UI, Business Logic (BLoC/Riverpod), dan Data Source API Backend Laravel.'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
```
