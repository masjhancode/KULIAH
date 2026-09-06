# Dokumentasi Widget: Router

## 1. Penjelasan Singkat & Fungsi
Widget `Router` mendukung navigasi deklaratif (*Navigator 2.0 / Router API*) untuk mengelola status rute aplikasi yang tersinkronisasi dengan URL browser / *deep linking*.

## 2. Tabel Atribut & Penggunaannya

| Atribut | Tipe Data | Fungsi & Penggunaan |
| :--- | :--- | :--- |
| `routerDelegate` | `RouterDelegate<T>` | Objek pengelola status rute navigasi deklaratif (wajib). |
| `routeInformationParser` | `RouteInformationParser<T>?` | Pengurai string URL menjadi state rute. |
| `backButtonDispatcher` | `BackButtonDispatcher?` | Pengendali tombol back sistem OS. |

## 3. Contoh Kode Flutter

### 3.1 Contoh Kode Dasar (Basic Usage)

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const RouterDemoApp());
}

class RouterDemoApp extends StatelessWidget {
  const RouterDemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Demo Router API')),
        body: const Center(child: Text('Navigasi Deklaratif Router')),
      ),
    );
  }
}
```

### 3.2 Contoh Kode Studi Kasus UI (Navigasi Deklaratif Portal SIAKAD Web/Mobile Berbasis Deep Link)

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const SiakadRouterApp());
}

class SiakadRouterApp extends StatelessWidget {
  const SiakadRouterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: _routerConfig,
    );
  }
}

final _routerConfig = RouterConfig<Object>(
  routerDelegate: SiakadRouterDelegate(),
);

class SiakadRouterDelegate extends RouterDelegate<Object> with ChangeNotifier, PopNavigatorRouterDelegateMixin<Object> {
  @override
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      pages: const [
        MaterialPage(
          child: Scaffold(
            body: Center(child: Text('Halaman Utama Router Deklaratif SIAKAD')),
          ),
        ),
      ],
      onPopPage: (route, result) => route.didPop(result),
    );
  }

  @override
  Future<void> setNewRoutePath(Object configuration) async {}
}
```
