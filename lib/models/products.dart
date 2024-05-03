import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
part 'products.freezed.dart';
part 'products.g.dart';

@freezed
class Product with _$Product {
  factory Product({
    required String name,
    required String code,
    required String value,
    required String chilecompra,
    required String category,
    required String description,
  }) = _Product;

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);
}
