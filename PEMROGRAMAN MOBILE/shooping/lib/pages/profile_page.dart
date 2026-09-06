import 'package:flutter/material.dart';
import '../models/user.dart';
import 'login_page.dart';

class ProfilePage extends StatelessWidget {
  final User? currentUser;

  const ProfilePage({super.key, this.currentUser});

  void _handleLogout(BuildContext context) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: const Row(
          children: [
            Icon(Icons.logout_rounded, color: Color(0xFFE11D48)),
            SizedBox(width: 10),
            Text('Konfirmasi Keluar'),
          ],
        ),
        content: const Text('Apakah Anda yakin ingin mengakhiri sesi dan keluar dari akun?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text('Batal', style: TextStyle(color: Color(0xFF64748B))),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFE11D48),
              foregroundColor: Colors.white,
            ),
            onPressed: () {
              Navigator.pop(ctx);
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => const LoginPage()),
                (route) => false,
              );
            },
            child: const Text('Keluar'),
          ),
        ],
      ),
    );
  }

  void _showInfoDialog(BuildContext context, String title, String message) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        content: Text(message, style: const TextStyle(fontSize: 13, height: 1.4)),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text('Tutup', style: TextStyle(color: Color(0xFF0F766E))),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final name = currentUser?.name ?? 'Mahasiswa Praktikan';
    final email = currentUser?.email ?? 'mahasiswa@kampus.ac.id';

    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      appBar: AppBar(
        title: const Text('Profil Pengguna'),
        backgroundColor: const Color(0xFF0F766E),
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            // Kartu Profil Utama
            Container(
              padding: const EdgeInsets.all(22),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: const Color(0xFFE2E8F0)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.03),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [Color(0xFF0F766E), Color(0xFF14B8A6)],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xFF0F766E).withOpacity(0.3),
                          blurRadius: 12,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Center(
                      child: Text(
                        name.isNotEmpty ? name[0].toUpperCase() : 'M',
                        style: const TextStyle(
                          fontSize: 34,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 14),
                  Text(
                    name,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF0F172A),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    email,
                    style: const TextStyle(fontSize: 13, color: Color(0xFF64748B)),
                  ),
                  const SizedBox(height: 12),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                    decoration: BoxDecoration(
                      color: const Color(0xFFF0FDFA),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: const Color(0xFFCCFBF1)),
                    ),
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.verified_rounded, size: 14, color: Color(0xFF0F766E)),
                        SizedBox(width: 6),
                        Text(
                          'Mahasiswa Terverifikasi',
                          style: TextStyle(
                            fontSize: 11.5,
                            color: Color(0xFF0F766E),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 18),

            // Informasi Teknis Praktikum
            Container(
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(18),
                border: Border.all(color: const Color(0xFFE2E8F0)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Spesifikasi Modul Praktikum',
                    style: TextStyle(
                      fontSize: 14.5,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF0F172A),
                    ),
                  ),
                  const Divider(height: 20),
                  _buildProfileRow(Icons.school_outlined, 'Mata Kuliah', 'Pemrograman Mobile'),
                  const Divider(height: 20),
                  _buildProfileRow(Icons.layers_outlined, 'State Management', 'setState (Lokal)'),
                  const Divider(height: 20),
                  _buildProfileRow(Icons.storage_rounded, 'Database Lokal', 'SQLite (sqflite)'),
                  const Divider(height: 20),
                  _buildProfileRow(Icons.architecture_rounded, 'Arsitektur UI', '1 Berkas 1 Halaman'),
                ],
              ),
            ),

            const SizedBox(height: 18),

            // Menu Pengaturan & Panduan
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(18),
                border: Border.all(color: const Color(0xFFE2E8F0)),
              ),
              child: Column(
                children: [
                  ListTile(
                    leading: const Icon(Icons.help_outline_rounded, color: Color(0xFF0F766E)),
                    title: const Text('Panduan Alur Belajar', style: TextStyle(fontSize: 13.5, fontWeight: FontWeight.w600)),
                    subtitle: const Text('Tahapan praktikum untuk mahasiswa pemula', style: TextStyle(fontSize: 11.5)),
                    trailing: const Icon(Icons.chevron_right_rounded, color: Color(0xFF94A3B8)),
                    onTap: () => _showInfoDialog(
                      context,
                      'Panduan Alur Belajar',
                      '1. Pelajari models (user, product, cart_item).\n2. Pahami helper db_helper.dart.\n3. Ikuti alur login & registrasi.\n4. Pelajari katalog dengan GridView & setState.\n5. Pelajari penambahan item ke keranjang belanja SQLite.',
                    ),
                  ),
                  const Divider(height: 1, indent: 16, endIndent: 16),
                  ListTile(
                    leading: const Icon(Icons.info_outline_rounded, color: Color(0xFF0F766E)),
                    title: const Text('Tentang Shooping App', style: TextStyle(fontSize: 13.5, fontWeight: FontWeight.w600)),
                    subtitle: const Text('Versi 1.0.0 (Material 3 Edukasi)', style: TextStyle(fontSize: 11.5)),
                    trailing: const Icon(Icons.chevron_right_rounded, color: Color(0xFF94A3B8)),
                    onTap: () => _showInfoDialog(
                      context,
                      'Tentang Shooping App',
                      'Shooping App dikembangkan sebagai aplikasi percontohan praktikum mahasiswa mata kuliah Pemrograman Mobile dengan framework Flutter, state management murni setState, dan SQLite.',
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // Tombol Keluar
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFFEF2F2),
                  foregroundColor: const Color(0xFFE11D48),
                  elevation: 0,
                  side: const BorderSide(color: Color(0xFFFECACA)),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                ),
                onPressed: () => _handleLogout(context),
                icon: const Icon(Icons.logout_rounded, size: 20),
                label: const Text('KELUAR DARI AKUN', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13.5)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileRow(IconData icon, String title, String value) {
    return Row(
      children: [
        Icon(icon, size: 19, color: const Color(0xFF0F766E)),
        const SizedBox(width: 12),
        Text(title, style: const TextStyle(fontSize: 13, color: Color(0xFF64748B))),
        const Spacer(),
        Text(
          value,
          style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: Color(0xFF0F172A)),
        ),
      ],
    );
  }
}
