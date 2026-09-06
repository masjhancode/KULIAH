import 'dart:io';
import 'package:flutter/material.dart';

class CartItem {
  final int? id;
  final int productId;
  final String name;
  final String category;
  final double price;
  int quantity;
  final String? image;

  CartItem({
    this.id,
    required this.productId,
    required this.name,
    required this.category,
    required this.price,
    required this.quantity,
    this.image,
  });

  double get totalPrice => price * quantity;

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
    return const Center(
      child: Icon(
        Icons.inventory_2_outlined,
        color: Color(0xFF0F766E),
        size: 24,
      ),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'product_id': productId,
      'name': name,
      'category': category,
      'price': price,
      'quantity': quantity,
      'image': image,
    };
  }

  factory CartItem.fromMap(Map<String, dynamic> map) {
    return CartItem(
      id: map['id'] as int?,
      productId: map['product_id'] as int,
      name: map['name'] as String,
      category: map['category'] as String,
      price: (map['price'] as num).toDouble(),
      quantity: map['quantity'] as int,
      image: map['image'] as String?,
    );
  }

  String formatCurrency(double amount) {
    final strVal = amount.toInt().toString();
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

