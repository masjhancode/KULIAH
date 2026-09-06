# Dokumentasi Widget: FormField

## 1. Penjelasan Singkat & Fungsi
Widget `FormField` merupakan komponen abstrak tingkat dasar yang memelihara state internal nilai masukan untuk membuat komponen input custom yang terintegrasi dengan `Form`.

## 2. Tabel Atribut & Penggunaannya

| Atribut | Tipe Data | Fungsi & Penggunaan |
| :--- | :--- | :--- |
| `builder` | `FormFieldBuilder<T>` | Fungsi perender UI komponen berdasarkan FormFieldState<T> saat ini. |
| `validator` | `FormFieldValidator<T>` | Fungsi uji validasi masukan data. |
| `initialValue` | `T` | Nilai masukan awal. |
| `onSaved` | `FormFieldSetter<T>` | Callback penyiapan Simpan data. |

## 3. Contoh Kode Flutter

### 3.1 Contoh Kode Dasar (Basic Usage)

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const FormFieldDemoApp());
}

class FormFieldDemoApp extends StatelessWidget {
  const FormFieldDemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Demo FormField Custom')),
        body: Center(
          child: FormField<bool>(
            initialValue: false,
            builder: (state) {
              return Checkbox(
                value: state.value,
                onChanged: (val) => state.didChange(val),
              );
            },
          ),
        ),
      ),
    );
  }
}
```

### 3.2 Contoh Kode Studi Kasus UI (Custom Input Rating Evaluasi Kinerja Dosen)

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const DosenRatingFormApp());
}

class DosenRatingFormApp extends StatelessWidget {
  const DosenRatingFormApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text('Evaluasi Dosen'), backgroundColor: Colors.indigo),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Penilaian Metode Mengajar Dosen:', style: TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 12),
              FormField<int>(
                initialValue: 3,
                validator: (val) => (val == null || val == 0) ? 'Harap berikan bintang penilaian' : null,
                builder: (state) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: List.generate(5, (index) {
                          return IconButton(
                            icon: Icon(
                              index < (state.value ?? 0) ? Icons.star : Icons.star_border,
                              color: Colors.amber,
                              size: 36,
                            ),
                            onPressed: () => state.didChange(index + 1),
                          );
                        }),
                      ),
                      if (state.hasError)
                        Text(state.errorText!, style: const TextStyle(color: Colors.red, fontSize: 12)),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
```
