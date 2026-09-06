# Dokumentasi Widget: Form

## 1. Penjelasan Singkat & Fungsi
Widget `Form` bertindak sebagai wadah (*container*) untuk mengelompokkan beberapa komponen `FormField` sehingga validasi dan pemicu submit dapat dikelola secara serentak melalui `GlobalKey<FormState>`.

## 2. Tabel Atribut & Penggunaannya

| Atribut | Tipe Data | Fungsi & Penggunaan |
| :--- | :--- | :--- |
| `key` | `Key` | Kunci unik GlobalKey<FormState> untuk mengakses state dan metode form (validate(), save(), reset()). |
| `child` | `Widget` | Widget tata letak anak yang menampung komponen-komponen masukan. |
| `autovalidateMode` | `AutovalidateMode` | Mode pemicu responsivitas validasi otomatis seluruh form. |
| `onChanged` | `VoidCallback` | Callback saat salah satu isi form berubah. |

## 3. Contoh Kode Flutter

### 3.1 Contoh Kode Dasar (Basic Usage)

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const FormDemoApp());
}

class FormDemoApp extends StatelessWidget {
  const FormDemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Demo Form')),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                TextFormField(validator: (v) => v!.isEmpty ? 'Wajib diisi' : null),
                ElevatedButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {}
                  },
                  child: const Text('Submit'),
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

### 3.2 Contoh Kode Studi Kasus UI (Formulir Login Autentikasi SIAKAD Mobile)

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const SiakadLoginFormApp());
}

class SiakadLoginFormApp extends StatefulWidget {
  const SiakadLoginFormApp({super.key});

  @override
  State<SiakadLoginFormApp> createState() => _SiakadLoginFormAppState();
}

class _SiakadLoginFormAppState extends State<SiakadLoginFormApp> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text('Login SIAKAD'), backgroundColor: Colors.indigo),
        body: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  decoration: const InputDecoration(labelText: 'NIM / Username', border: OutlineInputBorder()),
                  validator: (val) => val == null || val.isEmpty ? 'NIM tidak boleh kosong' : null,
                ),
                const SizedBox(height: 16),
                TextFormField(
                  obscureText: true,
                  decoration: const InputDecoration(labelText: 'Kata Sandi', border: OutlineInputBorder()),
                  validator: (val) => val == null || val.length < 6 ? 'Password minimal 6 karakter' : null,
                ),
                const SizedBox(height: 24),
                SizedBox(
                  width: double.infinity,
                  height: 48,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.indigo),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Proses Autentikasi...')));
                      }
                    },
                    child: const Text('Masuk Ke SIAKAD', style: TextStyle(color: Colors.white)),
                  ),
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
