# Dokumentasi Widget: CustomScrollView

## 1. Penjelasan Singkat & Fungsi
Widget `CustomScrollView` digunakan untuk membuat efek pengguliran kompleks dengan mengombinasikan berbagai elemen `Sliver` (seperti `SliverAppBar`, `SliverToBoxAdapter`, `SliverGrid`, dan `SliverList`) dalam satu koordinat scroll viewport tunggal.

## 2. Tabel Atribut & Penggunaannya

| Atribut | Tipe Data | Fungsi & Penggunaan |
| :--- | :--- | :--- |
| `slivers` | `List<Widget>` | Daftar elemen sliver (SliverAppBar, SliverList, SliverGrid, SliverToBoxAdapter, dsb) yang dikombinasikan. |
| `scrollDirection` | `Axis` | Arah sumbu pengguliran (Axis.vertical atau Axis.horizontal). |
| `controller` | `ScrollController` | Objek pengontrol posisi scroll untuk memantau atau menggerakkan offset. |
| `physics` | `ScrollPhysics` | Perilaku animasi respon efek pengguliran (BouncingScrollPhysics, ClampingScrollPhysics). |
| `center` | `Key` | Key elemen sliver yang dijadikan titik nol offset pengguliran. |

## 3. Contoh Kode Flutter

### 3.1 Contoh Kode Dasar (Basic Usage)

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const CustomScrollViewDemoApp());
}

class CustomScrollViewDemoApp extends StatelessWidget {
  const CustomScrollViewDemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: CustomScrollView(
          slivers: [
            const SliverAppBar(
              expandedHeight: 150.0,
              flexibleSpace: FlexibleSpaceBar(title: Text('CustomScrollView')),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) => ListTile(title: Text('Item Sliver #${index + 1}')),
                childCount: 15,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
```

### 3.2 Contoh Kode Studi Kasus UI (Dashboard Akademik)

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const SiakadDashboardApp());
}

class SiakadDashboardApp extends StatelessWidget {
  const SiakadDashboardApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.indigo),
      home: const DashboardScreen(),
    );
  }
}

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: CustomScrollView(
        slivers: [
          // 1. App Bar Beranimasi dengan Efek Melipat (Collapsing Header)
          SliverAppBar(
            pinned: true,
            expandedHeight: 220.0,
            backgroundColor: Colors.indigo,
            flexibleSpace: FlexibleSpaceBar(
              titlePadding: const EdgeInsets.only(left: 16, bottom: 16),
              title: const Text(
                'SIAKAD Mobile',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              background: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.indigo, Colors.indigoAccent],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
                child: const Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 36,
                        backgroundColor: Colors.white,
                        child: Icon(Icons.person, size: 48, color: Colors.indigo),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Ahmad Fauzi (2026090123)',
                        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Teknik Informatika - Semester 6',
                        style: TextStyle(color: Colors.white70, fontSize: 12),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            actions: [
              IconButton(icon: const Icon(Icons.notifications), onPressed: () {}),
            ],
          ),

          // 2. Section Header: Ringkasan Akademik
          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.fromLTRB(16, 20, 16, 8),
              child: Text(
                'Ringkasan Akademik',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
          ),

          // 3. Grid Kartu KPI Statistik (SliverGrid)
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            sliver: SliverGrid.count(
              crossAxisCount: 2,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: 1.5,
              children: const [
                AcademicKpiCard(title: 'IPK Kumulatif', value: '3.85', icon: Icons.grade, color: Colors.blue),
                AcademicKpiCard(title: 'SKS Lulus', value: '112 SKS', icon: Icons.school, color: Colors.green),
                AcademicKpiCard(title: 'Status SPP', value: 'LUNAS', icon: Icons.verified, color: Colors.orange),
                AcademicKpiCard(title: 'Absensi', value: '96%', icon: Icons.event_available, color: Colors.purple),
              ],
            ),
          ),

          // 4. Section Header: Pengumuman Kampus
          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.fromLTRB(16, 24, 16, 8),
              child: Text(
                'Pengumuman Terbaru',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
          ),

          // 5. List Berita & Pengumuman (SliverList)
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return Card(
                    margin: const EdgeInsets.only(bottom: 10),
                    child: ListTile(
                      leading: const CircleAvatar(
                        backgroundColor: Colors.indigo,
                        child: Icon(Icons.campaign, color: Colors.white),
                      ),
                      title: Text('Pengumuman Akademik #${index + 1}'),
                      subtitle: const Text('Batas akhir pengisian KRS semester ganjil.'),
                      trailing: const Icon(Icons.chevron_right),
                    ),
                  );
                },
                childCount: 8,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class AcademicKpiCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;
  final Color color;

  const AcademicKpiCard({
    super.key,
    required this.title,
    required this.value,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: color, size: 24),
          const SizedBox(height: 6),
          Text(title, style: TextStyle(fontSize: 12, color: Colors.grey.shade600)),
          Text(value, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
```
