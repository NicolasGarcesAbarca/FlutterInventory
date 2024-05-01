import 'package:flutter/material.dart';
import 'package:inventory/models/products.dart';
import 'package:inventory/widgets/item_list_product.dart';

class ListProducts extends StatelessWidget {
  final List<Product> products;

  const ListProducts({Key? key, required this.products}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: products.length,
      itemBuilder: (context, index) {
        final product = products[index];
        return ItemListProduct(product: product);
      },
    );
  }
}
