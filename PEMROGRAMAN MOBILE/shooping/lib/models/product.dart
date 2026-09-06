import 'dart:io';
import 'package:flutter/material.dart';

class Product {
  final int? id;
  final String name;
  final String category;
  final double price;
  final int stock;
  final String description;
  final String? image;

  Product({
    this.id,
    required this.name,
    required this.category,
    required this.price,
    required this.stock,
    required this.description,
    this.image,
  });

  // Pemeta otomatis gambar aset berdasarkan kategori
  String get assetImage {
    if (image != null && image!.isNotEmpty && image!.startsWith('assets/')) {
      return image!;
    }
    switch (category.toLowerCase()) {
      case 'elektronik':
        return 'assets/images/laptop.jpg';
      case 'pakaian':
        return 'assets/images/kemeja.jpg';
      case 'olahraga':
        return 'assets/images/sepatu.jpg';
      case 'aksesoris':
        return 'assets/images/tumbler.jpg';
      default:
        return 'assets/images/laptop.jpg';
    }
  }

  // Widget pembangun gambar cerdas (Mendukung Aset bawaan & Berkas Kamera/Galeri)
  Widget buildImage({
    double? width,
    double? height,
    BoxFit fit = BoxFit.cover,
  }) {
    if (image != null && image!.isNotEmpty) {
      if (image!.startsWith('assets/')) {
        return Image.asset(
          image!,
          width: width,
          height: height,
          fit: fit,
          errorBuilder: (context, error, stackTrace) => _buildFallback(),
        );
      } else {
        final file = File(image!);
        return Image.file(
          file,
          width: width,
          height: height,
          fit: fit,
          errorBuilder: (context, error, stackTrace) {
            return Image.asset(
              assetImage,
              width: width,
              height: height,
              fit: fit,
              errorBuilder: (context, error, stackTrace) => _buildFallback(),
            );
          },
        );
      }
    }
    return Image.asset(
      assetImage,
      width: width,
      height: height,
      fit: fit,
      errorBuilder: (context, error, stackTrace) => _buildFallback(),
    );
  }

  Widget _buildFallback() {
    return Center(
      child: Icon(
        Icons.inventory_2_outlined,
        color: const Color(0xFF0F766E).withValues(alpha: 0.5),
        size: 36,
      ),
    );
  }

  // Konversi objek Product ke Map untuk SQLite
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'category': category,
      'price': price,
      'stock': stock,
      'description': description,
      'image': image ?? assetImage,
    };
  }

  // Rekonstruksi objek Product dari Map SQLite
  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      id: map['id'] as int?,
      name: map['name'] as String,
      category: map['category'] as String,
      price: (map['price'] as num).toDouble(),
      stock: map['stock'] as int,
      description: map['description'] as String,
      image: map['image'] as String?,
    );
  }

  // Helper pemformat harga Rupiah tanpa dependensi eksternal
  String get formattedPrice {
    final strVal = price.toInt().toString();
    final buffer = StringBuffer();
    int count = 0;
    for (int i = strVal.length - 1; i >= 0; i--) {
      buffer.write(strVal[i]);
      count++;
      if (count % 3 == 0 && i > 0) {
        buffer.write('.');
      }
    }
    return 'Rp ${buffer.toString().split('').reversed.join('')}';
  }
}

