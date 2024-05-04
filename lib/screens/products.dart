import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:inventory/models/products.dart';
import 'package:inventory/providers/provider.dart';
import 'package:inventory/widgets/list_products.dart';

class ProductsPage extends StatefulWidget {
  const ProductsPage({super.key});

  @override
  State<ProductsPage> createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, child) {
      final AsyncValue<List<Product>> products = ref.watch(productsProvider);
      return Scaffold(
          appBar: AppBar(
            title: const Text('Productos'),
          ),
          body: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: switch (products) {
                AsyncData(:final value) => ListProducts(products: value),
                AsyncError() => const Center(child: Text('Error')),
                _ => const Center(child: CircularProgressIndicator())
              }));
    });
  }
}
