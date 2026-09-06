# Dokumentasi Widget: GeofencingMapWidget (Peta Radius Presensi)

## 1. Deskripsi & Fungsi Modul

Widget `GeofencingMapWidget` (menggunakan komponen peta seperti `flutter_map` atau `google_maps_flutter`) merupakan modul penyaji peta lokasi berbasis GPS dengan penanda batas wilayah lingkaran (*geofence radius circle*). Dalam Sistem Informasi Akademik (SIAKAD), widget ini digunakan untuk memvalidasi bahwa mahasiswa berada secara fisik di dalam radius wilayah kampus (misal radius 100 meter dari titik koordinat gedung fakultas) saat melakukan presensi QR Code atau perkuliahan tatap muka.

## 3. Tabel Atribut & Penggunaannya

| Atribut | Tipe Data | Fungsi & Penggunaan |
| :--- | :--- | :--- |
| `centerLatitude` | `double` | **(WAJIB)** Titik koordinat garis lintang (*latitude*) pusat wilayah geofence kampus. |
| `centerLongitude` | `double` | **(WAJIB)** Titik koordinat garis bujur (*longitude*) pusat wilayah geofence kampus. |
| `radiusInMeters` | `double` | **(WAJIB)** Jarak radius batas wilayah yang diizinkan dalam satuan meter (misal `100.0`). |
| `userLatitude` | `double?` | Titik koordinat garis lintang posisi perangkat mahasiswa saat ini. |
| `userLongitude` | `double?` | Titik koordinat garis bujur posisi perangkat mahasiswa saat ini. |

---

## 4. Contoh Kode Flutter

### 4.1 Contoh Kode Dasar (Basic Usage)

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const BasicGeofenceApp());
}

class BasicGeofenceApp extends StatelessWidget {
  const BasicGeofenceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Basic Geofence Map')),
        body: const Center(
          child: Text('Placeholder: GeofenceMap(lat: -6.200000, lng: 106.816666, radius: 100)'),
        ),
      ),
    );
  }
}
```

### 4.2 Contoh Kode Studi Kasus UI (Peta Radius Presensi Geofencing SIAKAD Mobile)

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const SiakadGeofenceMapApp());
}

class SiakadGeofenceMapApp extends StatelessWidget {
  const SiakadGeofenceMapApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Geofencing SIAKAD',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.indigo,
      ),
      home: const GeofencePresensiScreen(),
    );
  }
}

class GeofencePresensiScreen extends StatefulWidget {
  const GeofencePresensiScreen({super.key});

  @override
  State<GeofencePresensiScreen> createState() => _GeofencePresensiScreenState();
}

class _GeofencePresensiScreenState extends State<GeofencePresensiScreen> {
  final double _kampusLat = -6.200000;
  final double _kampusLng = 106.816666;
  final double _radiusMeters = 100.0;

  // Simulasi jarak posisi mahasiswa ke kampus (45 meter = VALID)
  final double _currentDistanceMeters = 45.0;

  bool get _isInRange => _currentDistanceMeters <= _radiusMeters;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PRESENSI GEOFENCING KAMPUS'),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Card(
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Icon(
                          _isInRange ? Icons.gpp_good : Icons.gpp_bad,
                          color: _isInRange ? Colors.green : Colors.red,
                          size: 40,
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                _isInRange ? 'LOKASI VALID (DI DALAM KAMPUS)' : 'LOKASI DILUAR RADIUS KAMPUS',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: _isInRange ? Colors.green : Colors.red,
                                ),
                              ),
                              Text('Jarak Anda: ${_currentDistanceMeters.toInt()}m dari Gedung Utama'),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: Colors.indigo, width: 2),
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          Container(
                            width: 180,
                            height: 180,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.indigo.withOpacity(0.15),
                              border: Border.all(color: Colors.indigo, width: 2),
                            ),
                          ),
                          const Icon(Icons.location_on, size: 48, color: Colors.indigo),
                        ],
                      ),
                      const SizedBox(height: 16),
                      const Text('Radius Geofence: 100 Meter', style: TextStyle(fontWeight: FontWeight.bold)),
                      const Text('Koordinat: -6.200000, 106.816666'),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton.icon(
              onPressed: _isInRange
                  ? () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Presensi berhasil dicatat! Status: HADIR (GEOFENCE VERIFIED)'), backgroundColor: Colors.green),
                      );
                    }
                  : null,
              icon: const Icon(Icons.check_circle),
              label: const Text('SUBMIT PRESENSI KEHADIRAN'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.indigo,
                foregroundColor: Colors.white,
                minimumSize: const Size(double.infinity, 50),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
```
