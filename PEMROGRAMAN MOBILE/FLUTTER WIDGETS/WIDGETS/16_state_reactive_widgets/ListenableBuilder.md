# Dokumentasi Widget: ListenableBuilder

## 1. Penjelasan Singkat & Fungsi
Widget `ListenableBuilder` (diperkenalkan pada Material 3 / Flutter 3.10) mendengarkan objek `Listenable` (seperti `ChangeNotifier`) untuk mendaur ulang perenderan komponen antarmuka yang terisolasi.

## 2. Tabel Atribut & Penggunaannya

| Atribut | Tipe Data | Fungsi & Penggunaan |
| :--- | :--- | :--- |
| `listenable` | `Listenable` | Objek pendengar Listenable / ChangeNotifier (wajib). |
| `builder` | `Widget Function(BuildContext, Widget?)` | Callback perender widget. |
| `child` | `Widget?` | Sub-pohon widget anak statis opsional. |

## 3. Contoh Kode Flutter

### 3.1 Contoh Kode Dasar (Basic Usage)

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const ListenableBuilderDemoApp());
}

class ThemeModel extends ChangeNotifier {
  bool isDark = false;
  void toggleTheme() {
    isDark = !isDark;
    notifyListeners();
  }
}

class ListenableBuilderDemoApp extends StatelessWidget {
  const ListenableBuilderDemoApp({super.key});

  static final ThemeModel themeModel = ThemeModel();

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: themeModel,
      builder: (context, child) {
        return MaterialApp(
          theme: themeModel.isDark ? ThemeData.dark() : ThemeData.light(),
          home: Scaffold(
            appBar: AppBar(title: const Text('Demo ListenableBuilder')),
            body: Center(
              child: ElevatedButton(
                onPressed: () => themeModel.toggleTheme(),
                child: const Text('Toggle Theme'),
              ),
            ),
          ),
        );
      },
    );
  }
}
```

### 3.2 Contoh Kode Studi Kasus UI (Manajemen Mode Tema Gelap/Terang Portal SIAKAD Mobile)

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const SiakadThemeListenableApp());
}

class SiakadThemeNotifier extends ChangeNotifier {
  bool isDarkMode = false;

  void switchMode() {
    isDarkMode = !isDarkMode;
    notifyListeners();
  }
}

class SiakadThemeListenableApp extends StatelessWidget {
  const SiakadThemeListenableApp({super.key});

  static final SiakadThemeNotifier themeNotifier = SiakadThemeNotifier();

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: themeNotifier,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: themeNotifier.isDarkMode ? ThemeData.dark() : ThemeData.light(),
          home: Scaffold(
            appBar: AppBar(
              title: const Text('SIAKAD Mobile Theme'),
              backgroundColor: themeNotifier.isDarkMode ? Colors.black87 : Colors.indigo,
            ),
            body: Center(
              child: SwitchListTile(
                title: const Text('Mode Tema Gelap (Dark Mode)'),
                value: themeNotifier.isDarkMode,
                onChanged: (val) => themeNotifier.switchMode(),
              ),
            ),
          ),
        );
      },
    );
  }
}
```
